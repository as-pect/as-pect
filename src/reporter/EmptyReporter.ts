import { TestReporter } from "../test/TestReporter";

/**
 * This class can be used as a blank reporter to interface with the `TestContext` in the browser.
 * It will not report any information about the tests.
 */
export default class EmptyReporter extends TestReporter {
  constructor(_options?: any) { super(); }
  onFinish(): void {}
  onGroupFinish(): void {}
  onGroupStart(): void {}
  onStart(): void {}
  onTestFinish(): void {}
  onTestStart(): void {}
  onTodo(): void {}
}