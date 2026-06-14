import { IReporter, IWritable, TestContext, TestNode } from "../src/index.js";
import type { SuiteReport } from "../src/index.js";
import { LegacyReporterAdapter } from "../src/reporter/LegacyReporterAdapter.js";

class RecordingReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;
  public entries: string[] = [];

  public onEnter(_ctx: TestContext, node: TestNode): void {
    this.entries.push(`enter:${node.name}`);
  }

  public onExit(_ctx: TestContext, node: TestNode): void {
    this.entries.push(`exit:${node.name}`);
  }

  public onFinish(ctx: TestContext): void {
    this.entries.push(`finish:${ctx.fileName}`);
  }
}

describe("LegacyReporterAdapter", () => {
  const ctx = { fileName: "assembly/example.spec.ts" } as TestContext;
  const group = { name: "math" } as TestNode;
  const test = { name: "adds" } as TestNode;
  const report = { fileName: "assembly/example.spec.ts" } as SuiteReport;
  const groupReport = {
    type: "group" as const,
    name: "math",
    pass: true,
    runtime: 0,
    hasChildren: true,
    logs: [],
    todos: [],
    tests: [],
  };
  const testReport = {
    type: "test" as const,
    groupName: "math",
    name: "adds",
    ran: true,
    negated: false,
    pass: true,
    runtime: 0,
    message: null,
    stackTrace: null,
    rtraceDelta: 0,
    logs: [],
    actual: null,
    expected: null,
    actualValue: null,
    expectedValue: null,
  };

  it("should translate group and test report events to legacy enter and exit callbacks", () => {
    const reporter = new RecordingReporter();
    const adapter = new LegacyReporterAdapter(reporter);

    adapter.onReportGroupStart({ group: groupReport }, { context: ctx, node: group });
    adapter.onReportTestStart({ group: groupReport, test: testReport }, { context: ctx, groupNode: group, node: test });
    adapter.onReportTestFinish(
      { group: groupReport, test: testReport },
      { context: ctx, groupNode: group, node: test },
    );
    adapter.onReportGroupFinish({ group: groupReport }, { context: ctx, node: group });

    expect(reporter.entries).toEqual(["enter:math", "enter:adds", "exit:adds", "exit:math"]);
  });

  it("should translate suite finish report events to the legacy finish callback", () => {
    const reporter = new RecordingReporter();
    const adapter = new LegacyReporterAdapter(reporter);

    adapter.onReportFinish({ report }, { context: ctx });

    expect(reporter.entries).toEqual(["finish:assembly/example.spec.ts"]);
  });

  it("should prefer modern report callbacks over legacy callbacks for each event", () => {
    const reporter = new RecordingReporter();
    const adapter = new LegacyReporterAdapter(reporter);
    reporter.onReportGroupStart = (event) => reporter.entries.push(`report-group-start:${event.group.name}`);
    reporter.onReportTestStart = (event) => reporter.entries.push(`report-test-start:${event.test.name}`);
    reporter.onReportTestFinish = (event) => reporter.entries.push(`report-test-finish:${event.test.name}`);
    reporter.onReportGroupFinish = (event) => reporter.entries.push(`report-group-finish:${event.group.name}`);
    reporter.onReportFinish = (event) => reporter.entries.push(`report-finish:${event.report.fileName}`);

    adapter.onReportGroupStart({ group: groupReport }, { context: ctx, node: group });
    adapter.onReportTestStart({ group: groupReport, test: testReport }, { context: ctx, groupNode: group, node: test });
    adapter.onReportTestFinish(
      { group: groupReport, test: testReport },
      { context: ctx, groupNode: group, node: test },
    );
    adapter.onReportGroupFinish({ group: groupReport }, { context: ctx, node: group });
    adapter.onReportFinish({ report }, { context: ctx });

    expect(reporter.entries).toEqual([
      "report-group-start:math",
      "report-test-start:adds",
      "report-test-finish:adds",
      "report-group-finish:math",
      "report-finish:assembly/example.spec.ts",
    ]);
  });
});
