import { Snapshot } from "./Snapshot";
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
/** Represents a snapshot comparison. */
export declare class SnapshotComparison {
    left: Snapshot;
    right: Snapshot;
    constructor(left: Snapshot, right: Snapshot);
    /**
     * Diff the current state of the left and the right snapshot.
     *
     * @param {Partial<ISnapshotStringifyOptions>} stringifyParameters - The stringify parameters.
     */
    diff(stringifyParameters?: Partial<ISnapshotStringifyOptions>): SnapshotDiff[];
}
//# sourceMappingURL=SnapshotComparison.d.ts.map