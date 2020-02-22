import grammar from "./grammar";
import { Parser, Grammar } from "nearley";

/**
 * Signifies a parsed snapshot.
 */
export type SnapshotData = Map<string, Map<string, Map<string, string>>>;

/**
 * Create a parser manually.
 */
export function createSnapshotParser(): Parser {
  return new Parser(Grammar.fromCompiled(grammar));
}

/**
 * Parse a snapshot string and return a SnapshotData map.
 *
 * @param {string} snapshot- A snapshot stored in stringified format.
 */
export function parseSnapshot(snapshot: string): SnapshotData {
  const parser = createSnapshotParser();
  parser.feed(snapshot);
  const results = parser.results;
  if (results.length !== 1) throw new Error("Invalid snapshot.");
  return results[0] as SnapshotData;
}
