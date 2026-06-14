import type { IReporter } from "./IReporter.js";
import { LegacyReporterAdapter } from "./LegacyReporterAdapter.js";
import { createGroupReport, createSuiteReport, createTestReport } from "./SuiteReportFactory.js";
import type { SuiteGroupReport, SuiteReport, SuiteTestReport } from "./SuiteReportFactory.js";
import type { TestContext } from "../test/TestContext.js";
import type { TestNode } from "../test/TestNode.js";
import { TestNodeType } from "../util/TestNodeType.js";

export { createGroupReport, createSuiteReport, createTestReport, SuiteReport } from "./SuiteReportFactory.js";
export type {
  SnapshotReportChange,
  SnapshotReportLine,
  SnapshotReportLineType,
  SnapshotReportStats,
  SuiteGroupReport,
  SuiteResultReport,
  SuiteTestReport,
  SuiteTodoReport,
} from "./SuiteReportFactory.js";

export interface GroupReportEvent {
  group: SuiteGroupReport;
}

export interface TestReportEvent {
  group: SuiteGroupReport;
  test: SuiteTestReport;
}

export interface SuiteReportEvent {
  report: SuiteReport;
}

export interface ReportAdapter {
  /**
   * Called before a user-authored group callback is invoked to collect that group's hooks,
   * tests, and nested groups. Start event report facts only include values known at that point;
   * use the matching finish event for complete group facts.
   */
  onReportGroupStart?(event: GroupReportEvent): void;
  onReportGroupFinish?(event: GroupReportEvent): void;
  /**
   * Called before the test callback is invoked. Start event report facts only include values known
   * before execution; use the matching finish event for pass/fail, runtime, log, and error facts.
   */
  onReportTestStart?(event: TestReportEvent): void;
  onReportTestFinish?(event: TestReportEvent): void;
  onReportFinish?(event: SuiteReportEvent): void;
}

export class ReportingLifecycle {
  private readonly reporterAdapter: LegacyReporterAdapter;

  public constructor(
    private readonly suite: TestContext,
    reporter: IReporter,
  ) {
    this.reporterAdapter = new LegacyReporterAdapter(reporter);
  }

  public enter(node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.reporterAdapter.onReportGroupStart(
        {
          group: createGroupReport(node),
        },
        {
          context: this.suite,
          node,
        },
      );
      return;
    }

    if (node.type === TestNodeType.Test) {
      const groupNode = node.parent!;
      this.reporterAdapter.onReportTestStart(
        {
          group: createGroupReport(groupNode),
          test: createTestReport(groupNode, node),
        },
        {
          context: this.suite,
          groupNode,
          node,
        },
      );
    }
  }

  public exit(node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.reporterAdapter.onReportGroupFinish(
        {
          group: createGroupReport(node),
        },
        {
          context: this.suite,
          node,
        },
      );
      return;
    }

    if (node.type === TestNodeType.Test) {
      const groupNode = node.parent!;
      this.reporterAdapter.onReportTestFinish(
        {
          group: createGroupReport(groupNode),
          test: createTestReport(groupNode, node),
        },
        {
          context: this.suite,
          groupNode,
          node,
        },
      );
    }
  }

  public finish(): void {
    this.reporterAdapter.onReportFinish(
      {
        report: createSuiteReport(this.suite),
      },
      {
        context: this.suite,
      },
    );
  }
}
