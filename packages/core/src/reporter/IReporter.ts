import { TestNode } from "../test/TestNode.js";
import { TestContext } from "../test/TestContext.js";

export interface IReporter {
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onFinish(ctx: TestContext): void;
}
