import { ISnapshotData, parseSnapshot } from "../parser";
import { unparse } from "./unparse";
import { SnapshotComparison } from "./SnapshotComparison";

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
  public static fromSnapshotData(data: ISnapshotData): Snapshot {
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
    if (typeof data !== "string")
      throw new Error(
        "Cannot create snapshot from string when data is not a string.",
      );
    const result = new Snapshot();
    result.stringified = data;
    result.data = parseSnapshot(data);
    return result;
  }

  /**
   * Compare two snapshots from each other.
   *
   * @param {Snapshot} other -
   */
  public compareTo(other: Snapshot): SnapshotComparison {
    if (!this.stringified || !other.stringified)
      throw new Error(
        "Cannot compare snapshots when Snapshot was not initialized.",
      );
    return new SnapshotComparison(this, other);
  }
}
