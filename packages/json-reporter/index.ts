import { Writable } from "stream";
import { TestContext, IReporter, IWritable, SuiteReport, SuiteReportEvent, SuiteResultReport } from "@as-pect/core";
import { ReporterFileOutput } from "@as-pect/reporter-output";

/**
 * This class reports all relevant test statistics to a JSON file located at
 * `{testLocation}.spec.json`.
 */
export default class JSONReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  protected file: Writable | null = null;
  protected fileOutput: ReporterFileOutput;

  private first: boolean = true;

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

    const fileReport = this.fileOutput.start(report, ".json");
    if (fileReport === null) return;

    const file = fileReport.stream;
    this.file = file;
    file.write("[");
    this.first = true;

    for (const result of report.results) {
      this.onResult(result);
    }

    file.write(this.first ? "]" : "\n]");
    file.end();
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
