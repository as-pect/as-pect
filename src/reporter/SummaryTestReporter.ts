import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { TestResult } from "../test/TestResult";
import chalk from "chalk";

export class SummaryTestReporter extends TestReporter {
  public onStart(): void {}
  public onGroupStart(): void {}
  public onGroupFinish(): void {}
  public onTestStart(): void {}
  public onTestFinish(): void {}
  public onTodo(): void {}
  constructor() { super(); }

  public onFinish(suite: TestContext): void {
    const tests: TestResult[] = ([] as TestResult[]).concat(...suite.testGroups.map(e => e.tests));
    const todos = ([] as string[])
      .concat(...suite.testGroups.map(e => e.todos)).length;
    const total = tests.length;
    const pass = tests.reduce((left, right) => right.pass ? left + 1 : left, 0);
    if (pass === total) {
      console.log(
        chalk`{green.bold ✔ ${suite.file}} Pass: ${pass.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${suite.time.toString()}ms`,
      );
    } else {
      console.log(
        chalk`{red.bold ❌ ${suite.file}} Pass: ${pass.toString()} / ${total.toString()} Todo: ${todos.toString()} Time: ${suite.time.toString()}ms`,
      );

      for (const group of suite.testGroups) {
        if (group.pass) continue;
        console.log(chalk`  ${group.name}`);
        inner:
        for (const test of group.tests) {
          if (test.pass) continue inner;
          console.log(chalk`    {red.bold ❌ ${test.name}} - ${test.message}`);
          if (test.expected !== null) console.log(chalk`      {green.bold [Expected]:} ${test.expected.message}`);
          if (test.actual !== null) console.log(chalk`      {red.bold [Actual]  :} ${test.actual.message}`);
        }
      }
    }
  }
}