import { TestContext } from "../test/TestContext.js";
import { IWritable } from "../util/IWriteable.js";
import { ReflectedValue } from "../util/ReflectedValue.js";
import { TestNodeType } from "../util/TestNodeType.js";
import { TestNode } from "../test/TestNode.js";
import { IReporter } from "./IReporter.js";
import { StringifyReflectedValueProps } from "../util/stringifyReflectedValue.js";
import {
  GroupReportEvent,
  SnapshotReportLine,
  SuiteGroupReport,
  SuiteReport,
  SuiteReportEvent,
  SuiteTestReport,
  TestReportEvent,
} from "./ReportingLifecycle.js";
import type { LegacyGroupReportFacts, LegacySuiteReportFacts, LegacyTestReportFacts } from "./LegacyReporterAdapter.js";
import chalk from "chalk";

/**
 * This is the default test reporter class for the `asp` command line application. It will pipe
 * all relevant details about each tests to the `stdout` WriteStream.
 */
export class VerboseReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  /** A set of default stringify properties that can be overridden. */
  protected stringifyProperties: Partial<StringifyReflectedValueProps> = {
    maxExpandLevel: 10,
  };

  constructor(_options?: any) {}

  onEnter(_ctx: TestContext, node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.onGroupStart(node);
    } else {
      this.onTestStart(node.parent!, node);
    }
  }

  onExit(_ctx: TestContext, node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.onGroupFinish(node);
    } else {
      this.onTestFinish(node.parent!, node);
    }
  }

  public onReportGroupStart(event: GroupReportEvent): void {
    this.writeGroupStart(event.group);
  }

  public onReportGroupStartWithLegacy(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void {
    if (this.onGroupStart !== VerboseReporter.prototype.onGroupStart) {
      this.onGroupStart(legacy.node);
      return;
    }
    this.onReportGroupStart(event);
  }

  public onReportGroupFinish(event: GroupReportEvent): void {
    this.writeGroupFinish(event.group);
  }

  public onReportGroupFinishWithLegacy(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void {
    if (this.onGroupFinish !== VerboseReporter.prototype.onGroupFinish) {
      this.onGroupFinish(legacy.node);
      return;
    }
    this.onReportGroupFinish(event);
  }

  public onReportTestStart(_event: TestReportEvent): void {}

  public onReportTestStartWithLegacy(event: TestReportEvent, legacy: LegacyTestReportFacts): void {
    if (this.onTestStart !== VerboseReporter.prototype.onTestStart) {
      this.onTestStart(legacy.groupNode, legacy.node);
      return;
    }
    this.onReportTestStart(event);
  }

  public onReportTestFinish(event: TestReportEvent): void {
    this.writeTestFinish(event.test);
  }

  public onReportTestFinishWithLegacy(event: TestReportEvent, legacy: LegacyTestReportFacts): void {
    if (this.onTestFinish !== VerboseReporter.prototype.onTestFinish) {
      this.onTestFinish(legacy.groupNode, legacy.node);
      return;
    }
    this.onReportTestFinish(event);
  }

  public onReportFinish(event: SuiteReportEvent): void {
    this.writeReport(event.report);
  }

  public onReportFinishWithLegacy(event: SuiteReportEvent, legacy: LegacySuiteReportFacts): void {
    if (this.onFinish !== VerboseReporter.prototype.onFinish) {
      this.onFinish(legacy.context);
      return;
    }
    this.onReportFinish(event);
  }

  /**
   * This method reports a TestGroup is starting.
   *
   * @param {TestNode} group - The started test group.
   */
  public onGroupStart(group: TestNode): void {
    this.writeGroupStart(SuiteReport.groupFromNode(group));
  }

  /**
   * This method reports a completed TestGroup.
   *
   * @param {TestGroup} group - The finished TestGroup.
   */
  public onGroupFinish(group: TestNode): void {
    this.writeGroupFinish(SuiteReport.groupFromNode(group));
  }

  /** This method is a stub for onTestStart(). */
  public onTestStart(_group: TestNode, _test: TestNode): void {}

  /**
   * This method reports a completed test.
   *
   * @param {TestNode} _group - The TestGroup that the TestResult belongs to.
   * @param {TestNode} test - The finished TestResult
   */
  public onTestFinish(group: TestNode, test: TestNode): void {
    this.writeTestFinish(SuiteReport.testFromNode(group, test));
  }

  /**
   * This method reports that a TestContext has finished.
   *
   * @param {TestContext} suite - The finished test context.
   */
  public onFinish(suite: TestContext): void {
    this.writeReport(SuiteReport.from(suite));
  }

  private writeGroupStart(group: SuiteGroupReport): void {
    /* istanbul ignore next */
    if (group.name) this.stdout!.write(`[Describe]: ${group.name}\n\n`);
  }

  private writeGroupFinish(group: SuiteGroupReport): void {
    if (group.tests.length === 0) return;

    for (const todo of group.todos) {
      this.onTodo(todo);
    }

    for (const logValue of group.logs) {
      this.onLog(logValue);
    }

    this.stdout!.write("\n");
  }

  private writeTestFinish(test: SuiteTestReport): void {
    if (test.pass) {
      /* istanbul ignore next */
      const rtraceDelta =
        /* istanbul ignore next */
        test.rtraceDelta === 0
          ? /* istanbul ignore next */
            ""
          : /* istanbul ignore next */
            chalk.yellow(
              ` RTrace: ${
                /* istanbul ignore next */
                (test.rtraceDelta > 0 ? /* istanbul ignore next */ "+" : /* istanbul ignore next */ "") +
                test.rtraceDelta.toString()
              }`,
            );
      this.stdout!.write(
        test.negated
          ? ` ${chalk.green(` [Throws]: ✔`)} ${test.name}${rtraceDelta}\n`
          : ` ${chalk.green(`[Success]: ✔`)} ${test.name}${rtraceDelta}\n`,
      );
    } else {
      this.stdout!.write(`    ${chalk.red(`[Fail]: ✖`)} ${test.name}\n`);
      const stringifyIndent2 = Object.assign({}, this.stringifyProperties, {
        indent: 2,
      });

      if (!test.negated) {
        if (test.actualValue) {
          this.stdout!.write(`  [Actual]: ${test.actualValue.stringify(stringifyIndent2).trimLeft()}\n`);
        }
        if (test.expectedValue) {
          const expected = test.expectedValue;
          this.stdout!.write(
            `[Expected]: ${expected.negated ? "Not " : ""}${expected.stringify(stringifyIndent2).trimLeft()}\n`,
          );
        }
      }

      /* istanbul ignore next */
      if (test.message) {
        this.stdout!.write(` [Message]: ${chalk.yellow(`${test.message}`)}\n`);
      }

      /* istanbul ignore next */
      if (test.stackTrace) {
        this.stdout!.write(`   [Stack]: ${test.stackTrace.split("\n").join("\n        ")}\n`);
      }
    }

    /** Log the values to stdout if this was a typical test. */
    for (const logValue of test.logs) {
      this.onLog(logValue);
    }
  }

  private writeReport(report: SuiteReport): void {
    /* istanbul ignore next */
    if (!report.hasResults) return;

    const result = report.pass ? chalk.green`✔ PASS` : chalk.red(`✖ FAIL`);

    const count = report.testCount;
    const successCount = report.testPassCount;

    const failText = count === successCount ? `0 fail` : chalk.red(`${(count - successCount).toString()} fail`);

    // There are currently no warnings provided by the as-pect testing suite
    /* istanbul ignore next */
    for (const warning of report.warnings) {
      /* istanbul ignore next */
      this.stdout!.write(`\n${chalk.yellow(` [Warning]`)}: ${warning.type} -> ${warning.message}\n`);
      /* istanbul ignore next */
      const stack = warning.stackTrace.trim();
      /* istanbul ignore next */
      if (stack) {
        /* istanbul ignore next */
        this.stdout!.write(`${chalk.yellow(`   [Stack]`)}: ${chalk.yellow(stack.split("\n").join("\n      "))}}\n`);
      }
      /* istanbul ignore next */
      this.stdout!.write("\n");
    }

    for (const error of report.errors) {
      this.stdout!.write(`\n${chalk.red(`   [Error]`)}: ${error.type} ${error.message}`);
      this.stdout!.write(
        `\n${chalk.red(`   [Stack]`)}: ${chalk.yellow(`${error.stackTrace.split("\n").join("\n           ")}`)}\n`,
      );
    }

    for (const change of report.snapshotChanges) {
      this.stdout!.write(`${chalk.red(`[Snapshot]`)}: ${change.name}\n`);
      this.writeSnapshotLines(change.lines);
      this.stdout!.write("\n");
    }

    const snapshotStats = report.snapshotStats;

    this.stdout!.write(`    [File]: ${report.fileName}
  [Groups]: ${chalk.green(`${report.groupCount} pass`)}, ${report.groupCount} total
  [Result]: ${result}
[Snapshot]: ${snapshotStats.total} total, ${snapshotStats.added} added, ${snapshotStats.removed} removed, ${snapshotStats.different} different
 [Summary]: ${chalk.green(`${report.testPassCount} pass`)},  ${failText}, ${report.testCount} total
    [Time]: ${report.rootRuntime}ms

${"~".repeat(80)}\n\n`);
  }

  private writeSnapshotLines(lines: SnapshotReportLine[]): void {
    for (const line of lines) {
      if (line.type === "added") {
        this.stdout!.write(`${chalk.green(`+ ${line.value}`)}\n`);
      } else if (line.type === "removed") {
        this.stdout!.write(`${chalk.red(`- ${line.value}`)}\n`);
      } else {
        this.stdout!.write(`  ${line.value}\n`);
      }
    }
  }

  /**
   * This method reports a todo to stdout.
   *
   * @param {string} todo - The todo.
   */
  /* istanbul ignore next */
  public onTodo(groupOrTodo: TestNode | string, maybeTodo?: string): void {
    const todo = typeof groupOrTodo === "string" ? groupOrTodo : maybeTodo!;
    /* istanbul ignore next */
    this.stdout!.write(`    ${chalk.yellow(`[Todo]:`)} ${todo}\n`);
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {ReflectedValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: ReflectedValue): void {
    const indent12 = Object.assign({}, this.stringifyProperties, {
      indent: 12,
    });
    const output: string = logValue.stringify(indent12).trimLeft();
    this.stdout!.write(`     ${chalk.yellow(`[Log]:`)} ${output}\n`);
    const stack = logValue.stack.trim();
    /* istanbul ignore next */
    if (stack) {
      this.stdout!.write(`   ${chalk.yellow(`[Stack]:`)} ${stack.trimStart().split("\n").join("\n        ")}\n`);
    }
  }
}
