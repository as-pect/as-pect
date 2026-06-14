import { CombinationReporter, IReporter, IWritable, TestContext, TestNode } from "../src/index.js";
import type { SuiteReport } from "../src/index.js";

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

  it("should wait for every reporter that implements the optional flush seam", async () => {
    const first = new RecordingReporter();
    const second = new RecordingReporter();
    const reporter = new CombinationReporter([first, second]);
    const calls: string[] = [];
    let releaseFirst!: () => void;
    let releaseSecond!: () => void;

    first.onFlush = async () => {
      calls.push("first:start");
      await new Promise<void>((resolve) => {
        releaseFirst = resolve;
      });
      calls.push("first:end");
    };
    second.onFlush = async () => {
      calls.push("second:start");
      await new Promise<void>((resolve) => {
        releaseSecond = resolve;
      });
      calls.push("second:end");
    };

    const flushed = reporter.onFlush();
    await Promise.resolve();

    expect(calls).toEqual(["first:start", "second:start"]);

    releaseFirst();
    await Promise.resolve();
    expect(calls).toEqual(["first:start", "second:start", "first:end"]);

    releaseSecond();
    await flushed;

    expect(calls).toEqual(["first:start", "second:start", "first:end", "second:end"]);
  });

  it("should combine reporters at the reporting seam and fall back to compatibility callbacks", () => {
    const reportingSeam = new RecordingReporter();
    const compatibilitySeam = new RecordingReporter();
    const reporter = new CombinationReporter([reportingSeam, compatibilitySeam]);
    const ctx = {} as TestContext;
    const group = { name: "math" } as TestNode;
    const test = { name: "adds" } as TestNode;
    const groupReport = {
      type: "group" as const,
      name: "math",
      pass: true,
      runtime: 0,
      hasChildren: true,
      logs: [],
      todos: [],
      tests: [],
    };
    const testReport = {
      type: "test" as const,
      groupName: "math",
      name: "adds",
      ran: true,
      negated: false,
      pass: true,
      runtime: 0,
      message: null,
      stackTrace: null,
      rtraceDelta: 0,
      logs: [],
      actual: null,
      expected: null,
      actualValue: null,
      expectedValue: null,
    };
    reportingSeam.onEnter = (_ctx, node) => reportingSeam.entries.push(`legacy-enter:${node.name}`);
    reportingSeam.onExit = (_ctx, node) => reportingSeam.entries.push(`legacy-exit:${node.name}`);
    reportingSeam.onFinish = (suite) => reportingSeam.entries.push(`legacy-finish:${suite.fileName}`);
    reportingSeam.onReportGroupStart = (event) => reportingSeam.entries.push(`report-group-start:${event.group.name}`);
    reportingSeam.onReportTestStart = (event) => reportingSeam.entries.push(`report-test-start:${event.test.name}`);
    reportingSeam.onReportTestFinish = (event) => reportingSeam.entries.push(`report-test-finish:${event.test.name}`);
    reportingSeam.onReportGroupFinish = (event) =>
      reportingSeam.entries.push(`report-group-finish:${event.group.name}`);
    reportingSeam.onReportFinish = (event) => reportingSeam.entries.push(`report-finish:${event.report.fileName}`);

    reporter.onReportGroupStart({
      context: ctx,
      node: group,
      group: groupReport,
    });
    reporter.onReportTestStart({
      context: ctx,
      groupNode: group,
      node: test,
      group: groupReport,
      test: testReport,
    });
    reporter.onReportTestFinish({
      context: ctx,
      groupNode: group,
      node: test,
      group: groupReport,
      test: testReport,
    });
    reporter.onReportGroupFinish({
      context: ctx,
      node: group,
      group: groupReport,
    });
    reporter.onReportFinish({
      context: ctx,
      report: { fileName: "assembly/example.spec.ts" } as SuiteReport,
    });

    expect(reportingSeam.entries).toEqual([
      "report-group-start:math",
      "report-test-start:adds",
      "report-test-finish:adds",
      "report-group-finish:math",
      "report-finish:assembly/example.spec.ts",
    ]);
    expect(compatibilitySeam.entries).toEqual(["enter", "enter", "exit", "exit", "finish"]);
  });
});
