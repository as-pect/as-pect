import { TestContext } from "../test/TestContext.js";
import { IWritable } from "../util/IWriteable.js";
import { ReflectedValue } from "../util/ReflectedValue.js";
import { IReporter } from "./IReporter.js";
import {
  SnapshotReportLine,
  SuiteGroupReport,
  SuiteReport,
  SuiteReportEvent,
  SuiteTestReport,
} from "./ReportingLifecycle.js";
import { TestNode } from "../test/TestNode.js";
import chalk from "chalk";

/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export class SummaryReporter implements IReporter {
  private enableLogging: boolean = true;

  constructor() {}

  public onEnter(_ctx: TestContext, _node: TestNode): void {}

  public onExit(_ctx: TestContext, _node: TestNode): void {}

  /* istanbul ignore next */
  public onStart(_ctx: TestContext): void {}
  /* istanbul ignore next */
  public onGroupStart(_node: TestNode): void {}
  /* istanbul ignore next */
  public onGroupFinish(_node: TestNode): void {}
  /* istanbul ignore next */
  public onTestStart(_group: TestNode, _test: TestNode): void {}
  /* istanbul ignore next */
  public onTestFinish(_group: TestNode, _test: TestNode): void {}
  /* istanbul ignore next */
  public onTodo(): void {}

  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  public onReportFinish(event: SuiteReportEvent): void {
    if (this.onFinish !== SummaryReporter.prototype.onFinish) {
      this.onFinish(event.context);
      return;
    }
    this.writeReport(event.report);
  }

  /**
   * This method reports a test context is finished running.
   *
   * @param {TestContext} suite - The finished test suite.
   */
  public onFinish(suite: TestContext): void {
    this.writeReport(SuiteReport.from(suite));
  }

  private writeReport(report: SuiteReport): void {
    const groups = report.groups;
    const total = report.testCount;
    const passCount = report.testPassCount;
    const deltaT = report.rootRuntime;

    /** Report if all the groups passed. */
    if (report.pass) {
      this.stdout!.write(
        chalk.green.bold(`✔ ${report.fileName} `) +
          `Pass: ${passCount.toString()} / ${total.toString()} Todo: ${report.todoCount.toString()} Time: ${deltaT.toString()}ms\n`,
      );

      /** If logging is enabled, log all the values. */
      /* istanbul ignore next */
      if (this.enableLogging) {
        for (const group of groups) {
          this.writeGroupLogs(group);

          for (const test of group.tests) {
            this.writeTestLogs(test);
          }
        }
      }
    } else {
      this.stdout!.write(
        chalk.red.bold(`❌ ${report.fileName} `) +
          `Pass: ${passCount.toString()} / ${total.toString()} Todo: ${report.todoCount.toString()} Time: ${deltaT.toString()}ms\n`,
      );

      /** If the group failed, report that the group failed. */
      for (const group of groups) {
        /* istanbul ignore next */
        if (group.pass) continue;
        this.stdout!.write("  " + chalk.red.bold(`Failed:`) + ` ${group.name}\n`);

        /** Display the reason if there is one. */
        // if (group.reason)
        //   this.stdout!.write(chalk`    {yellow Reason:} ${group.reason}`);

        /** Log each log item in the failed group. */
        /* istanbul ignore next */
        if (this.enableLogging) {
          this.writeGroupLogs(group);
        }

        inner: for (const test of group.tests) {
          if (test.pass) continue inner;
          this.stdout!.write(chalk.red.bold(`    ❌ ${test.name}`) + ` - ${test.message}\n`);
          if (test.actualValue !== null)
            this.stdout!.write(
              chalk.red.bold(`      [Actual]  :`) + ` ${test.actualValue.stringify({ indent: 2 }).trimStart()}\n`,
            );
          if (test.expectedValue !== null) {
            const expected = test.expectedValue;
            this.stdout!.write(
              chalk.green.bold(`      [Expected]:`) +
                ` ${expected.negated ? "Not " : ""}${expected.stringify({ indent: 2 }).trimStart()}\n`,
            );
          }
          /* istanbul ignore next */
          if (this.enableLogging) {
            this.writeTestLogs(test);
          }
        }
      }
    }

    // There are no warnings left in the as-pect test suite software
    for (const warning of report.warnings) {
      /* istanbul ignore next */
      this.stdout!.write(chalk.yellow(` [Warning]`) + +`: ${warning.type} -> ${warning.message}\n`);
      /* istanbul ignore next */
      const stack = warning.stackTrace.trim();
      /* istanbul ignore next */
      if (stack) {
        this.stdout!.write(
          chalk.yellow(`   [Stack]`) + ": " + chalk.yellow(`${stack.split("\n").join("\n      ")}`) + "\n",
        );
      }
      /* istanbul ignore next */
      this.stdout!.write("\n");
    }

    for (const error of report.errors) {
      this.stdout!.write(`${chalk.red(`   [Error]`)}: ${error.type} ${error.message}\n`);
      this.stdout!.write(
        `${chalk.red(`   [Stack]`)}: ${chalk.yellow(`${error.stackTrace.split("\n").join("\n           ")}\n\n`)}`,
      );
    }

    for (const change of report.snapshotChanges) {
      console.log("A change occurred");
      this.stdout!.write(`${chalk.red("[Snapshot]")}: ${change.name}\n`);
      this.writeSnapshotLines(change.lines);
      this.stdout!.write("\n");
    }
  }

  private writeGroupLogs(group: SuiteGroupReport): void {
    for (const log of group.logs) {
      this.onLog(log);
    }
  }

  private writeTestLogs(test: SuiteTestReport): void {
    for (const log of test.logs) {
      this.onLog(log);
    }
  }

  private writeSnapshotLines(lines: SnapshotReportLine[]): void {
    for (const line of lines) {
      if (line.type === "added") {
        this.stdout!.write(chalk.green(`+ ${line.value}\n`));
      } else if (line.type === "removed") {
        this.stdout!.write(`${chalk.red(`- ${line.value}`)}\n`);
      } else {
        this.stdout!.write(`  ${line.value}\n`);
      }
    }
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {ReflectedValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: ReflectedValue): void {
    const output = logValue.stringify({ indent: 12 }).trimLeft();
    this.stdout!.write(chalk.yellow(`     [Log]:`) + ` ${output}\n`);
  }
}
