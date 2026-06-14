import { Snapshot, SnapshotLifecycle } from "@as-pect/snapshots";
import {
  EmptyReporter,
  IAspectExports,
  ReportingLifecycle,
  SummaryReporter,
  TestContext,
  TestNode,
  TestNodeType,
  VerboseReporter,
} from "../src/index.js";

describe("ReportingLifecycle", () => {
  function createSuite(rootNode: TestNode): TestContext {
    const snapshotLifecycle = new SnapshotLifecycle(new Snapshot(), new Snapshot());
    return {
      fileName: "assembly/example.spec.ts",
      pass: true,
      testCount: 1,
      testPassCount: 1,
      groupCount: 1,
      groupPassCount: 1,
      rootNode,
      warnings: [],
      errors: [],
      snapshotLifecycle,
      snapshotDiff: snapshotLifecycle.diff,
    } as unknown as TestContext;
  }

  it("should publish lifecycle events through the compatibility reporter seam", () => {
    const reporter = new EmptyReporter();
    const calls: string[] = [];
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
    group.children.push(test);
    reporter.onEnter = (_ctx, node) => calls.push(`enter:${node.name}`);
    reporter.onExit = (_ctx, node) => calls.push(`exit:${node.name}`);
    reporter.onFinish = (suite) => calls.push(`finish:${suite.fileName}`);
    const lifecycle = new ReportingLifecycle(createSuite(rootNode), reporter);

    lifecycle.enter(group);
    lifecycle.enter(test);
    lifecycle.exit(test);
    lifecycle.exit(group);
    lifecycle.finish();

    expect(calls).toEqual(["enter:math", "enter:adds", "exit:adds", "exit:math", "finish:assembly/example.spec.ts"]);
  });

  it("should publish start events before group collection and test execution", () => {
    const events: string[] = [];
    const reporter = new EmptyReporter();
    const ctx = new TestContext({
      reporter,
      fileName: "assembly/generated.spec.ts",
    });
    const strings = new Map<number, string>([
      [1, "math"],
      [2, "adds"],
    ]);
    const exports = {
      memory: new WebAssembly.Memory({ initial: 1 }),
      _start(): void {
        events.push("collect:root");
        (ctx as unknown as { reportGroupTypeNode(description: number, runner: number): void }).reportGroupTypeNode(
          1,
          10,
        );
      },
      __call(pointer: number): void {
        if (pointer === 10) {
          events.push("collect:group:math");
          (ctx as unknown as { reportTestTypeNode(description: number, runner: number): void }).reportTestTypeNode(
            2,
            20,
          );
          return;
        }

        if (pointer === 20) {
          events.push("execute:test:adds");
        }
      },
      __getString(pointer: number): string {
        return strings.get(pointer)!;
      },
    };
    reporter.onReportGroupStart = (event) => {
      if (event.group.name) {
        events.push(`report:group:start:${event.group.name}:children=${event.group.tests.length}`);
      }
    };
    reporter.onReportTestStart = (event) => events.push(`report:test:start:${event.test.name}:pass=${event.test.pass}`);
    reporter.onReportTestFinish = (event) =>
      events.push(`report:test:finish:${event.test.name}:pass=${event.test.pass}`);
    reporter.onReportGroupFinish = (event) => {
      if (event.group.name) {
        events.push(`report:group:finish:${event.group.name}:children=${event.group.tests.length}`);
      }
    };
    reporter.onReportFinish = (event) => events.push(`report:finish:${event.report.fileName}`);

    ctx.run({
      exports: exports as unknown as IAspectExports,
      instance: {} as WebAssembly.Instance,
    });

    expect(events).toEqual([
      "collect:root",
      "report:group:start:math:children=0",
      "collect:group:math",
      "report:test:start:adds:pass=false",
      "execute:test:adds",
      "report:test:finish:adds:pass=true",
      "report:group:finish:math:children=1",
      "report:finish:assembly/generated.spec.ts",
    ]);
  });

  it("should publish report facts through the reporting seam", () => {
    const reporter = new EmptyReporter();
    const calls: string[] = [];
    const rootNode = new TestNode();
    rootNode.type = TestNodeType.Group;
    rootNode.name = "root";
    const group = new TestNode();
    group.type = TestNodeType.Group;
    group.name = "math";
    group.parent = rootNode;
    rootNode.children.push(group);
    const test = new TestNode();
    test.type = TestNodeType.Test;
    test.name = "adds";
    test.parent = group;
    test.pass = true;
    group.children.push(test);
    reporter.onEnter = (_ctx, node) => calls.push(`legacy-enter:${node.name}`);
    reporter.onExit = (_ctx, node) => calls.push(`legacy-exit:${node.name}`);
    reporter.onFinish = (suite) => calls.push(`legacy-finish:${suite.fileName}`);
    const eventShapes: string[] = [];
    reporter.onReportGroupStart = (event) => {
      eventShapes.push(Object.keys(event).sort().join(","));
      calls.push(`group:start:${event.group.name}`);
    };
    reporter.onReportTestStart = (event) => {
      eventShapes.push(Object.keys(event).sort().join(","));
      calls.push(`test:start:${event.group.name}:${event.test.name}`);
    };
    reporter.onReportTestFinish = (event) => {
      eventShapes.push(Object.keys(event).sort().join(","));
      calls.push(`test:finish:${event.group.name}:${event.test.name}`);
    };
    reporter.onReportGroupFinish = (event) => {
      eventShapes.push(Object.keys(event).sort().join(","));
      calls.push(`group:finish:${event.group.name}`);
    };
    reporter.onReportFinish = (event) => {
      eventShapes.push(Object.keys(event).sort().join(","));
      calls.push(`finish:${event.report.fileName}`);
    };
    const lifecycle = new ReportingLifecycle(createSuite(rootNode), reporter);

    lifecycle.enter(group);
    lifecycle.enter(test);
    lifecycle.exit(test);
    lifecycle.exit(group);
    lifecycle.finish();

    expect(calls).toEqual([
      "group:start:math",
      "test:start:math:adds",
      "test:finish:math:adds",
      "group:finish:math",
      "finish:assembly/example.spec.ts",
    ]);
    expect(eventShapes).toEqual(["group", "group,test", "group,test", "group", "report"]);
  });

  it("should preserve VerboseReporter subclass compatibility overrides behind report callbacks", () => {
    class CustomVerboseReporter extends VerboseReporter {
      public entries: string[] = [];

      public onGroupStart(group: TestNode): void {
        this.entries.push(`group-start:${group.name}`);
      }

      public onGroupFinish(group: TestNode): void {
        this.entries.push(`group-finish:${group.name}`);
      }

      public onTestStart(group: TestNode, test: TestNode): void {
        this.entries.push(`test-start:${group.name}:${test.name}`);
      }

      public onTestFinish(group: TestNode, test: TestNode): void {
        this.entries.push(`test-finish:${group.name}:${test.name}`);
      }

      public onFinish(suite: TestContext): void {
        this.entries.push(`finish:${suite.fileName}`);
      }
    }

    const reporter = new CustomVerboseReporter();
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
    group.children.push(test);
    const lifecycle = new ReportingLifecycle(createSuite(rootNode), reporter);

    lifecycle.enter(group);
    lifecycle.enter(test);
    lifecycle.exit(test);
    lifecycle.exit(group);
    lifecycle.finish();

    expect(reporter.entries).toEqual([
      "group-start:math",
      "test-start:math:adds",
      "test-finish:math:adds",
      "group-finish:math",
      "finish:assembly/example.spec.ts",
    ]);
  });

  it("should preserve SummaryReporter onFinish subclass overrides behind report callbacks", () => {
    class CustomSummaryReporter extends SummaryReporter {
      public entries: string[] = [];

      public onFinish(suite: TestContext): void {
        this.entries.push(`finish:${suite.fileName}`);
      }
    }

    const reporter = new CustomSummaryReporter();
    const rootNode = new TestNode();
    rootNode.type = TestNodeType.Group;
    const lifecycle = new ReportingLifecycle(createSuite(rootNode), reporter);

    lifecycle.finish();

    expect(reporter.entries).toEqual(["finish:assembly/example.spec.ts"]);
  });
});
