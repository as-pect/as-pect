import { TestNode } from "../test/TestNode.js";
import { TestContext } from "../test/TestContext.js";

export interface IWritable {
  write(str: string): void;
}

export interface IReporter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onFinish(ctx: TestContext): void;
}
