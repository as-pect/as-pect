import { IWritable } from "../reporter/IWriteable";
import { TestReporter } from "./TestReporter";
import { IPerformanceConfiguration, createDefaultPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { EmptyReporter } from "../reporter/EmptyReporter";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";
import { TestGroup } from "./TestGroup";
import { IWarning } from "./IWarning";
import { TestResult } from "./TestResult";
import { timeDifference } from "../util/timeDifference";
import { ILogTarget } from "../util/ILogTarget";
import { performance } from "perf_hooks";
import { ValueType, ActualValue } from "../util/ActualValue";

const wasmFilter = (input: string): boolean => /wasm-function/i.test(input);

export interface ITestContextParameters {
  reporter?: TestReporter;
  stdout?: IWritable;
  stderr?: IWritable;
  performanceConfiguration?: IPerformanceConfiguration;
  testRegex?: RegExp;
  groupRegex?: RegExp;
  fileName?: string;
}

export class TestContext {
  private wasm: (ASUtil & IAspectExports) | null = null;
  public reporter: TestReporter = new EmptyReporter();

  public time: number = 0;
  public pass: boolean = true;

  public errors: IWarning[] = [];
  // stdout emulation
  public stdoutChunks: string[] = [];
  public stdout: IWritable = typeof process !== "undefined"
    ? process.stdout
    : {
      write: (chunk: string) => this.stdoutChunks.push(chunk)
    };

  // stderr emulation
  public stderrChunks: string[] = [];
  public stderr: IWritable = typeof process !== "undefined"
    ? process.stderr
    : {
      write: (chunk: string) => this.stderrChunks.push(chunk)
    };

  public performanceConfiguration: IPerformanceConfiguration = createDefaultPerformanceConfiguration();
  public testRegex: RegExp = new RegExp("");
  public groupRegex: RegExp = new RegExp("");
  public fileName: string = "";

  public testGroups: TestGroup[] = [];

  private currentGroup: TestGroup | null = null;
  private currentTest: TestResult | null = null;

  private logTarget: ILogTarget | null = null;

  private traceMaps: Map<number, string> = new Map();
  private stackTraceIndex: number = 0;

  public startupTime: number = 0;

  constructor(props: ITestContextParameters) {
    /* istanbul ignore next */
    if (props) {
      /* istanbul ignore next */
      if (props.reporter) this.reporter = props.reporter;
      /* istanbul ignore next */
      if (props.stdout) this.stdout = props.stdout;
      /* istanbul ignore next */
      if (props.stderr) this.stderr = props.stderr;
      /* istanbul ignore next */
      if (props.performanceConfiguration) Object.assign(this.performanceConfiguration, props.performanceConfiguration);
      /* istanbul ignore next */
      if (props.testRegex) this.testRegex = props.testRegex;
      /* istanbul ignore next */
      if (props.groupRegex) this.groupRegex = props.groupRegex;
      /* istanbul ignore next */
      if (props.fileName) this.fileName = props.fileName;
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
        tryCall: this.tryCall.bind(this),
        testCanRun: this.testCanRun.bind(this),
        groupCanRun: this.groupCanRun.bind(this),
        testStart: this.testStart.bind(this),
        testFail: this.testFail.bind(this),
        testPass: this.testPass.bind(this),
        groupStart: this.groupStart.bind(this),
        reportTodo: this.reportTodo.bind(this),
        groupEnd: this.groupEnd.bind(this),
        now: this.now.bind(this),
        getLogStackTrace: this.getLogStackTrace.bind(this),
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

  public run(wasm: ASUtil & IAspectExports) {
    // start the timer
    const start = performance.now();

    // initialize wasm property
    this.wasm = wasm;

    // setup performance values
    wasm.__set_performanceEnabled(this.performanceConfiguration.enabled ? 1 : 0);
    wasm.__set_maxSamples(this.performanceConfiguration.maxSamples!);
    wasm.__set_maxTestRunTime(this.performanceConfiguration.maxTestRunTime!);
    wasm.__set_roundDecimalPlaces(this.performanceConfiguration.roundDecimalPlaces!);
    wasm.__set_recordAverage(this.performanceConfiguration.reportAverage ? 1 : 0);
    wasm.__set_recordMedian(this.performanceConfiguration.reportMedian ? 1 : 0);
    wasm.__set_recordStdDev(this.performanceConfiguration.reportStandardDeviation ? 1 : 0);
    wasm.__set_recordMax(this.performanceConfiguration.reportMax ? 1 : 0);
    wasm.__set_recordMin(this.performanceConfiguration.reportMin ? 1 : 0);
    wasm.__set_recordVar(this.performanceConfiguration.reportVariance ? 1 : 0);

    // initialize and perform test collection
    wasm.__init();

    this.startupTime = timeDifference(performance.now(), start);
    // report startup
    this.reporter.onStart(this);

    // run the tests
    wasm.__run();
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
    } catch (ex) {
      if (this.currentTest) {
        this.currentTest.stack = this.getErrorStackTrace(ex);
      } else {
        console.log(ex);
      }
    }
    return 1;
  }

  /**
   * This method checks to see if the provided string matches the test regular expression.
   *
   * @param {number} descriptionPointer - The pointer to the test's name.
   * @returns {1 | 0} - The return value is a bool in AssemblyScript.
   */
  private testCanRun(descriptionPointer: number): 1 | 0 {
    return this.testRegex.test(this.wasm!.__getString(descriptionPointer)) ? 1 : 0;
  }

  /**
   * This method checks to see if the provided string matches the group regular expression.
   *
   * @param {number} descriptionPointer - The pointer to the test's name.
   * @returns {1 | 0} - The return value is a bool in AssemblyScript.
   */
  private groupCanRun(descriptionPointer: number): 1 | 0 {
    return this.groupRegex.test(this.wasm!.__getString(descriptionPointer)) ? 1 : 0;
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
  private abort(reasonPointer: number, fileNamePointer: number, line: number, col: number): void {
    if (this.currentTest) {
      this.currentTest!.message = reasonPointer !== 0 ? this.wasm!.__getString(reasonPointer) : "";
    } else {
      console.log(this.fileName);
      let reason = reasonPointer !== 0 ? this.wasm!.__getString(reasonPointer) : "";
      let fileName = fileNamePointer !== 0 ? this.wasm!.__getString(fileNamePointer) : "";
      console.log(reason);
      console.log(`${fileName}:${line}:${col}`);
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
   * Starts the next group and starts the timer.
   *
   * @param {number} descriptionPointer - The pointer to the name of the group.
   */
  private groupStart(descriptionPointer: number): void {
    const group = new TestGroup();

    group.name = descriptionPointer !== 0
      ? this.wasm!.__getString(descriptionPointer)
      : "";
    group.start = performance.now();
    this.currentGroup = group;
    this.logTarget = group;

    this.reporter.onGroupStart(group);
    this.testGroups.push(group);
  }

  /**
   * Starts a new test.
   *
   * @param {number} descriptionPointer - The pointer to the test description.
   */
  public testStart(descriptionPointer: number): void {
    const test = new TestResult();
    test.name = descriptionPointer === 0
      ? ""
      : this.wasm!.__getString(descriptionPointer);
    this.logTarget = test;
    this.currentTest = test;
    this.currentGroup!.tests.push(test);
    this.reporter.onTestStart(this.currentGroup!, test);
  }

  /**
   * Reports a todo.
   *
   * @param {number} descriptionPointer - A pointer to the todo description.
   */
  private reportTodo(descriptionPointer: number): void {
    const description = descriptionPointer !== 0
      ? this.wasm!.__getString(descriptionPointer)
      : "";
    this.currentGroup!.todos.push(description);
    this.reporter.onTodo(this.currentGroup!, description);
  }

  /**
   * This method is linked to web assembly, and will be called when a group has ended. It also
   * stops the timer and calculated the runtime for the group.
   */
  private groupEnd(pass: 1 | 0): void {
    let group = this.currentGroup!;
    group.end = performance.now();
    group.time = timeDifference(group.end, group.start);
    group.pass = !!pass;
    this.reporter.onGroupFinish(group);
    this.currentGroup = null;
    this.logTarget = null;
  }

  /**
   * This linked function returns the current time.
   */
  private now(): number {
    return performance.now();
  }

  private testFail(
    actualType: ValueType,
    actualValue: number,
    actualReference: number,
    actualOffset: number,
    actualStack: number,
    expectedType: ValueType,
    expectedValue: number,
    expectedReference: number,
    expectedOffset: number,
    expectedStack: number,
    negated: 0 | 1,
  ): void {
    const test = this.currentTest!;
    test.pass = false;
    test.negated = (negated === 1);

    test.actual = new ActualValue(
      this.wasm!,
      actualType,
      actualValue,
      actualReference,
      actualOffset,
      this.traceMaps.get(actualStack)!,
      0,
    );

    test.expected = new ActualValue(
      this.wasm!,
      expectedType,
      expectedValue,
      expectedReference,
      expectedOffset,
      this.traceMaps.get(expectedStack)!,
      negated,
    );

    this.reporter.onTestFinish(this.currentGroup!, test);
  }

  public testPass(
    times: number,
    performanceEnabled: 0 | 1,
    roundDecimalPlaces: 0 | 1,
    recordAverage: 0 | 1,
    recordMedian: 0 | 1,
    recordMax: 0 | 1,
    recordMin: 0 | 1,
    recordStdDev: 0 | 1,
    recordVariance: 0 | 1,
    negated: 0 | 1,
  ): void {
    const test = this.currentTest!;

    test.times = this.wasm!.__getArray(times);
    test.negated = (negated === 1);
    test.pass = true;
    if (performanceEnabled === 1) {
      test.performance = true;
      test.decimalPlaces = roundDecimalPlaces;
      if (recordAverage === 1) test.calculateAverage();
      if (recordMedian === 1) test.calculateMedian();
      if (recordMax === 1) test.calculateMax();
      if (recordMin === 1) test.calculateMin();
      if (recordVariance === 1) test.calculateVariance();
      if (recordStdDev === 1) test.calculateStandardDeviation();
    }

    this.reporter.onTestFinish(this.currentGroup!, test);
  }

  /**
   * This method creates a stack trace, filters the relevant functions, then returns an index to
   * the stack trace. Since this value is only read outside of Web Assembly when generating host
   * objects, this prevents the need for strings to be passed into and out of Web Assembly.
   */
  private getLogStackTrace(): number {
    const trace = new Error("Stack Trace")
      .stack!
      .split("\n")
      .filter(wasmFilter)
      .join("\n");
    const nextID = this.stackTraceIndex + 1;
    this.stackTraceIndex = nextID;
    this.traceMaps.set(nextID, trace);
    return nextID;
  }
}
