import { ISnapshotData } from "../parser";
import { SnapshotComparison } from "./SnapshotComparison";
export declare class Snapshot {
    /** The snapshot data in object format. */
    data: ISnapshotData | null;
    stringified: string | null;
    /**
     * Create a Snapshot from an ISnapshotData.
     *
     * @param {ISnapshotData} data - The snapshot data.
     */
    static fromSnapshotData(data: ISnapshotData): Snapshot;
    /**
     * Create a Snapshot from string content.
     *
     * @param {string} data - The stringified snapshot data.
     */
    static fromString(data: string): Snapshot;
    /**
     * Compare two snapshots from each other.
     *
     * @param {Snapshot} other -
     */
    compareTo(other: Snapshot): SnapshotComparison;
}
//# sourceMappingURL=Snapshot.d.ts.map