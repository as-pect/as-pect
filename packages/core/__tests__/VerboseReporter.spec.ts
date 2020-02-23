import { VerboseReporter, TestContext, TestGroup, TestResult } from "../src";
import { createReporterModule } from "./setup/createReporterModule";
import strip from "strip-ansi";

const writer = {
  result: "",
  write(input: string): void {
    writer.result += input;
  },
  reset() { writer.result = ""; }
};



class ReporterWrapper extends VerboseReporter {
  onStart(ctx: TestContext) {
    ctx.stdout = writer;
    writer.reset();
    super.onStart(ctx);
    const result = strip(writer.result);
    test("onStart", () => expect(result).toMatchSnapshot("start"));
    writer.reset();
  }
  onGroupStart(group: TestGroup): void {
    writer.reset();
    super.onGroupStart(group);
    const result = strip(writer.result);
    test("onGroupStart", () => expect(result).toMatchSnapshot(group.name));
    writer.reset();
  }
  onGroupEnd(group: TestGroup): void {
    writer.reset();
    super.onGroupFinish(group);
    const result = strip(writer.result);
    test("onGroupEnd", () => expect(result).toMatchSnapshot(group.name));
    writer.reset();
  }
  onTestStart(group: TestGroup, testResult: TestResult): void {
    writer.reset();
    super.onTestStart(group, testResult);
    const result = strip(writer.result);
    test("onTestStart", () => expect(result).toMatchSnapshot(`${group.name} ${testResult.name}`));
    writer.reset();
  }
  onTestFinish(group: TestGroup, testResult: TestResult): void {
    writer.reset();
    super.onTestFinish(group, testResult);
    const result = strip(writer.result);
    test("onTestFinish", () => expect(result).toMatchSnapshot(`${group.name} ${testResult.name}`));
    writer.reset();
  }

  onTodo(group: TestGroup, todo: string): void {
    writer.reset();
    super.onTodo(group, todo);
    const result = strip(writer.result);
    test("todo", () => expect(result).toMatchSnapshot(`${group.name}`));
    writer.reset();
  }
}

let start = new Promise<void>((resolve, reject) => {
  createReporterModule({}, (err, _result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      resolve();
    }
  }, new ReporterWrapper());
});

beforeAll(() => start);
