import { CombinationReporter, IReporter, IWritable, TestContext, TestNode } from "../src/index.js";

class RecordingReporter implements IReporter {
  public stdout: IWritable | null = null;
  public stderr: IWritable | null = null;
  public entries: string[] = [];

  public onEnter(_ctx: TestContext, _node: TestNode): void {
    this.entries.push("enter");
  }

  public onExit(_ctx: TestContext, _node: TestNode): void {
    this.entries.push("exit");
  }

  public onFinish(_ctx: TestContext): void {
    this.entries.push("finish");
  }
}

describe("CombinationReporter", () => {
  it("should propagate stdout and stderr writers to every reporter", () => {
    const first = new RecordingReporter();
    const second = new RecordingReporter();
    const stdout = { write(_value: string): void {} };
    const stderr = { write(_value: string): void {} };
    const reporter = new CombinationReporter([first, second]);

    reporter.stdout = stdout;
    reporter.stderr = stderr;

    expect(first.stdout).toBe(stdout);
    expect(second.stdout).toBe(stdout);
    expect(first.stderr).toBe(stderr);
    expect(second.stderr).toBe(stderr);
  });

  it("should publish lifecycle events to every reporter in order", () => {
    const first = new RecordingReporter();
    const second = new RecordingReporter();
    const reporter = new CombinationReporter([first, second]);
    const ctx = {} as TestContext;
    const node = {} as TestNode;

    reporter.onEnter(ctx, node);
    reporter.onExit(ctx, node);
    reporter.onFinish(ctx);

    expect(first.entries).toEqual(["enter", "exit", "finish"]);
    expect(second.entries).toEqual(["enter", "exit", "finish"]);
  });
});
