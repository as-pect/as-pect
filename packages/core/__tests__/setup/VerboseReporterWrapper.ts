import { VerboseReporter, TestNode, TestContext } from "../../src/index.js";
import stripAnsi from "strip-ansi";
import { removeStackTraces } from "./removeStackTraces.js";

export class VerboseReporterWrapper extends VerboseReporter {
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

    // set some reasonable defaults
    this.stringifyProperties.maxPropertyCount = 30;
    this.stringifyProperties.maxLineLength = 80;
  }
  onGroupStart(group: TestNode): void {
    this.writer.reset();
    removeStackTraces(group);
    super.onGroupStart(group);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onGroupStart ${group.name}`, result);
    this.writer.reset();
  }
  onGroupFinish(group: TestNode): void {
    this.writer.reset();
    removeStackTraces(group);
    // @ts-ignore
    super.onGroupFinish(group);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onGroupEnd ${group.name}`, result);
    this.writer.reset();
  }
  onTestStart(group: TestNode, testResult: TestNode): void {
    this.writer.reset();
    removeStackTraces(group);
    removeStackTraces(testResult);
    super.onTestStart(group, testResult);
    const result = stripAnsi(this.writer.result);
    this.addSnapshot(`onTestStart ${group.name} ${testResult.name}`, result);
    this.writer.reset();
  }
  onTestFinish(group: TestNode, testResult: TestNode): void {
    this.writer.reset();
    removeStackTraces(group);
    removeStackTraces(testResult);
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
    ctx.errors.forEach((e) => {
      e.stackTrace = e.stackTrace ? "Has Stack Trace" : "No Stack Trace";
    });
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
