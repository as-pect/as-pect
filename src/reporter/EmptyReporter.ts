import { TestReporter } from "../test/TestReporter";

export class EmptyReporter extends TestReporter {
  onFinish(): void {}
  onGroupFinish(): void {}
  onGroupStart(): void {}
  onStart(): void {}
  onTestFinish(): void {}
  onTestStart(): void {}
  onTodo(): void {}
}