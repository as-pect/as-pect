import { Snapshot, SnapshotLifecycle } from "@as-pect/snapshots";
import { TestContext, TestNode, TestNodeType } from "../src/index.js";
import { createGroupReport, createSuiteReport, createTestReport } from "../src/reporter/SuiteReportFactory.js";

describe("SuiteReportFactory", () => {
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

  it("creates group and test report facts without a ReportingLifecycle", () => {
    const rootNode = new TestNode();
    rootNode.type = TestNodeType.Group;

    const group = new TestNode();
    group.type = TestNodeType.Group;
    group.name = "math";
    group.pass = true;
    group.start = 20;
    group.end = 35;
    group.parent = rootNode;
    rootNode.children.push(group);

    const test = new TestNode();
    test.type = TestNodeType.Test;
    test.name = "adds";
    test.parent = group;
    test.ran = true;
    test.pass = true;
    test.start = 25;
    test.end = 30;
    test.message = "ok";
    test.rtraceStart = 2;
    test.rtraceEnd = 5;
    group.children.push(test);
    group.todos.push("subtracts");

    expect(createGroupReport(group)).toEqual({
      type: "group",
      name: "math",
      pass: true,
      runtime: 15,
      hasChildren: true,
      logs: [],
      todos: ["subtracts"],
      tests: [
        {
          type: "test",
          groupName: "math",
          name: "adds",
          ran: true,
          negated: false,
          pass: true,
          runtime: 5,
          message: "ok",
          stackTrace: null,
          rtraceDelta: 3,
          logs: [],
          actual: null,
          expected: null,
          actualValue: null,
          expectedValue: null,
        },
      ],
    });
    expect(createTestReport(group, test)).toMatchObject({
      type: "test",
      groupName: "math",
      name: "adds",
      runtime: 5,
      rtraceDelta: 3,
    });
  });

  it("creates suite report snapshot stats and change lines without reporter publication", () => {
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

    const report = createSuiteReport(createSuite(rootNode, snapshotLifecycle));

    expect(report.fileName).toBe("assembly/example.spec.ts");
    expect(report.snapshotStats).toEqual({
      total: 4,
      added: 1,
      removed: 1,
      different: 1,
    });
    expect(report.snapshotChanges.map((change) => change.name)).toEqual(["added", "changed", "removed"]);
    expect(report.snapshotChanges.find((change) => change.name === "changed")!.lines).toEqual([
      { type: "removed", value: "expected" },
      { type: "added", value: "actual" },
    ]);
  });
});
