import { TestSuite } from "./TestSuite";
import { TestGroup } from "./TestGroup";

import { ASUtil, instantiateBuffer, instantiateStreaming } from "assemblyscript/lib/loader";
import { TestResult } from "./TestResult";
import { Reporter } from "../reporter/Reporter";
import { DefaultReporter } from "../reporter/DefaultReporter";
const { performance } = require('perf_hooks');

/**
 * This function generates a 2 digit hexadecimal string from the given number.
 *
 * @param {number} value - A number from [0-255].
 */
const hex = (value: number) => {
  var result: string = value.toString(16);
  if (result.length === 1) return "0" + result;
  return result;
};

/**
 * The test class that hooks up the web assembly imports, and runs each test group in a file.
 */
export class TestRunner {
  constructor() {

  }

  /**
   * This is the value set by the web assembly module whenever an expectation fails.
   */
  public message: string = "";

  /**
   * This is the currently running TestSuite.
   */
  public suite: TestSuite | null = null;

  /**
   * This is the string that represents the current actual value reported by the module.
   */
  public actual: string = "";

  /**
   * This is the string that represents the current expected value reported by the module.
   */
  public expected: string = "";

  /**
   * This boolean is set to true for every run, and is true if the test suite passed.
   */
  public passed: boolean = true;

  /**
   * This is the web assembly module.
   */
  public wasm: ASUtil | null = null;

  /**
   * This function generates web assembly imports object.
   *
   * @param {any} imports - The web assembly imports to be mixed in.
   */
  createImports(imports: any = {}): any {
    imports.env = {
      abort: this.abort.bind(this),
    };
    imports.__aspect = {
      clearExpected: this.clearExpected.bind(this),
      tryCall: this.tryCall.bind(this),
      reportDescribe: this.reportDescribe.bind(this),
      reportTest: this.reportTest.bind(this),
      reportBeforeEach: this.reportBeforeEach.bind(this),
      reportBeforeAll: this.reportBeforeAll.bind(this),
      reportAfterEach: this.reportAfterEach.bind(this),
      reportAfterAll: this.reportAfterAll.bind(this),
      reportTodo: this.reportTodo.bind(this),
      reportActualNull: this.reportActualNull.bind(this),
      reportExpectedNull: this.reportExpectedNull.bind(this),
      reportActualValue: this.reportActualValue.bind(this),
      reportExpectedValue: this.reportExpectedValue.bind(this),
      reportActualReference: this.reportActualReference.bind(this),
      reportExpectedReference: this.reportExpectedReference.bind(this),
      reportActualString: this.reportActualString.bind(this),
      reportExpectedString: this.reportExpectedString.bind(this),
      reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
      reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
    };
    return imports;
  }

  /**
   * Runs a test suite from a compiled AssemblyScript module buffer.
   *
   * @param {string} filename - The name of the file.
   * @param {Uint8Array} buffer - The buffer containing the AssemblyScript module.
   * @param {any} imports - Custom web assembly imports object.
   * @param {Reporter} reporter - The reporter that reports each test and fail.
   */
  runBuffer(
    filename: string,
    buffer: Uint8Array,
    imports: any = {},
    reporter: Reporter = new DefaultReporter(),
    ): void {
    this.suite = new TestSuite();
    this.wasm = instantiateBuffer(buffer, this.createImports(imports));
    this.run(filename, reporter);
  }

  /**
   * Runs a test suite from a fetched reponse object that resolves to an AssemblyScript module.
   *
   * @param {string} filename - The name of the file.
   * @param {Promise<Response>} response - The buffer containing the AssemblyScript module.
   * @param {any} imports - Custom web assembly imports object.
   * @param {Reporter} reporter - The reporter that reports each test and fail.
   */
  async runStreaming(
    filename: string,
    response: Promise<Response>,
    imports: any = {},
    reporter: Reporter = new DefaultReporter(),
    ): Promise<void> {
    this.suite = new TestSuite();
    this.wasm = await instantiateStreaming(response, this.createImports(imports));
    this.run(filename, reporter);
  }

  /**
   * This function should be called after the test suite is initialized and the web assembly module
   * has been instantiated.
   *
   * @param {string} filename - The name of the test file.
   * @param {Reporter} reporter - The reporter that reports each test and fail.
   */
  run(filename: string, reporter: Reporter = new DefaultReporter()): void {
    var start = 0;
    var end = 0;
    var groupstart = 0;
    var groupend = 0;
    var teststart = 0;
    var testend = 0;
    var suite = this.suite!;
    var wasm = this.wasm!;
    var passed = true;

    // set the filename
    suite.filename = filename;

    // report onStart
    reporter.onStart(suite);
    start = performance.now();


    // for each test group generated by the module
    groupLoop:
    for (const group of suite.testGroups) {
      // set the group name
      const groupName = wasm.getString(group.suiteNamePointer);
      group.name = groupName;
      group.pass = true;

      // list each todo
      for(const todoPointer of group.todoPointers) {
        // dereference the todoPointer
        const todo: string = wasm.getString(todoPointer);

        // add it to the list
        group.todos.push(todo);
        // report it
        reporter.onTodo(group, todo);
      }

      group.todoCount = group.todoPointers.length;
      suite.todoCount += group.todoCount;

      reporter.onGroupStart(group);

      // start the timer
      groupstart = performance.now();

      // run beforeAll
      const beforeAllResult = this.tryCall(group.beforeAllPointer);

      // if the callback throws an error
      if (beforeAllResult === 0) {
        groupend = performance.now();
        group.pass = false;
        group.reason = `Test suite ${groupName} failed in beforeAll callback.`;
        passed = false;
        continue;
      }

      // for each test function
      for (let i = 0; i < group.testFunctionPointers.length; i++) {

        // create a new test result
        const result = new TestResult();
        const testname = wasm.getString(group.testNamePointers[i]);
        result.description = testname;

        // run beforeEach
        const beforeEachResult = this.tryCall(group.beforeEachPointer);
        if (beforeEachResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in beforeEach callback.`;
          passed = false;
          continue groupLoop;
        }

        // report test start
        reporter.onTestStart(group, result);

        // start the test
        teststart = performance.now();

        // run the test
        const testCallResult = this.tryCall(group.testFunctionPointers[i]);

        // the test is ended
        testend = performance.now();
        group.totalCount++;
        suite.totalTests++;

        // calculate test time
        const testtime = Math.round((testend - teststart) * 1000) / 1000;

        // the test passed!
        if (testCallResult === 1) {
          // pass the test
          result.pass = true;
          result.time = testtime;

          // increase group success count
          group.successCount++;

          // increase test suite success count
          suite.successCount++;
        } else { // the test failed
          // fail the test
          result.pass = false;
          result.reason = this.message;
          result.actual = this.actual;
          result.expected = this.expected;

          // fail the group
          group.failCount++;
          group.pass = false;

          // fail the suite
          suite.failCount++;
          passed = false;
        }

        // run afterEach
        const afterEachResult = this.tryCall(group.afterEachPointer);
        if (afterEachResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in afterEach callback.`;
          passed = false;
          continue groupLoop;
        }

        // report test finish
        reporter.onTestFinish(group, result);
      }

      // run afterAll
      const afterAllResult = this.tryCall(group.afterAllPointer);
      if (afterAllResult === 0) {
        groupend = performance.now();
        group.pass = false;
        group.reason = `Test suite ${groupName} failed in afterAll callback.`;
        passed = false;
        continue groupLoop;
      }

      // end group timing
      groupend = performance.now();

      // calculate the group time
      const grouptime = Math.round((groupend - groupstart) * 1000) / 1000;
      group.reason = `Test suite ${groupName} passed successfully.`;
      group.time = grouptime;

      reporter.onGroupFinish(group);
    }

    // end the test suite timing
    end = performance.now();
    suite.time = Math.round((end - start) * 1000) / 1000;
    suite.pass = passed;
    this.passed = passed;

    // report finished
    reporter.onFinish(suite);
  }

  /**
   * This is a web assembly utility function that wraps a function call in a try catch block to
   * report success or failure.
   *
   * @param {number} pointer - The function pointer to call. It must accept no parameters and return
   * void.
   * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
   * returns 0.
   */
  tryCall(pointer: number): 1 | 0 {
    if (pointer === -1) return 1;

    var func = this.wasm!.getFunction(pointer);
    try {
      func();
    } catch (ex){
      return 0;
    }
    return 1;
  }

  /**
   * This web assembly linked function creates a test group. It's called when the test suite calls
   * the describe("test", callback) function from within AssemblyScript. It returns a pointer to the
   * suiteName string.
   *
   * @param {number} suiteNamePointer
   */
  reportDescribe(suiteNamePointer: number): void {
    const group = new TestGroup();
    group.suiteNamePointer = suiteNamePointer;
    this.suite!.testGroups.push(group);
  }

  /**
   * This web assembly linked function creates a test from the callback and the testNamePointer in
   * the current group. It assumes that the group has already been created with the describe
   * function. It is called when `it("description", callback)` or `test("description", callback)`
   * is called.
   *
   * @param {number} testNamePointer - The test's name pointer.
   * @param {number} callback - The test's function.
   */
  reportTest(testNamePointer: number, callback: number): void {
    var group = this.suite!.testGroups[this.suite!.testGroups.length - 1];
    group.testFunctionPointers.push(callback);
    group.testNamePointers.push(testNamePointer);
  }

  /**
   * This web assembly linked function sets the group's "beforeEach" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test.
   */
  reportBeforeEach(callbackPointer: number): void {
    var group = this.suite!.testGroups[this.suite!.testGroups.length - 1];
    group.beforeEachPointer = callbackPointer;
  }

  /**
   * This web assembly linked function sets the group's "beforeAll" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test group.
   */
  reportBeforeAll(callbackPointer: number): void {
    var group = this.suite!.testGroups[this.suite!.testGroups.length - 1];
    group.beforeAllPointer = callbackPointer;
  }

  /**
   * This web assembly linked function sets the group's "afterEach" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test group.
   */
  reportAfterEach(callbackPointer: number): void {
    var group = this.suite!.testGroups[this.suite!.testGroups.length - 1];
    group.afterEachPointer = callbackPointer;
  }

  /**
   * This web assembly linked function sets the group's "afterAll" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test group.
   */
  reportAfterAll(callbackPointer: number): void {
    var testGroup = this.suite!.testGroups[this.suite!.testGroups.length - 1];
    testGroup.afterAllPointer = callbackPointer;
  }

  /**
   * This function reports a single "todo" item in a test suite.
   *
   * @param {number} todoPointer - The todo description string pointer.
   */
  reportTodo(todoPointer: number): void {
    var testGroup = this.suite!.testGroups[this.suite!.testGroups.length -1];
    testGroup.todoPointers.push(todoPointer);
  }

  /**
   * This function reports an actual string value.
   *
   * @param {number} stringPointer - A pointer that points to the actual string.
   */
  reportActualString(stringPointer: number): void {
    this.actual = `"${this.wasm!.getString(stringPointer).replace(`"`, `\\"`)}"`; // escape the string
  }

  /**
   * This function reports an expected string value.
   *
   * @param {number} stringPointer - A pointer that points to the expected string.
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedString(value: number, negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "") + `"${this.wasm!.getString(value).replace(`"`, `\\"`)}"`;
  }

  /**
   * This function reports an actual null value.
   */
  reportActualNull(): void {
    this.actual = "null";
  }

  /**
   * This function reports an expected null value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedNull(negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "") + "null";
  }

  /**
   * This function reports an actual numeric value.
   *
   * @param {number} value - The value to be expected.
   */
  reportActualValue(value: number): void {
    this.actual = value.toString();
  }

  /**
   * This function reports an expected numeric value.
   *
   * @param {number} value - The value to be expected
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedValue(value: number, negated: 0 | 1): void {
    this.expected = (negated === 1 ? "not " : "") + value.toString();
  }

  /**
   * This function reports an actual reference value. It converts the reference to a string of hex
   * characters with a space between each `u8` value.
   *
   * @param {number} referencePointer - The actual reference pointer.
   * @param {number} offset - The size of the reference in bytes.
   */
  reportActualReference(referencePointer: number, offset: number): void {
    this.actual = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset))
      .map(hex)
      .join(" ");
  }

  /**
   * This function reports an expected reference value. It converts the reference to a string of hex
   * characters with a space between each `u8` value.
   *
   * @param {number} referencePointer - The expected reference pointer.
   * @param {number} offset - The size of the reference in bytes.
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedReference(referencePointer: number, offset: number, negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "")
      + Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset)).map(hex).join(" ");
  }

  /**
   * This function reports an expected truthy value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedTruthy(negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "") + "truthy";
  }

  /**
   * This function reports an expected falsy value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedFalsy(negated: 1 | 0): void {
    this.expected = (negated === 1 ? "not " : "") + "falsy";
  }

  /**
   * This function is called after each expectation if the expectation passes. This prevents other
   * unreachable() conditions that throw errors to report actual and expected values too.
   */
  clearExpected(): void {
    this.expected = "";
    this.actual = "";
  }

  /**
   * This function overrides the provided AssemblyScript `env.abort()` function to catch abort
   * reasons.
   *
   * @param {number} reasonPointer - This points to the message value that causes the expectation to
   * fail.
   * @param {number} _fileNamePointer - The file name that reported the error. (Ignored)
   * @param {number} _line - The line that reported the error. (Ignored)
   * @param {number} _col - The column that reported the error. (Ignored)
   */
  abort(reasonPointer: number, _fileNamePointer: number, _line: number, _col: number): void {
    this.message = this.wasm!.getString(reasonPointer);
  }
}
