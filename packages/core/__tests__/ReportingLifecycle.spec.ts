import { Snapshot, SnapshotLifecycle } from "@as-pect/snapshots";
import { EmptyReporter, ReportingLifecycle, SuiteReport, TestContext, TestNode } from "../src/index.js";

describe("SuiteReport", () => {
  it("should expose final report facts without making reporters interpret snapshot diff internals", () => {
    const actual = Snapshot.from(
      new Map([
        ["same", "1"],
        ["added", "2"],
        ["changed", "actual"],
      ]),
    );
    const expected = Snapshot.from(
      new Map([
        ["same", "1"],
        ["changed", "expected"],
        ["removed", "3"],
      ]),
    );
    const snapshotLifecycle = new SnapshotLifecycle(actual, expected);
    const rootNode = new TestNode();
    const suite = {
      fileName: "assembly/example.spec.ts",
      pass: false,
      testCount: 3,
      testPassCount: 1,
      groupCount: 2,
      groupPassCount: 1,
      rootNode,
      warnings: [],
      errors: [],
      snapshotLifecycle,
      snapshotDiff: snapshotLifecycle.diff,
    } as unknown as TestContext;

    const report = SuiteReport.from(suite);

    expect(report.fileName).toBe("assembly/example.spec.ts");
    expect(report.snapshotStats).toEqual({
      total: 4,
      added: 1,
      removed: 1,
      different: 1,
    });
    expect(report.snapshotChanges.map((change) => change.name)).toEqual(["added", "changed", "removed"]);
  });
});

describe("ReportingLifecycle", () => {
  it("should publish lifecycle events through the compatibility reporter seam", () => {
    const reporter = new EmptyReporter();
    const calls: string[] = [];
    const suite = {} as TestContext;
    const node = new TestNode();
    reporter.onEnter = () => calls.push("enter");
    reporter.onExit = () => calls.push("exit");
    reporter.onFinish = () => calls.push("finish");
    const lifecycle = new ReportingLifecycle(suite, reporter);

    lifecycle.enter(node);
    lifecycle.exit(node);
    lifecycle.finish();

    expect(calls).toEqual(["enter", "exit", "finish"]);
  });
});
