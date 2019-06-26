import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import stringify, { Stringifier } from "csv-stringify";
import { WriteStream, createWriteStream } from "fs";
import { basename, extname, dirname, join } from "path";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";

/**
 * This is a list of all the columns in the exported csv file.
 */
const csvColumns = [
  "Group",
  "Name",
  "Ran",
  "Pass",
  "Runtime",
  "Message",
  "Actual",
  "Expected",
  "Average",
  "Mean",
  "Max",
  "Min",
  "StdDev",
  "Variance",
];

/**
 * This class is responsible for creating a csv file located at {testName}.spec.csv. It will
 * contain a set of tests with relevant pass and fail information.
 */
export default class CSVReporter extends TestReporter {
  protected output: Stringifier | null = null;
  protected fileName: WriteStream | null = null;

  constructor(_options?: any) {
    super();
  }

  public onStart(suite: TestContext): void {
    this.output = stringify({ columns: csvColumns });
    const extension = extname(suite.fileName);
    const dir = dirname(suite.fileName);
    const base = basename(suite.fileName, extension);
    const outPath = join(
      process.cwd(),
      dir,
      base + ".csv",
    );
    this.fileName = createWriteStream(outPath, "utf8");
    this.output.pipe(this.fileName);

    this.output.write(csvColumns);
  }

  public onGroupStart(): void {}
  public onGroupFinish(): void {}
  public onFinish(): void {
    this.output!.end();
  }
  public onTestStart() {}
  public onTestFinish(group: TestGroup, result: TestResult) {
    this.output!.write([
      group.name,
      result.ran ? "RAN" : "NOT RUN",
      result.name,
      result.pass ? "PASS" : "FAIL",
      result.runTime.toString(),
      result.message,
      result.actual ? result.actual.message : "",
      result.expected ? result.expected.message : "",
      result.hasAverage ? result.average.toString() : "",
      result.hasMedian ? result.median.toString() : "",
      result.hasMax ? result.max.toString() : "",
      result.hasMin ? result.min.toString() : "",
      result.hasStdDev ? result.stdDev.toString() : "",
      result.hasVariance ? result.variance.toString() : ""
    ]);
  }

  public onTodo(group: TestGroup, desc: string) {
    this.output!.write([
      group.name,
      "TODO",
      desc,
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ]);
  }
}
