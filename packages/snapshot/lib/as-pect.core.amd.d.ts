declare module "parser/grammar" {
    interface NearleyToken {
        value: any;
        [key: string]: any;
    }
    interface NearleyLexer {
        reset: (chunk: string, info: any) => void;
        next: () => NearleyToken | undefined;
        save: () => any;
        formatError: (token: NearleyToken) => string;
        has: (tokenType: string) => boolean;
    }
    interface NearleyRule {
        name: string;
        symbols: NearleySymbol[];
        postprocess?: (d: any[], loc?: number, reject?: {}) => any;
    }
    type NearleySymbol = string | {
        literal: any;
    } | {
        test: (token: any) => boolean;
    };
    interface Grammar {
        Lexer: NearleyLexer | undefined;
        ParserRules: NearleyRule[];
        ParserStart: string;
    }
    const grammar: Grammar;
    export default grammar;
}
declare module "parser/index" {
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
    export function createSnapshotParser(): Parser;
    export function parseSnapshot(snapshot: string): ISnapshotData;
}
declare module "index" {
    export * from "parser/index";
}
declare module "test/unparse" {
    import { ISnapshotData } from "parser/index";
    /**
     * Convert an ISnapshotData into a stringified representation.
     *
     * @param {ISnapshotData} data - The snapshot data to be converted.
     */
    export function unparse(data: ISnapshotData): string;
}
declare module "test/SnapshotDiff" {
    export const enum SnapshotDiffType {
        None = 0,
        Added = 1,
        Removed = 2,
        Different = 3
    }
    /** Represents a snapshot diff. Simple data class. */
    export class SnapshotDiff {
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
}
declare module "test/SnapshotComparison" {
    import { Snapshot } from "test/Snapshot";
    import { SnapshotDiff } from "test/SnapshotDiff";
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
}
declare module "test/Snapshot" {
    import { ISnapshotData } from "parser/index";
    import { SnapshotComparison } from "test/SnapshotComparison";
    export class Snapshot {
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
}
//# sourceMappingURL=as-pect.core.amd.d.ts.map