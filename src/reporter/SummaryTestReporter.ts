import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { TestResult } from "../test/TestResult";
import chalk from "chalk";
import { TestGroup } from "../test/TestGroup";
import { IWritable } from "./IWriteable";
import { LogValue } from "../util/LogValue";
import { createReferenceString } from "./util/createReferenceString";

/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export class SummaryTestReporter extends TestReporter {
  private enableLogging: boolean = false;

  constructor(options: any) {
    super();
    if (options) {
      if (options.enableLogging) this.enableLogging = true;
    }
  }

  public onStart(): void {}
  public onGroupStart(): void {}
  public onGroupFinish(): void {}
  public onTestStart(): void {}
  public onTestFinish(): void {}
  public onTodo(): void {}

  private stdout: IWritable | null = null;

  public onFinish(suite: TestContext): void {
    this.stdout = suite.stdout;

    const tests: TestResult[] = ([] as TestResult[]).concat(...suite.testGroups.map(e => e.tests));
    const todos = ([] as string[])
      .concat(...suite.testGroups.map(e => e.todos)).length;
    const total = tests.length;
    const passCount = tests.reduce((left, right) => right.pass ? left + 1 : left, 0);
    const groupPassCount = suite.testGroups.reduce((num: number, group: TestGroup) => (group.pass ? 1 : 0) + num, 0);

    if (passCount === total && suite.testGroups.length === groupPassCount) {
      suite.stdout!.write(
        chalk`{green.bold ✔ ${suite.fileName}} Pass: ${passCount.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${suite.time.toString()}ms\n`,
      );

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
        chalk`{red.bold ❌ ${suite.fileName}} Pass: ${passCount.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${suite.time.toString()}ms\n`,
      );

      for (const group of suite.testGroups) {
        if (group.pass) continue;
        suite.stdout!.write(chalk`  ${group.name}\n`);

        if (group.reason) suite.stdout!.write(chalk`  {yellow Reason:} ${group.reason}`);

        if (this.enableLogging) {
          for (const log of group.logs) {
            this.onLog(log);
          }
        }
        inner:
        for (const test of group.tests) {
          if (test.pass) continue inner;
          suite.stdout!.write(chalk`    {red.bold ❌ ${test.name}} - ${test.message}\n`);
          if (test.expected !== null) suite.stdout!.write(chalk`      {green.bold [Expected]:} ${test.expected.message}\n`);
          if (test.actual !== null) suite.stdout!.write(chalk`      {red.bold [Actual]  :} ${test.actual.message}\n`);
          if (this.enableLogging) {
            for (const log of test.logs) {
              this.onLog(log);
            }
          }
        }
      }
    }
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {LogValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: LogValue): void {
    // create string representations of the pointer
    var pointer: string = logValue.pointer.toString();
    var hexPointer: string = logValue.pointer.toString(16);

    // log the log message
    if (logValue.pointer > 0) {
      this.stdout!.write(chalk`     {yellow [Log]:} Reference at address [${pointer}] [hex: 0x${hexPointer}] ${logValue.message}\n`);
    } else {
      this.stdout!.write(chalk`     {yellow [Log]:} ${logValue.message}\n`);
    }

    // if there are bytes to show, create a logging representation of the bytes
    if (logValue.bytes.length > 0) {
      const value = createReferenceString(logValue.bytes, logValue.pointer, logValue.offset);
      this.stdout!.write(chalk`            {blueBright ${value.split("\n").join("\n            ")}}\n`);
    }

    this.stdout!.write(chalk`        {yellow ${logValue.stack.split("\n").join("\n        ")}}\n\n`);
  }
}
