import { SuiteReport, type IReporter, type IWritable, type SuiteReportEvent, type SuiteResultReport, type TestContext } from "@as-pect/core";
import { ReporterFileOutput } from "@as-pect/reporter-output";

function escapeXmlText(value: string): string {
  return value
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\"/g, "&quot;")
    .replace(/'/g, "&apos;");
}

function attr(name: string, value: string | number): string {
  return ` ${name}="${escapeXmlText(String(value))}"`;
}

function seconds(milliseconds: number): string {
  if (!Number.isFinite(milliseconds) || milliseconds <= 0) return "0";

  return (milliseconds / 1000).toFixed(3).replace(/\.0+$/, "").replace(/(\.\d*?)0+$/, "$1");
}

function countFailures(results: SuiteResultReport[]): number {
  return results.filter((result) => result.type === "test" && result.ran && !result.pass).length;
}

function countSkipped(results: SuiteResultReport[]): number {
  return results.filter((result) => result.type === "todo" || (result.type === "test" && !result.ran)).length;
}

function failureBody(result: Extract<SuiteResultReport, { type: "test" }>): string {
  const lines = [result.message ?? "Test failed"];

  if (result.stackTrace) lines.push(result.stackTrace);
  if (result.actual !== null) lines.push(`Actual: ${result.actual}`);
  if (result.expected !== null) lines.push(`Expected: ${result.expected}`);

  return escapeXmlText(lines.join("\n"));
}

function snapshotOutput(report: SuiteReport): string | null {
  if (report.snapshotChanges.length === 0) return null;

  const lines: string[] = [];
  for (const change of report.snapshotChanges) {
    lines.push(`Snapshot: ${change.name}`);
    for (const line of change.lines) {
      const prefix = line.type === "added" ? "+" : line.type === "removed" ? "-" : " ";
      lines.push(`${prefix} ${line.value}`);
    }
  }

  return lines.join("\n");
}

function renderTestcase(result: SuiteResultReport): string {
  if (result.type === "todo") {
    return [
      `  <testcase${attr("classname", result.groupName)}${attr("name", `TODO: ${result.description}`)}${attr("time", "0")}>`,
      `    <skipped${attr("message", "TODO")}/>`,
      "  </testcase>",
    ].join("\n");
  }

  const opening = `  <testcase${attr("classname", result.groupName)}${attr("name", result.name)}${attr("time", seconds(result.runtime))}>`;
  if (!result.ran) {
    return [opening, `    <skipped${attr("message", "Not run")}/>`, "  </testcase>"].join("\n");
  }

  if (!result.pass) {
    return [
      opening,
      `    <failure${attr("message", result.message ?? "Test failed")}>${failureBody(result)}</failure>`,
      "  </testcase>",
    ].join("\n");
  }

  return opening.replace(/>$/, "/>");
}

function renderSuiteError(error: SuiteReport["errors"][number]): string {
  return [
    `  <testcase${attr("classname", "as-pect")}${attr("name", error.type)}${attr("time", "0")}>`,
    `    <error${attr("message", error.message)}>${escapeXmlText(error.stackTrace)}</error>`,
    "  </testcase>",
  ].join("\n");
}

function renderReport(report: SuiteReport): string {
  const tests = report.results.length + report.errors.length;
  const failures = countFailures(report.results);
  const skipped = countSkipped(report.results);
  const output = snapshotOutput(report);
  const lines = [
    '<?xml version="1.0" encoding="UTF-8"?>',
    `<testsuite${attr("name", report.fileName)}${attr("tests", tests)}${attr("failures", failures)}${attr("errors", report.errors.length)}${attr("skipped", skipped)}${attr("time", seconds(report.rootRuntime))}>`,
  ];

  for (const result of report.results) {
    lines.push(renderTestcase(result));
  }

  for (const error of report.errors) {
    lines.push(renderSuiteError(error));
  }

  if (output !== null) {
    lines.push(`  <system-out>${escapeXmlText(output)}</system-out>`);
  }

  lines.push("</testsuite>", "");
  return lines.join("\n");
}

/**
 * Writes JUnit XML report files next to each test entry.
 */
export default class JUnitReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  protected fileOutput: ReporterFileOutput = new ReporterFileOutput();

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

    const fileReport = this.fileOutput.start(report, ".xml");
    if (fileReport === null) return;

    fileReport.stream.end(renderReport(report));
  }
}
