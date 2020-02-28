import { TestNode } from "../test/TestNode";
import { TestContext } from "../test/TestContext";
import { IWritable } from "../util/IWriteable";
import { ReflectedValue } from "../util/ReflectedValue";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";
import { visitImmediateChildren, visitAllChildren } from "../util/visitChildren";
import { IReporter } from "./IReporter";
import { IWarning } from "../test/IWarning";


/**
 * This is the default test reporter class for the `asp` command line application. It will pipe
 * all relevant details about each tests to the `stdout` WriteStream.
 */
export class VerboseReporter implements IReporter {
  public stdout: IWritable | null = null;

  onEnter(_ctx: TestContext, node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.onGroupStart(node);
    }
  }

  onExit(_ctx: TestContext, node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.onGroupFinish(node);
    }
  }

  /**
   * This method reports a TestGroup is starting.
   *
   * @param {TestGroup} group - The started test group.
   */
  public onGroupStart(group: TestNode): void {
    if (group.children.length === 0) return;
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
    if (group.children.length === 0) return;
    const tests: TestNode[] = [];
    visitImmediateChildren(group, TestNodeType.Test, (child) => {
      tests.push(child);
    });

    for (let i = 0; i < tests.length; i++) {
      this.onTestFinish(group, tests[i]);
    }
    this.stdout!.write("\n");
  }

  /** This method is a stub for onTestStart(). */
  public onTestStart(_group: TestContext, _test: TestNode): void {}

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

      if (!test.negated) {
        if (test.actual) {
          this.stdout!.write(
            `  [Actual]: ${test.actual!.stringify({ indent: 2 }).trimLeft()}\n`,
          );
        }
        if (test.expected) {
          const expected = test.expected;
          this.stdout!.write(
            `[Expected]: ${expected.negated ? "Not " : ""}${expected
              .stringify({
                indent: 2,
              })
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
   * @param {TestContext} ctx - The finished test context.
   */
  public onFinish(ctx: TestContext): void {
    const suite = ctx.rootNode;
    /* istanbul ignore next */
    if (suite.children.length === 0) return;
    const errors: IWarning[] = [];
    const warnings: IWarning[] = [];

    visitAllChildren(suite, (node) => {
      for (const error of node.errors) errors.push(error);
      for (const warning of node.warnings) warnings.push(warning);
    });

    const chalk = require("chalk");

    const result = suite.pass ? chalk`{green ✔ PASS}` : chalk`{red ✖ FAIL}`;

    const failText =
      ctx.testPassCount === ctx.testCount
        ? `0 fail`
        : chalk`{red ${(ctx.testCount - ctx.testPassCount).toString()} fail}`;

    const rtcount = suite.rtraceDelta;

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

    for (const warning of suite.warnings) {
      this.stdout!.write(
        chalk`\n{yellow  [Warning]}: ${warning.type} -> ${warning.message}\n`,
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
        chalk`\n{red    [Error]}: ${error.type} ${error.message}`,
      );
      this.stdout!.write(
        chalk`\n{red    [Stack]}: {yellow ${error.stackTrace
          .split("\n")
          .join("\n           ")}}\n`,
      );
    }
    const time = Math.round(1000 * (suite.end - suite.start)) / 1000;
    this.stdout!.write(chalk`${
      process.stdout.columns
        ? /* istanbul ignore next */
          "~".repeat(Math.max(process.stdout.columns - 10, 10))
        : /* istanbul ignore next */
          "~".repeat(80)
    }

    [File]: ${ctx.fileName}${rTrace}
  [Groups]: {green ${ctx.groupPassCount}, ${ctx.groupCount} total
  [Result]: ${result}
 [Summary]: {green ${ctx.testPassCount} pass},  ${failText}, ${ctx.testCount} total
    [Todo]: {yellow ${ctx.todoCount}}
    [Time]: {blue ${time}ms}\n\n`);
  }

  /**
   * This method reports a todo to stdout.
   *
   * @param {TestGroup} _group - The test group the todo belongs to.
   * @param {string} todo - The todo.
   */
  /* istanbul ignore next */
  public onTodo(todo: string): void {
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
    const output: string = logValue.stringify({ indent: 12 }).trimLeft();
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
