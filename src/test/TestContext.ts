import { ASUtil } from "assemblyscript/lib/loader";
import { TestGroup } from "./TestGroup";
import { ILogTarget } from "../util/ILogTarget";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { TestReporter } from "./TestReporter";
import { TestResult } from "./TestResult";
import { DefaultTestReporter } from "../reporter/DefaultTestReporter";
import { performance } from "perf_hooks";
import { timeDifference } from "../util/timeDifference";

const wasmFilter = (input: string): boolean => /wasm/i.test(input);

export class TestContext {

  public file: string = "";

  private groupStack: TestGroup[] = [new TestGroup()];
  public testGroups: TestGroup[] = [];
  private logTarget: ILogTarget = this.groupStack[0];

  private wasm: ASUtil | null = null;

  // test state machine values
  private stack: string = "";
  private message: string = "";
  private actual: ActualValue | null = null;
  private expected: ActualValue | null = null;

  public time: number = 0;
  public pass: boolean = true;

  /**
   * Run the tests on the wasm module.
   */
  public run(wasm: ASUtil, reporter: TestReporter = new DefaultTestReporter(), file: string = ""): void {
    this.wasm = wasm;
    this.file = file;

    let start = 0;
    let end = 0;
    let groupstart = 0;
    let groupend = 0;
    let teststart = 0;
    let testend = 0;
    let passed = true;

    // start the test suite
    reporter.onStart(this);
    start = performance.now();

    testgroup:
    for (const group of this.testGroups) {
      // get the group's name
      const groupName = group.describePointers
        .map(pointer => wasm.getString(pointer))
        .join(" ");
      group.name = groupName;

      // report the group as started
      reporter.onGroupStart(group);

      for (const todo of group.todos) {
        reporter.onTodo(group, wasm.getString(todo));
      }

      groupstart = performance.now();

      // set the log target
      this.logTarget = group;

      // for each beforeAllCallback
      for (const beforeAllCallback of group.beforeAllPointers) {
        // call each beforeAll callback
        const beforeAllResult = this.tryCall(beforeAllCallback);

        // if the test fails
        if (beforeAllResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in beforeAll callback.`;
          passed = false;
          group.time = timeDifference(groupend, groupstart);
          continue testgroup;
        }
      }

      for (let i = 0; i < group.testFunctionPointers.length; i++) {
        const testFunctionCallback = group.testFunctionPointers[i];

        // create the test result
        const result = new TestResult();
        group.tests.push(result);
        this.logTarget = result;
        result.testName = wasm.getString(group.testNamePointers[i]);
        reporter.onTestStart(group, result);
        teststart = performance.now();

        // for each beforeEach callback function pointer
        for (const beforeEachCallback of group.beforeEachPointers) {
          const beforeEachResult = this.tryCall(beforeEachCallback);

          // if beforeEach fails
          if (beforeEachResult === 0) {
            testend = performance.now();
            groupend = performance.now();
            group.pass = false;
            group.reason = group.reason = `Test suite ${groupName} failed in beforeEach callback.`;
            result.pass = false;
            group.time = timeDifference(groupend, groupstart);
            result.time = timeDifference(testend, teststart);
            reporter.onTestFinish(group, result);
            reporter.onGroupFinish(group);
            continue testgroup;
          }
        }

        const testCallResult = this.tryCall(testFunctionCallback);
        const throws = group.testThrows[i]
        testend = performance.now();
        result.time = timeDifference(testend, teststart);
        result.pass = throws
          ? (testCallResult === 0)
          : (testCallResult === 1)
        result.negated = throws;

        if (!result.pass) {
          // if it throws...
          if (throws) {
            // only set the message
            result.message = this.wasm!.getString(group.testMessagePointers[i]);
          } else {
            // set the message, the actual, expected, and stack values
            result.message = this.message;
            result.actual = this.actual;
            result.expected = this.expected;
            result.stack = this.stack;
          }
        }

        // for each afterEach callback function pointer
        for (const afterEachCallback of group.afterEachPointers) {
          const afterEachResult = this.tryCall(afterEachCallback);

          // if afterEach fails
          if (afterEachResult === 0) {
            testend = performance.now();
            groupend = performance.now();
            group.pass = false;
            group.reason = group.reason = `Test suite ${groupName} failed in afterEach callback.`;
            result.pass = false;
            group.time = timeDifference(groupend, groupstart);
            result.time = timeDifference(testend, teststart);
            reporter.onTestFinish(group, result);
            reporter.onGroupFinish(group);
            continue testgroup;
          }
        }

        reporter.onTestFinish(group, result);
        this.logTarget = group;
      }

      // for each afterAllCallback
      for (const afterAllCallback of group.afterAllPointers) {
        // call each afterAll callback
        const afterAllResult = this.tryCall(afterAllCallback);

        // if the test fails
        if (afterAllResult === 0) {
          groupend = performance.now();
          group.pass = false;
          group.reason = `Test suite ${groupName} failed in beforeAll callback.`;
          passed = false;
          group.time = timeDifference(groupend, groupstart);
          reporter.onGroupFinish(group);
          continue testgroup;
        }
      }

      // finish the group
      groupend = performance.now();
      group.time = timeDifference(groupend, groupstart);
      group.reason = `Test suite ${groupName} passed successfully.`;
      reporter.onGroupFinish(group);
    }

    end = performance.now();
    this.time = timeDifference(end, start);
    this.pass = passed;

    reporter.onFinish(this);
  }

  /**
   * This method creates a WebAssembly imports object with all the TestContext functions
   * bound to the TestContext.
   *
   * @param {any[]} imports - Every import item specified.
   */
  public createImports(...imports: any[]): any {
    const result = Object.assign({}, ...imports, {
      __aspect: {
        clearExpected: this.clearExpected.bind(this),
        debug: this.debug.bind(this),
        tryCall: this.tryCall.bind(this),
        logNull: this.logNull.bind(this),
        logReference: this.logReference.bind(this),
        logString: this.logString.bind(this),
        logValue: this.logValue.bind(this),
        reportDescribe: this.reportDescribe.bind(this),
        reportEndDescribe: this.reportEndDescribe.bind(this),
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
        reportExpectedFinite: this.reportExpectedFinite.bind(this),
        reportNegatedTest: this.reportNegatedTest.bind(this),
      },
    });
    result.env = result.env || {};
    const previousAbort = (result.env.abort) || (() => {});
    result.env.abort = (...args: any[]) => {
      previousAbort(...args);
      // @ts-ignore
      this.abort(...args);
    };
    return result;
  }

  /**
   * This web assembly linked function creates a test group. It's called when the test suite calls
   * the describe("test", callback) function from within AssemblyScript. It receives a pointer to
   * the description of the tests, forks the top level test group, pushes the suiteName to a list,
   * then pushes the forked group to the top of the test context stack.
   *
   * @param {number} suiteNamePointer
   */
  private reportDescribe(suiteNamePointer: number): void {
    const group = this.groupStack[this.groupStack.length - 1];
    const nextGroup = group.fork();
    nextGroup.describePointers.push(suiteNamePointer);
    this.groupStack.push(nextGroup);
    this.logTarget = nextGroup;
  }

  /**
   * This web assembly linked function finishes a test group. It's called when the test suite calls
   * the describe("test", callback) function from within AssemblyScript. It pops the current
   * test group from the test context stack and pushes it to the final test group list.
   */
  private reportEndDescribe(): void {
    const next = this.groupStack.pop()!;
    /**
     * If a describe finishes first, it happens BEFORE other describes. This means
     * inner describe blocks run at lower priority than outer describe blocks.
     */
    this.testGroups.unshift(next);
    this.logTarget = this.groupStack[this.groupStack.length - 1];
  }

  /**
   * This web assembly linked function sets the group's "beforeEach" callback pointer to
   * the current groupStackItem.
   *
   * @param {number} callbackPointer - The callback that should run before each test.
   */
  private reportBeforeEach(callbackPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];;
    group.beforeEachPointers.push(callbackPointer);
  }

  /**
   * This web assembly linked function adds the group's "beforeAll" callback pointer to
   * the current groupStackItem.
   *
   * @param {number} callbackPointer - The callback that should run before each test in the
   * current context.
   */
  private reportBeforeAll(callbackPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];;
    group.beforeAllPointers.push(callbackPointer);
  }

  /**
   * This web assembly linked function sets the group's "afterEach" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test group.
   */
  private reportAfterEach(callbackPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];;
    group.afterEachPointers.push(callbackPointer);
  }

  /**
   * This web assembly linked function adds the group's "afterAll" callback pointer to
   * the current groupStackItem.
   *
   * @param {number} callbackPointer - The callback that should run before each test in the
   * current context.
   */
  private reportAfterAll(callbackPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];;
    group.afterAllPointers.push(callbackPointer);
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
  private tryCall(pointer: number): 1 | 0 {
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
   * This adds a logged string to the current test.
   *
   * @param {number} pointer - The pointer to the logged string reference.
   */
  private logString(pointer: number): void {
    const value = new LogValue();
    const target = this.logTarget;

    value.message = `"${this.wasm!.getString(pointer).replace(`"`, `\\"`)}"`;
    value.offset = 0;
    value.pointer = pointer;
    value.stack = this.getLogStackTrace();
    value.target = target;

    // push the log value to the logs
    target.logs.push(value);
  }

  /**
   * Log a reference to the reporter.
   *
   * @param {number} referencePointer - The pointer to the reference.
   * @param {number} offset - The offset of the reference.
   */
  private logReference(referencePointer: number, offset: number): void {
    const value = new LogValue();
    const target = this.logTarget;

    value.bytes = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset));
    value.message = "Reference Type";
    value.offset = offset;
    value.pointer = referencePointer;
    value.stack = this.getLogStackTrace();
    value.target = target;

    // push the log value to the logs
    target.logs.push(value);
  }

  /**
   * Log a numevalueric value to the reporter.
   *
   * @param {number} value - The value to be logged.
   */
  private logValue(numericValue: number): void {
    const value = new LogValue();
    const target = this.logTarget;

    value.stack = this.getLogStackTrace();
    value.message = `Value ${numericValue.toString()}`;
    value.target = target;

    // push the log value to the logs
    target.logs.push(value);
  }

  /**
   * Log a null value to the reporter.
   */
  private logNull(): void {
    // create a new log value
    const value = new LogValue();
    const target = this.logTarget;

    // collect log metadata
    value.stack = this.getLogStackTrace();
    value.message = "null";
    value.target = target;

    // push the log value to the logs
    target.logs.push(value);
  }

  /**
   * Gets a log stack trace.
   */
  private getLogStackTrace(): string {
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
  private getErrorStackTrace(ex: Error): string {
    var stackItems = ex.stack!.toString().split("\n");
    return [stackItems[0], ...stackItems.slice(1).filter(wasmFilter)].join("\n");
  }

  /**
   * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
   */
  private debug(): void { debugger; }

  /**
   * This web assembly linked function creates a test from the callback and the testNamePointer in
   * the current group. It assumes that the group has already been created with the describe
   * function. It is called when `it("description", callback)` or `test("description", callback)`
   * is called.
   *
   * @param {number} testNamePointer - The test's name pointer.
   * @param {number} callback - The test's function.
   */
  private reportTest(testNamePointer: number, callback: number): void {
    var group = this.groupStack[this.groupStack.length - 1];
    group.testFunctionPointers.push(callback);
    group.testNamePointers.push(testNamePointer);
    group.testMessagePointers.push(-1);
    group.testThrows.push(false);
  }

  /**
   * This web assembly linked function is responsible for reporting tests that are expected
   * to fail. This is useful for verifying that specific application states will throw.
   *
   * @param {number} testNamePointer - The test's name pointer.
   * @param {number} callback - The test's function.
   * @param {number} message - The message associated with this test if it does not throw.
   */
  private reportNegatedTest(testNamePointer: number, callback: number, message: number): void {
    var group = this.groupStack[this.groupStack.length - 1];
    group.testFunctionPointers.push(callback);
    group.testNamePointers.push(testNamePointer);
    group.testMessagePointers.push(message);
    group.testThrows.push(true);
  }

  /**
   * This function reports a single "todo" item in a test suite.
   *
   * @param {number} todoPointer - The todo description string pointer.
   */
  private reportTodo(todoPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];
    group.todos.push(todoPointer);
  }

/**
  * This function is called after each expectation if the expectation passes. This prevents other
  * unreachable() conditions that throw errors to report actual and expected values too.
  */
  private clearExpected(): void {
    this.expected = null;
    this.actual = null;
    this.stack = "";
  }

  /**
   * This function reports an actual null value.
   */
  private reportActualNull(): void {
    const value = new ActualValue();
    value.message = `null`;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    this.actual = value;
  }

  /**
   * This function reports an expected null value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedNull(negated: 1 | 0): void {
    const value = new ActualValue();
    value.message = `null`;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an actual numeric value.
   *
   * @param {number} numericValue - The value to be expected.
   */
  private reportActualValue(numericValue: number): void {
    const value = new ActualValue();
    value.message = numericValue.toString();
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    this.actual = value;
  }

  /**
   * This function reports an expected numeric value.
   *
   * @param {number} numericValue - The value to be expected
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedValue(numericValue: number, negated: 0 | 1): void {
    const value = new ActualValue();
    value.message = numericValue.toString();
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
  }

 /**
  * This function reports an actual reference value.
  *
  * @param {number} referencePointer - The actual reference pointer.
  * @param {number} offset - The size of the reference in bytes.
  */
 private reportActualReference(referencePointer: number, offset: number): void {
   const value = new ActualValue();
   value.message = "Reference Type";
   value.stack = this.getLogStackTrace();
   value.target = this.logTarget;
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
 private reportExpectedReference(referencePointer: number, offset: number, negated: 1 | 0): void {
   const value = new ActualValue();
   value.message = "Reference Type";
   value.stack = this.getLogStackTrace();
   value.target = this.logTarget;
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
  private reportExpectedTruthy(negated: 1 | 0): void {
    const value = new ActualValue();
    value.message = `truthy value`;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an expected falsy value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedFalsy(negated: 1 | 0): void {
    const value = new ActualValue();
    value.message = "falsy value";
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an expected finite value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedFinite(negated: 1 | 0): void {
    const value = new ActualValue();
    value.message = "finite value";
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * This function reports an actual string value.
   *
   * @param {number} stringPointer - A pointer that points to the actual string.
   */
  private reportActualString(stringPointer: number): void {
    const value = new ActualValue();
    value.message = `"${this.wasm!.getString(stringPointer).replace(`"`, `\\"`)}"`;
    value.pointer = stringPointer;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    this.actual = value;
  }

  /**
   * This function reports an expected string value.
   *
   * @param {number} stringPointer - A pointer that points to the expected string.
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedString(stringPointer: number, negated: 1 | 0): void {
    const value = new ActualValue();
    value.message = `"${this.wasm!.getString(stringPointer).replace(`"`, `\\"`)}"`;
    value.pointer = stringPointer;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
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
  private abort(reasonPointer: number, _fileNamePointer: number, _line: number, _col: number): void {
    this.message = this.wasm!.getString(reasonPointer);
  }
}
