import type { IReporter } from "./IReporter.js";
import type { GroupReportEvent, SuiteReportEvent, TestReportEvent } from "./ReportingLifecycle.js";

/**
 * Adapts report events to legacy reporter callbacks when a reporter has not implemented the
 * corresponding report callback.
 */
export class LegacyReporterAdapter {
  public constructor(private readonly reporter: IReporter) {}

  public onReportGroupStart(event: GroupReportEvent): void {
    if (this.reporter.onReportGroupStart) {
      this.reporter.onReportGroupStart(event);
    } else {
      this.reporter.onEnter(event.context, event.node);
    }
  }

  public onReportGroupFinish(event: GroupReportEvent): void {
    if (this.reporter.onReportGroupFinish) {
      this.reporter.onReportGroupFinish(event);
    } else {
      this.reporter.onExit(event.context, event.node);
    }
  }

  public onReportTestStart(event: TestReportEvent): void {
    if (this.reporter.onReportTestStart) {
      this.reporter.onReportTestStart(event);
    } else {
      this.reporter.onEnter(event.context, event.node);
    }
  }

  public onReportTestFinish(event: TestReportEvent): void {
    if (this.reporter.onReportTestFinish) {
      this.reporter.onReportTestFinish(event);
    } else {
      this.reporter.onExit(event.context, event.node);
    }
  }

  public onReportFinish(event: SuiteReportEvent): void {
    if (this.reporter.onReportFinish) {
      this.reporter.onReportFinish(event);
    } else {
      this.reporter.onFinish(event.context);
    }
  }
}
