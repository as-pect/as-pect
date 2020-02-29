import { TestContext, SummaryReporter } from "../src";
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
  constructor() {
    super();
    this.stdout = writer;
  }
  onFinish(ctx: TestContext): void {
    ctx.rootNode.start = 0;
    ctx.rootNode.end = 0;
    ctx.rootNode.visit(node => {
      node.start = 0;
      node.end = 0;
    });
    writer.reset();
    super.onFinish(ctx);
    const result = strip(writer.result);
    test("onFinish", () => expect(result).toMatchSnapshot(`finish`));
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
