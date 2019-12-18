import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestContext } from "../test/TestContext";
import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { TestReporter } from "../test/TestReporter";
import { IWritable } from "../util/IWriteable";
import { createReferenceString } from "./util/createReferenceString";

/**
 * @ignore
 * This enum is used by the VerboseReporter to distinguish Actual and expected types.
 */
const enum ValueType {
  Actual,
  Expected,
}

/**
 * @ignore
 * This method stringifies an actual or expected test value.
 *
 * @param {ValueType} type - Actual or Expected.
 * @param {ActualValue | null} value - The reported value.
 */
function stringifyActualValue(
  type: ValueType,
  value: ActualValue | null,
): string {
  const chalk = require("chalk");
  if (!value) return "";
  let byteString: string = "";

  if (value.bytes.length > 0 || value.values.length > 0) {
    byteString =
      "\n               " +
      createReferenceString(value)
        .split("\n")
        .join("\n               ");
  }

  // const stackString =
  //   "\n           " + value.stack.split("\n").join("\n           ");

  return type === ValueType.Expected
    ? chalk`{green ${value.message}}{blue ${byteString}}`
    : chalk`{red ${value.message}}{blue ${byteString}}`;
}

/**
 * @ignore
 * This weakmap is used to keep track of which logs have already been printed, and from what index.
 */
const groupLogIndex: WeakMap<TestGroup, number> = new WeakMap();

/**
 * This is the default test reporter class for the `asp` command line application. It will pipe
 * all relevant details about each tests to the `stdout` WriteStream.
 */
export default class VerboseReporter extends TestReporter {
  protected stdout: IWritable | null = null;

  constructor(_options?: any) {
    super();
  }

  /**
   * This method reports a starting TestContext. This method can be called many times, but may
   * be instantiated once
   *
   * @param {TestContext} suite - The test context being started.
   */
  public onStart(suite: TestContext): void {
    this.stdout = suite.stdout || process.stdout;
  }

  /**
   * This method reports a TestGroup is starting.
   *
   * @param {TestGroup} group - The started test group.
   */
  public onGroupStart(group: TestGroup): void {
    if (group.tests.length === 0) return;
    const chalk = require("chalk");
    if (group.name) this.stdout!.write(chalk`[Describe]: ${group.name}\n\n`);
    for (const logValue of group.logs) {
      this.onLog(logValue);
    }
    groupLogIndex.set(group, group.logs.length);
  }

  /**
   * This method reports a completed TestGroup.
   *
   * @param {TestGroup} group - The finished TestGroup.
   */
  public onGroupFinish(group: TestGroup): void {
    if (group.tests.length === 0) return;
    this.stdout!.write("\n");
  }

  /** This method is a stub for onTestStart(). */
  public onTestStart(_group: TestGroup, _test: TestResult): void {}

  /**
   * This method reports a completed test.
   *
   * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
   * @param {TestResult} test - The finished TestResult
   */
  public onTestFinish(_group: TestGroup, test: TestResult): void {
    const chalk = require("chalk");
    if (test.pass) {
      const rtraceDelta =
        test.rtraceDelta === 0
          ? ""
          : chalk`{yellow RTrace: ${(test.rtraceDelta > 0 ? "+" : "-") +
              test.rtraceDelta.toString()}}`;
      this.stdout!.write(
        test.negated
          ? chalk` {green  [Throws]: ✔} ${test.name} ${rtraceDelta}\n`
          : chalk` {green [Success]: ✔} ${test.name} ${rtraceDelta}\n`,
      );
    } else {
      this.stdout!.write(chalk`    {red [Fail]: ✖} ${test.name}\n`);

      if (!test.negated) {
        this.stdout!.write(`  [Actual]: ${stringifyActualValue(
          ValueType.Actual,
          test.actual,
        )}
[Expected]: ${stringifyActualValue(ValueType.Expected, test.expected)}
`);
      }

      if (test.message) {
        this.stdout!.write(chalk` [Message]: {yellow ${test.message}}\n`);
      }
      if (test.stack) {
        this.stdout!.write(
          `   [Stack]: ${test.stack.split("\n").join("\n           ")}\n`,
        );
      }
    }

    /** If performance mode was enabled for this test, report the statistics. */
    if (test.performance) {
      this.stdout!.write(
        chalk` {yellow [Samples]}: ${test.times.length.toString()} runs\n`,
      );

      if (test.hasAverage) {
        this.stdout!.write(
          chalk`    {yellow [Mean]}: ${test.average.toString()}ms\n`,
        );
      }

      if (test.hasMedian) {
        this.stdout!.write(
          chalk`  {yellow [Median]}: ${test.median.toString()}ms\n`,
        );
      }

      if (test.hasVariance) {
        this.stdout!.write(
          chalk`{yellow [Variance]}: ${test.variance.toString()}ms\n`,
        );
      }

      if (test.hasStdDev) {
        this.stdout!.write(
          chalk`  {yellow [StdDev]}: ${test.stdDev.toString()}ms\n`,
        );
      }

      if (test.hasMax) {
        this.stdout!.write(
          chalk`     {yellow [Max]}: ${test.max.toString()}ms\n`,
        );
      }

      if (test.hasMin) {
        this.stdout!.write(
          chalk`     {yellow [Min]}: ${test.min.toString()}ms\n`,
        );
      }
    } else {
      /** Log the values to stdout if this was a typical test. */
      for (const logValue of test.logs) {
        this.onLog(logValue);
      }
    }
  }

  /**
   * This method reports that a TestContext has finished.
   *
   * @param {TestContext} suite - The finished test context.
   */
  public onFinish(suite: TestContext): void {
    if (suite.testGroups.length === 0) return;
    const chalk = require("chalk");

    const result = suite.pass ? chalk`{green ✔ PASS}` : chalk`{red ✖ FAIL}`;

    const count = suite.testGroups
      .map(e => e.tests.length)
      .reduce((a, b) => a + b, 0);
    const successCount = suite.testGroups
      .map(e => e.tests.filter(f => f.pass).length)
      .reduce((a, b) => a + b, 0);

    const fail =
      count === successCount
        ? `0 fail`
        : chalk`{red ${(count - successCount).toString()} fail}`;

    const rtcount = suite.allocationCount - suite.freeCount;

    const rtraceDelta =
      rtcount === 0
        ? ""
        : chalk`{yellow RTrace: ${(rtcount > 0 ? "+" : "-") +
            rtcount.toString()}}`;

    for (const warning of suite.warnings) {
      this.stdout!.write(
        chalk`\n{yellow  [Warning]}: ${warning.type} ${warning.message}`,
      );
      this.stdout!.write(
        chalk`\n{yellow    [Stack]}: {yellow ${warning.stackTrace
          .split("\n")
          .join("\n           ")}}\n`,
      );
    }

    for (const error of suite.errors) {
      this.stdout!.write(
        chalk`\n{red    [Error]}: ${error.type} ${error.message}`,
      );
      this.stdout!.write(
        chalk`\n{red    [Stack]}: {yellow ${error.stackTrace
          .split("\n")
          .join("\n           ")}}\n`,
      );
    }

    this.stdout!.write(chalk`${
  process.stdout.columns
    ? "~".repeat(Math.max(process.stdout.columns - 10, 10))
    : "~".repeat(80)
}

    [File]: ${suite.fileName} ${rtraceDelta}
  [Groups]: {green ${suite.testGroups
    .filter(e => e.pass)
    .length.toString()} pass}, ${suite.testGroups.length.toString()} total
  [Result]: ${result}
 [Summary]: {green ${successCount.toString()} pass},  ${fail}, ${count.toString()} total
 [Startup]: ${suite.startupTime.toString()}ms
    [Time]: ${suite.time.toString()}ms\n\n`);
  }

  /**
   * This method reports a todo to stdout.
   *
   * @param {TestGroup} _group - The test group the todo belongs to.
   * @param {string} todo - The todo.
   */
  public onTodo(_group: TestGroup, todo: string): void {
    const chalk = require("chalk");
    this.stdout!.write(chalk`    {yellow [Todo]:} ${todo}\n`);
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {LogValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: LogValue): void {
    const chalk = require("chalk");
    // create string representations of the pointer
    var pointer: string = logValue.pointer.toString();
    var hexPointer: string = logValue.pointer.toString(16);

    // log the log message
    if (logValue.pointer > 0) {
      this.stdout!.write(
        chalk`\n     {yellow [Log]:} Reference at address [${pointer}] [hex: 0x${hexPointer}] ${logValue.message}\n`,
      );
    } else {
      this.stdout!.write(chalk`\n     {yellow [Log]:} ${logValue.message}\n`);
    }

    // if there are bytes to show, create a logging representation of the bytes
    if (logValue.bytes.length > 0 || logValue.values.length > 0) {
      const value = createReferenceString(logValue);
      this.stdout!.write(
        chalk`            {blueBright ${value
          .split("\n")
          .join("\n            ")}}\n`,
      );
    }

    this.stdout!.write(
      chalk`        {yellow ${logValue.stack
        .split("\n")
        .join("\n        ")}}\n`,
    );
  }
}
