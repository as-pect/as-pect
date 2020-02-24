import { TestContext, TestGroup, TestResult, SummaryReporter } from "../src";
import { createReporterModule } from "./setup/createReporterModule";
import strip from "strip-ansi";

const writer = {
  result: "",
  write(input: string): void {
    writer.result += input;
  },
  reset() {
    writer.result = "";
  },
};

class ReporterWrapper extends SummaryReporter {
  // @ts-ignore
  onStart(ctx: TestContext) {
    ctx.stdout = writer;
    writer.reset();
    super.onStart();
    const result = strip(writer.result);
    test("onStart", () => expect(result).toMatchSnapshot("start"));
    writer.reset();
  }
  // @ts-ignore
  onGroupStart(group: TestGroup): void {
    writer.reset();
    super.onGroupStart();
    const result = strip(writer.result);
    test("onGroupStart", () => expect(result).toMatchSnapshot(group.name));
    writer.reset();
  }
  // @ts-ignore
  onGroupEnd(group: TestGroup): void {
    writer.reset();
    super.onGroupFinish();
    const result = strip(writer.result);
    test("onGroupEnd", () => expect(result).toMatchSnapshot(group.name));
    writer.reset();
  }
  // @ts-ignore
  onTestStart(group: TestGroup, testResult: TestResult): void {
    writer.reset();
    super.onTestStart();
    const result = strip(writer.result);
    test("onTestStart", () =>
      expect(result).toMatchSnapshot(`${group.name} ${testResult.name}`));
    writer.reset();
  }
  // @ts-ignore
  onTestFinish(group: TestGroup, testResult: TestResult): void {
    writer.reset();
    super.onTestFinish();
    const result = strip(writer.result);
    test("onTestFinish", () =>
      expect(result).toMatchSnapshot(`${group.name} ${testResult.name}`));
    writer.reset();
  }
  onFinish(ctx: TestContext): void {
    writer.reset();
    ctx.time = 0;
    ctx.startupTime = 0;
    super.onFinish(ctx);
    const result = strip(writer.result);
    test("onFinish", () => expect(result).toMatchSnapshot(`finish`));
    writer.reset();
  }
  // @ts-ignore
  onTodo(group: TestGroup, todo: string): void {
    writer.reset();
    super.onTodo();
    const result = strip(writer.result);
    test("todo", () => expect(result).toMatchSnapshot(`${group.name}`));
    writer.reset();
  }
}

let start = new Promise<void>((resolve, reject) => {
  createReporterModule(
    "./assembly/jest-reporter.ts",
    {},
    (err, _result) => {
      if (err) {
        console.log(err);
        reject(err);
      } else {
        resolve();
      }
    },
    new ReporterWrapper(),
  );
})
  .then(
    () =>
      new Promise<void>((resolve, reject) => {
        createReporterModule(
          "./assembly/jest-reporter2.ts",
          {},
          (err, _result) => {
            if (err) {
              console.log(err);
              reject(err);
            } else {
              resolve();
            }
          },
          new ReporterWrapper(),
        );
      }),
  )
  .then(
    () =>
      new Promise<void>((resolve, reject) => {
        createReporterModule(
          "./assembly/jest-reporter3.ts",
          {},
          (err, _result) => {
            if (err) {
              console.log(err);
              reject(err);
            } else {
              resolve();
            }
          },
          new ReporterWrapper(),
        );
      }),
  );

beforeAll(() => start);
