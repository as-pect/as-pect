import { TestContext } from "../test/TestContext";
import { IReporter } from "./IReporter";
import { TestNode } from "../test/TestNode";

/**
 * This reporter is used to combine a set of reporters into a single reporter object. It uses
 * forEach() to call each reporter's function when each method is called.
 */
export class CombinationReporter implements IReporter {
  constructor(protected reporters: IReporter[]) {}

  onEnter(ctx: TestContext, node: TestNode) {
    this.reporters.forEach(e => e.onEnter(ctx, node));
  }

  onExit(ctx: TestContext, node: TestNode) {
    this.reporters.forEach(e => e.onExit(ctx, node));
  }

  onFinish(ctx: TestContext) {
    this.reporters.forEach(e => e.onFinish(ctx));
  }
}
