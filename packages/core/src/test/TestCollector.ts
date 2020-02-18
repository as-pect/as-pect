import { IAspectExports } from "../util/IAspectExports";
import { TestGroup } from "./TestGroup";
import { ILogTarget } from "../util/ILogTarget";
import { IWarning } from "./IWarning";
import {
  IPerformanceConfiguration,
  createDefaultPerformanceConfiguration,
} from "../util/IPerformanceConfiguration";
import { TestResult } from "./TestResult";
import { PerformanceLimits } from "./PerformanceLimits";
// @ts-ignore: Constructor is new Long(low, high, signed);
import Long from "long";
import { NameSection } from "../util/wasmTools";
import { HostValue } from "../util/HostValue";
import { HostValueType } from "@as-pect/assembly/assembly/internal/HostValueType";

/**
 * @ignore
 * This function is a filter for stack trace lines.
 *
 * @param {string} input - The stack trace line.
 */
const wasmFilter = (input: string): boolean => /wasm-function/i.test(input);

/**
 * @ignore
 * This is a collection of all the parameters required for intantiating a TestCollector.
 */
export interface ITestCollectorParameters {
  /** A provided performance configuration. */
  performanceConfiguration?: Partial<IPerformanceConfiguration>;
  /** A regular expression that filters what tests can be run. Must be set before calling `testContext.run(wasm);` */
  testRegex?: RegExp;
  /** A regular expression that filters what test groups can be run. Must be set before calling `testContext.run(wasm);` */
  groupRegex?: RegExp;
  /**
   * Put the AssemblyScript test filename here.
   *
   * @example
   * ```ts
   * const ctx = new TestContext({
   *   fileName: "example.spec.ts",
   * });
   * ```
   */
  fileName?: string;
  /** Disable RTrace when set to `true`. */
  nortrace?: boolean;
  binary?: Uint8Array;
}

/**
 * @ignore
 * This is an internal class that is responsible for collecting all the tests in a test binary.
 */
export class TestCollector {
  protected wasm: IAspectExports | null = null;
  protected nameSection: NameSection | null = null;

  // test group values
  private groupStack: TestGroup[] = [new TestGroup()];
  /** A collection of `TestGroup` objects that ran tests after `testContext.run(wasm)` was called. */
  public testGroups: TestGroup[] = [];

  /** The root `TestGroup` object. */
  public topLevelGroup: TestGroup | null = null;

  protected logTarget: ILogTarget = this.groupStack[0];

  /** A set of errors that were collected during the testing process. */
  public errors: IWarning[] = [];
  /** A set of warnings that were collected during the testing process. */
  public warnings: IWarning[] = [];

  /** The name of the AssemblyScript test file. */
  public fileName: string = "";

  // test state machine values
  protected stack: string = "";
  protected message: string = "";
  protected actual: HostValue | null = null;
  protected expected: HostValue | null = null;

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

  // partial performance configuration
  private performanceConfiguration: Partial<
    IPerformanceConfiguration
  > = createDefaultPerformanceConfiguration();

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

  /**
   * RTrace is a funciton that helps with debugging reference counting and can be used to find
   * leaks. If it is enabled, it will be included automatically by the bootstrap in the
   * assemblyscript imports.
   */
  protected rtraceEnabled: boolean = true;

  /**
   * A collection of host values used to help cache and aid in the creation
   * of nested host values.
   */
  private hostValueCache: HostValue[] = [];

  // This map collects the starting values for the labels created by `RTrace.start()`
  private rtraceLabels: Map<number, number> = new Map();

  constructor(props?: ITestCollectorParameters) {
    /* istanbul ignore next */
    if (props) {
      /* istanbul ignore next */
      if (props.fileName) this.fileName = props.fileName;
      /* istanbul ignore next */
      if (props.testRegex) this.testRegex = props.testRegex;
      /* istanbul ignore next */
      if (props.groupRegex) this.groupRegex = props.groupRegex;
      /* istanbul ignore next */
      if (props.performanceConfiguration)
        this.performanceConfiguration = props.performanceConfiguration;

      if (this.performanceConfiguration.maxSamples != null) {
        if (
          this.performanceConfiguration.maxSamples >
          PerformanceLimits.MaxSamples
        ) {
          /* istanbul ignore next */
          this.pushWarning({
            message:
              "Invalid Performance Configuration: maxSamples exceeds " +
              PerformanceLimits.MaxSamples,
            stackTrace: new Error().stack || "",
            type: "PerformanceConfigurationWarning",
          });
        }

        if (this.performanceConfiguration.maxSamples < 0) {
          /* istanbul ignore next */
          this.pushWarning({
            message:
              "Invalid Performance Configuration: maxSamples less than 0.",
            stackTrace: new Error().stack || "",
            type: "PerformanceConfigurationWarning",
          });
        }
      }

      if (this.performanceConfiguration.maxTestRunTime != null) {
        if (
          this.performanceConfiguration.maxTestRunTime >
          PerformanceLimits.MaxTestRuntime
        ) {
          /* istanbul ignore next */
          this.pushWarning({
            message:
              "Invalid Performance Configuration: maxTestRunTime exceeds " +
              PerformanceLimits.MaxTestRuntime,
            stackTrace: new Error().stack || "",
            type: "PerformanceConfigurationWarning",
          });
        }

        if (this.performanceConfiguration.maxTestRunTime < 0) {
          /* istanbul ignore next */
          this.pushWarning({
            message:
              "Invalid Performance Configuration: maxTestRunTime less than 0.",
            stackTrace: new Error().stack || "",
            type: "PerformanceConfigurationWarning",
          });
        }
      }

      if (this.performanceConfiguration.roundDecimalPlaces != null) {
        if (
          this.performanceConfiguration.roundDecimalPlaces >
          PerformanceLimits.MaximumDecimalPlaces
        ) {
          /* istanbul ignore next */
          this.pushWarning({
            message:
              "Invalid Performance Configuration: roundDecimalPlaces exceeds " +
              PerformanceLimits.MaximumDecimalPlaces,
            stackTrace: new Error().stack || "",
            type: "PerformanceConfigurationWarning",
          });
        }

        if (
          this.performanceConfiguration.roundDecimalPlaces <
          PerformanceLimits.MinimumDecimalPlaces
        ) {
          /* istanbul ignore next */
          this.pushWarning({
            message:
              "Invalid Performance Configuration: roundDecimalPlaces less than " +
              PerformanceLimits.MinimumDecimalPlaces,
            stackTrace: new Error().stack || "",
            type: "PerformanceConfigurationWarning",
          });
        }
      }

      /* istanbul ignore next */
      if (props.nortrace) this.rtraceEnabled = false;
      /* istanbul ignore next */
      if (props.binary) this.nameSection = new NameSection(props.binary);
    }
  }

  /**
   * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
   * process of test collection.
   */
  protected collectTests(): void {
    // reset the performance values first, then collect the tests by calling `__main()`
    this.resetPerformanceValues();

    /**
     * In version >0.8.1 of assemblyscript, there was a __start function refactor that helped
     * conform assemblyscript to the wasi standard. The following line is used for backwards
     * compatibility to older versions of assemblyscript. Coverage is ignored because one branch
     * is impossible to test using assemblyscript latest.
     */
    /* istanbul ignore next */
    const startFunc = this.wasm!.__start ?? this.wasm!._start!;
    startFunc();
    this.wasm!.__ready();
    let topLevelGroup = this.groupStack[0];

    topLevelGroup.willRun = this.groupRegex.test(topLevelGroup.name);
    this.reportEndDescribe();
    this.topLevelGroup = topLevelGroup!;

    /* istanbul ignore next */
    if (!topLevelGroup || this.groupStack.length > 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: "Invalid TestContext state after test collection.",
        stackTrace: this.getLogStackTrace(),
        type: "InvalidTestContextState",
      });
    }
  }

  /**
   * This method creates a WebAssembly imports object with all the TestContext functions
   * bound to the TestContext.
   *
   * @param {any[]} imports - Every import item specified.
   */
  public createImports(...imports: any[]): any {
    const result = Object.assign(
      {},
      ...imports, // get all the user defined imports
      {
        __aspect: {
          clearActual: this.clearActual.bind(this),
          clearExpected: this.clearExpected.bind(this),
          createHostValue: this.createHostValue.bind(this),
          debug: this.debug.bind(this),
          endRTrace: this.endRTrace.bind(this),
          getRTraceAllocations: this.getRTraceAllocations.bind(this),
          getRTraceBlocks: this.getRTraceBlocks.bind(this),
          getRTraceCount: this.getRTraceCount.bind(this),
          getRTraceDecrements: this.getRTraceDecrements.bind(this),
          getRTraceFrees: this.getRTraceFrees.bind(this),
          getRTraceGroupAllocations: this.getRTraceGroupAllocations.bind(this),
          getRTraceGroupBlocks: this.getRTraceGroupBlocks.bind(this),
          getRTraceGroupDecrements: this.getRTraceGroupDecrements.bind(this),
          getRTraceGroupFrees: this.getRTraceGroupFrees.bind(this),
          getRTraceGroupIncrements: this.getRTraceGroupIncrements.bind(this),
          getRTraceGroupReallocs: this.getRTraceGroupReallocs.bind(this),
          getRTraceIncrements: this.getRTraceIncrements.bind(this),
          getRTraceReallocs: this.getRTraceReallocs.bind(this),
          getRTraceTestAllocations: this.getRTraceTestAllocations.bind(this),
          getRTraceTestBlocks: this.getRTraceTestBlocks.bind(this),
          getRTraceTestDecrements: this.getRTraceTestDecrements.bind(this),
          getRTraceTestFrees: this.getRTraceTestFrees.bind(this),
          getRTraceTestIncrements: this.getRTraceTestIncrements.bind(this),
          getRTraceTestReallocs: this.getRTraceTestReallocs.bind(this),
          logHostValue: this.logHostValue.bind(this),
          maxSamples: this.maxSamples.bind(this),
          maxTestRunTime: this.maxTestRunTime.bind(this),
          performanceEnabled: this.performanceEnabled.bind(this),
          pushHostObjectKey: this.pushHostObjectKey.bind(this),
          pushHostObjectValue: this.pushHostObjectValue.bind(this),
          reportActualHostValue: this.reportActualHostValue.bind(this),
          reportAfterAll: this.reportAfterAll.bind(this),
          reportAfterEach: this.reportAfterEach.bind(this),
          reportAverage: this.reportAverage.bind(this),
          reportBeforeAll: this.reportBeforeAll.bind(this),
          reportBeforeEach: this.reportBeforeEach.bind(this),
          reportDescribe: this.reportDescribe.bind(this),
          reportEndDescribe: this.reportEndDescribe.bind(this),
          reportExpectedHostValue: this.reportExpectedHostValue.bind(this),
          reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
          reportExpectedFinite: this.reportExpectedFinite.bind(this),
          reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
          reportInvalidExpectCall: this.reportInvalidExpectCall.bind(this),
          reportMax: this.reportMax.bind(this),
          reportMedian: this.reportMedian.bind(this),
          reportMin: this.reportMin.bind(this),
          reportNegatedTest: this.reportNegatedTest.bind(this),
          reportStdDev: this.reportStdDev.bind(this),
          reportTest: this.reportTest.bind(this),
          reportTodo: this.reportTodo.bind(this),
          reportVariance: this.reportVariance.bind(this),
          roundDecimalPlaces: this.roundDecimalPlaces.bind(this),
          startRTrace: this.startRTrace.bind(this),
          tryCall: this.tryCall.bind(this),
        },
      },
    );

    /** If RTrace is enabled, add it to the imports. */
    if (this.rtraceEnabled)
      result.rtrace = {
        onalloc: this.onalloc.bind(this),
        onfree: this.onfree.bind(this),
        onincrement: this.onincrement.bind(this),
        ondecrement: this.ondecrement.bind(this),
        onrealloc: this.onrealloc.bind(this),
      };

    /** add an env object */
    result.env = result.env || {};

    /** Override the abort function */
    const previousAbort = result.env.abort || (() => {});
    result.env.abort = (...args: any[]) => {
      previousAbort(...args);
      // @ts-ignore
      this.abort(...args);
    };
    /** Override trace completely. */
    result.env.trace = this.trace.bind(this);

    return result;
  }

  /**
   * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
   */
  /* istanbul ignore next */
  private debug(): void {
    /* istanbul ignore next */
    debugger;
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
  protected tryCall(pointer: number): 1 | 0 {
    /** This is a safety net conditional, no reason to test it. */
    /* istanbul ignore next */
    if (pointer < 0) return 1;

    try {
      this.wasm!.__call(pointer);
    } catch (ex) {
      this.stack = this.getErrorStackTrace(ex);
      return 0;
    }
    return 1;
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
    nextGroup.name =
      group.name +
      this.getString(suiteNamePointer, "No describe() name provided.");
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
    var group = this.groupStack[this.groupStack.length - 1];
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
    var group = this.groupStack[this.groupStack.length - 1];
    group.beforeAllPointers.push(callbackPointer);
  }

  /**
   * This web assembly linked function sets the group's "afterEach" callback pointer.
   *
   * @param {number} callbackPointer - The callback that should run before each test group.
   */
  private reportAfterEach(callbackPointer: number): void {
    var group = this.groupStack[this.groupStack.length - 1];
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
    var group = this.groupStack[this.groupStack.length - 1];
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
    /* istanbul ignore next */
    if (!group.willRun) return;
    const name = this.getString(testNamePointer, "No test() name provided.");
    /* istanbul ignore next */
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
        : Math.max(
            Math.round(this.roundDecimalPlacesValue!),
            PerformanceLimits.MinimumDecimalPlaces,
          );

      if (test.decimalPlaces > PerformanceLimits.MaximumDecimalPlaces) {
        test.decimalPlaces = PerformanceLimits.MaximumDecimalPlaces;
      }

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
  private reportNegatedTest(
    testNamePointer: number,
    callback: number,
    message: number,
  ): void {
    const group = this.groupStack[this.groupStack.length - 1];
    /* istanbul ignore next */
    if (!group.willRun) return;
    const name = this.getString(testNamePointer, "No test() name provided.");
    /* istanbul ignore next */
    if (!this.testRegex.test(name)) return;

    const test = new TestResult();

    test.functionPointer = callback;
    test.name = name;
    test.message = this.getString(message, "");
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
        : Math.max(
            Math.round(this.roundDecimalPlacesValue!),
            PerformanceLimits.MinimumDecimalPlaces,
          );

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
    group.todos.push(this.getString(todoPointer, "No todo() value provided."));
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
  private abort(
    reasonPointer: number,
    _fileNamePointer: number,
    _line: number,
    _col: number,
  ): void {
    this.message = this.getString(
      reasonPointer,
      "No assertion message provided.",
    );
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
    if (value > PerformanceLimits.MaxSamples) {
      this.pushWarning({
        message:
          "Invalid Performance Configuration: maxSamples exceeds " +
          PerformanceLimits.MaxSamples,
        stackTrace: this.getLogStackTrace(),
        type: "PerformanceConfigurationWarning",
      });
    }

    if (value < 0) {
      this.pushWarning({
        message: "Invalid Performance Configuration: maxSamples less than 0.",
        stackTrace: this.getLogStackTrace(),
        type: "PerformanceConfigurationWarning",
      });
    }

    this.maxSamplesValue = value;
  }

  /**
   * This web assembly linked function modifies the state machine to set the maximum amount of
   * time to run the following test in milliseconds
   *
   * @param {number} value - The maximum number of milliseconds to run the following test.
   */
  private maxTestRunTime(value: number): void {
    if (value > PerformanceLimits.MaxTestRuntime) {
      this.pushWarning({
        message:
          "Invalid Performance Configuration: maxTestRunTime exceeds " +
          PerformanceLimits.MaxTestRuntime,
        stackTrace: this.getLogStackTrace(),
        type: "PerformanceConfigurationWarning",
      });
    }

    if (value < 0) {
      this.pushWarning({
        message:
          "Invalid Performance Configuration: maxTestRunTime less than 0.",
        stackTrace: this.getLogStackTrace(),
        type: "PerformanceConfigurationWarning",
      });
    }
    this.maxTestRunTimeValue = value;
  }

  /**
   * This web assembly linked function modifies the state machine to set the number of decimal places
   * to round all the statistics to.
   *
   * @param {number} value - The number of decimal places to round to.
   */
  private roundDecimalPlaces(value: number): void {
    if (value > PerformanceLimits.MaximumDecimalPlaces) {
      /* istanbul ignore next */
      this.pushWarning({
        message:
          "Invalid Performance Configuration: roundDecimalPlaces exceeds " +
          PerformanceLimits.MaximumDecimalPlaces,
        stackTrace: this.getLogStackTrace(),
        type: "PerformanceConfigurationWarning",
      });
    }

    if (value < PerformanceLimits.MinimumDecimalPlaces) {
      /* istanbul ignore next */
      this.pushWarning({
        message:
          "Invalid Performance Configuration: roundDecimalPlaces less than " +
          PerformanceLimits.MinimumDecimalPlaces,
        stackTrace: this.getLogStackTrace(),
        type: "PerformanceConfigurationWarning",
      });
    }
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
    this.pushError({
      type: "InvalidExpectCall",
      message: `An expect() function call was used outside of a test function in ${this.fileName}.`,
      stackTrace: this.getLogStackTrace(),
    });
  }

  /**
   * Gets an error stack trace.
   */
  protected getErrorStackTrace(ex: Error): string {
    var stackItems = ex.stack!.toString().split("\n");
    return [stackItems[0], ...stackItems.slice(1).filter(wasmFilter)].join(
      "\n",
    );
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
      .stack!.toString()
      .split("\n")
      .slice(1)
      .filter(wasmFilter)
      .join("\n");
  }

  /**
   * This method returns the current rtrace count.
   */
  private getRTraceCount(): number {
    return this.blocks.size;
  }

  /**
   * This method starts a new rtrace count label.
   *
   * @param {number} label - The RTrace label.
   */
  private startRTrace(label: number): void {
    this.rtraceLabels.set(label, this.blocks.size);
  }

  /**
   * This method ends an RTrace label and returns the difference between the current and the
   * starting reference counts.
   *
   * @param {number} label - The RTrace label.
   * @returns {number}
   */
  private endRTrace(label: number): number {
    const result = this.blocks.size - this.rtraceLabels.get(label)!;
    this.rtraceLabels.delete(label);
    return result;
  }

  /**
   * This is the current number of net allocations that occurred during `TestContext` execution.
   */
  public allocationCount: number = 0;

  /**
   * This is the current number of net allocations that occured during `TestGroup` execution.
   */
  protected groupAllocationCount: number = 0;

  /**
   * This is the current number of net allocations that occured during `TestResult` execution.
   */
  protected testAllocationCount: number = 0;

  /**
   * This is the current number of net dellocations that occurred during `TestContext` execution.
   */
  public freeCount: number = 0;

  /**
   * This is the current number of net allocations that occured during `TestGroup` execution.
   */
  protected groupFreeCount: number = 0;

  /**
   * This is the current number of net allocations that occured during `TestGroup` execution.
   */
  protected testFreeCount: number = 0;

  /**
   * This is the current number of net increments that occurred during `TestContext` execution.
   */
  protected incrementCount: number = 0;

  /**
   * This is the current number of net increments that occurred during `TestGroup` execution.
   */
  protected groupIncrementCount: number = 0;

  /**
   * This is the current number of net increments that occurred during `TestResult` execution.
   */
  protected testIncrementCount: number = 0;

  /**
   * This is the current number of net decrements that occurred during `TestContext` execution.
   */
  protected decrementCount: number = 0;

  /**
   * This is the current number of net decrements that occurred during `TestGroup` execution.
   */
  protected groupDecrementCount: number = 0;

  /**
   * This is the current number of net decrements that occurred during `TestResult` execution.
   */
  protected testDecrementCount: number = 0;

  /**
   * This is the current number of net reallocations during the `TestContext` execution.
   */
  protected reallocationCount: number = 0;

  /**
   * This is the current number of net reallocations during the `TestGroup` execution.
   */
  protected groupReallocationCount: number = 0;

  /**
   * This is the current number of net reallocations during the `TestResult` execution.
   */
  protected testReallocationCount: number = 0;

  /**
   * This map is responsible for keeping track of which blocks are currently allocated by their id.
   */
  protected blocks: Map<number, number> = new Map();

  /**
   * This set contains all the blocks currently allocated for the current test.
   */
  protected testBlocks: Set<number> = new Set();

  /**
   * This set contains all the blocks currently allocated for the current group.
   */
  protected groupBlocks: Set<number> = new Set();

  /**
   * This method is called when a memory block is allocated on the heap.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private onalloc(block: number): void {
    this.allocationCount += 1;
    this.groupAllocationCount += 1;
    this.testAllocationCount += 1;
    /**
     * This is impossible to test but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (this.blocks.has(block)) {
      /* istanbul ignore next */
      this.pushError({
        message:
          "A duplicate allocation has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Allocation Error",
      });
    } else {
      this.blocks.set(block, 0);
    }

    this.testBlocks.add(block);
    this.groupBlocks.add(block);
  }

  /**
   * This method is called when a memory block is deallocated from the heap.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private onfree(block: number): void {
    this.freeCount += 1;
    this.groupFreeCount += 1;
    this.testFreeCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(block)) {
      /* istanbul ignore next */
      this.pushError({
        message:
          "An orphaned dellocation has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Deallocation Error",
      });
    } else {
      this.blocks.delete(block);
    }

    this.testBlocks.delete(block);
    this.groupBlocks.delete(block);
  }

  /**
   * This method is called when a memory block reference count is incremented.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private onincrement(block: number): void {
    this.incrementCount += 1;
    this.groupIncrementCount += 1;
    this.testIncrementCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(block)) {
      /* istanbul ignore next */
      this.pushError({
        message:
          "An orphaned increment has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Increment Error",
      });
    } else {
      const count = this.blocks.get(block)!;
      this.blocks.set(block, count + 1);
    }
  }

  /**
   * This method is called when a memory block reference count is decremented.
   *
   * @param {number} block - This is a unique identifier for the affected block.
   */
  private ondecrement(block: number): void {
    this.decrementCount += 1;
    this.groupDecrementCount += 1;
    this.testDecrementCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(block)) {
      /* istanbul ignore next */
      this.pushError({
        message:
          "An orphaned decrement has occurred at block: " + block.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Decrement Error",
      });
    } else {
      const count = this.blocks.get(block)!;
      this.blocks.set(block, count - 1);
    }
  }

  private onrealloc(oldBlock: number, newBlock: number): void {
    this.reallocationCount += 1;
    this.groupReallocationCount += 1;
    this.testReallocationCount += 1;
    /**
     * This is impossible to test, but follows exactly from the AssemblyScript example located
     * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
     *
     * Please see this file for further information about how rtrace errors are reported.
     */
    /* istanbul ignore next */
    if (!this.blocks.has(oldBlock)) {
      /* istanbul ignore next */
      this.pushError({
        message:
          "An orphaned realloc has occurred at old block: " +
          oldBlock.toString(),
        stackTrace: this.getLogStackTrace(),
        type: "Orphaned Reallocation Error (old)",
      });
    } else {
      /* istanbul ignore next */
      if (!this.blocks.has(newBlock)) {
        /* istanbul ignore next */
        this.pushError({
          message:
            "An orphaned realloc has occurred at new block: " +
            newBlock.toString(),
          stackTrace: this.getLogStackTrace(),
          type: "Orphaned Reallocation Error (new)",
        });
      } else {
        /* istanbul ignore next */
        let newRc = this.blocks.get(newBlock);
        /* istanbul ignore next */
        if (newRc != 0) {
          /* istanbul ignore next */
          this.pushError({
            message: `An invalid realloc error has occurred from ${oldBlock} to ${newBlock}.`,
            stackTrace: this.getLogStackTrace(),
            type: "Invalid Reallocation Error",
          });
        } else {
          let oldRc = this.blocks.get(oldBlock)!;
          this.blocks.set(newBlock, oldRc);
        }
      }
    }
  }

  /**
   * This method reports an error to the current logTarget and the `TestContext`.
   *
   * @param {IWarning} error - The error being reported.
   */
  protected pushError(error: IWarning): void {
    this.errors.push(error);
    /**
     * All the tests will always have a log target set. There is no reason to test this branch.
     */
    /* istanbul ignore next */
    if (this.logTarget) this.logTarget.errors.push(error);
  }

  protected pushWarning(warning: IWarning): void {
    this.warnings.push(warning);

    /* istanbul ignore next */
    if (this.logTarget) this.logTarget.warnings.push(warning);
  }

  /**
   * This linked method gets all the RTrace increments for this entire test up until this point.
   */
  private getRTraceIncrements(): number {
    return this.incrementCount;
  }

  /**
   * This linked method gets all the RTrace decrements for this entire test up until this point.
   */
  private getRTraceDecrements(): number {
    return this.decrementCount;
  }

  /**
   * This linked method gets all the RTrace increments for the current group up until this point.
   */
  private getRTraceGroupIncrements(): number {
    return this.groupIncrementCount;
  }

  /**
   * This linked method gets all the RTrace decrements for the current group up until this point.
   */
  private getRTraceGroupDecrements(): number {
    return this.groupDecrementCount;
  }

  /**
   * This linked method gets all the RTrace increments for the current test up until this point.
   */
  private getRTraceTestIncrements(): number {
    return this.testIncrementCount;
  }

  /**
   * This linked method gets all the RTrace decrements for the current test up until this point.
   */
  private getRTraceTestDecrements(): number {
    return this.testDecrementCount;
  }

  /**
   * This linked method gets all the RTrace allocations for this entire test up until this point.
   */
  private getRTraceAllocations(): number {
    return this.allocationCount;
  }

  /**
   * This linked method gets all the RTrace frees for this entire test up until this point.
   */
  private getRTraceFrees(): number {
    return this.freeCount;
  }

  /**
   * This linked method gets all the RTrace increments for this entire test up until this point.
   */
  private getRTraceGroupAllocations(): number {
    return this.groupAllocationCount;
  }

  /**
   * This linked method gets all the RTrace frees for the current group up until this point.
   */
  private getRTraceGroupFrees(): number {
    return this.groupFreeCount;
  }

  /**
   * This linked method gets all the RTrace allocations for the current test up until this point.
   */
  private getRTraceTestAllocations(): number {
    return this.testAllocationCount;
  }

  /**
   * This linked method gets all the RTrace allocations for the current test up until this point.
   */
  private getRTraceTestFrees(): number {
    return this.testFreeCount;
  }

  /**
   * This linked method gets all the RTrace reallocations for the current TestContext.
   */
  private getRTraceReallocs(): number {
    return this.reallocationCount;
  }

  /**
   * This linked method gets all the RTrace reallocations for the current TestGroup.
   */
  private getRTraceGroupReallocs(): number {
    return this.groupReallocationCount;
  }
  /**
   * This linked method gets all the RTrace reallocations for the current TestResult.
   */
  private getRTraceTestReallocs(): number {
    return this.testReallocationCount;
  }

  /**
   * This linked method gets all the current RTrace allocations and adds them to an array.
   */
  private getRTraceBlocks(): number {
    return this.wasm!.__allocArray(
      this.wasm!.__getUsizeArrayId(),
      Array.from(this.blocks.keys()),
    );
  }

  /**
   * This linked method gets all the current RTrace allocations for the current group.
   */
  private getRTraceGroupBlocks(): number {
    return this.wasm!.__allocArray(
      this.wasm!.__getUsizeArrayId(),
      Array.from(this.groupBlocks),
    );
  }

  /**
   * This linked method gets all the current RTrace allocations for the current test.
   */
  private getRTraceTestBlocks(): number {
    return this.wasm!.__allocArray(
      this.wasm!.__getUsizeArrayId(),
      Array.from(this.testBlocks),
    );
  }

  /**
   * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
   * a default value.
   */
  private getString(pointer: number, defaultValue: string): string {
    return pointer === 0 ? defaultValue : this.wasm!.__getString(pointer);
  }

  /**
   * An override implementation of the AssemblyScript trace function.
   *
   * @param {number} strPointer - The trace string.
   * @param {number} count - The number of arguments to be traced.
   * @param {number[]} args - The traced arguments.
   */
  private trace(strPointer: number, count: number, ...args: number[]): void {
    const hostValue = new HostValue();

    hostValue.pointer = strPointer;
    hostValue.stack = this.getLogStackTrace();
    hostValue.typeName = "trace";
    hostValue.type = HostValueType.String;
    hostValue.value = `trace: ${this.getString(strPointer, "")} ${args
      .slice(0, count)
      .join(", ")}`;

    // push the log value to the logs
    this.logTarget.logs.push(hostValue);
  }

  /**
   * Retrieve the function name of a given web assembly function.
   *
   * @param {number} index - The function index
   */
  private funcName(index: number): string {
    /* istanbul ignore next */
    if (this.nameSection) return this.nameSection.fromIndex(index);
    /* istanbul ignore next */
    return "";
  }

  private createHostValue(
    isNull: 1 | 0,
    hasKeys: 1 | 0,
    nullable: 1 | 0,
    offset: number, // offsetof<T>("propName")
    pointer: number, // changetype<usize>(this) | 0
    signed: 1 | 0, // isSigned<T>()
    size: number, // sizeof<T>()
    hostTypeValue: HostValueType,
    typeId: number, // idof<T>()
    typeName: number, // nameof<T>()
    value: number, // usize | Box<T>
    hasValues: 1 | 0,
  ): number {
    const hostValue = new HostValue();
    hostValue.isNull = isNull === 1;
    hostValue.keys = hasKeys ? [] : null;
    hostValue.nullable = nullable === 1;
    hostValue.offset = offset;
    hostValue.pointer = pointer;
    hostValue.signed = signed === 1;
    hostValue.size = size;
    hostValue.type = hostTypeValue;
    hostValue.typeId = typeId;
    hostValue.typeName = this.getString(typeName, "");
    hostValue.values = hasValues ? [] : null;
    hostValue.stack = this.getLogStackTrace();

    if (hostTypeValue === HostValueType.Integer) {
      hostValue.value = this.getInteger(value, size, signed === 1);
      // get long
    } else if (hostTypeValue === HostValueType.String) {
      hostValue.value = this.getString(value, "");
    } else if (hostTypeValue === HostValueType.Float) {
      hostValue.value = this.getFloat(value, size);
    } else if (hostTypeValue === HostValueType.Function) {
      hostValue.value = this.funcName(value);
    } else {
      hostValue.value = value;
    }

    return this.hostValueCache.push(hostValue) - 1;
  }

  /**
   * Get a boxed integer of a given kind at a pointer location.
   *
   * @param {number} pointer - The pointer location of the number
   * @param {number} size - The size of the integer in bytes
   * @param {boolean} signed - If the number is signed
   */
  private getInteger(pointer: number, size: number, signed: boolean): number {
    const buffer = this.wasm!.memory.buffer;
    /* istanbul ignore next */
    if (pointer + size >= buffer.byteLength) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot obtain ${
          signed ? "" : "un"
        }signed integer value at pointer ${pointer} of size ${size}: index out of bounds`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return 0;
    }

    switch (size) {
      case 1:
        if (signed) {
          return new Int8Array(buffer)[pointer];
        } else {
          return new Uint8Array(buffer)[pointer];
        }
      case 2:
        if (signed) {
          return new Int16Array(buffer)[pointer >>> 1];
        } else {
          return new Uint16Array(buffer)[pointer >>> 1];
        }
      case 4:
        if (signed) {
          return new Int32Array(buffer)[pointer >>> 2];
        } else {
          return new Uint32Array(buffer)[pointer >>> 2];
        }
      case 8:
        const long = new Long.fromBytesLE(
          new Uint8Array(buffer, pointer, 8),
          !signed,
        );
        return long.toString();
      /* istanbul ignore next */
      default:
        /* istanbul ignore next */
        this.errors.push({
          message: `Cannot obtain an ${
            signed ? "" : "un"
          }signed integer at ${pointer} of size ${size}`,
          stackTrace: this.getLogStackTrace(),
          type: "HostValue",
        });
        /* istanbul ignore next */
        return 0;
    }
  }

  /**
   * Get a boxed float of a given kind at a pointer location.
   *
   * @param {number} pointer - The pointer location of the number
   * @param {number} size - The size of the float in bytes.
   */
  private getFloat(pointer: number, size: number): number {
    const buffer = this.wasm!.memory.buffer;
    /* istanbul ignore next */
    if (pointer + size >= buffer.byteLength) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot obtain a float value at pointer ${pointer} of size ${size}: index out of bounds`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return 0;
    }
    switch (size) {
      case 4:
        return new Float32Array(buffer)[pointer >>> 2];
      case 8:
        return new Float64Array(buffer)[pointer >>> 3];
      /* istanbul ignore next */
      default:
        // sanity checks
        /* istanbul ignore next */
        this.errors.push({
          message: `Cannot obtain a float at ${pointer} of size ${size}`,
          stackTrace: this.getLogStackTrace(),
          type: "HostValue",
        });
        /* istanbul ignore next */
        return 0;
    }
  }

  /**
   * Log a host value.
   *
   * @param {number} id - The HostValue id
   */
  private logHostValue(id: number): void {
    /* istanbul ignore next */
    if (id >= this.hostValueCache.length || id < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot log HostValue of id ${id}. Index out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.logTarget.logs.push(this.hostValueCache[id]);
  }

  /**
   * Report an actual host value.
   *
   * @param {number} id - The HostValue id
   */
  private reportActualHostValue(id: number): void {
    // ignored lines are santiy checks for error reporting
    /* istanbul ignore next */
    if (id >= this.hostValueCache.length || id < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot report actual HostValue of id ${id}. Index out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.actual = this.hostValueCache[id];
  }

  /**
   * Report an expected host value.
   *
   * @param {number} id - The HostValue id
   */
  private reportExpectedHostValue(id: number, negated: number): void {
    // ignored lines are error reporting for sanity checks
    /* istanbul ignore next */
    if (id >= this.hostValueCache.length || id < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot report expected HostValue of id ${id}. Index out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }
    this.expected = this.hostValueCache[id];
    this.expected.negated = !!negated;
  }

  /**
   * Push a host value to a given host value.
   *
   * @param {number} hostValueID - The target host value parent.
   * @param {number} valueID - The target host value to be pushed.
   */
  private pushHostObjectValue(hostValueID: number, valueID: number): void {
    // each ignored line for test coverage is error reporting for sanity checks
    /* istanbul ignore next */
    if (hostValueID >= this.hostValueCache.length || hostValueID < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot push HostValue of id ${valueID} to HostValue ${hostValueID}. HostObject id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }

    /* istanbul ignore next */
    if (valueID >= this.hostValueCache.length || valueID < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot push HostValue of id ${valueID} to HostValue ${hostValueID}. HostObject value id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }

    let hostValue = this.hostValueCache[hostValueID];
    let value = this.hostValueCache[valueID];

    /* istanbul ignore next */
    if (!hostValue.values) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot push HostValue of id ${valueID} to HostValue ${hostValueID}. HostObject was not initialized with a values array.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }
    hostValue.values.push(value);
  }

  /**
   * Push a host value key to a given host value.
   *
   * @param {number} hostValueID - The target host value parent.
   * @param {number} keyId - The target host value key to be pushed.
   */
  private pushHostObjectKey(hostValueID: number, keyId: number): void {
    // every ignored line for test coverage in this function are sanity checks
    /* istanbul ignore next */
    if (hostValueID >= this.hostValueCache.length || hostValueID < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot push HostValue of id ${keyId} to HostValue ${hostValueID}. HostObject id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }

    /* istanbul ignore next */
    if (keyId >= this.hostValueCache.length || keyId < 0) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot push HostValue of id ${keyId} to HostValue ${hostValueID}. HostObject key id out of bounds.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }
    let hostValue = this.hostValueCache[hostValueID];
    let key = this.hostValueCache[keyId];

    // this is a failsafe if a keys[] does not exist on the HostValue
    /* istanbul ignore next */
    if (!hostValue.keys) {
      /* istanbul ignore next */
      this.errors.push({
        message: `Cannot push HostValue of id ${keyId} to HostValue ${hostValueID}. HostObject was not initialized with a keys array.`,
        stackTrace: this.getLogStackTrace(),
        type: "HostValue",
      });
      /* istanbul ignore next */
      return;
    }
    hostValue.keys.push(key);
  }

  /**
   * Clear the expected value.
   */
  private clearExpected(): void {
    this.expected = null;
  }

  /**
   * Clear the actual value.
   */
  private clearActual(): void {
    this.actual = null;
  }

  /**
   * Report an expected truthy value, and if it's negated.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedTruthy(negated: number): void {
    const expected = this.expected = new HostValue();

    expected.negated = negated === 1;
    expected.type = HostValueType.Truthy;
  }

  /**
   * Report an expected truthy value, and if it's negated.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedFalsy(negated: number): void {
    const expected = this.expected = new HostValue();

    expected.negated = negated === 1;
    expected.type = HostValueType.Falsy;
  }

  /**
   * Report an expected finite value, and if it's negated.
   *
   * @param {1 | 0} negated - An indicator if the expectation is negated.
   */
  private reportExpectedFinite(negated: number): void {
    const expected = this.expected = new HostValue();

    expected.negated = negated === 1;
    expected.type = HostValueType.Finite;
  }
}
