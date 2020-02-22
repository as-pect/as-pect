import { Parser } from "nearley";
/**
 * Signifies a parsed snapshot.
 */
export declare type SnapshotData = Map<string, Map<string, Map<string, string>>>;
/**
 * Create a parser manually.
 */
export declare function createSnapshotParser(): Parser;
/**
 * Parse a snapshot string and return a SnapshotData map.
 *
 * @param {string} snapshot- A snapshot stored in stringified format.
 */
export declare function parseSnapshot(snapshot: string): SnapshotData;
//# sourceMappingURL=index.d.ts.map