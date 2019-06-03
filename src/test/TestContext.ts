import { ASUtil } from "assemblyscript/lib/loader";
import { TestGroup } from "./TestGroup";
import { TestReporter } from "./TestReporter";
import { TestResult } from "./TestResult";
import { DefaultTestReporter } from "../reporter/DefaultTestReporter";
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
  public reporter: TestReporter = new DefaultTestReporter();

  /* istanbul ignore next */
  public stdout: IWritable | null = process ? process.stdout : null;
  /* istanbul ignore next */
  public stderr: IWritable | null = process.stderr ? process.stderr : null;

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

    // start the module up
    super.collectTests();

    // calculate startuptime
    this.startupTime = timeDifference(performance.now(), start);

    if (this.errors.length > 0) return;

    // start the test suite
    this.reporter.onStart(this);

    for (const group of this.testGroups) {
      this.runGroup(group);
    }

    const end = performance.now();
    this.time = timeDifference(end, start);

    this.reporter.onFinish(this);
  }

  private runGroup(group: TestGroup): void {
    this.endGroup = false;

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
    if (this.endGroup) return;

    // finish the group
    group.end = performance.now();
    group.time = timeDifference(group.end, group.start);
    group.reason = `Test suite ${group.name} passed successfully.`;
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
    result.start = performance.now();
    // If performance is enabled, use the performance values, otherwise, just run once.
    if (result.performance) {
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
        if (this.endGroup) return;
        this.runTestCall(group, result);
        this.runAfterEach(group, result);
        if (this.endGroup) return; // check to see if the afterEach functions errored (see above)

        currentTestRunTime = performance.now() - testStartTime; // calculate how long the current test has run

        runCount += 1;  // increase the run count

        if (runCount >= result.maxSamples) break; // if we have reached the max sample count
        if (currentTestRunTime >= result.maxRuntime) break; // weve collected enough samples and the test is over
      }

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
        this.actual = null;
        this.expected = null;
        this.message = "";
        this.stack = "";
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
  private runAfterEach(group: TestGroup, result: TestResult): void {
    // for each afterEach callback function pointer
    for (const afterEachCallback of group.afterEachPointers) {
      const afterEachResult = this.tryCall(afterEachCallback);
      // if afterEach fails
      if (afterEachResult === 0) {
        this.endGroup = true;
        group.end = result.end = performance.now();
        group.pass = false;
        this.pass = false;
        group.reason = `Test suite ${group.name} failed in afterEach callback.`;
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
        result.end = group.end = performance.now();
        group.pass = false;
        group.reason = group.reason = `Test suite ${group.name} failed in beforeEach callback.`;
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
        group.reason = `Test suite ${group.name} failed in afterAll callback.`;
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
        group.reason = `Test suite ${group.name} failed in beforeAll callback.`;
        this.pass = false;
        group.time = timeDifference(group.end, group.start);
        this.endGroup = true;
        return;
      }
    }
  }
}
