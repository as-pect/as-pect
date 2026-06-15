import { SuiteReport, type IReporter, type IWritable, type SuiteReportEvent, type SuiteResultReport, type TestContext } from "@as-pect/core";
import { ReporterFileOutput } from "@as-pect/reporter-output";

const CTRF_SPEC_VERSION = "0.0.0";

type CTRFTestStatus = "passed" | "failed" | "pending" | "skipped" | "other";

interface CTRFSummary {
  tests: number;
  passed: number;
  failed: number;
  pending: number;
  skipped: number;
  other: number;
  start: number;
  stop: number;
}

interface CTRFTest {
  name: string;
  status: CTRFTestStatus;
  duration: number;
  suite?: string[];
  filePath?: string;
  message?: string;
  trace?: string;
  extra: {
    asPect: Record<string, unknown>;
  };
}

interface CTRFReport {
  reportFormat: "CTRF";
  specVersion: string;
  results: {
    tool: {
      name: "as-pect";
    };
    summary: CTRFSummary;
    tests: CTRFTest[];
    extra: {
      asPect: Record<string, unknown>;
    };
  };
}

function nowMilliseconds(): number {
  return Date.now();
}

function statusForTest(result: Extract<SuiteResultReport, { type: "test" }>): CTRFTestStatus {
  if (!result.ran) return "skipped";
  return result.pass ? "passed" : "failed";
}

function createTestExtra(report: SuiteReport, result: Extract<SuiteResultReport, { type: "test" }>): Record<string, unknown> {
  return {
    fileName: report.fileName,
    groupName: result.groupName,
    negated: result.negated,
    rtraceDelta: result.rtraceDelta,
    actual: result.actual,
    expected: result.expected,
    actualValue: result.actualValue,
    expectedValue: result.expectedValue,
    logs: result.logs,
  };
}

function createTodoExtra(report: SuiteReport, result: Extract<SuiteResultReport, { type: "todo" }>): Record<string, unknown> {
  return {
    fileName: report.fileName,
    groupName: result.groupName,
    description: result.description,
  };
}

function createSuiteErrorReport(report: SuiteReport, error: SuiteReport["errors"][number]): CTRFTest {
  return {
    name: error.type,
    status: "failed",
    duration: 0,
    suite: ["as-pect"],
    filePath: report.fileName,
    message: error.message,
    trace: error.stackTrace,
    extra: {
      asPect: {
        fileName: report.fileName,
        type: "suiteError",
        errorType: error.type,
      },
    },
  };
}

function createTestReport(report: SuiteReport, result: SuiteResultReport): CTRFTest {
  if (result.type === "todo") {
    return {
      name: `TODO: ${result.description}`,
      status: "pending",
      duration: 0,
      suite: [result.groupName],
      filePath: report.fileName,
      extra: { asPect: createTodoExtra(report, result) },
    };
  }

  const test: CTRFTest = {
    name: result.name,
    status: statusForTest(result),
    duration: result.runtime,
    suite: [result.groupName],
    filePath: report.fileName,
    extra: { asPect: createTestExtra(report, result) },
  };

  if (result.message !== null) test.message = result.message;
  if (result.stackTrace !== null) test.trace = result.stackTrace;

  return test;
}

function createSummary(tests: CTRFTest[], rootRuntime: number): CTRFSummary {
  const start = nowMilliseconds();
  const summary: CTRFSummary = {
    tests: tests.length,
    passed: 0,
    failed: 0,
    pending: 0,
    skipped: 0,
    other: 0,
    start,
    stop: start + Math.max(0, rootRuntime),
  };

  for (const test of tests) {
    if (test.status === "passed") summary.passed += 1;
    else if (test.status === "failed") summary.failed += 1;
    else if (test.status === "pending") summary.pending += 1;
    else if (test.status === "skipped") summary.skipped += 1;
    else summary.other += 1;
  }

  return summary;
}

function createReportExtra(report: SuiteReport): Record<string, unknown> {
  return {
    fileName: report.fileName,
    pass: report.pass,
    testCount: report.testCount,
    testPassCount: report.testPassCount,
    groupCount: report.groupCount,
    groupPassCount: report.groupPassCount,
    todoCount: report.todoCount,
    warnings: report.warnings,
    errors: report.errors,
    snapshotStats: report.snapshotStats,
    snapshotChanges: report.snapshotChanges.map((change) => ({
      name: change.name,
      lines: change.lines,
    })),
  };
}

function renderReport(report: SuiteReport): CTRFReport {
  const tests = [
    ...report.results.map((result) => createTestReport(report, result)),
    ...report.errors.map((error) => createSuiteErrorReport(report, error)),
  ];

  return {
    reportFormat: "CTRF",
    specVersion: CTRF_SPEC_VERSION,
    results: {
      tool: { name: "as-pect" },
      summary: createSummary(tests, report.rootRuntime),
      tests,
      extra: { asPect: createReportExtra(report) },
    },
  };
}

/**
 * Writes CTRF JSON report files next to each test entry.
 */
export default class CTRFReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  protected fileOutput: ReporterFileOutput;

  public constructor(outputRoot?: string) {
    this.fileOutput = new ReporterFileOutput(undefined, outputRoot);
  }

  public onEnter(_ctx: TestContext): void {}

  public onExit(_ctx: TestContext): void {}

  public onReportFinish(event: SuiteReportEvent): void {
    this.writeReport(event.report);
  }

  public onFinish(ctx: TestContext): void {
    this.writeReport(SuiteReport.from(ctx));
  }

  public onFlush(): Promise<void> {
    return this.fileOutput.flush();
  }

  protected writeReport(report: SuiteReport): void {
    if (report.hasResults === false) return;

    const fileReport = this.fileOutput.start(report, ".ctrf.json");
    if (fileReport === null) return;

    fileReport.stream.end(`${JSON.stringify(renderReport(report), null, 2)}\n`);
  }
}
