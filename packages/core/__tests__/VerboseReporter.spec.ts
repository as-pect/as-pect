import { VerboseReporter, TestContext, TestNode } from "../src";
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

class ReporterWrapper extends VerboseReporter {
  constructor() {
    super();
    this.stdout = writer;
    this.stderr = writer;
  }
  onGroupStart(group: TestNode): void {
    writer.reset();
    super.onGroupStart(group);
    const result = strip(writer.result);
    test("onGroupStart", () => expect(result).toMatchSnapshot(group.name));
    writer.reset();
  }
  onGroupEnd(group: TestNode): void {
    writer.reset();
    super.onGroupFinish(group);
    const result = strip(writer.result);
    test("onGroupEnd", () => expect(result).toMatchSnapshot(group.name));
    writer.reset();
  }
  onTestStart(group: TestNode, testResult: TestNode): void {
    writer.reset();
    super.onTestStart(group, testResult);
    const result = strip(writer.result);
    test("onTestStart", () =>
      expect(result).toMatchSnapshot(`${group.name} ${testResult.name}`));
    writer.reset();
  }
  onTestFinish(group: TestNode, testResult: TestNode): void {
    writer.reset();
    super.onTestFinish(group, testResult);
    const result = strip(writer.result);
    test("onTestFinish", () =>
      expect(result).toMatchSnapshot(`${group.name} ${testResult.name}`));
    writer.reset();
  }
  onFinish(ctx: TestContext): void {
    writer.reset();
    ctx.rootNode.visit(e => {
      e.start = 0;
      e.end = 0;
    });
    super.onFinish(ctx);
    const result = strip(writer.result);
    test("onFinish", () => expect(result).toMatchSnapshot(`finish`));
    writer.reset();
  }
  onTodo(group: TestNode, todo: string): void {
    writer.reset();
    super.onTodo(group, todo);
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
