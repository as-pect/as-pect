import { TestSuite } from "./TestSuite";
import { TestGroup } from "./TestGroup";

import { ASUtil, instantiateBuffer, instantiateStreaming } from "assemblyscript/lib/loader";
import { TestResult } from "./TestResult";
import { Reporter } from "../reporter/Reporter";
import { DefaultReporter } from "../reporter/DefaultReporter";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
const { performance } = require('perf_hooks');

const wasmFilter = (input: string): boolean => /wasm/i.test(input);

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
   * This is the ActualValue that represents the current actual value reported by an expectation.
   */
  public actual: ActualValue | null = null;

  /**
   * This is the ActualValue that represents the current expected value reported by an expectation.
   */
  public expected: ActualValue | null = null;

  /**
   * This boolean is set to true for every run, and is true if the test suite passed.
   */
  public passed: boolean = true;

  /**
   * This is the web assembly module.
   */
  public wasm: ASUtil | null = null;

  /**
   * The currently running test.
   */
  public currentTest: TestResult | null = null;

  /**
   * The currently running test group.
   */
  public currentGroup: TestGroup | null = null;

  /**
   * The index of the next group log to be logged to the reporter.
   */
  public groupLogIndex: number = 0;

  /**
   * The current reporter.
   */
  public reporter: Reporter | null = null;

  /**
   * The stack trace generated when the currently running test threw.
   */
  public stack: string = "";

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
      logNull: this.logNull.bind(this),
      logReference: this.logReference.bind(this),
      logString: this.logString.bind(this),
      logValue: this.logValue.bind(this),
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
    this.reporter = reporter;
    this.run(filename);
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
    this.reporter = reporter;
    this.run(filename);
  }

  /**
   * This function should be called after the test suite is initialized and the web assembly module
   * has been instantiated.
   *
   * @param {string} filename - The name of the test file.
   * @param {Reporter} reporter - The reporter that reports each test and fail.
   */
  run(filename: string): void {
    if (!this.reporter) {
      throw new Error("Reporter is null, did you forget to set the reporter?");
    }
    const reporter = this.reporter;
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
      this.groupLogIndex = 0;
      // set the group name
      const groupName = wasm.getString(group.suiteNamePointer);
      group.name = groupName;
      group.pass = true;
      this.currentGroup = group;

      // list each todo
      for (const todoPointer of group.todoPointers) {
        // dereference the todoPointer
        const todo: string = wasm.getString(todoPointer);

        // add it to the list, but don't report it yet.
        group.todos.push(todo);
      }

      // update group and suite metadata
      group.todoCount = group.todoPointers.length;
      suite.todoCount += group.todoCount;

      // start reporting the group
      reporter.onGroupStart(group);

      for (const todo of group.todos) {
        // report each todo first before starting the timer
        reporter.onTodo(group, todo);
      }

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

      // logged values can happen in the beforeAll callback
      this.flushGroupLogs();

      // for each test function
      for (let i = 0; i < group.testFunctionPointers.length; i++) {

        // create a new test result
        const result = new TestResult();
        this.currentTest = result;

        const testname = wasm.getString(group.testNamePointers[i]);
        result.testName = testname;

        // run beforeEach
        const beforeEachResult = this.tryCall(group.beforeEachPointer);
        if (beforeEachResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in beforeEach callback.`;
          passed = false;
          continue groupLoop;
        }

        // logs can happen before each test
        this.flushGroupLogs();

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
          // collect the metadata
          result.pass = false;
          result.message = this.message;
          result.actual = this.actual;
          result.expected = this.expected;
          result.stack = this.stack;

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

        // logs can happen after each test
        this.flushGroupLogs();

        this.currentTest = null;
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

      // logs can happen in afterAll callback
      this.flushGroupLogs();

      // end group timing
      groupend = performance.now();
      this.currentGroup = null;

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
   * Flush all the collected log values to the logger.
   */
  public flushGroupLogs(): void {
    for(; this.groupLogIndex < this.currentGroup!.log.length; this.groupLogIndex++) {
      this.reporter!.onLog(this.currentGroup!.log[this.groupLogIndex]);
    }
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
      this.stack = this.getErrorStackTrace(ex);
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
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = `"${this.wasm!.getString(stringPointer).replace(`"`, `\\"`)}"`;
    value.pointer = stringPointer;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    this.actual = value;
  }

  /**
   * This function reports an expected string value.
   *
   * @param {number} stringPointer - A pointer that points to the expected string.
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedString(stringPointer: number, negated: 1 | 0): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = `"${this.wasm!.getString(stringPointer).replace(`"`, `\\"`)}"`;
    value.pointer = stringPointer;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an actual null value.
   */
  reportActualNull(): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = `null`;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    this.actual = value;
  }

  /**
   * This function reports an expected null value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedNull(negated: 1 | 0): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = `null`;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an actual numeric value.
   *
   * @param {number} numericValue - The value to be expected.
   */
  reportActualValue(numericValue: number): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = numericValue.toString();
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    this.actual = value;
  }

  /**
   * This function reports an expected numeric value.
   *
   * @param {number} numericValue - The value to be expected
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedValue(numericValue: number, negated: 0 | 1): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = numericValue.toString();
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an actual reference value.
   *
   * @param {number} referencePointer - The actual reference pointer.
   * @param {number} offset - The size of the reference in bytes.
   */
  reportActualReference(referencePointer: number, offset: number): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = "Reference Type";
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.pointer = referencePointer;
    value.offset = offset;
    value.bytes = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset));
    this.actual = value;
  }

  /**
   * This function reports an expected reference value.
   *
   * @param {number} referencePointer - The expected reference pointer.
   * @param {number} offset - The size of the reference in bytes.
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedReference(referencePointer: number, offset: number, negated: 1 | 0): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = "Reference Type";
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.pointer = referencePointer;
    value.offset = offset;
    value.bytes = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset));
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an expected truthy value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedTruthy(negated: 1 | 0): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = `truthy`;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an expected falsy value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  reportExpectedFalsy(negated: 1 | 0): void {
    const value = new ActualValue();
    value.group = this.currentGroup;
    value.message = `falsy`;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function is called after each expectation if the expectation passes. This prevents other
   * unreachable() conditions that throw errors to report actual and expected values too.
   */
  clearExpected(): void {
    this.expected = null;
    this.actual = null;
    this.stack = "";
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

  /**
   * This adds a logged string to the current test.
   *
   * @param {number} pointer - The pointer to the logged string reference.
   */
  logString(pointer: number): void {
    const value = new LogValue();
    value.group = this.currentGroup || null;
    value.message = `"${this.wasm!.getString(pointer).replace(`"`, `\\"`)}"`;
    value.offset = 0;
    value.pointer = pointer;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest || null;

    // add the log value to the current test
    if (this.currentTest) {
      this.currentTest.log.push(value);
    }

    // add the log value to the current group
    if (this.currentGroup) {
      this.currentGroup.log.push(value);
    }
  }

  /**
   * Log a reference to the reporter.
   *
   * @param {number} referencePointer - The pointer to the reference.
   * @param {number} offset - The offset of the reference.
   */
  logReference(referencePointer: number, offset: number): void {
    const value = new LogValue();
    value.bytes = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset));
    value.group = this.currentGroup || null;
    value.message = "Reference Type";
    value.offset = offset;
    value.pointer = referencePointer;
    value.stack = this.getLogStackTrace();
    value.test = this.currentTest || null;

    // add the log value to the current test
    if (this.currentTest) {
      this.currentTest.log.push(value);
    }

    // add the log value to the current group
    if (this.currentGroup) {
      this.currentGroup.log.push(value);
    }
  }

  /**
   * Log a numevalueric value to the reporter.
   *
   * @param {number} value - The value to be logged.
   */
  logValue(numericValue: number): void {
    const value = new LogValue();

    value.group = this.currentGroup || null;
    value.test = this.currentTest || null;
    value.stack = this.getLogStackTrace();
    value.message = `Value ${numericValue.toString()}`;

    // add the log value to the current test
    if (this.currentTest) {
      this.currentTest.log.push(value);
    }

    // add the log value to the current group
    if (this.currentGroup) {
      this.currentGroup.log.push(value);
    }
  }

  /**
   * Log a null value to the reporter.
   */
  logNull(): void {
    // create a new log value
    const value = new LogValue();

    // collect log metadata
    value.group = this.currentGroup || null;
    value.test = this.currentTest || null;
    value.stack = this.getLogStackTrace();
    value.message = "null";

    // add the log value to the current test
    if (this.currentTest) {
      this.currentTest.log.push(value);
    }

    // add the log value to the current group
    if (this.currentGroup) {
      this.currentGroup.log.push(value);
    }
  }

  /**
   * Gets a log stack trace.
   */
  getLogStackTrace(): string {
    try {
      throw new Error("Get stack trace.");
    } catch (ex) {
      return ex.stack.toString()
        .split("\n")
        .slice(1)
        .filter(wasmFilter)
        .join("\n");
    }
  }

  /**
   * Gets an error stack trace.
   */
  getErrorStackTrace(ex: Error): string {
    var stackItems = ex.stack!.toString().split("\n");
    return [stackItems[0], ...stackItems.slice(1).filter(wasmFilter)].join("\n");
  }
}
