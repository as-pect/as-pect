import { SnapshotDiffResultType } from "@as-pect/snapshots";
import type { SnapshotDiffResult } from "@as-pect/snapshots";
import type { TestContext } from "../test/TestContext.js";
import type { IWarning } from "../test/IWarning.js";
import type { TestNode } from "../test/TestNode.js";
import type { ReflectedValue } from "../util/ReflectedValue.js";

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

export function createSuiteReport(suite: TestContext): SuiteReport {
  return SuiteReport.from(suite);
}

export function createGroupReport(group: TestNode): SuiteGroupReport {
  return {
    type: "group",
    name: group.name,
    pass: group.pass,
    runtime: group.deltaT,
    hasChildren: group.children.length > 0 || group.groupTodos.length > 0,
    logs: group.logs,
    todos: group.groupTodos,
    tests: group.groupTests.map((test) => createTestReport(group, test)),
  };
}

export function createTestReport(group: TestNode, test: TestNode): SuiteTestReport {
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

function collectGroups(rootNode: TestNode): SuiteGroupReport[] {
  return rootNode.childGroups.map((group) => createGroupReport(group));
}

function collectTodoResults(groupName: string, todos: string[]): SuiteTodoReport[] {
  return todos.map((description) => ({
    type: "todo",
    groupName,
    description,
  }));
}

function collectResults(rootNode: TestNode, groups: SuiteGroupReport[]): SuiteResultReport[] {
  const results: SuiteResultReport[] = collectTodoResults(rootNode.name, rootNode.groupTodos);

  for (const group of groups) {
    for (const test of group.tests) {
      results.push(test);
    }

    results.push(...collectTodoResults(group.name, group.todos));
  }

  return results;
}

function collectSnapshotLines(result: SnapshotDiffResult): SnapshotReportLine[] {
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
    this.groups = collectGroups(suite.rootNode);
    this.todoCount = suite.todoCount;
    this.results = collectResults(suite.rootNode, this.groups);
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
          lines: collectSnapshotLines(result),
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
    return createGroupReport(group);
  }

  public static testFromNode(group: TestNode, test: TestNode): SuiteTestReport {
    return createTestReport(group, test);
  }
}
