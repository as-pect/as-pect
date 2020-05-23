import { TestContext } from "../test/TestContext";
import { IWritable } from "../util/IWritable";
import { ReflectedValue } from "../util/ReflectedValue";
import { IReporter } from "./IReporter";
import { SnapshotDiffResultType } from "@as-pect/snapshots";
import { TestNode } from "../test/TestNode";

/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export class SummaryReporter implements IReporter {
  private enableLogging: boolean = true;
  constructor(options?: any) {
    this.stdout = options?.stdout ?? process.stdout;
    this.stderr = options?.stderr ?? process.stderr;
  }

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

  /**
   * This method reports a test context is finished running.
   *
   * @param {TestContext} suite - The finished test suite.
   */
  public onFinish(suite: TestContext): void {
    const chalk = require("chalk");
    const testGroups = suite.rootNode.childGroups;

    // TODO: Figure out a better way to flatten this array.

    const todos = ([] as string[]).concat.apply(
      [],
      testGroups.map((e) => e.groupTodos),
    ).length;
    const total = suite.testCount;
    const passCount = suite.testPassCount;
    const deltaT = suite.rootNode.deltaT;

    /** Report if all the groups passed. */
    if (suite.pass) {
      this.stdout!.write(
        chalk`{green.bold ✔ ${
          suite.fileName
        }} Pass: ${passCount.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${deltaT.toString()}ms\n`,
      );

      /** If logging is enabled, log all the values. */
      /* istanbul ignore next */
      if (this.enableLogging) {
        for (const group of testGroups) {
          for (const log of group.logs) {
            this.onLog(log);
          }

          for (const test of group.groupTests) {
            for (const log of test.logs) {
              this.onLog(log);
            }
          }
        }
      }
    } else {
      this.stdout!.write(
        chalk`{red.bold ❌ ${
          suite.fileName
        }} Pass: ${passCount.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${deltaT.toString()}ms\n`,
      );

      /** If the group failed, report that the group failed. */
      for (const group of testGroups) {
        /* istanbul ignore next */
        if (group.pass) continue;
        this.stdout!.write(chalk`  {red Failed:} ${group.name}\n`);

        /** Display the reason if there is one. */
        // if (group.reason)
        //   this.stdout!.write(chalk`    {yellow Reason:} ${group.reason}`);

        /** Log each log item in the failed group. */
        /* istanbul ignore next */
        if (this.enableLogging) {
          for (const log of group.logs) {
            this.onLog(log);
          }
        }

        inner: for (const test of group.groupTests) {
          if (test.pass) continue inner;
          this.stdout!.write(
            chalk`    {red.bold ❌ ${test.name}} - ${test.message}\n`,
          );
          if (test.actual !== null)
            this.stdout!.write(
              chalk`      {red.bold [Actual]  :} ${test.actual
                .stringify({ indent: 2 })
                .trimLeft()}\n`,
            );
          if (test.expected !== null) {
            const expected = test.expected;
            this.stdout!.write(
              chalk`      {green.bold [Expected]:} ${
                expected.negated ? "Not " : ""
              }${expected.stringify({ indent: 2 }).trimLeft()}\n`,
            );
          }
          /* istanbul ignore next */
          if (this.enableLogging) {
            for (const log of test.logs) {
              this.onLog(log);
            }
          }
        }
      }
    }

    // There are no warnings left in the as-pect test suite software
    for (const warning of suite.warnings) {
      /* istanbul ignore next */
      this.stdout!.write(
        chalk`{yellow  [Warning]}: ${warning.type} -> ${warning.message}\n`,
      );
      /* istanbul ignore next */
      const stack = warning.stackTrace.trim();
      /* istanbul ignore next */
      if (stack) {
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
        chalk`{red    [Error]}: ${error.type} ${error.message}\n`,
      );
      this.stdout!.write(
        chalk`{red    [Stack]}: {yellow ${error.stackTrace
          .split("\n")
          .join("\n           ")}}\n\n`,
      );
    }

    const diff = suite.snapshotDiff!.results;
    for (const [name, result] of diff.entries()) {
      if (result.type !== SnapshotDiffResultType.NoChange) {
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
