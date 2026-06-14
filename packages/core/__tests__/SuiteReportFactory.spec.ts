import { Snapshot, SnapshotLifecycle } from "@as-pect/snapshots";
import { TestContext, TestNode, TestNodeType } from "../src/index.js";
import { createGroupReport, createSuiteReport, createTestReport } from "../src/reporter/SuiteReportFactory.js";
import { reflectedInteger } from "./setup/SuiteReportFixtures.js";

describe("SuiteReportFactory", () => {
  function createSuite(
    rootNode: TestNode,
    snapshotLifecycle: SnapshotLifecycle,
    overrides: Partial<TestContext> = {},
  ): TestContext {
    return {
      fileName: "assembly/example.spec.ts",
      pass: false,
      testCount: 3,
      testPassCount: 1,
      groupCount: 2,
      groupPassCount: 1,
      todoCount: 0,
      rootNode,
      warnings: [],
      errors: [],
      snapshotLifecycle,
      snapshotDiff: snapshotLifecycle.diff,
      ...overrides,
    } as unknown as TestContext;
  }

  function createEmptySnapshotLifecycle(): SnapshotLifecycle {
    return new SnapshotLifecycle(Snapshot.from(new Map()), Snapshot.from(new Map()));
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

  it("uses expected-value negation for structured expected strings", () => {
    const group = new TestNode();
    group.name = "math";
    group.type = TestNodeType.Group;

    const test = new TestNode();
    test.name = "rejects equal values";
    test.type = TestNodeType.Test;
    test.parent = group;
    test.expected = reflectedInteger(2, true);

    expect(createTestReport(group, test).expected).toBe("Not 2");
  });

  it("does not use throw-style test negation for structured expected strings", () => {
    const group = new TestNode();
    group.name = "math";
    group.type = TestNodeType.Group;

    const test = new TestNode();
    test.name = "throws";
    test.type = TestNodeType.Test;
    test.parent = group;
    test.negated = true;
    test.expected = reflectedInteger(2, false);

    expect(createTestReport(group, test).expected).toBe("2");
  });

  it("reports todo-only groups as results", () => {
    const rootNode = new TestNode();
    rootNode.type = TestNodeType.Group;

    const group = new TestNode();
    group.type = TestNodeType.Group;
    group.name = "later";
    group.pass = true;
    group.parent = rootNode;
    group.addTodo("write coverage");
    rootNode.addChild(group);

    const report = createSuiteReport(
      createSuite(rootNode, createEmptySnapshotLifecycle(), {
        testCount: 0,
        testPassCount: 0,
        groupCount: 2,
        groupPassCount: 2,
        todoCount: 1,
      }),
    );

    expect(report.todoCount).toBe(1);
    expect(report.groups).toEqual([
      {
        type: "group",
        name: "later",
        pass: true,
        runtime: 0,
        hasChildren: true,
        logs: [],
        todos: ["write coverage"],
        tests: [],
      },
    ]);
    expect(report.results).toEqual([{ type: "todo", groupName: "later", description: "write coverage" }]);
  });

  it("includes root-level todos in suite report facts", () => {
    const rootNode = new TestNode();
    rootNode.type = TestNodeType.Group;
    rootNode.addTodo("write a root-level case");

    const report = createSuiteReport(
      createSuite(rootNode, createEmptySnapshotLifecycle(), {
        testCount: 0,
        testPassCount: 0,
        groupCount: 1,
        groupPassCount: 1,
        todoCount: 1,
      }),
    );

    expect(report.todoCount).toBe(1);
    expect(report.results).toEqual([{ type: "todo", groupName: "", description: "write a root-level case" }]);
  });

  it("creates suite report snapshot stats and change lines without reporter publication", () => {
    const actual = Snapshot.from(
      new Map([
        ["same", "1"],
        ["added", "new snapshot"],
        ["changed", "same line\nnew line\n"],
      ]),
    );
    const expected = Snapshot.from(
      new Map([
        ["same", "1"],
        ["changed", "same line\nold line\n"],
        ["removed", "old snapshot"],
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
    expect(report.snapshotChanges.find((change) => change.name === "added")!.lines).toEqual([
      { type: "added", value: "new snapshot" },
    ]);
    expect(report.snapshotChanges.find((change) => change.name === "changed")!.lines).toEqual([
      { type: "unchanged", value: "same line" },
      { type: "removed", value: "old line" },
      { type: "added", value: "new line" },
    ]);
    expect(report.snapshotChanges.find((change) => change.name === "removed")!.lines).toEqual([
      { type: "removed", value: "old snapshot" },
    ]);
    expect(report.snapshotChanges.find((change) => change.name === "added")!.result).toBe(
      snapshotLifecycle.diff.results.get("added"),
    );
  });

  it("uses SnapshotLifecycle stats when they are available", () => {
    const snapshotLifecycle = new SnapshotLifecycle(
      Snapshot.from(new Map([["added by diff", "new snapshot"]])),
      Snapshot.from(new Map()),
    );
    (snapshotLifecycle as unknown as { stats: SnapshotLifecycle["stats"] }).stats = {
      totalSnapshots: 7,
      addedSnapshots: 2,
      removedSnapshots: 3,
      changedSnapshots: 4,
      passedSnapshots: 0,
    };
    const rootNode = new TestNode();

    const report = createSuiteReport(createSuite(rootNode, snapshotLifecycle));

    expect(report.snapshotStats).toEqual({
      total: 7,
      added: 2,
      removed: 3,
      different: 4,
    });
  });
});
