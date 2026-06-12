import { TestNode } from "../test/TestNode.js";
import { TestContext } from "../test/TestContext.js";
import type { ReportAdapter } from "./ReportingLifecycle.js";

export interface IWritable {
  write(str: string): void;
}

export interface IReporter extends ReportAdapter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onFinish(ctx: TestContext): void;
}
