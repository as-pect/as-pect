import { TestContext } from "../test/TestContext";
import { IWritable } from "../util/IWriteable";
import { ReflectedValue } from "../util/ReflectedValue";
import { TestNode } from "../test/TestNode";
import { EmptyReporter } from "./EmptyReporter";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";
import { IWarning } from "../test/IWarning";

/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export class SummaryReporter extends EmptyReporter {
  private enableLogging: boolean = true;

  private warnings: IWarning[] = [];
  private errors: IWarning[] = [];

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

  onExit(_ctx: TestContext, node: TestNode): void {
    /**
     * Reporting strategy. If the node passes, only display it if it's a group.
     */
    if (node.pass) {
      if (node.type === TestNodeType.Group) {
        const tests = node.groupTests;
        const todos = node.groupTodos;
        const count = tests.length;
        const chalk = require("chalk");
        const deltaT = node.deltaT;
        const todoCount = todos.length;
        this.stdout!.write(
          chalk`{green ${node.name}} Pass: {green ${count}} / ${count} Todo: {blue ${todoCount}} Time: {blue ${deltaT}ms}\n`,
        );
      }
    } else {
      // this node didn't pass, report it
      const tests = node.groupTests;
      const failed = tests.filter(e => !e.pass);
      const todoCount = node.todos.length;
      const chalk = require("chalk");
      const deltaT = node.deltaT;
      const count = tests.length;
      const failedCount = failed.length;


      this.stdout!.write(
        chalk`{red ${node.name}} Pass: {red ${count - failedCount}} / ${count} Todo: {blue ${todoCount}} Time: {blue ${deltaT}ms}\n`,
      );

      if (this.enableLogging) {
        for (let i = 0; i < node.logs.length; i++) {
          this.onLog(node.logs[i]);
        }
      }

      // loop over the failed tests
      for (let i = 0; i < failed.length; i++) {
        const test = failed[i];
        this.stdout!.write(
          chalk`    {red.bold ❌ ${test.name}} - ${test.message}\n`,
        );
        const actual = test.actual;
        const expected = test.expected;

        if (expected) {
          this.stdout!.write(
            chalk`      {green.bold [Expected]:} ${
              expected.negated ? "Not " : ""
            }${expected.stringify({ indent: 2 }).trimLeft()}\n`,
          );
        }

        if (actual) {
          this.stdout!.write(
            chalk`      {red.bold [Actual]  :} ${actual
              .stringify({ indent: 2 })
              .trimLeft()}\n`,
          );
        }

        for (let i = 0; i < test.logs.length; i++) {
          this.onLog(test.logs[i]);
        }
      }
    }

    for (let i = 0; i < node.warnings.length; i++) {
      this.warnings.push(node.warnings[i]);
    }
    for (let i = 0; i < node.errors.length; i++) {
      this.errors.push(node.errors[i]);
    }
  }

  onFinish(_ctx: TestContext) {
    const chalk = require("chalk");
    for (let i = 0; i < this.warnings.length; i++) {
      const warning = this.warnings[i];

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
    for (let i = 0; i < this.errors.length; i++) {
      const error = this.errors[i];
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

  public stdout: IWritable | null = null;


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
