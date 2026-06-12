import stripAnsi from "strip-ansi";
import { SummaryReporter, type SuiteReport, type SuiteReportEvent, type TestContext } from "../src/index.js";

function createWriter(): { result: string; write(input: string): void } {
  return {
    result: "",
    write(input: string): void {
      this.result += input;
    },
  };
}

function createReport(overrides: Partial<SuiteReport>): SuiteReport {
  return {
    fileName: "assembly/example.spec.ts",
    pass: true,
    testCount: 0,
    testPassCount: 0,
    groupCount: 0,
    groupPassCount: 0,
    rootRuntime: 0,
    hasResults: false,
    todoCount: 0,
    rootNode: null,
    warnings: [],
    errors: [],
    snapshotChanges: [],
    snapshotStats: {
      total: 0,
      added: 0,
      removed: 0,
      different: 0,
    },
    groups: [],
    results: [],
    ...overrides,
  } as unknown as SuiteReport;
}

function writeSummaryReport(report: SuiteReport): string {
  const reporter = new SummaryReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportFinish({
    report,
    context: null as unknown as TestContext,
  } as SuiteReportEvent);

  return stripAnsi(writer.result);
}

test("SummaryReporter writes human-readable warning lines", () => {
  const output = writeSummaryReport(
    createReport({
      warnings: [
        {
          type: "WarningType",
          message: "warning message",
          stackTrace: "",
        },
      ],
    }),
  );

  expect(output).toContain(" [Warning]: WarningType -> warning message\n");
  expect(output).not.toContain("NaN");
});

test("SummaryReporter routes snapshot-change output through its writer only", () => {
  const originalConsoleLog = console.log;
  const consoleWrites: unknown[][] = [];
  console.log = (...args: unknown[]): void => {
    consoleWrites.push(args);
  };

  try {
    const output = writeSummaryReport(
      createReport({
        snapshotChanges: [
          {
            name: "snapshot group!~snapshot name[0]",
            lines: [
              { type: "removed", value: "old snapshot" },
              { type: "added", value: "new snapshot" },
            ],
            result: null,
          },
        ],
      }),
    );

    expect(consoleWrites).toEqual([]);
    expect(output).toContain("[Snapshot]: snapshot group!~snapshot name[0]\n");
    expect(output).toContain("- old snapshot\n");
    expect(output).toContain("+ new snapshot\n");
  } finally {
    console.log = originalConsoleLog;
  }
});
