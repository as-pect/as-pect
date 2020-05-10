import { SummaryReporter, TestNode, TestContext } from "../../src";
import stripAnsi from "strip-ansi";

export class SummaryReporterWrapper extends SummaryReporter {
  public writer: any;
  public snapshots = new Map<string, string[]>();

  constructor() {
    super();
    this.writer = {
      result: "",
      write(input: string): void {
        this.result += input;
      },
      reset() {
        this.result = "";
      },
    };
    this.stdout = this.writer;
    this.stderr = this.writer;
  }
  onGroupStart(group: TestNode): void {
    this.writer.reset();
    super.onGroupStart(group);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onGroupStart ${group.name}`, result);
    this.writer.reset();
  }
  onGroupFinish(group: TestNode): void {
    this.writer.reset();
    super.onGroupFinish(group);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onGroupEnd ${group.name}`, result);
    this.writer.reset();
  }
  onTestStart(group: TestNode, testResult: TestNode): void {
    this.writer.reset();
    super.onTestStart(group, testResult);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onTestStart ${group.name} ${testResult.name}`, result);
    this.writer.reset();
  }
  onTestFinish(group: TestNode, testResult: TestNode): void {
    this.writer.reset();
    super.onTestFinish(group, testResult);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onTestFinish ${group.name} ${testResult.name}`, result);
    this.writer.reset();
  }
  onFinish(ctx: TestContext): void {
    this.writer.reset();
    ctx.rootNode.visit((e) => {
      e.start = 0;
      e.end = 0;
    });
    ctx.rootNode.start = 0;
    ctx.rootNode.end = 0;
    super.onFinish(ctx);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onFinish ${ctx.fileName}`, result);
    this.writer.reset();
  }

  private addSnapshot(name: string, result: string): void {
    if (!this.snapshots.has(name)) this.snapshots.set(name, []);
    const array = this.snapshots.get(name)!;
    array.push(result);
  }
}
