import chalk from "chalk";
import { Snapshot } from "./Snapshot";
import { SnapshotDiff, SnapshotDiffType } from "./SnapshotDiff";
import diff from "diff";

/** Stringify format function callback type. */
export type SnapshotFormatCallback = (input: string) => string;

/** The stringify options. */
export interface ISnapshotStringifyOptions {
  /** How many spaces to indent. */
  indent: number;
  /** String format for added lines. */
  addedFormat: SnapshotFormatCallback;
  /** String format for removed lines. */
  removedFormat: SnapshotFormatCallback;
  /** String format for default lines. */
  defaultFormat: SnapshotFormatCallback;
}

/** Represents a snapshot comparison. */
export class SnapshotComparison {
  public constructor(
    public left: Snapshot,
    public right: Snapshot,
  ) {}

  /**
   * Diff the current state of the left and the right snapshot.
   *
   * @param {Partial<ISnapshotStringifyOptions>} stringifyParameters - The stringify parameters.
   */
  public diff(stringifyParameters: Partial<ISnapshotStringifyOptions> = {}): SnapshotDiff[] {
    if (!this.left.data || !this.right.data) throw new Error("Cannot evaluate diff on uninitialized left or right side");
    const effectiveStringifyParameters = Object.assign({
      addedFormat: chalk.green,
      removedFormat: chalk.red,
      defaultFormat: chalk.gray,
      indent: 0,
    }, stringifyParameters);

    let output: SnapshotDiff[] = [];
    const leftData = this.left.data;
    const rightData = this.right.data;

    // for each snapshot in the left side
    for (const [groupName, group] of Object.entries(leftData)) {
      for (const [testName, test] of Object.entries(group)) {
        for (const [snapshotName, snapshot] of Object.entries(test)) {
          const rightGroup = rightData[groupName];
          if (!rightGroup) {
            // the group doesn't exist, it was added
            const diff = new SnapshotDiff();
            diff.left = snapshot;
            diff.type = SnapshotDiffType.Added;
            diff.groupName = groupName;
            diff.testName = testName;
            diff.snapshotName = snapshotName;
            output.push(diff);
            continue;
          }

          const rightTest = rightGroup[testName];
          if (!rightTest) {
            // the test doesn't exist
            const diff = new SnapshotDiff();
            diff.left = snapshot;
            diff.type = SnapshotDiffType.Added;
            diff.groupName = groupName;
            diff.testName = testName;
            diff.snapshotName = snapshotName;
            output.push(diff);
            continue;
          }

          const rightSnapshot = rightTest[snapshotName];
          if (!rightSnapshot) {
            // the snapshot doesn't exist
            const diff = new SnapshotDiff();
            diff.left = snapshot;
            diff.type = SnapshotDiffType.Added;
            diff.groupName = groupName;
            diff.testName = testName;
            diff.snapshotName = snapshotName;
            output.push(diff);
            continue;
          }

          // the snapshot exists
          if (snapshot !== rightSnapshot) {
            // there is a difference
            const diffObject = new SnapshotDiff();
            diffObject.diff = stringifyChanges(snapshot, rightSnapshot, effectiveStringifyParameters);
            diffObject.groupName = groupName;
            diffObject.left = snapshot;
            diffObject.right = rightSnapshot;
            diffObject.snapshotName = snapshotName;
            diffObject.testName = testName;
            diffObject.type = SnapshotDiffType.Different;
            output.push(diffObject);
            continue;
          }
        }
      }
    }

    // for each snapshot in the right side
    for (const [groupName, group] of Object.entries(rightData)) {
      for (const [testName, test] of Object.entries(group)) {
        for (const [snapshotName, snapshot] of Object.entries(test)) {
          const leftGroup = leftData[groupName];
          if (!leftGroup) {
            // the group doesn't exist, it was removed
            const diff = new SnapshotDiff();
            diff.right = snapshot;
            diff.type = SnapshotDiffType.Removed;
            diff.groupName = groupName;
            diff.testName = testName;
            diff.snapshotName = snapshotName;
            output.push(diff);
            continue;
          }

          const leftTest = leftGroup[testName];
          if (!leftTest) {
            // the test doesn't exist
            const diff = new SnapshotDiff();
            diff.right = snapshot;
            diff.type = SnapshotDiffType.Removed;
            diff.groupName = groupName;
            diff.testName = testName;
            diff.snapshotName = snapshotName;
            output.push(diff);
            continue;
          }

          const leftSnapshot = leftTest[snapshotName];
          if (!leftSnapshot) {
            // the snapshot doesn't exist
            const diff = new SnapshotDiff();
            diff.right = snapshot;
            diff.type = SnapshotDiffType.Removed;
            diff.groupName = groupName;
            diff.testName = testName;
            diff.snapshotName = snapshotName;
            output.push(diff);
            continue;
          }
        }
      }
    }
    return output;
  }
}

/**
 * Stringify the changes between two string values.
 *
 * @param {string} left - The left side.
 * @param {string} right - The right side.
 * @param {ISnapshotStringifyOptions} props - The stringify options.
 */
function stringifyChanges(left: string, right: string, props: ISnapshotStringifyOptions): string {
  const changes = diff.diffLines(left, right);
  let output = "";
  for (const change of changes) {
    if (change.added) {
      output += " ".repeat(props.indent) +  props.addedFormat("+ " + change.value);
    } else if (change.removed) {
      output += " ".repeat(props.indent) +  props.removedFormat("- " + change.value);
    } else {
      output += " ".repeat(props.indent) +  props.defaultFormat("  " + change.value);
    }
  }
  return output;
}
