import { Snapshot } from "./Snapshot.js";
import { SnapshotDiff } from "./SnapshotDiff.js";
import { SnapshotDiffResultType } from "./SnapshotDiffResult.js";

export interface SnapshotLifecycleStats {
  /**
   * The number of unique snapshot keys seen across the actual test output and
   * the expected snapshot file. Added, removed, changed, and unchanged
   * snapshots each contribute one key to this total.
   */
  totalSnapshots: number;
  /** Snapshot keys that were produced by the test run but missing from the expected snapshot file. */
  addedSnapshots: number;
  /** Snapshot keys that exist in the expected snapshot file but were not produced by the test run. */
  removedSnapshots: number;
  /** Snapshot keys that exist on both sides with different values. */
  changedSnapshots: number;
  /** Snapshot keys that either matched exactly or can be added by the update plan. */
  passedSnapshots: number;
}

export interface SnapshotUpdate {
  name: string;
  value: string;
}

export class SnapshotUpdatePlan {
  public constructor(public readonly updates: SnapshotUpdate[]) {}

  public get shouldWrite(): boolean {
    return this.updates.length > 0;
  }

  public get addedSnapshots(): number {
    return this.updates.length;
  }

  public applyTo(snapshot: Snapshot): Snapshot {
    for (const update of this.updates) {
      snapshot.set(update.name, update.value);
    }
    return snapshot;
  }
}

export class SnapshotLifecycle {
  public readonly diff: SnapshotDiff;
  public readonly pass: boolean;
  public readonly stats: SnapshotLifecycleStats;
  public readonly updatePlan: SnapshotUpdatePlan;

  public constructor(
    public readonly actual: Snapshot,
    public readonly expected: Snapshot,
  ) {
    this.diff = actual.diff(expected);
    this.pass = SnapshotLifecycle.calculatePass(this.diff);
    this.stats = SnapshotLifecycle.calculateStats(this.diff);
    this.updatePlan = SnapshotLifecycle.createUpdatePlan(this.diff);
  }

  private static calculatePass(diff: SnapshotDiff): boolean {
    for (const result of diff.results.values()) {
      if (result.type !== SnapshotDiffResultType.Added && result.type !== SnapshotDiffResultType.NoChange) {
        return false;
      }
    }
    return true;
  }

  private static calculateStats(diff: SnapshotDiff): SnapshotLifecycleStats {
    const stats: SnapshotLifecycleStats = {
      totalSnapshots: diff.results.size,
      addedSnapshots: 0,
      removedSnapshots: 0,
      changedSnapshots: 0,
      passedSnapshots: 0,
    };

    for (const result of diff.results.values()) {
      if (result.type === SnapshotDiffResultType.Added) {
        stats.addedSnapshots += 1;
        stats.passedSnapshots += 1;
      } else if (result.type === SnapshotDiffResultType.Removed) {
        stats.removedSnapshots += 1;
      } else if (result.type === SnapshotDiffResultType.Different) {
        stats.changedSnapshots += 1;
      } else if (result.type === SnapshotDiffResultType.NoChange) {
        stats.passedSnapshots += 1;
      }
    }

    return stats;
  }

  private static createUpdatePlan(diff: SnapshotDiff): SnapshotUpdatePlan {
    const updates: SnapshotUpdate[] = [];
    for (const [name, result] of diff.results) {
      if (result.type === SnapshotDiffResultType.Added && result.left !== null) {
        updates.push({ name, value: result.left });
      }
    }
    return new SnapshotUpdatePlan(updates);
  }
}
