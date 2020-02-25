import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { TestResult } from "../test/TestResult";
import { TestGroup } from "../test/TestGroup";
import { IWritable } from "../util/IWriteable";
import { ReflectedValue } from "../util/ReflectedValue";

/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export default class SummaryReporter extends TestReporter {
  private enableLogging: boolean = true;

  constructor(options?: any) {
    super();
    /* istanbul ignore next */
    if (options) {
      // can be "false" from cli
      /* istanbul ignore next */
      if (
        !options.enableLogging ||
        /* istanbul ignore next */ options.enableLogging === "false"
      )
        /* istanbul ignore next */
        this.enableLogging = false;
    }
  }

  /* istanbul ignore next */
  public onStart(): void {}
  /* istanbul ignore next */
  public onGroupStart(): void {}
  /* istanbul ignore next */
  public onGroupFinish(): void {}
  /* istanbul ignore next */
  public onTestStart(): void {}
  /* istanbul ignore next */
  public onTestFinish(): void {}
  /* istanbul ignore next */
  public onTodo(): void {}

  private stdout: IWritable | null = null;

  /**
   * This method reports a test context is finished running.
   *
   * @param {TestContext} suite - The finished test suite.
   */
  public onFinish(suite: TestContext): void {
    const chalk = require("chalk");
    this.stdout = suite.stdout;

    // TODO: Figure out a better way to flatten this array.
    const tests: TestResult[] = ([] as TestResult[]).concat(
      ...suite.testGroups.map(e => e.tests),
    );
    const todos = ([] as string[]).concat(...suite.testGroups.map(e => e.todos))
      .length;
    const total = tests.length;
    const passCount = tests.reduce(
      (left, right) => (right.pass ? left + 1 : left),
      0,
    );
    const groupPassCount = suite.testGroups.reduce(
      (num: number, group: TestGroup) => (group.pass ? 1 : 0) + num,
      0,
    );

    /** Report if all the groups passed. */
    if (passCount === total && suite.testGroups.length === groupPassCount) {
      suite.stdout!.write(
        chalk`{green.bold ✔ ${
          suite.fileName
        }} Pass: ${passCount.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${suite.time.toString()}ms\n`,
      );

      /** If logging is enabled, log all the values. */
      /* istanbul ignore next */
      if (this.enableLogging) {
        for (const group of suite.testGroups) {
          for (const log of group.logs) {
            this.onLog(log);
          }

          for (const test of group.tests) {
            for (const log of test.logs) {
              this.onLog(log);
            }
          }
        }
      }
    } else {
      suite.stdout!.write(
        chalk`{red.bold ❌ ${
          suite.fileName
        }} Pass: ${passCount.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${suite.time.toString()}ms\n`,
      );

      /** If the group failed, report that the group failed. */
      for (const group of suite.testGroups) {
        /* istanbul ignore next */
        if (group.pass) continue;
        suite.stdout!.write(chalk`  {red Failed:} ${group.name}\n`);

        /** Display the reason if there is one. */
        if (group.reason)
          suite.stdout!.write(chalk`    {yellow Reason:} ${group.reason}`);

        /** Log each log item in the failed group. */
        /* istanbul ignore next */
        if (this.enableLogging) {
          for (const log of group.logs) {
            this.onLog(log);
          }
        }

        inner: for (const test of group.tests) {
          if (test.pass) continue inner;
          suite.stdout!.write(
            chalk`    {red.bold ❌ ${test.name}} - ${test.message}\n`,
          );
          if (test.expected !== null) {
            const expected = test.expected;
            suite.stdout!.write(
              chalk`      {green.bold [Expected]:} ${
                expected.negated ? "Not " : ""
              }${expected.stringify({ indent: 2 }).trimLeft()}\n`,
            );
          }
          if (test.actual !== null)
            suite.stdout!.write(
              chalk`      {red.bold [Actual]  :} ${test.actual
                .stringify({ indent: 2 })
                .trimLeft()}\n`,
            );
          /* istanbul ignore next */
          if (this.enableLogging) {
            for (const log of test.logs) {
              this.onLog(log);
            }
          }
        }
      }
    }

    for (const warning of suite.warnings) {
      this.stdout!.write(
        chalk`{yellow  [Warning]}: ${warning.type} -> ${warning.message}\n`,
      );
      const stack = warning.stackTrace.trim();
      /* istanbul ignore next */
      if (stack) {
        this.stdout!.write(
          chalk`{yellow    [Stack]}: {yellow ${stack
            .split("\n")
            .join("\n      ")}}\n`,
        );
      }
      this.stdout!.write("\n");
    }

    for (const error of suite.errors) {
      this.stdout!.write(
        chalk`{red    [Error]}: ${error.type} ${error.message}\n`,
      );
      this.stdout!.write(
        chalk`{red    [Stack]}: {yellow ${error.stackTrace
          .split("\n")
          .join("\n           ")}}\n\n`,
      );
    }
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {ReflectedValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: ReflectedValue): void {
    const chalk = require("chalk");
    const output = logValue.stringify({ indent: 12 }).trimLeft();
    this.stdout!.write(chalk`     {yellow [Log]:} ${output}\n`);
  }
}
