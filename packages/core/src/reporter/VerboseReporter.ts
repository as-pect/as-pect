import { TestContext } from "../test/TestContext";
import { IWritable } from "../util/IWriteable";
import { ReflectedValue } from "../util/ReflectedValue";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";
import { TestNode } from "../test/TestNode";
import { IReporter } from "./IReporter";
import { SnapshotDiffResultType } from "@as-pect/snapshots";
import { StringifyReflectedValueProps } from "../util/stringifyReflectedValue";

/**
 * This is the default test reporter class for the `asp` command line application. It will pipe
 * all relevant details about each tests to the `stdout` WriteStream.
 */
export class VerboseReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  /** A set of default stringify properties that can be overridden. */
  protected stringifyProperties: Partial<StringifyReflectedValueProps> = {};

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

  /**
   * This method reports a TestGroup is starting.
   *
   * @param {TestNode} group - The started test group.
   */
  public onGroupStart(group: TestNode): void {
    /* istanbul ignore next */
    if (group.groupTests.length === 0) return;
    const chalk = require("chalk");
    /* istanbul ignore next */
    if (group.name) this.stdout!.write(chalk`[Describe]: ${group.name}\n\n`);
    for (const logValue of group.logs) {
      this.onLog(logValue);
    }
  }

  /**
   * This method reports a completed TestGroup.
   *
   * @param {TestGroup} group - The finished TestGroup.
   */
  public onGroupFinish(group: TestNode): void {
    if (group.groupTests.length === 0) return;

    for (const todo of group.groupTodos) {
      this.onTodo(group, todo);
    }

    this.stdout!.write("\n");
  }

  /** This method is a stub for onTestStart(). */
  public onTestStart(_group: TestNode, _test: TestNode): void {}

  /**
   * This method reports a completed test.
   *
   * @param {TestNode} _group - The TestGroup that the TestResult belongs to.
   * @param {TestNode} test - The finished TestResult
   */
  public onTestFinish(_group: TestNode, test: TestNode): void {
    const chalk = require("chalk");
    if (test.pass) {
      const rtraceDelta =
        test.rtraceDelta === 0
          ? ""
          : chalk` {yellow RTrace: ${
              /* istanbul ignore next */
              (test.rtraceDelta > 0
                ? /* istanbul ignore next */
                  "+"
                : /* istanbul ignore next */
                  "") + test.rtraceDelta.toString()
            }}`;
      this.stdout!.write(
        test.negated
          ? chalk` {green  [Throws]: ✔} ${test.name}${rtraceDelta}\n`
          : chalk` {green [Success]: ✔} ${test.name}${rtraceDelta}\n`,
      );
    } else {
      this.stdout!.write(chalk`    {red [Fail]: ✖} ${test.name}\n`);
      const stringifyIndent2 = Object.assign({}, this.stringifyProperties, {
        indent: 2,
      });

      if (!test.negated) {
        if (test.actual) {
          this.stdout!.write(
            `  [Actual]: ${test
              .actual!.stringify(stringifyIndent2)
              .trimLeft()}\n`,
          );
        }
        if (test.expected) {
          const expected = test.expected;
          this.stdout!.write(
            `[Expected]: ${expected.negated ? "Not " : ""}${expected
              .stringify(stringifyIndent2)
              .trimLeft()}\n`,
          );
        }
      }

      /* istanbul ignore next */
      if (test.message) {
        this.stdout!.write(chalk` [Message]: {yellow ${test.message}}\n`);
      }

      /* istanbul ignore next */
      if (test.stackTrace) {
        this.stdout!.write(
          `   [Stack]: ${test.stackTrace.split("\n").join("\n        ")}\n`,
        );
      }
    }

    /** Log the values to stdout if this was a typical test. */
    for (const logValue of test.logs) {
      this.onLog(logValue);
    }
  }

  /**
   * This method reports that a TestContext has finished.
   *
   * @param {TestContext} suite - The finished test context.
   */
  public onFinish(suite: TestContext): void {
    /* istanbul ignore next */
    if (suite.rootNode.children.length === 0) return;
    const chalk = require("chalk");

    const result = suite.pass ? chalk`{green ✔ PASS}` : chalk`{red ✖ FAIL}`;

    const count = suite.testCount;
    const successCount = suite.testPassCount;

    const failText =
      count === successCount
        ? `0 fail`
        : chalk`{red ${(count - successCount).toString()} fail}`;

    const rtcount = suite.allocationCount - suite.freeCount;

    const rTrace =
      rtcount === 0
        ? /* istanbul ignore next */
          ""
        : /* istanbul ignore next */
          chalk` {yellow RTrace: ${
            /* istanbul ignore next */
            rtcount > 0
              ? /* istanbul ignore next */
                `+${rtcount}`
              : /* istanbul ignore next */
                rtcount.toString()
          }}`;

    // There are currently no warnings provided by the as-pect testing suite
    /* istanbul ignore next */
    for (const warning of suite.warnings) {
      /* istanbul ignore next */
      this.stdout!.write(
        chalk`\n{yellow  [Warning]}: ${warning.type} -> ${warning.message}\n`,
      );
      /* istanbul ignore next */
      const stack = warning.stackTrace.trim();
      /* istanbul ignore next */
      if (stack) {
        /* istanbul ignore next */
        this.stdout!.write(
          chalk`{yellow    [Stack]}: {yellow ${stack
            .split("\n")
            .join("\n      ")}}\n`,
        );
      }
      /* istanbul ignore next */
      this.stdout!.write("\n");
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

    const diff = suite.snapshotDiff!.results;
    let addedCount = 0;
    let removedCount = 0;
    let differentCount = 0;
    let totalCount = 0;

    for (const [name, result] of diff.entries()) {
      if (
        result.type === SnapshotDiffResultType.Different ||
        result.type === SnapshotDiffResultType.Removed
      ) {
        this.stdout!.write(chalk`{red [Snapshot]}: ${name}\n`);

        const changes = result.changes;
        for (const change of changes) {
          const lines = change.value.split("\n");
          for (const line of lines) {
            if (!line.trim()) continue;
            if (change.added) {
              this.stdout!.write(chalk`{green + ${line}}\n`);
            } else if (change.removed) {
              this.stdout!.write(chalk`{red - ${line}}\n`);
            } else {
              this.stdout!.write(chalk`  ${line}\n`);
            }
          }
        }
        this.stdout!.write("\n");
      }
      totalCount += 1;
      addedCount += result.type === SnapshotDiffResultType.Added ? 1 : 0;
      removedCount += result.type === SnapshotDiffResultType.Removed ? 1 : 0;
      differentCount +=
        result.type === SnapshotDiffResultType.Different ? 1 : 0;
    }

    this.stdout!.write(chalk`    [File]: ${suite.fileName}${rTrace}
  [Groups]: {green ${suite.groupCount} pass}, ${suite.groupCount} total
  [Result]: ${result}
[Snapshot]: ${totalCount} total, ${addedCount} added, ${removedCount} removed, ${differentCount} different
 [Summary]: {green ${suite.testPassCount} pass},  ${failText}, ${
      suite.testCount
    } total
    [Time]: ${suite.rootNode.deltaT}ms

${"~".repeat(80)}\n\n`);
  }

  /**
   * This method reports a todo to stdout.
   *
   * @param {TestGroup} _group - The test group the todo belongs to.
   * @param {string} todo - The todo.
   */
  /* istanbul ignore next */
  public onTodo(_group: TestNode, todo: string): void {
    /* istanbul ignore next */
    const chalk = require("chalk");
    /* istanbul ignore next */
    this.stdout!.write(chalk`    {yellow [Todo]:} ${todo}\n`);
  }

  /**
   * A custom logger function for the default reporter that writes the log values using `console.log()`
   *
   * @param {ReflectedValue} logValue - A value to be logged to the console
   */
  public onLog(logValue: ReflectedValue): void {
    const chalk = require("chalk");
    const indent12 = Object.assign({}, this.stringifyProperties, {
      indent: 12,
    });
    const output: string = logValue.stringify(indent12).trimLeft();
    this.stdout!.write(chalk`     {yellow [Log]:} ${output}\n`);
    const stack = logValue.stack.trim();
    /* istanbul ignore next */
    if (stack) {
      this.stdout!.write(
        chalk`   {yellow [Stack]:} ${stack
          .trimLeft()
          .split("\n")
          .join("\n        ")}\n`,
      );
    }
  }
}
