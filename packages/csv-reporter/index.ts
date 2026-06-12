import { Stringifier, stringify } from "csv-stringify";
import { WriteStream, createWriteStream } from "fs";
import { basename, extname, dirname, join } from "path";
import { finished } from "stream/promises";
import { TestContext, IReporter, IWritable, SuiteReport, SuiteReportEvent, SuiteResultReport } from "@as-pect/core";

/**
 * This is a list of all the columns in the exported csv file.
 */
const csvColumns = ["Group", "Name", "Ran", "Negated", "Pass", "Runtime", "Message", "Actual", "Expected"];

/**
 * This class is responsible for creating a csv file located at {testName}.spec.csv. It will
 * contain a set of tests with relevant pass and fail information.
 */
export default class CSVReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;

  protected output: Stringifier | null = null;
  protected fileName: WriteStream | null = null;
  protected pendingWrite: Promise<void> = Promise.resolve();

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
    const extension = extname(report.fileName);
    const dir = dirname(report.fileName);
    const base = basename(report.fileName, extension);
    const outPath = join(process.cwd(), dir, base + ".csv");

    this.output = stringify({ columns: csvColumns });
    this.fileName = createWriteStream(outPath, "utf8");
    this.output.pipe(this.fileName);
    this.pendingWrite = Promise.all([finished(this.output), finished(this.fileName)]).then(() => undefined);
    this.output.write(csvColumns);

    for (const result of report.results) {
      this.onResult(result);
    }

    this.output.end();
  }

  protected onResult(result: SuiteResultReport): void {
    if (result.type === "test") {
      this.output!.write([
        result.groupName,
        result.name,
        result.ran ? "RAN" : "NOT RUN",
        result.negated ? "TRUE" : "FALSE",
        result.pass ? "PASS" : "FAIL",
        result.runtime.toString(),
        result.message,
        result.actual || "",
        result.expected || "",
      ]);
    } else {
      this.output!.write([result.groupName, result.description, "TODO", "", "", "", "", "", ""]);
    }
  }
}
