export const enum SnapshotDiffType {
  None,
  Added,
  Removed,
  Different,
}

/** Represents a snapshot diff. Simple data class. */
export class SnapshotDiff {
  /** The snapshot comparison type. */
  type: SnapshotDiffType = SnapshotDiffType.None;
  /** The snapshot diff itself. */
  diff: string | null = null;
  /** The left side of the change comparison. */
  left: string | null = null;
  /** The identified group name. */
  groupName: string | null = null;
  /** The identified test name. */
  testName: string | null = null;
  /** The identified snapshot name. */
  snapshotName: string | null = null;
  /** The right side of the change comparison. */
  right: string | null = null;
}
