import { Reporter } from "./Reporter";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestSuite } from "../test/TestSuite";
import chalk from "chalk";

export class DefaultReporter extends Reporter {
  onStart(suite: TestSuite): void {
    console.log("");
    console.log(chalk`[Log] Running: ${suite.filename}`);
    console.log("");
  }
  onGroupStart(group: TestGroup): void {
    console.log(chalk`[Describe]: ${group.name}`);
    console.log("");
  }
  onGroupFinish(group: TestGroup): void {
    const result = group.pass
      ? chalk`{green ✔ PASS}`
      : chalk`{red ✖ FAIL}`;

    console.log("");
    console.log(chalk`  [Result]: ${result}`);
    console.log(chalk`   [Tests]: ${group.successCount.toString()} pass, ${group.failCount.toString()} fail, ${group.totalCount.toString()} total`);
    console.log(chalk`    [Todo]: ${group.todoCount.toString()} tests`);
    console.log(chalk`    [Time]: ${group.time.toString()}ms`);
  }
  onTestStart(_group: TestGroup, _test: TestResult): void {}
  onTestFinish(_group: TestGroup, test: TestResult): void {
    if (test.pass) {
      console.log(chalk` {green [Success]: ✔} ${test.testName}`);
    } else {
      console.log("");
      console.log(chalk`    {red [Fail]: ✖} ${test.testName}`);
      console.log("");
      console.log(chalk`   [Actual]: {red ${test.actual}}`);
      console.log(chalk` [Expected]: {green ${test.expected}}`);
      console.log(chalk`  [Message]: {yellow ${test.message}}`);
      console.log(chalk`    [Stack]: ${test.stack!}`);
    }
  }
  onFinish(suite: TestSuite): void {
    const result = suite.pass
      ? chalk`{green ✔ Pass} `
      : chalk`{red ✖ Fail}`;

    console.log("");
    console.log(chalk`    [File]: ${suite.filename}`);
    console.log(chalk`  [Result]: ${result}`);
    console.log(chalk` [Summary]: ${suite.successCount.toString()} pass, ${suite.failCount.toString()} fail, ${suite.totalTests.toString()} total`);
    console.log(chalk`    [Todo]: ${suite.todoCount.toString()} test` + (suite.todoCount === 1 ? "s" : ""));
    console.log(chalk`    [Time]: ${suite.time.toString()}ms`);
    console.log("");
  }
  onTodo(_group: TestGroup, todo: string): void {
    console.log(chalk`    {yellow [Todo]:} ${todo}`);
  }
  onLog(_result: TestResult | null, logValue: string): void {
    console.log(chalk`     {yellow [Log]:} ${logValue}`);
    console.log("");
  }
}