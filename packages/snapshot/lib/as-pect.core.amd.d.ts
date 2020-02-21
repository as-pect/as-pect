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
declare module "test/Snapshot" {
    import { ISnapshotData } from "parser/index";
    export class Snapshot {
        data: ISnapshotData | null;
        stringified: string | null;
        static fromSnapshotData(data: ISnapshotData): Snapshot;
        static fromString(data: string): Snapshot;
    }
}
//# sourceMappingURL=as-pect.core.amd.d.ts.map