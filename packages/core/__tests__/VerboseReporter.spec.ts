import { VerboseReporter, TestContext, TestGroup, TestResult } from "../src";
import { createReporterModule } from "./setup/createReporterModule";

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
    expect(writer.result).toMatchSnapshot("start");
    writer.reset();
  }
  onGroupStart(group: TestGroup): void {
    writer.reset();
    super.onGroupStart(group);
    expect(writer.result).toMatchSnapshot("start " + group.name);
    writer.reset();
  }
  onGroupEnd(group: TestGroup): void {
    writer.reset();
    super.onGroupFinish(group);
    expect(writer.result).toMatchSnapshot("end " + group.name);
    writer.reset();
  }
  onTestStart(group: TestGroup, test: TestResult): void {
    writer.reset();
    super.onTestStart(group, test);
    expect(writer.result).toMatchSnapshot(`start ${group.name} ${test.name}`);
    writer.reset();
  }
  onTestFinish(group: TestGroup, test: TestResult): void {
    writer.reset();
    super.onTestFinish(group, test);
    expect(writer.result).toMatchSnapshot(`end ${group.name} ${test.name}`);
    writer.reset();
  }

  onTodo(group: TestGroup, todo: string): void {
    writer.reset();
    super.onTodo(group, todo);
    expect(writer.result).toMatchSnapshot(`todo ${group.name}`);
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

test("todos", () => {

});
