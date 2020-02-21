import { ISnapshotData, parseSnapshot } from "../parser";
import { unparse } from "./unparse";
import { diffLines } from "diff";
import chalk from "chalk";
import { SnapshotDiff, SnapshotDiffType } from "./SnapshotDiff";

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

export class Snapshot {
  /** The snapshot data in object format. */
  data: ISnapshotData | null = null;
  //** The stringified data in string format. */
  stringified: string | null = null;

  /**
   * Create a Snapshot from an ISnapshotData.
   *
   * @param {ISnapshotData} data - The snapshot data.
   */
  public static fromData(data: ISnapshotData): Snapshot {
    const result = new Snapshot();
    result.stringified = unparse(data);
    result.data = data;
    return result;
  }

  /**
   * Create a Snapshot from string content.
   *
   * @param {string} data - The stringified snapshot data.
   */
  public static fromString(data: string): Snapshot {
    /* istanbul ignore next */
    if (typeof data !== "string")
      /* istanbul ignore next */
      throw new Error(
        "Cannot create snapshot from string when data is not a string.",
      );
    const result = new Snapshot();
    result.stringified = data;
    result.data = parseSnapshot(data);
    return result;
  }

  /**
   * Diff the current state of the left and the right snapshot.
   *
   * @param {Partial<ISnapshotStringifyOptions>} stringifyParameters - The stringify parameters.
   */
  public diff(
    other: Snapshot,
    /* istanbul ignore next */
    stringifyParameters: Partial<ISnapshotStringifyOptions> = {},
  ): SnapshotDiff[] {
    /* istanbul ignore next */
    if (!this.data || !other.data)
      /* istanbul ignore next */
      throw new Error("Cannot evaluate diff on uninitialized snapshot data");
    const effectiveStringifyParameters = Object.assign(
      {
        addedFormat: chalk.green,
        removedFormat: chalk.red,
        defaultFormat: chalk.gray,
        indent: 0,
      },
      stringifyParameters,
    );

    let output: SnapshotDiff[] = [];
    const leftData = this.data;
    const rightData = other.data;

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
            diffObject.diff = stringifyChanges(
              snapshot,
              rightSnapshot,
              effectiveStringifyParameters,
            );
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
function stringifyChanges(
  left: string,
  right: string,
  props: ISnapshotStringifyOptions,
): string {
  const changes = diffLines(left, right);
  let output = "";
  for (const change of changes) {
    if (change.added) {
      output +=
        " ".repeat(props.indent) + props.addedFormat("+ " + change.value) + "\n";
    } else if (change.removed) {
      output +=
        " ".repeat(props.indent) + props.removedFormat("- " + change.value) + "\n";
    } else {
      output +=
        " ".repeat(props.indent) + props.defaultFormat("  " + change.value) + "\n";
    }
  }
  return output;
}
