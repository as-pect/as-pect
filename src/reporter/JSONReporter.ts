import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { WriteStream, createWriteStream } from "fs";
import { basename, extname, dirname, join } from "path";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";

/**
 * This class reports all relevant test statistics to a JSON file located at
 * `{testLocation}.spec.json`.
 */
export default class JSONReporter extends TestReporter {
  constructor(_options?: any) { super(); }

  protected file: WriteStream | null = null;

  private first: boolean = true;
  public onStart(suite: TestContext): void {
    const extension = extname(suite.fileName);
    const dir = dirname(suite.fileName);
    const base = basename(suite.fileName, extension);
    const outPath = join(
      process.cwd(),
      dir,
      base + ".json",
    );
    this.file = createWriteStream(outPath, "utf8");
    this.file.write("[");
    this.first = true;
  }

  public onGroupStart(): void {}
  public onGroupFinish(): void {}
  public onFinish(): void {
    this.file!.end("\n]");
  }

  public onTestStart() {}

  public onTestFinish(group: TestGroup, result: TestResult) {
    this.file!.write(
      (this.first ? "\n" : ",\n") + JSON.stringify({
        group: group.name,
        name: result.name,
        ran: result.ran,
        pass: result.pass,
        runtime: result.runTime,
        message: result.message,
        actual: result.actual ? result.actual.message : null,
        expected: result.expected ? result.expected.message : null,
        average: result.average,
        median: result.median,
        max: result.max,
        min: result.min,
        stdDev: result.stdDev,
        variance: result.variance,
      })
    );
    this.first = false;
  }

  public onTodo(group: TestGroup, desc: string) {
    this.file!.write((this.first ? "\n" : ",\n") + JSON.stringify({
        group: group.name,
        name: "TODO:" + desc,
        ran: false,
        pass: null,
        runtime: 0,
        message: "",
        actual: null,
        expected: null,
        average: 0,
        median: 0,
        max: 0,
        min: 0,
        stdDev: 0,
        variance: 0,
      })
    );
    this.first = false;
  }
}
