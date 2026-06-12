import stripAnsi from "strip-ansi";
import type {
  GroupReportEvent,
  SuiteGroupReport,
  SuiteReport,
  SuiteReportEvent,
  SuiteTestReport,
  TestContext,
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
  const reporter = new SummaryReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportFinish(finishEvent(report));

  return stripAnsi(writer.result);
}

export function writeVerboseReport(report: SuiteReport): string {
  const reporter = new VerboseReporter();
  const writer = createWriter();
  reporter.stdout = writer;
  reporter.stderr = writer;

  reporter.onReportFinish(finishEvent(report));

  return stripAnsi(writer.result);
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
    context: null as unknown as TestContext,
    groupNode: null,
    node: null,
  } as unknown as TestReportEvent);

  return stripAnsi(writer.result);
}

function finishEvent(report: SuiteReport): SuiteReportEvent {
  return {
    report,
    context: null as unknown as TestContext,
  } as SuiteReportEvent;
}

function groupEvent(group: SuiteGroupReport): GroupReportEvent {
  return {
    group,
    context: null as unknown as TestContext,
    node: null,
  } as unknown as GroupReportEvent;
}
