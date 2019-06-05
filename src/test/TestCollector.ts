import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { TestGroup } from "./TestGroup";
import { ILogTarget } from "../util/ILogTarget";
import { IWarning } from "./IWarning";
import { IPerformanceConfiguration, createDefaultPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { TestResult } from "./TestResult";
import { PerformanceLimits } from "./PerformanceLimits";
// @ts-ignore: Constructor is new Long(low, high, signed);
import Long from "long";

const wasmFilter = (input: string): boolean => /wasm-function/i.test(input);

export interface ITestCollectorParameters {
  performanceConfiguration?: IPerformanceConfiguration;
  testRegex?: RegExp;
  groupRegex?: RegExp;
  fileName?: string;

}

/**
 * This class is responsible for collecting all the tests in a test binary.
 */
export class TestCollector {
  protected wasm: (ASUtil & IAspectExports) | null = null;

  // test group values
  private groupStack: TestGroup[] = [new TestGroup()];
  public testGroups: TestGroup[] = [];
  protected logTarget: ILogTarget = this.groupStack[0];

  // public warning/error lists
  public errors: IWarning[] = [];

  // public fileName
  public fileName: string = "";

  // test state machine values
  protected stack: string = "";
  protected message: string = "";
  protected actual: ActualValue | null = null;
  protected expected: ActualValue | null = null;

  // performance collection values
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

  private performanceConfiguration: IPerformanceConfiguration = createDefaultPerformanceConfiguration();

  /**
   * This value is used to detect if an `expect()` function call was used outside of a test
   * function. If a reportExpected or reportActual function is called before the `context.run()`
   * method is called, it should prevent the `run()` method from running the tests and report a
   * failure.
   */
  protected ready: boolean = false;

  /**
   * These are the test and group filters for the binary. They must be provided before collection
   * begins.
   */
  protected testRegex: RegExp = new RegExp("");
  protected groupRegex: RegExp = new RegExp("");

  constructor(props?: ITestCollectorParameters) {
    if (props) {
      /* istanbul ignore next */
      if (props.fileName) this.fileName = props.fileName;
      /* istanbul ignore next */
      if (props.testRegex) this.testRegex = props.testRegex;
      /* istanbul ignore next */
      if (props.groupRegex) this.groupRegex = props.groupRegex;
      /* istanbul ignore next */
      if (props.performanceConfiguration) this.performanceConfiguration = props.performanceConfiguration;
    }
  }

  /**
   * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
   * process of test collection.
   */
  protected collectTests(): void {
    // reset the performance values first, then collect the tests by calling `__main()`
    this.resetPerformanceValues();
    this.wasm!.__main();
    this.wasm!.__ready();
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
        debug: this.debug.bind(this),
        tryCall: this.tryCall.bind(this),
        logArray: this.logArray.bind(this),
        logLong: this.logLong.bind(this),
        logNull: this.logNull.bind(this),
        logReference: this.logReference.bind(this),
        logString: this.logString.bind(this),
        logValue: this.logValue.bind(this),
        reportInvalidExpectCall: this.reportInvalidExpectCall.bind(this),
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
        reportActualArray: this.reportActualArray.bind(this),
        reportExpectedArray: this.reportExpectedArray.bind(this),
        reportActualLong: this.reportActualLong.bind(this),
        reportExpectedLong: this.reportExpectedLong.bind(this),
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
   * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
   */
  private debug(): void { debugger; }

  /**
   * This is a web assembly utility function that wraps a function call in a try catch block to
   * report success or failure.
   *
   * @param {number} pointer - The function pointer to call. It must accept no parameters and return
   * void.
   * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
   * returns 0.
   */
  protected tryCall(pointer: number): 1 | 0 {
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
   * Log an array to the reporter.
   *
   * @param arrayPointer - The array pointer.
   */
  private logArray(arrayPointer: number): void {
    const value = new LogValue();
    const target = this.logTarget;

    value.stack = this.getLogStackTrace();
    value.message = JSON.stringify(this.wasm!.__getArray(arrayPointer));
    value.target = target;

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
   * This adds a logged string to the current test.
   *
   * @param {number} pointer - The pointer to the logged string reference.
   */
  private logString(pointer: number): void {
    const value = new LogValue();
    const target = this.logTarget;

    value.message = this.wasm!.__getString(pointer);
    value.offset = 0;
    value.pointer = pointer;
    value.stack = this.getLogStackTrace();
    value.target = target;
    value.value = pointer;

    // push the log value to the logs
    target.logs.push(value);
  }

  /**
   * Log a numevalueric value to the reporter.
   *
   * @param {number} value - The value to be logged.
   * @param {1 | 0} signed - The value indicating if the number is signed.
   */
  private logValue(numericValue: number, signed: 1 | 0): void {
    const value = new LogValue();
    const target = this.logTarget;

    // convert to unsigned value if the integer is not signed
    numericValue = signed === 1 ? numericValue : numericValue >>> 0;

    value.stack = this.getLogStackTrace();
    value.message = `Value ${numericValue.toString()}`;
    value.value = numericValue;
    value.target = target;

    // push the log value to the logs
    target.logs.push(value);
  }

  /**
   * Log a long value.
   *
   * @param suiteNamePointer - The boxed long value's pointer.
   */
  private logLong(boxPointer: number, signed: 1 | 0): void {
    const value = new LogValue();
    const target = this.logTarget;

    const long = new Long
      .fromBytesLE(this.wasm!.U8.slice(boxPointer, boxPointer + 8), !signed);

    value.stack = this.getLogStackTrace();
    value.message = `Value ${long.toString()}`;
    value.target = target;

    // push the log value to the logs
    target.logs.push(value);
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
    nextGroup.name = group.name + this.wasm!.__getString(suiteNamePointer);
    nextGroup.willRun = this.groupRegex.test(nextGroup.name);
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

    const testCount = next.tests.length;

    /**
     * If a describe finishes first, it happens BEFORE other describes. This means
     * inner describe blocks run at lower priority than outer describe blocks. It also should be
     * pushed if it willRun.
     */
    if (next.willRun && testCount > 0) {
      this.testGroups.unshift(next);
    }
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
   * This web assembly linked function creates a test from the callback and the testNamePointer in
   * the current group. It assumes that the group has already been created with the describe
   * function. It is called when `it("description", callback)` or `test("description", callback)`
   * is called.
   *
   * @param {number} testNamePointer - The test's name pointer.
   * @param {number} callback - The test's function.
   */
  private reportTest(testNamePointer: number, callback: number): void {
    const group = this.groupStack[this.groupStack.length - 1];
    if (!group.willRun) return;
    const name = this.wasm!.__getString(testNamePointer);
    if (!this.testRegex.test(name)) return;

    const test = new TestResult();

    test.functionPointer = callback;
    test.name = name;
    test.message = "";
    test.negated = false;
    test.performance = this.performanceEnabledValue || false;
    if (test.performance) {
      test.maxSamples = !isFinite(this.maxSamplesValue!)
        ? PerformanceLimits.MaxSamples
        : Math.min(this.maxSamplesValue!, PerformanceLimits.MaxSamples);

      test.maxRuntime = !isFinite(this.maxTestRunTimeValue!)
        ? PerformanceLimits.MaxTestRuntime
        : Math.min(this.maxTestRunTimeValue!, PerformanceLimits.MaxTestRuntime);

      test.decimalPlaces = !isFinite(this.roundDecimalPlacesValue!)
        ? 3
        : Math.max(Math.round(this.roundDecimalPlacesValue!), PerformanceLimits.MinimumDecimalPlaces);

      test.calculateAverageValue = this.recordAverageValue || false;
      test.calculateMedianValue = this.recordMedianValue || false;
      test.calculateStandardDeviationValue = this.recordStdDevValue || false;
      test.calculateMaxValue = this.recordMaxValue || false;
      test.calculateMinValue = this.recordMinValue || false;
      test.calculateVarianceValue = this.recordVariance || false;
    }
    group.tests.push(test);
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
    const group = this.groupStack[this.groupStack.length - 1];
    if (!group.willRun) return;
    const name = this.wasm!.__getString(testNamePointer);
    if (!this.testRegex.test(name)) return;

    const test = new TestResult();

    test.functionPointer = callback;
    test.name = name;
    test.message = this.wasm!.__getString(message);
    test.negated = true;
    test.performance = this.performanceEnabledValue || false;
    /* istanbul ignore next */
    if (test.performance) {
      /* istanbul ignore next */
      test.maxSamples = !isFinite(this.maxSamplesValue!)
        ? PerformanceLimits.MaxSamples
        : Math.min(this.maxSamplesValue!, PerformanceLimits.MaxSamples);

      /* istanbul ignore next */
      test.maxRuntime = !isFinite(this.maxTestRunTimeValue!)
        ? PerformanceLimits.MaxTestRuntime
        : Math.min(this.maxTestRunTimeValue!, PerformanceLimits.MaxTestRuntime);

      /* istanbul ignore next */
      test.decimalPlaces = !isFinite(this.roundDecimalPlacesValue!)
        ? 3
        : Math.max(Math.round(this.roundDecimalPlacesValue!), PerformanceLimits.MinimumDecimalPlaces);

      /* istanbul ignore next */
      test.calculateAverageValue = this.recordAverageValue || false;
      /* istanbul ignore next */
      test.calculateMedianValue = this.recordMedianValue || false;
      /* istanbul ignore next */
      test.calculateStandardDeviationValue = this.recordStdDevValue || false;
      /* istanbul ignore next */
      test.calculateMaxValue = this.recordMaxValue || false;
      /* istanbul ignore next */
      test.calculateMinValue = this.recordMaxValue || false;
      /* istanbul ignore next */
      test.calculateVarianceValue = this.recordVariance || false;
    }
    group.tests.push(test);
    this.resetPerformanceValues();
  }

  /**
   * This function reports a single "todo" item in a test suite.
   *
   * @param {number} todoPointer - The todo description string pointer.
   */
  private reportTodo(todoPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];
    group.todos.push(this.wasm!.__getString(todoPointer));
  }

  /**
   * This function reports an actual null value.
   */
  private reportActualNull(): void {
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
   * @param {1 | 0} signed - The value indicating if the value is signed.
   */
  private reportActualValue(numericValue: number, signed: 1 | 0): void {
    // flip the sign bits if it's unsigned
    numericValue = signed === 1 ? numericValue : numericValue >>> 0;

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
   * @param {number} numericValue - The expected value.
   * @param {1 | 0} signed - The value indicating if the value is signed.
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedValue(numericValue: number, signed: 0 | 1, negated: 0 | 1): void {
    // convert to unsigned if the value is unsigned
    numericValue = signed === 1 ? numericValue : numericValue >>> 0;

    const value = new ActualValue();
    value.message = numericValue.toString();
    value.stack = this.getLogStackTrace();
    value.target = this.logTarget;
    value.negated = negated === 1;
    value.value = numericValue;
    this.expected = value;
  }

 /**
  * This function reports an actual long value.
  *
  * @param {number} boxPointer - The expected box pointer.
  * @param {1 | 0} signed - An indicator if the long value is signed.
  */
 private reportActualLong(boxPointer: number, signed: 1 | 0): void {
  const value = new ActualValue();

  const long = new Long
    .fromBytesLE(this.wasm!.U8.slice(boxPointer, boxPointer + 8), !signed);

  value.message = "Long Value: " + long.toString();
  value.stack = this.getLogStackTrace();
  value.target = this.logTarget;
  this.actual = value;
}

 /**
  * This function reports an actual reference value.
  *
  * @param {number} referencePointer - The actual reference pointer.
  * @param {number} offset - The size of the reference in bytes.
  */
 private reportActualReference(referencePointer: number, offset: number): void {
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
  * This function reports an expected long value.
  *
  * @param {number} boxPointer - The expected box pointer.
  * @param {1 | 0} signed - An indicator if the long value is signed.
  * @param {1 | 0} negated - An indicator if the expectation is negated.
  */
 private reportExpectedLong(boxPointer: number, signed: 1 | 0, negated: 1 | 0): void {
  const value = new ActualValue();

  const long = new Long
    .fromBytesLE(this.wasm!.U8.slice(boxPointer, boxPointer + 8), !signed);

  value.message = "Long Value: " + long.toString();
  value.stack = this.getLogStackTrace();
  value.target = this.logTarget;
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
    const value = new ActualValue();
    value.message = this.wasm!.__getString(stringPointer);
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
    value.message = this.wasm!.__getString(stringPointer);
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
    this.message = this.wasm!.__getString(reasonPointer);
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
      message: `An expect() function call was used outside of a test function in ${this.fileName}.`,
      stackTrace: this.getLogStackTrace(),
    });
  }

  /**
   * This method reports an actual array value.
   *
   * @param {number} arrayPointer - The Array pointer.
   */
  private reportActualArray(arrayPointer: number): void {
    const array = this.wasm!.__getArray(arrayPointer);
    const value = new ActualValue();
    value.message = JSON.stringify(array);
    value.target = this.logTarget;
    this.actual = value;
  }

  /**
   * This  method reports an expected array value.
   *
   * @param {number} arrayPointer - The Array pointer.
   * @param {1 | 0} negated - Is `1` if the expectation is negated.
   */
  private reportExpectedArray(arrayPointer: number, negated: 1 | 0): void {
    const array = this.wasm!.__getArray(arrayPointer);
    const value = new ActualValue();
    value.message = JSON.stringify(array);
    value.target = this.logTarget;
    value.negated = negated === 1;
    this.expected = value;
  }

  /**
   * Gets an error stack trace.
   */
  private getErrorStackTrace(ex: Error): string {
    var stackItems = ex.stack!.toString().split("\n");
    return [stackItems[0], ...stackItems.slice(1).filter(wasmFilter)].join("\n");
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
   * Gets a log stack trace.
   */
  private getLogStackTrace(): string {
    return new Error("Get stack trace.")
      .stack!
      .toString()
      .split("\n")
      .slice(1)
      .filter(wasmFilter)
      .join("\n");
  }
}