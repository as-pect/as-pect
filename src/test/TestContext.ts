import { ASUtil } from "assemblyscript/lib/loader";
import { TestGroup } from "./TestGroup";
import { TestReporter } from "./TestReporter";
import { TestResult } from "./TestResult";
import DefaultTestReporter from "../reporter/DefaultTestReporter";
import { performance } from "perf_hooks";
import { timeDifference } from "../util/timeDifference";
import { IAspectExports } from "../util/IAspectExports";
import { TestCollector, ITestCollectorParameters } from "./TestCollector";
import { IWritable } from "../reporter/IWriteable";

export interface ITestContextParameters extends ITestCollectorParameters {
  reporter?: TestReporter;
  stdout?: IWritable;
  stderr?: IWritable;
}

export class TestContext extends TestCollector {

  public time: number = 0;
  public pass: boolean = true;
  public startupTime: number = 0;
  public reporter: TestReporter = new DefaultTestReporter({});

  /* istanbul ignore next */
  public stdout: IWritable | null = typeof process !== "undefined"
    ? process.stdout
    : null;
  /* istanbul ignore next */
  public stderr: IWritable | null = typeof process !== "undefined"
    ? process.stderr
    : null;

  private endGroup: boolean = false;

  constructor(props?: ITestContextParameters) {
    super(props);

    if (props) {
      /* istanbul ignore next */
      if (props.reporter) this.reporter = props.reporter;
      /* istanbul ignore next */
      if (props.stdout) this.stdout = props.stdout;
      /* istanbul ignore next */
      if (props.stderr) this.stderr = props.stderr;
    }
  }

  /**
   * Run the tests on the wasm module.
   */
  public run(wasm: ASUtil & IAspectExports): void {
    // set wasm immediately
    this.wasm = wasm;

    // start the timer
    const start = performance.now();

    try {
      // start the module up
      super.collectTests();

      if (!this.rtraceEnabled) {
        wasm.__disableRTrace();
      }

      // calculate startuptime
      this.startupTime = timeDifference(performance.now(), start);
    } catch (ex) {
      /** This skipped line is related to the message coalescing, which is just a fallback. */
      /* istanbul ignore next */
      this.pushError({
        message: "TestCollectionError: " + (this.message || (ex as Error).message),
        stackTrace: this.getErrorStackTrace(ex),
        type: "TestCollectionError"
      });
    }

    if (this.errors.length > 0) return;

    // start the test suite
    this.reporter.onStart(this);

    for (const group of this.testGroups) {
      this.runGroup(group);
      this.stackTraces.clear();
      this.stackTraces.set(-1, "");
    }

    const end = performance.now();
    this.time = timeDifference(end, start);

    this.reporter.onFinish(this);
  }

  private runGroup(group: TestGroup): void {
    this.endGroup = false;

    if (this.rtraceEnabled) {
      // reset all the reference counting properties
      this.groupAllocationCount = 0;
      this.groupFreeCount = 0;
      this.groupDecrementCount = 0;
      this.groupIncrementCount = 0;
      group.rtraceStart = this.blocks.size;
      this.groupBlocks.clear();
    }

    // set the group starttime
    group.start = performance.now();

    // set the log target
    this.logTarget = group;

    // for each beforeAllCallback
    this.runBeforeAll(group);

    // report the group as started, and log all the beforeAll logs outside the describe block
    this.reporter.onGroupStart(group);

    if (this.endGroup) return;

    for (const result of group.tests) {
      this.runTest(group, result);
      if (this.endGroup) return;
      this.reporter.onTestFinish(group, result);
      this.logTarget = group;
    }

    // for each afterAllCallback
    this.runAfterAll(group);
    if (this.endGroup) {
      group.pass = false;
      group.reason = `Test suite ${group.name} failed because of an afterAll() callback occurred.`;
      return;
    }

    if (this.rtraceEnabled) {
      // calculate reference counts for the group
      group.allocationCount = this.groupAllocationCount;
      group.freeCount = this.groupFreeCount;
      group.decrementCount = this.groupDecrementCount;
      group.incrementCount = this.groupIncrementCount;
      group.rtraceEnd = this.blocks.size;
      group.rtraceDelta = group.rtraceEnd - group.rtraceStart;
    }

    // finish the group
    group.end = performance.now();
    group.time = timeDifference(group.end, group.start);
    this.reporter.onGroupFinish(group);
  }

  /**
   * Run a given test.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current run group.
   * @param {number} testIndex - The current test index.
   */
  private runTest(group: TestGroup, result: TestResult): void {
    // set the log target
    this.logTarget = result;

    this.reporter.onTestStart(group, result);
    result.ran = true;

    if (this.rtraceEnabled) {
      // reset all the reference counting properties
      this.testAllocationCount = 0;
      this.testFreeCount = 0;
      this.testDecrementCount = 0;
      this.testIncrementCount = 0;

      result.rtraceStart = this.blocks.size;
      this.testBlocks.clear();
    }

    result.start = performance.now();
    // If performance is enabled, use the performance values, otherwise, just run once.
    if (result.performance) {
      // we must ignore the log values to increase performance execution speed
      this.wasm!.__ignoreLogs(1);
      let runCount = 0;

      const testStartTime = performance.now();
      let currentTestRunTime = 0;
      // run the test loop
      while (true) { // always run at least once
        this.runBeforeEach(group, result);
        /**
         * Especially because the performance functions are run repeatedly, if an error occurs, assume the
         * worst and skip the test group. These functions definitely are assumed to be safe by the test context.
         */
        if (this.endGroup) {
          this.wasm!.__ignoreLogs(0);
          this.wasm!.__cleanup();
          this.wasm!.__collect();
          return;
        }
        this.runTestCall(group, result);
        this.runAfterEach(group, result);

        // check to see if the afterEach functions errored (see above)
        if (this.endGroup) {
          this.wasm!.__ignoreLogs(0);
          this.wasm!.__cleanup();
          this.wasm!.__collect();
          return;
        }

        currentTestRunTime = performance.now() - testStartTime; // calculate how long the current test has run

        runCount += 1;  // increase the run count

        if (runCount >= result.maxSamples) {
          this.wasm!.__ignoreLogs(0);
          break; // if we have reached the max sample count
        }
        if (currentTestRunTime >= result.maxRuntime) {
          this.wasm!.__ignoreLogs(0);
          break; // weve collected enough samples and the test is over
        }
      }
      this.wasm!.__ignoreLogs(0);
      if (result.calculateAverageValue) result.calculateAverage();
      if (result.calculateMaxValue) result.calculateMax();
      if (result.calculateMedianValue) result.calculateMedian();
      if (result.calculateMinValue) result.calculateMin();
      if (result.calculateVarianceValue) result.calculateVariance();
      if (result.calculateStandardDeviationValue) result.calculateStandardDeviation();
    } else {
      this.runBeforeEach(group, result);
      if (this.endGroup) return;
      this.runTestCall(group, result);
      this.runAfterEach(group, result);
      if (this.endGroup) return;
    }

    if (this.rtraceEnabled) {
      // calculate reference counts for the group
      result.allocationCount = this.groupAllocationCount;
      result.freeCount = this.groupFreeCount;
      result.decrementCount = this.groupDecrementCount;
      result.incrementCount = this.groupIncrementCount;
      result.rtraceEnd = this.blocks.size;
      result.rtraceDelta = result.rtraceEnd - result.rtraceStart;
    }

    /**
     * In the chance that some kind of memory error occurs as a result of executing the test,
     * this should end the test unsuccesfully. Since most errors that end with some kind of
     * runtime error using `unreachable()`, it's impossible to test this branch meaningfully.
     * This if statement is ignored because it's a failsafe in case some kind of error occurs
     * that doesn't cause an unreachable state.
     */
    /* istanbul ignore next */
    if (result.errors.length > 0) result.pass = false;

    result.end = performance.now();
    result.runTime = timeDifference(result.end, result.start);
  }

  /**
   * Run the current test once and collect statistics.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The current test result.
   * @param {number} testIndex - The current test index.
   */
  private runTestCall(group: TestGroup, result: TestResult): void {

    const start = performance.now();
    const testCallResult = this.tryCall(result.functionPointer);

    const end = performance.now();

    result.times.push(timeDifference(end, start));
    result.pass = result.negated
      ? (testCallResult === 0)
      : (testCallResult === 1);

    if (!result.pass) {
      group.pass = false;
      // if it's not negated then set the message, the actual, expected, and stack values
      if (!result.negated) {
        this.wasm!.__sendActual();
        this.wasm!.__sendExpected();
        result.actual = this.actual;
        result.expected = this.expected;
        result.message = this.message;
        result.stack = this.stack;
      }
    }

    if (testCallResult === 0) {
      this.wasm!.__cleanup();
      this.wasm!.__collect();
    }

    // always clear the values
    this.message = "";
    this.actual = null;
    this.expected = null;
    this.stack = "";
  }

  /**
   * Run the afterEach callbacks before running the test.
   *
   * @param {RunContext} runContext - The current run context.
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The current test result.
   */
  private runAfterEach(group: TestGroup, result: TestResult): void {
    // for each afterEach callback function pointer
    for (const afterEachCallback of group.afterEachPointers) {
      const afterEachResult = this.tryCall(afterEachCallback);
      // if afterEach fails
      if (afterEachResult === 0) {
        this.wasm!.__collect();
        this.endGroup = true;
        group.end = result.end = performance.now();
        group.pass = false;
        this.pass = false;
        group.reason = `Test suite ${group.name} failed because an error occurred in an afterEach() callback.`;
        result.pass = false;
        group.time = timeDifference(group.end, group.start);
        this.reporter.onTestFinish(group, result);
        this.reporter.onGroupFinish(group);
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
  private runBeforeEach(group: TestGroup, result: TestResult): void {
    // for each beforeEach callback function pointer
    for (const beforeEachCallback of group.beforeEachPointers) {
      const beforeEachResult = this.tryCall(beforeEachCallback);
      // if beforeEach fails
      if (beforeEachResult === 0) {
        this.wasm!.__collect();
        result.end = group.end = performance.now();
        group.pass = false;
        group.reason = `Test suite ${group.name} failed because an error occurred in a beforeEach() callback.`;
        result.pass = false;
        group.time = timeDifference(group.end, group.start);
        this.reporter.onTestFinish(group, result);
        this.reporter.onGroupFinish(group);
        this.endGroup = true;
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
  private runAfterAll(group: TestGroup): void {
    for (const afterAllCallback of group.afterAllPointers) {
      // call each afterAll callback
      const afterAllResult = this.tryCall(afterAllCallback);
      // if the test fails
      if (afterAllResult === 0) {
        group.end = performance.now();
        group.pass = false;
        group.reason = `Test suite ${group.name} failed because an error occurred in an afterAll() callback.`;
        this.pass = false;
        group.time = timeDifference(group.end, group.start);
        this.reporter.onGroupFinish(group);
        this.endGroup = true;
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
  private runBeforeAll(group: TestGroup): void {
    for (const beforeAllCallback of group.beforeAllPointers) {
      // call each beforeAll callback
      const beforeAllResult = this.tryCall(beforeAllCallback);
      // if the test fails
      if (beforeAllResult === 0) {
        group.end = performance.now();
        group.pass = false;
        group.reason = `Test suite ${group.name} failed because an error occurred in a beforeAll() callback.`;
        this.pass = false;
        group.time = timeDifference(group.end, group.start);
        this.endGroup = true;
        return;
      }
    }
  }
}
