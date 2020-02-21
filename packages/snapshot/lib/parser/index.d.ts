import { Parser } from "nearley";
/**
 * Signifies a parsed snapshot.
 */
export interface ISnapshotData {
    /** The testing group that the snapshots belong to. */
    [groupName: string]: {
        /** The test name that the snapshots belong to. */
        [testName: string]: {
            /** The snapshot itself. */
            [snapshotName: string]: string;
        };
    };
}
export declare function createSnapshotParser(): Parser;
export declare function parseSnapshot(snapshot: string): ISnapshotData;
//# sourceMappingURL=index.d.ts.map