import { SnapshotDiffResultType } from "@as-pect/snapshots";
import type { SnapshotDiffResult } from "@as-pect/snapshots";
import type { IReporter } from "./IReporter.js";
import { LegacyReporterAdapter } from "./LegacyReporterAdapter.js";
import type { TestContext } from "../test/TestContext.js";
import type { TestNode } from "../test/TestNode.js";
import type { IWarning } from "../test/IWarning.js";
import type { ReflectedValue } from "../util/ReflectedValue.js";
import { TestNodeType } from "../util/TestNodeType.js";

export type SnapshotReportLineType = "added" | "removed" | "unchanged";

export interface SnapshotReportLine {
  type: SnapshotReportLineType;
  value: string;
}

export interface SnapshotReportChange {
  name: string;
  lines: SnapshotReportLine[];
  /**
   * Compatibility-only access to the original snapshot diff result.
   * New reporters should render `lines` instead of interpreting diff internals.
   */
  result: SnapshotDiffResult;
}

export interface SnapshotReportStats {
  total: number;
  added: number;
  removed: number;
  different: number;
}

export interface SuiteTestReport {
  type: "test";
  groupName: string;
  name: string;
  ran: boolean;
  negated: boolean;
  pass: boolean;
  runtime: number;
  message: string | null;
  stackTrace: string | null;
  rtraceDelta: number;
  logs: ReflectedValue[];
  actual: string | null;
  expected: string | null;
  actualValue: ReflectedValue | null;
  expectedValue: ReflectedValue | null;
}

export interface SuiteTodoReport {
  type: "todo";
  groupName: string;
  description: string;
}

export type SuiteResultReport = SuiteTestReport | SuiteTodoReport;

export interface SuiteGroupReport {
  type: "group";
  name: string;
  pass: boolean;
  runtime: number;
  hasChildren: boolean;
  logs: ReflectedValue[];
  todos: string[];
  tests: SuiteTestReport[];
}

export interface GroupReportEvent {
  group: SuiteGroupReport;
}

export interface TestReportEvent {
  group: SuiteGroupReport;
  test: SuiteTestReport;
}

export interface SuiteReportEvent {
  report: SuiteReport;
}

export interface ReportAdapter {
  /**
   * Called before a user-authored group callback is invoked to collect that group's hooks,
   * tests, and nested groups. Start event report facts only include values known at that point;
   * use the matching finish event for complete group facts.
   */
  onReportGroupStart?(event: GroupReportEvent): void;
  onReportGroupFinish?(event: GroupReportEvent): void;
  /**
   * Called before the test callback is invoked. Start event report facts only include values known
   * before execution; use the matching finish event for pass/fail, runtime, log, and error facts.
   */
  onReportTestStart?(event: TestReportEvent): void;
  onReportTestFinish?(event: TestReportEvent): void;
  onReportFinish?(event: SuiteReportEvent): void;
}

export class SuiteReport {
  public readonly fileName: string;
  public readonly pass: boolean;
  public readonly testCount: number;
  public readonly testPassCount: number;
  public readonly groupCount: number;
  public readonly groupPassCount: number;
  public readonly rootRuntime: number;
  public readonly hasResults: boolean;
  public readonly todoCount: number;
  /** Compatibility-only access to the mutable test tree. */
  public readonly rootNode: TestNode;
  public readonly warnings: IWarning[];
  public readonly errors: IWarning[];
  public readonly snapshotChanges: SnapshotReportChange[];
  public readonly snapshotStats: SnapshotReportStats;
  public readonly groups: SuiteGroupReport[];
  public readonly results: SuiteResultReport[];

  private constructor(suite: TestContext) {
    this.fileName = suite.fileName;
    this.pass = suite.pass;
    this.testCount = suite.testCount;
    this.testPassCount = suite.testPassCount;
    this.groupCount = suite.groupCount;
    this.groupPassCount = suite.groupPassCount;
    this.rootRuntime = suite.rootNode.deltaT;
    this.rootNode = suite.rootNode;
    this.warnings = suite.warnings;
    this.errors = suite.errors;
    this.groups = SuiteReport.collectGroups(suite.rootNode);
    this.todoCount = this.groups.reduce((count, group) => count + group.todos.length, 0);
    this.results = SuiteReport.collectResults(this.groups);
    this.hasResults = suite.testCount > 0 || suite.todoCount > 0 || this.warnings.length > 0 || this.errors.length > 0;

    const snapshotDiff = suite.snapshotLifecycle ? suite.snapshotLifecycle.diff : suite.snapshotDiff!;
    const snapshotStats = suite.snapshotLifecycle ? suite.snapshotLifecycle.stats : null;
    this.snapshotChanges = [];

    let total = 0;
    let added = 0;
    let removed = 0;
    let different = 0;

    for (const [name, result] of snapshotDiff.results.entries()) {
      total += 1;
      if (result.type === SnapshotDiffResultType.Added) added += 1;
      if (result.type === SnapshotDiffResultType.Removed) removed += 1;
      if (result.type === SnapshotDiffResultType.Different) different += 1;
      if (result.type !== SnapshotDiffResultType.NoChange) {
        this.snapshotChanges.push({
          name,
          result,
          lines: SuiteReport.collectSnapshotLines(result),
        });
      }
    }

    this.snapshotStats = snapshotStats
      ? {
          total,
          added: snapshotStats.addedSnapshots,
          removed: snapshotStats.removedSnapshots,
          different: snapshotStats.changedSnapshots,
        }
      : { total, added, removed, different };
  }

  public static from(suite: TestContext): SuiteReport {
    return new SuiteReport(suite);
  }

  public static groupFromNode(group: TestNode): SuiteGroupReport {
    return {
      type: "group",
      name: group.name,
      pass: group.pass,
      runtime: group.deltaT,
      hasChildren: group.children.length > 0,
      logs: group.logs,
      todos: group.groupTodos,
      tests: group.groupTests.map((test) => SuiteReport.testFromNode(group, test)),
    };
  }

  public static testFromNode(group: TestNode, test: TestNode): SuiteTestReport {
    return {
      type: "test",
      groupName: group.name,
      name: test.name,
      ran: test.ran,
      negated: test.negated,
      pass: test.pass,
      runtime: test.deltaT,
      message: test.message,
      stackTrace: test.stackTrace,
      rtraceDelta: test.rtraceDelta,
      logs: test.logs,
      actual: test.actual ? test.actual.stringify({ indent: 0 }) : null,
      expected: test.expected
        ? `${test.negated ? "Not " : ""}${test.expected.stringify({
            indent: 0,
          })}`
        : null,
      actualValue: test.actual,
      expectedValue: test.expected,
    };
  }

  private static collectGroups(rootNode: TestNode): SuiteGroupReport[] {
    return rootNode.childGroups.map((group) => SuiteReport.groupFromNode(group));
  }

  private static collectResults(groups: SuiteGroupReport[]): SuiteResultReport[] {
    const results: SuiteResultReport[] = [];

    for (const group of groups) {
      if (!group.hasChildren) continue;

      for (const test of group.tests) {
        results.push(test);
      }

      for (const description of group.todos) {
        results.push({
          type: "todo",
          groupName: group.name,
          description,
        });
      }
    }

    return results;
  }

  private static collectSnapshotLines(result: SnapshotDiffResult): SnapshotReportLine[] {
    const lines: SnapshotReportLine[] = [];

    for (const change of result.changes) {
      for (const value of change.value.split("\n")) {
        if (!value.trim()) continue;
        lines.push({
          type: change.added ? "added" : change.removed ? "removed" : "unchanged",
          value,
        });
      }
    }

    return lines;
  }
}

export class ReportingLifecycle {
  private readonly reporterAdapter: LegacyReporterAdapter;

  public constructor(
    private readonly suite: TestContext,
    reporter: IReporter,
  ) {
    this.reporterAdapter = new LegacyReporterAdapter(reporter);
  }

  public enter(node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.reporterAdapter.onReportGroupStart(
        {
          group: SuiteReport.groupFromNode(node),
        },
        {
          context: this.suite,
          node,
        },
      );
      return;
    }

    if (node.type === TestNodeType.Test) {
      const groupNode = node.parent!;
      this.reporterAdapter.onReportTestStart(
        {
          group: SuiteReport.groupFromNode(groupNode),
          test: SuiteReport.testFromNode(groupNode, node),
        },
        {
          context: this.suite,
          groupNode,
          node,
        },
      );
    }
  }

  public exit(node: TestNode): void {
    if (node.type === TestNodeType.Group) {
      this.reporterAdapter.onReportGroupFinish(
        {
          group: SuiteReport.groupFromNode(node),
        },
        {
          context: this.suite,
          node,
        },
      );
      return;
    }

    if (node.type === TestNodeType.Test) {
      const groupNode = node.parent!;
      this.reporterAdapter.onReportTestFinish(
        {
          group: SuiteReport.groupFromNode(groupNode),
          test: SuiteReport.testFromNode(groupNode, node),
        },
        {
          context: this.suite,
          groupNode,
          node,
        },
      );
    }
  }

  public finish(): void {
    this.reporterAdapter.onReportFinish(
      {
        report: SuiteReport.from(this.suite),
      },
      {
        context: this.suite,
      },
    );
  }
}
