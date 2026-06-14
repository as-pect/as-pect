import type { IReporter } from "./IReporter.js";
import type { GroupReportEvent, SuiteReportEvent, TestReportEvent } from "./ReportingLifecycle.js";
import type { TestContext } from "../test/TestContext.js";
import type { TestNode } from "../test/TestNode.js";

export interface LegacyGroupReportFacts {
  context: TestContext;
  node: TestNode;
}

export interface LegacyTestReportFacts {
  context: TestContext;
  groupNode: TestNode;
  node: TestNode;
}

export interface LegacySuiteReportFacts {
  context: TestContext;
}

export interface ReportCompatibilityAdapter {
  onReportGroupStartWithLegacy?(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void;
  onReportGroupFinishWithLegacy?(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void;
  onReportTestStartWithLegacy?(event: TestReportEvent, legacy: LegacyTestReportFacts): void;
  onReportTestFinishWithLegacy?(event: TestReportEvent, legacy: LegacyTestReportFacts): void;
  onReportFinishWithLegacy?(event: SuiteReportEvent, legacy: LegacySuiteReportFacts): void;
}

/**
 * Adapts report events to legacy reporter callbacks when a reporter has not implemented the
 * corresponding report callback.
 */
export class LegacyReporterAdapter {
  public constructor(private readonly reporter: IReporter) {}

  public onReportGroupStart(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void {
    const compatibilityReporter = this.reporter as ReportCompatibilityAdapter;
    if (compatibilityReporter.onReportGroupStartWithLegacy) {
      compatibilityReporter.onReportGroupStartWithLegacy(event, legacy);
    } else if (this.reporter.onReportGroupStart) {
      this.reporter.onReportGroupStart(event);
    } else {
      this.reporter.onEnter(legacy.context, legacy.node);
    }
  }

  public onReportGroupFinish(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void {
    const compatibilityReporter = this.reporter as ReportCompatibilityAdapter;
    if (compatibilityReporter.onReportGroupFinishWithLegacy) {
      compatibilityReporter.onReportGroupFinishWithLegacy(event, legacy);
    } else if (this.reporter.onReportGroupFinish) {
      this.reporter.onReportGroupFinish(event);
    } else {
      this.reporter.onExit(legacy.context, legacy.node);
    }
  }

  public onReportTestStart(event: TestReportEvent, legacy: LegacyTestReportFacts): void {
    const compatibilityReporter = this.reporter as ReportCompatibilityAdapter;
    if (compatibilityReporter.onReportTestStartWithLegacy) {
      compatibilityReporter.onReportTestStartWithLegacy(event, legacy);
    } else if (this.reporter.onReportTestStart) {
      this.reporter.onReportTestStart(event);
    } else {
      this.reporter.onEnter(legacy.context, legacy.node);
    }
  }

  public onReportTestFinish(event: TestReportEvent, legacy: LegacyTestReportFacts): void {
    const compatibilityReporter = this.reporter as ReportCompatibilityAdapter;
    if (compatibilityReporter.onReportTestFinishWithLegacy) {
      compatibilityReporter.onReportTestFinishWithLegacy(event, legacy);
    } else if (this.reporter.onReportTestFinish) {
      this.reporter.onReportTestFinish(event);
    } else {
      this.reporter.onExit(legacy.context, legacy.node);
    }
  }

  public onReportFinish(event: SuiteReportEvent, legacy: LegacySuiteReportFacts): void {
    const compatibilityReporter = this.reporter as ReportCompatibilityAdapter;
    if (compatibilityReporter.onReportFinishWithLegacy) {
      compatibilityReporter.onReportFinishWithLegacy(event, legacy);
    } else if (this.reporter.onReportFinish) {
      this.reporter.onReportFinish(event);
    } else {
      this.reporter.onFinish(legacy.context);
    }
  }
}
