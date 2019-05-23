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
import { RunContext } from "./RunContext";
import { IPerformanceConfiguration, createDefaultPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { IAspectExports } from "../util/IAspectExports";
import { IWarning } from "./IWarning";

const wasmFilter = (input: string): boolean => /wasm-function/i.test(input);


const enum PerformanceLimits {
  MaxSamples = 10000,
  MaxTestRuntime = 5000,
  MinimumDecimalPlaces = 0,
};

export class TestContext {

  private groupStack: TestGroup[] = [new TestGroup()];
  public testGroups: TestGroup[] = [];
  private logTarget: ILogTarget = this.groupStack[0];

  private wasm: (ASUtil & IAspectExports) | null = null;

  // test state machine values
  private stack: string = "";
  private message: string = "";
  private actual: ActualValue | null = null;
  private expected: ActualValue | null = null;

  public time: number = 0;
  public pass: boolean = true;

  private performanceEnabledValue: boolean | undefined;
  private maxSamplesValue: number | undefined;
  private maxTestRunTimeValue: number | undefined;
  private roundDecimalPlacesValue: number | undefined;
  private recordAverageValue: boolean | undefined;
  private recordMedianValue: boolean | undefined;
  private recordStdDevValue: boolean | undefined;
  private recordMaxValue: boolean | undefined;
  private recordMinValue: boolean | undefined;
  private recordVariance: boolean | undefined;

  /**
   * This value is used to detect if an `expect()` function call was used outside of a test
   * function. If a reportExpected or reportActual function is called before the `context.run()`
   * method is called, it should prevent the `run()` method from running the tests and report a
   * failure.
   */
  private ready: boolean = false;

  public errors: IWarning[] = [];

  constructor(
    public reporter: TestReporter = new DefaultTestReporter(),
    public file: string = "",
    public performanceConfiguration: IPerformanceConfiguration = createDefaultPerformanceConfiguration(),
  ) {
    this.resetPerformanceValues();
  }

  /**
   * Run the tests on the wasm module.
   */
  public run(wasm: ASUtil & IAspectExports): void {
    if (this.errors.length > 0) return;
    this.ready = true;
    this.wasm = wasm;

    const runContext = new RunContext(wasm, this.reporter);

    // start the test suite
    this.reporter.onStart(this);
    runContext.start = performance.now();

    testgroup:
    for (const group of this.testGroups) {
      this.runGroup(runContext, group);
    }

    runContext.end = performance.now();
    this.time = timeDifference(runContext.end, runContext.start);
    this.pass = runContext.passed;

    this.reporter.onFinish(this);
  }

  private runGroup(runContext: RunContext, group: TestGroup): void {
    // get the group's name
    const groupName = group.describePointers
      .map(pointer => this.wasm!.getString(pointer))
      .join(" ");
    group.name = groupName;
    runContext.endGroup = false;

    for (const todoPointer of group.todoPointers) {
      const todo = this.wasm!.getString(todoPointer);
      group.todos.push(todo);
      this.reporter.onTodo(group, todo);
    }

    runContext.groupstart = performance.now();

    // set the log target
    this.logTarget = group;

    // for each beforeAllCallback
    this.runBeforeAll(runContext, group);

    // report the group as started, and log all the beforeAll logs outside the describe block
    this.reporter.onGroupStart(group);

    if (runContext.endGroup) return;

    for (let i = 0; i < group.testFunctionPointers.length; i++) {
      const result = this.runTest(runContext, group, i);
      if (runContext.endGroup) return;
      this.reporter.onTestFinish(group, result!);
      this.logTarget = group;
    }

    // for each afterAllCallback
    this.runAfterAll(runContext, group);
    if (runContext.endGroup) return;

    // finish the group
    runContext.groupend = performance.now();
    group.time = timeDifference(runContext.groupend, runContext.groupstart);
    group.reason = `Test suite ${groupName} passed successfully.`;
    this.reporter.onGroupFinish(group);
  }

  /**
   * Run a given test.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current run group.
   * @param {number} testIndex - The current test index.
   */
  private runTest(runContext: RunContext, group: TestGroup, testIndex: number) {
    // create the test result
    const result = new TestResult();

    const performanceEnabled = group.performanceEnabled[testIndex];

    group.tests.push(result);

    // set the log target
    this.logTarget = result;
    // initialize the test name
    result.name = this.wasm!.getString(group.testNamePointers[testIndex]);

    this.reporter.onTestStart(group, result);
    result.start = performance.now();

    // If performance is enabled, use the performance values, otherwise, just run once.
    if (performanceEnabled) {
      let runCount = 0;
      result.performance = true;

      // collect performance variables
      const reportAverage = group.reportAverage[testIndex];
      const reportMax = group.reportMax[testIndex];
      const reportMedian = group.reportMedian[testIndex];
      const reportMin = group.reportMin[testIndex];
      const reportVariance = group.reportVariance[testIndex];
      const reportStandardDeviation = group.reportStandardDeviation[testIndex];

      // sample collection configuration
      const maxSamplesValue = group.maxSamples[testIndex];
      const maxTestRuntimeValue = group.maxTestRuntime[testIndex];
      const decimalPlacesValue = group.roundDecimalPlaces[testIndex];

      // calculate effective values
      const maxSamples = !isFinite(maxSamplesValue!)
        ? PerformanceLimits.MaxSamples
        : Math.min(maxSamplesValue!, PerformanceLimits.MaxSamples);
      const maxTestRuntime = !isFinite(maxTestRuntimeValue!)
        ? PerformanceLimits.MaxTestRuntime
        : Math.min(maxTestRuntimeValue!, PerformanceLimits.MaxTestRuntime);
      const decimalPlaces = !isFinite(decimalPlacesValue!)
        ? 3
        : Math.max(decimalPlacesValue!, PerformanceLimits.MinimumDecimalPlaces);

      result.decimalPlaces = Math.round(decimalPlaces); // could be a float number
      const testStartTime = performance.now();
      let currentTestRunTime = 0;
      // run the test loop
      while (true) { // always run at least once
        this.runBeforeEach(runContext, group, result);
        /**
         * Especially because the performance functions are run repeatedly, if an error occurs, assume the
         * worst and skip the test group. These functions definitely are assumed to be safe by the test context.
         */
        if (runContext.endGroup) return;
        this.runTestCall(runContext, group, result, testIndex);
        this.runAfterEach(runContext, group, result);
        if (runContext.endGroup) return; // check to see if the afterEach functions errored (see above)

        currentTestRunTime = performance.now() - testStartTime; // calculate how long the current test has run

        runCount += 1;  // increase the run count

        if (runCount >= maxSamples) break; // if we have reached the max sample count
        if (currentTestRunTime >= maxTestRuntime) break; // weve collected enough samples and the test is over
      }

      if (reportAverage) result.calculateAverage();
      if (reportMax) result.calculateMax();
      if (reportMedian) result.calculateMedian();
      if (reportMin) result.calculateMin();
      if (reportVariance) result.calculateVariance();
      if (reportStandardDeviation) result.calculateStandardDeviation();
    } else {
      this.runBeforeEach(runContext, group, result);
      if (runContext.endGroup) return;
      this.runTestCall(runContext, group, result, testIndex);
      this.runAfterEach(runContext, group, result);
      if (runContext.endGroup) return;
    }

    result.end = performance.now();
    result.runTime = result.start - result.end;
    return result;
  }

  /**
   * Run the current test once and collect statistics.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The current test result.
   * @param {number} testIndex - The current test index.
   */
  private runTestCall(runContext: RunContext, group: TestGroup, result: TestResult, testIndex: number): void {
    const testFunctionCallback = group.testFunctionPointers[testIndex];
    const start = performance.now();
    const testCallResult = this.tryCall(testFunctionCallback);
    const end = performance.now();
    const throws = group.testThrows[testIndex];
    runContext.testend = performance.now();
    result.times.push(timeDifference(end, start));
    result.pass = throws
      ? (testCallResult === 0)
      : (testCallResult === 1);
    result.negated = throws;
    if (!result.pass) {
      group.pass = false;
      // if it throws...
      if (throws) {
        // only set the message
        result.message = this.wasm!.getString(group.testMessagePointers[testIndex]);
      }
      else {
        // set the message, the actual, expected, and stack values
        result.message = this.message;
        result.actual = this.actual;
        result.expected = this.expected;
        result.stack = this.stack;
      }
    }
  }

  /**
   * Run the afterEach callbacks before running the test.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The current test result.
   */
  private runAfterEach(runContext: RunContext, group: TestGroup, result: TestResult): void {
    // for each afterEach callback function pointer
    for (const afterEachCallback of group.afterEachPointers) {
      const afterEachResult = this.tryCall(afterEachCallback);
      // if afterEach fails
      if (afterEachResult === 0) {
        runContext.testend = performance.now();
        runContext.groupend = performance.now();
        group.pass = false;
        group.reason = group.reason = `Test suite ${group.name} failed in afterEach callback.`;
        result.pass = false;
        group.time = timeDifference(runContext.groupend, runContext.groupstart);
        this.reporter.onTestFinish(group, result);
        this.reporter.onGroupFinish(group);
        runContext.endGroup = true;
        return;
      }
    }
  }

  /**
   * Run the beforeEach callbacks before running the test.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The current test result.
   */
  private runBeforeEach(runContext: RunContext, group: TestGroup, result: TestResult): void {
    // for each beforeEach callback function pointer
    for (const beforeEachCallback of group.beforeEachPointers) {
      const beforeEachResult = this.tryCall(beforeEachCallback);
      // if beforeEach fails
      if (beforeEachResult === 0) {
        runContext.testend = performance.now();
        runContext.groupend = performance.now();
        group.pass = false;
        group.reason = group.reason = `Test suite ${group.name} failed in beforeEach callback.`;
        result.pass = false;
        group.time = timeDifference(runContext.groupend, runContext.groupstart);
        this.reporter.onTestFinish(group, result);
        this.reporter.onGroupFinish(group);
        runContext.endGroup = true;
        return;
      }
    }
  }

  /**
   * Run the afterAll callbacks with the given runContext and group.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   */
  private runAfterAll(runContext: RunContext, group: TestGroup): void {
    for (const afterAllCallback of group.afterAllPointers) {
      // call each afterAll callback
      const afterAllResult = this.tryCall(afterAllCallback);
      // if the test fails
      if (afterAllResult === 0) {
        runContext.groupend = performance.now();
        group.pass = false;
        group.reason = `Test suite ${group.name} failed in afterAll callback.`;
        runContext.passed = false;
        group.time = timeDifference(runContext.groupend, runContext.groupstart);
        this.reporter.onGroupFinish(group);
        runContext.endGroup = true;
        return;
      }
    }
  }

  /**
   * Run the beforeAll callbacks with the given runContext and group.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   */
  private runBeforeAll(runContext: RunContext, group: TestGroup): void {
    for (const beforeAllCallback of group.beforeAllPointers) {
      // call each beforeAll callback
      const beforeAllResult = this.tryCall(beforeAllCallback);
      // if the test fails
      if (beforeAllResult === 0) {
        runContext.groupend = performance.now();
        group.pass = false;
        group.reason = `Test suite ${group.name} failed in beforeAll callback.`;
        runContext.passed = false;
        group.time = timeDifference(runContext.groupend, runContext.groupstart);
        runContext.endGroup = true;
        return;
      }
    }
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
        performanceEnabled: this.performanceEnabled.bind(this),
        maxSamples: this.maxSamples.bind(this),
        maxTestRunTime: this.maxTestRunTime.bind(this),
        roundDecimalPlaces: this.roundDecimalPlaces.bind(this),
        reportAverage: this.reportAverage.bind(this),
        reportMedian: this.reportMedian.bind(this),
        reportStdDev: this.reportStdDev.bind(this),
        reportMax: this.reportMax.bind(this),
        reportMin: this.reportMin.bind(this),
        reportVariance: this.reportVariance.bind(this),
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

    try {
      this.wasm!.__call(pointer)
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

    value.message = this.wasm!.getString(pointer);
    value.offset = 0;
    value.pointer = pointer;
    value.stack = this.getLogStackTrace();
    value.target = target;
    value.value = pointer;

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
    value.value = referencePointer;

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
    value.value = numericValue;
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
    group.performanceEnabled.push(this.performanceEnabledValue);
    group.maxSamples.push(this.maxSamplesValue);
    group.maxTestRuntime.push(this.maxTestRunTimeValue);
    group.roundDecimalPlaces.push(this.roundDecimalPlacesValue);
    group.reportAverage.push(this.recordAverageValue);
    group.reportMedian.push(this.recordMedianValue);
    group.reportStandardDeviation.push(this.recordStdDevValue);
    group.reportMax.push(this.recordMaxValue);
    group.reportMin.push(this.recordMinValue);
    group.reportVariance.push(this.recordVariance);
    this.resetPerformanceValues();
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
    group.performanceEnabled.push(this.performanceEnabledValue);
    group.maxSamples.push(this.maxSamplesValue);
    group.maxTestRuntime.push(this.maxTestRunTimeValue);
    group.roundDecimalPlaces.push(this.roundDecimalPlacesValue);
    group.reportAverage.push(this.recordAverageValue);
    group.reportMedian.push(this.recordMedianValue);
    group.reportStandardDeviation.push(this.recordStdDevValue);
    group.reportMax.push(this.recordMaxValue);
    group.reportMin.push(this.recordMinValue);
    group.reportVariance.push(this.recordVariance);
    this.resetPerformanceValues();
  }

  /**
   * This function reports a single "todo" item in a test suite.
   *
   * @param {number} todoPointer - The todo description string pointer.
   */
  private reportTodo(todoPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];
    group.todoPointers.push(todoPointer);
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
    if (!this.ready) {
      this.reportInvalidExpectCall();
      return;
    }
    const value = new ActualValue();
    value.message = `null`;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.value = null;
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
    value.value = null;
    this.expected = value;
  }

  /**
   * This function reports an actual numeric value.
   *
   * @param {number} numericValue - The value to be expected.
   */
  private reportActualValue(numericValue: number): void {
    if (!this.ready) {
      this.reportInvalidExpectCall();
      return;
    }
    const value = new ActualValue();
    value.message = numericValue.toString();
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.value = numericValue;
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
    value.value = numericValue;
    this.expected = value;
  }

 /**
  * This function reports an actual reference value.
  *
  * @param {number} referencePointer - The actual reference pointer.
  * @param {number} offset - The size of the reference in bytes.
  */
 private reportActualReference(referencePointer: number, offset: number): void {
   if (!this.ready) {
     this.reportInvalidExpectCall();
     return;
   }
   const value = new ActualValue();
   value.message = "Reference Value";
   value.stack = this.getLogStackTrace();
   value.target = this.logTarget;
   value.pointer = referencePointer;
   value.offset = offset;
   value.bytes = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset));
   value.value = referencePointer;
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
   value.message = "Reference Value";
   value.stack = this.getLogStackTrace();
   value.target = this.logTarget;
   value.pointer = referencePointer;
   value.offset = offset;
   value.bytes = Array.from(this.wasm!.U8.slice(referencePointer, referencePointer + offset));
   value.negated = negated === 1;
   value.value = referencePointer;
   this.expected = value;
 }

  /**
   * This function reports an expected truthy value.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedTruthy(negated: 1 | 0): void {
    const value = new ActualValue();
    value.message = "Truthy Value";
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
    value.message = "Falsy Value";
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
    value.message = "Finite Value";
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
    if (!this.ready) {
      this.reportInvalidExpectCall();
      return;
    }
    const value = new ActualValue();
    value.message = this.wasm!.getString(stringPointer);
    value.pointer = stringPointer;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.value = stringPointer;
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
    value.message = this.wasm!.getString(stringPointer);
    value.pointer = stringPointer;
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    value.value = stringPointer;
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

  /**
   * Reset all the performance values to the configured values.
   */
  private resetPerformanceValues(): void {
    this.performanceEnabledValue = this.performanceConfiguration.enabled;
    this.maxSamplesValue = this.performanceConfiguration.maxSamples;
    this.maxTestRunTimeValue = this.performanceConfiguration.maxTestRunTime;
    this.roundDecimalPlacesValue = this.performanceConfiguration.roundDecimalPlaces;
    this.recordAverageValue = this.performanceConfiguration.reportAverage;
    this.recordMedianValue = this.performanceConfiguration.reportMedian;
    this.recordStdDevValue = this.performanceConfiguration.reportStandardDeviation;
    this.recordMaxValue = this.performanceConfiguration.reportMax;
    this.recordMinValue = this.performanceConfiguration.reportMin;
    this.recordVariance = this.performanceConfiguration.reportVariance;
  }

  /**
   * This web assembly linked function modifies the state machine to enable
   * performance for the following test.
   *
   * @param {1 | 0} value - A value indicating if performance should be enabled.
   */
  private performanceEnabled(value: 1 | 0): void {
    this.performanceEnabledValue = value === 1;
  }

  /**
   * This web assembly linked function modifies the state machine to set the maximum number of
   * samples for the following test.
   *
   * @param {number} value - The maximum number of samples to collect for the following test.
   */
  private maxSamples(value: number): void {
    this.maxSamplesValue = value;
  }

  /**
   * This web assembly linked function modifies the state machine to set the maximum amount of
   * time to run the following test in milliseconds
   *
   * @param {number} value - The maximum number of milliseconds to run the following test.
   */
  private maxTestRunTime(value: number): void {
    this.maxTestRunTimeValue = value;
  }

  /**
   * This web assembly linked function modifies the state machine to set the number of decimal places
   * to round all the statistics to.
   *
   * @param {number} value - The number of decimal places to round to.
   */
  private roundDecimalPlaces(value: number): void {
    this.roundDecimalPlacesValue = value;
  }

  /**
   * This web assembly linked function modifies the state machine to cause the next test to report
   * an average run time.
   *
   * @param {1 | 0} value - A boolean indicating if the average should be reported.
   */
  private reportAverage(value: 1 | 0): void {
    this.recordAverageValue = value === 1;
  }

  /**
   * This web assembly linked function modifies the state machine to cause the next test to report
   * an median run time.
   *
   * @param {1 | 0} value - A boolean indicating if the median should be reported.
   */
  private reportMedian(value: 1 | 0): void {
    this.recordMedianValue = value === 1;
  }

  /**
   * This web assembly linked function modifies the state machine to cause the next test to report
   * a standard deviation calculation on the run times.
   *
   * @param {1 | 0} value - A boolean indicating if the standard deviation should be reported.
   */
  private reportStdDev(value: 1 | 0): void {
    this.recordStdDevValue = value === 1;
  }

  /**
   * This web assembly linked function modifies the state machine to cause the next test to report
   * the maximum run time for this test.
   *
   * @param {1 | 0} value - A boolean indicating if the max should be reported.
   */
  private reportMax(value: 1 | 0): void {
    this.recordMaxValue = value === 1;
  }

  /**
   * This web assembly linked function modifies the state machine to cause the next test to report
   * the minimum run time for this test.
   *
   * @param {1 | 0} value - A boolean indicating if the min should be reported.
   */
  private reportMin(value: 1 | 0): void {
    this.recordMinValue = value === 1;
  }

  /**
   * This web assembly linked function modifies the state machine to cause the next test to report
   * the variance of the run times for this test.
   *
   * @param {1 | 0} value - A boolean indicating if the min should be reported.
   */
  private reportVariance(value: 1 | 0): void {
    this.recordVariance = value === 1;
  }

  /**
   * This method reports to the TestContext that an expect function call was used outside of the
   * intended test functions.
   */
  private reportInvalidExpectCall(): void {
    this.errors.push({
      type: "InvalidExpectCall",
      message: `An expect() function call was used outside of a test function in ${this.file}.`,
      stackTrace: this.getLogStackTrace(),
    });
  }
}
