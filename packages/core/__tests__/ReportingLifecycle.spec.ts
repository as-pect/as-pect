import { Snapshot, SnapshotLifecycle } from "@as-pect/snapshots";
import { EmptyReporter, ReportingLifecycle, SuiteReport, TestContext, TestNode, TestNodeType } from "../src/index.js";

describe("SuiteReport", () => {
  function createSuite(rootNode: TestNode, snapshotLifecycle: SnapshotLifecycle): TestContext {
    return {
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
  }

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
    const suite = createSuite(rootNode, snapshotLifecycle);

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

  it("should expose final test and todo report facts without making file reporters walk test nodes", () => {
    const snapshotLifecycle = new SnapshotLifecycle(new Snapshot(), new Snapshot());
    const rootNode = new TestNode();
    rootNode.type = TestNodeType.Group;

    const group = new TestNode();
    group.type = TestNodeType.Group;
    group.name = "math";
    group.parent = rootNode;
    rootNode.children.push(group);

    const test = new TestNode();
    test.type = TestNodeType.Test;
    test.name = "adds";
    test.parent = group;
    test.ran = true;
    test.pass = true;
    test.start = 10;
    test.end = 15;
    test.message = "ok";
    group.children.push(test);
    group.todos.push("subtracts");

    const report = SuiteReport.from(createSuite(rootNode, snapshotLifecycle));

    expect(report.results).toEqual([
      {
        type: "test",
        groupName: "math",
        name: "adds",
        ran: true,
        negated: false,
        pass: true,
        runtime: 5,
        message: "ok",
        actual: null,
        expected: null,
      },
      {
        type: "todo",
        groupName: "math",
        description: "subtracts",
      },
    ]);
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
