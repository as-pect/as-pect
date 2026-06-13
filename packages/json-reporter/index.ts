import { WriteStream, createWriteStream } from "fs";
import { basename, extname, dirname, join } from "path";
import { finished } from "stream/promises";
import { TestContext, IReporter, IWritable, SuiteReport, SuiteReportEvent, SuiteResultReport } from "@as-pect/core";

/**
 * This class reports all relevant test statistics to a JSON file located at
 * `{testLocation}.spec.json`.
 */
export default class JSONReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  protected file: WriteStream | null = null;
  protected pendingWrite: Promise<void> = Promise.resolve();

  private first: boolean = true;

  public onEnter(_ctx: TestContext): void {}

  public onExit(_ctx: TestContext): void {}

  public onReportFinish(event: SuiteReportEvent): void {
    this.writeReport(event.report);
  }

  public onFinish(ctx: TestContext): void {
    this.writeReport(SuiteReport.from(ctx));
  }

  public onFlush(): Promise<void> {
    return this.pendingWrite;
  }

  protected writeReport(report: SuiteReport): void {
    if (report.hasResults === false) return;

    const extension = extname(report.fileName);
    const dir = dirname(report.fileName);
    const base = basename(report.fileName, extension);
    const outPath = join(process.cwd(), dir, base + ".json");

    this.file = createWriteStream(outPath, "utf8");
    this.pendingWrite = finished(this.file).then(() => undefined);
    this.file.write("[");
    this.first = true;

    for (const result of report.results) {
      this.onResult(result);
    }

    this.file.write(this.first ? "]" : "\n]");
    this.file.end();
  }

  protected onResult(result: SuiteResultReport): void {
    if (result.type === "test") {
      this.writeResult({
        group: result.groupName,
        name: result.name,
        ran: result.ran,
        pass: result.pass,
        negated: result.negated,
        runtime: result.runtime,
        message: result.message,
        actual: result.actual,
        expected: result.expected,
      });
    } else {
      this.writeResult({
        group: result.groupName,
        name: "TODO: " + result.description,
        ran: false,
        pass: null,
        negated: false,
        runtime: 0,
        message: "",
        actual: null,
        expected: null,
      });
    }
  }

  protected writeResult(result: object): void {
    this.file!.write((this.first ? "\n" : ",\n") + JSON.stringify(result));
    this.first = false;
  }
}
