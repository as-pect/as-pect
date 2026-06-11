import { SnapshotDiffResultType } from "@as-pect/snapshots";
import type { SnapshotDiffResult } from "@as-pect/snapshots";
import type { IReporter } from "./IReporter.js";
import type { TestContext } from "../test/TestContext.js";
import type { TestNode } from "../test/TestNode.js";
import type { IWarning } from "../test/IWarning.js";

export interface SnapshotReportChange {
  name: string;
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
  actual: string | null;
  expected: string | null;
}

export interface SuiteTodoReport {
  type: "todo";
  groupName: string;
  description: string;
}

export type SuiteResultReport = SuiteTestReport | SuiteTodoReport;

export class SuiteReport {
  public readonly fileName: string;
  public readonly pass: boolean;
  public readonly testCount: number;
  public readonly testPassCount: number;
  public readonly groupCount: number;
  public readonly groupPassCount: number;
  public readonly rootNode: TestNode;
  public readonly warnings: IWarning[];
  public readonly errors: IWarning[];
  public readonly snapshotChanges: SnapshotReportChange[];
  public readonly snapshotStats: SnapshotReportStats;
  public readonly results: SuiteResultReport[];

  private constructor(suite: TestContext) {
    this.fileName = suite.fileName;
    this.pass = suite.pass;
    this.testCount = suite.testCount;
    this.testPassCount = suite.testPassCount;
    this.groupCount = suite.groupCount;
    this.groupPassCount = suite.groupPassCount;
    this.rootNode = suite.rootNode;
    this.warnings = suite.warnings;
    this.errors = suite.errors;
    this.results = SuiteReport.collectResults(suite.rootNode);

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
        this.snapshotChanges.push({ name, result });
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

  private static collectResults(rootNode: TestNode): SuiteResultReport[] {
    const results: SuiteResultReport[] = [];

    for (const group of rootNode.childGroups) {
      if (group.children.length === 0) continue;

      for (const test of group.groupTests) {
        results.push({
          type: "test",
          groupName: group.name,
          name: test.name,
          ran: test.ran,
          negated: test.negated,
          pass: test.pass,
          runtime: test.deltaT,
          message: test.message,
          actual: test.actual ? test.actual.stringify({ indent: 0 }) : null,
          expected: test.expected
            ? `${test.negated ? "Not " : ""}${test.expected.stringify({
                indent: 0,
              })}`
            : null,
        });
      }

      for (const description of group.groupTodos) {
        results.push({
          type: "todo",
          groupName: group.name,
          description,
        });
      }
    }

    return results;
  }
}

export class ReportingLifecycle {
  public constructor(
    private readonly suite: TestContext,
    private readonly reporter: IReporter,
  ) {}

  public enter(node: TestNode): void {
    this.reporter.onEnter(this.suite, node);
  }

  public exit(node: TestNode): void {
    this.reporter.onExit(this.suite, node);
  }

  public finish(): void {
    this.reporter.onFinish(this.suite);
  }
}
