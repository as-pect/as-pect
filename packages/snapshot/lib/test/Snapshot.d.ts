import { SnapshotData } from "../parser";
import { SnapshotDiff } from "./SnapshotDiff";
/** Stringify format function callback type. */
export declare type SnapshotFormatCallback = (input: string) => string;
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
export declare class Snapshot {
    /** The snapshot data in object format. */
    data: SnapshotData | null;
    stringified: string | null;
    /**
     * Create a Snapshot from an ISnapshotData.
     *
     * @param {SnapshotData} data - The snapshot data.
     */
    static fromData(data: SnapshotData): Snapshot;
    /**
     * Create a Snapshot from string content.
     *
     * @param {string} data - The stringified snapshot data.
     */
    static fromString(data: string): Snapshot;
    /**
     * Diff the current state of the left and the right snapshot.
     *
     * @param {Partial<ISnapshotStringifyOptions>} stringifyParameters - The stringify parameters.
     */
    diff(other: Snapshot, stringifyParameters?: Partial<ISnapshotStringifyOptions>): SnapshotDiff[];
}
//# sourceMappingURL=Snapshot.d.ts.map