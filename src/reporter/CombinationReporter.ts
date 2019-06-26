import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";

/**
 * This reporter is used to combine a set of reporters into a single reporter object. It uses
 * forEach() to call each reporter's function when each method is called.
 */
export default class CombinationReporter extends TestReporter {
  constructor(
    public reporters: TestReporter[],
  ) {
    super();
  }

  onFinish(suite: TestContext): void {
    this.reporters.forEach(e => e.onFinish(suite));
  }

  onGroupFinish(group: TestGroup): void {
    this.reporters.forEach(e => e.onGroupFinish(group));
  }

  onGroupStart(group: TestGroup): void {
    this.reporters.forEach(e => e.onGroupStart(group));
  }

  onStart(suite: TestContext): void {
    this.reporters.forEach(e => e.onStart(suite));
  }

  onTestStart(group: TestGroup, result: TestResult): void {
    this.reporters.forEach(e => e.onTestStart(group, result));
  }

  onTestFinish(group: TestGroup, result: TestResult): void {
    this.reporters.forEach(e => e.onTestFinish(group, result));
  }

  onTodo(group: TestGroup, todo: string): void {
    this.reporters.forEach(e => e.onTodo(group, todo));
  }
}