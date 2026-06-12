import { Snapshot } from "./Snapshot.js";
import { SnapshotDiffResult, SnapshotDiffResultType } from "./SnapshotDiffResult.js";
import { diffLines } from "diff";
import type { Change } from "diff";

export class SnapshotDiff {
  results = new Map<string, SnapshotDiffResult>();

  constructor(
    public left: Snapshot,
    public right: Snapshot,
  ) {
    this.calculateDiff();
  }

  public calculateDiff(): void {
    const left = this.left.values;
    const right = this.right.values;

    // loop over the items on the left side
    for (const [key, value] of left.entries()) {
      // the snapshot exists, NoChange or Different
      if (right.has(key)) {
        const rightValue = right.get(key)!;
        const result = new SnapshotDiffResult();
        result.left = value;
        result.right = rightValue;

        if (value === rightValue) {
          result.type = SnapshotDiffResultType.NoChange;
          result.changes = createUnchangedLineChanges(value);
        } else {
          result.type = SnapshotDiffResultType.Different;
          result.changes = diffLines(rightValue, value);
        }

        this.results.set(key, result);
      } else {
        // it was added
        const result = new SnapshotDiffResult();
        result.left = value;
        result.right = null;
        result.type = SnapshotDiffResultType.Added;
        result.changes = diffLines("", value);
        this.results.set(key, result);
      }
    }

    // loop over the items on the right side
    for (const [key, value] of right.entries()) {
      if (!left.has(key)) {
        // it was removed
        const result = new SnapshotDiffResult();
        result.left = null;
        result.right = value;
        result.changes = diffLines(value, "");
        result.type = SnapshotDiffResultType.Removed;
        this.results.set(key, result);
      }
    }
  }
}

function createUnchangedLineChanges(value: string): Change[] {
  if (value === "") return [];

  return [
    {
      count: countLines(value),
      added: false,
      removed: false,
      value,
    },
  ];
}

function countLines(value: string): number {
  let lineCount = 1;

  for (let i = 0; i < value.length; i++) {
    if (value.charCodeAt(i) === 10) lineCount += 1;
  }

  return value.endsWith("\n") ? lineCount - 1 : lineCount;
}
