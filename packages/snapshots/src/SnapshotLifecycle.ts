import { Snapshot } from "./Snapshot.js";
import { SnapshotDiff } from "./SnapshotDiff.js";
import { SnapshotDiffResultType } from "./SnapshotDiffResult.js";

export interface SnapshotLifecycleStats {
  totalSnapshots: number;
  addedSnapshots: number;
  removedSnapshots: number;
  changedSnapshots: number;
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
      snapshot.add(update.name, update.value);
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
    this.stats = SnapshotLifecycle.calculateStats(expected, this.diff);
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

  private static calculateStats(expected: Snapshot, diff: SnapshotDiff): SnapshotLifecycleStats {
    const stats: SnapshotLifecycleStats = {
      totalSnapshots: expected.values.size,
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
