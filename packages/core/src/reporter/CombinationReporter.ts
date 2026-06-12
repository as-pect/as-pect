import { TestContext } from "../test/TestContext.js";
import { IReporter, IWritable } from "./IReporter.js";
import { TestNode } from "../test/TestNode.js";
import type { GroupReportEvent, SuiteReportEvent, TestReportEvent } from "./ReportingLifecycle.js";

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
    this.reporters.forEach((e) => (e.stderr = writer));
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

  async onFlush(): Promise<void> {
    await Promise.all(this.reporters.map((reporter) => reporter.onFlush?.()));
  }

  onReportGroupStart(event: GroupReportEvent): void {
    this.reporters.forEach((reporter) => {
      if (reporter.onReportGroupStart) {
        reporter.onReportGroupStart(event);
      } else {
        reporter.onEnter(event.context, event.node);
      }
    });
  }

  onReportGroupFinish(event: GroupReportEvent): void {
    this.reporters.forEach((reporter) => {
      if (reporter.onReportGroupFinish) {
        reporter.onReportGroupFinish(event);
      } else {
        reporter.onExit(event.context, event.node);
      }
    });
  }

  onReportTestStart(event: TestReportEvent): void {
    this.reporters.forEach((reporter) => {
      if (reporter.onReportTestStart) {
        reporter.onReportTestStart(event);
      } else {
        reporter.onEnter(event.context, event.node);
      }
    });
  }

  onReportTestFinish(event: TestReportEvent): void {
    this.reporters.forEach((reporter) => {
      if (reporter.onReportTestFinish) {
        reporter.onReportTestFinish(event);
      } else {
        reporter.onExit(event.context, event.node);
      }
    });
  }

  onReportFinish(event: SuiteReportEvent): void {
    this.reporters.forEach((reporter) => {
      if (reporter.onReportFinish) {
        reporter.onReportFinish(event);
      } else {
        reporter.onFinish(event.context);
      }
    });
  }
}
