import { TestContext } from "../test/TestContext.js";
import { IReporter, IWritable } from "./IReporter.js";
import { TestNode } from "../test/TestNode.js";

/**
 * This reporter is used to combine a set of reporters into a single reporter object. It uses
 * forEach() to call each reporter's function when each method is called.
 */
export class CombinationReporter implements IReporter {
  constructor(protected reporters: IReporter[]) {}

  get stdout(): IWritable | null {
    return this.reporters[0].stdout;
  }

  get stderr(): IWritable | null {
    return this.reporters[0].stderr;
  }

  set stdout(writer: IWritable | null) {
    this.reporters.forEach((e) => (e.stdout = writer));
  }

  set stderr(writer: IWritable | null) {
    this.reporters.forEach((e) => (e.stdout = writer));
  }

  onEnter(ctx: TestContext, node: TestNode) {
    this.reporters.forEach((e) => e.onEnter(ctx, node));
  }

  onExit(ctx: TestContext, node: TestNode) {
    this.reporters.forEach((e) => e.onExit(ctx, node));
  }

  onFinish(ctx: TestContext) {
    this.reporters.forEach((e) => e.onFinish(ctx));
  }
}
