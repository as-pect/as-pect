export declare const enum SnapshotDiffType {
    None = 0,
    Added = 1,
    Removed = 2,
    Different = 3
}
/** Represents a snapshot diff. Simple data class. */
export declare class SnapshotDiff {
    /** The snapshot comparison type. */
    type: SnapshotDiffType;
    /** The snapshot diff itself. */
    diff: string | null;
    /** The left side of the change comparison. */
    left: string | null;
    /** The identified group name. */
    groupName: string | null;
    /** The identified test name. */
    testName: string | null;
    /** The identified snapshot name. */
    snapshotName: string | null;
    /** The right side of the change comparison. */
    right: string | null;
}
//# sourceMappingURL=SnapshotDiff.d.ts.map