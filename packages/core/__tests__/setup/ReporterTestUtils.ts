import stripAnsi from "strip-ansi";
import type {
  GroupReportEvent,
  SuiteGroupReport,
  SuiteReport,
  SuiteReportEvent,
  SuiteTestReport,
  TestReportEvent,
} from "../../src/index.js";
import { SummaryReporter, VerboseReporter } from "../../src/index.js";

export interface TestWriter {
  result: string;
  write(input: string): void;
  reset(): void;
}

export function createWriter(): TestWriter {
  return {
    result: "",
    write(input: string): void {
      this.result += input;
    },
    reset(): void {
      this.result = "";
    },
  };
}

export function writeSummaryReport(report: SuiteReport): string {
  return stripAnsi(writeSummaryReportRaw(report));
}

export function writeSummaryReportRaw(report: SuiteReport): string {
  const reporter = new SummaryReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportFinish(finishEvent(report));

  return writer.result;
}

export function writeVerboseReport(report: SuiteReport): string {
  return stripAnsi(writeVerboseReportRaw(report));
}

export function writeVerboseReportRaw(report: SuiteReport): string {
  const reporter = new VerboseReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportFinish(finishEvent(report));

  return writer.result;
}

export function withForcedColor<T>(forceColor: string, callback: () => T): T {
  const originalForceColor = process.env.FORCE_COLOR;
  const originalNoColor = process.env.NO_COLOR;

  try {
    process.env.FORCE_COLOR = forceColor;
    delete process.env.NO_COLOR;
    return callback();
  } finally {
    if (originalForceColor === undefined) {
      delete process.env.FORCE_COLOR;
    } else {
      process.env.FORCE_COLOR = originalForceColor;
    }

    if (originalNoColor === undefined) {
      delete process.env.NO_COLOR;
    } else {
      process.env.NO_COLOR = originalNoColor;
    }
  }
}

export function writeVerboseGroupStart(group: SuiteGroupReport): string {
  const reporter = new VerboseReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportGroupStart(groupEvent(group));

  return stripAnsi(writer.result);
}

export function writeVerboseGroupFinish(group: SuiteGroupReport): string {
  const reporter = new VerboseReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportGroupFinish(groupEvent(group));

  return stripAnsi(writer.result);
}

export function writeVerboseTestFinish(test: SuiteTestReport, group: SuiteGroupReport): string {
  const reporter = new VerboseReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportTestFinish({
    group,
    test,
  } as TestReportEvent);

  return stripAnsi(writer.result);
}

function finishEvent(report: SuiteReport): SuiteReportEvent {
  return {
    report,
  };
}

function groupEvent(group: SuiteGroupReport): GroupReportEvent {
  return {
    group,
  };
}
