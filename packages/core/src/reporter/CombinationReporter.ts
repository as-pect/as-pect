import { TestContext } from "../test/TestContext.js";
import { IReporter, IWritable } from "./IReporter.js";
import { TestNode } from "../test/TestNode.js";
import { LegacyReporterAdapter } from "./LegacyReporterAdapter.js";
import type { GroupReportEvent, SuiteReportEvent, TestReportEvent } from "./ReportingLifecycle.js";

/**
 * This reporter is used to combine a set of reporters into a single reporter object. It uses
 * forEach() to call each reporter's function when each method is called.
 */
export class CombinationReporter implements IReporter {
  private readonly reporterAdapters: LegacyReporterAdapter[];

  constructor(protected reporters: IReporter[]) {
    this.reporterAdapters = reporters.map((reporter) => new LegacyReporterAdapter(reporter));
  }

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
    this.reporterAdapters.forEach((reporter) => reporter.onReportGroupStart(event));
  }

  onReportGroupFinish(event: GroupReportEvent): void {
    this.reporterAdapters.forEach((reporter) => reporter.onReportGroupFinish(event));
  }

  onReportTestStart(event: TestReportEvent): void {
    this.reporterAdapters.forEach((reporter) => reporter.onReportTestStart(event));
  }

  onReportTestFinish(event: TestReportEvent): void {
    this.reporterAdapters.forEach((reporter) => reporter.onReportTestFinish(event));
  }

  onReportFinish(event: SuiteReportEvent): void {
    this.reporterAdapters.forEach((reporter) => reporter.onReportFinish(event));
  }
}
