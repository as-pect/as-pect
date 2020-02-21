import grammar from "./grammar";
import { Parser, Grammar } from "nearley";

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

export function createSnapshotParser(): Parser {
  return new Parser(Grammar.fromCompiled(grammar));
}

export function parseSnapshot(snapshot: string): ISnapshotData {
  const parser = createSnapshotParser();
  parser.feed(snapshot);
  const results = parser.results;
  if (results.length !== 1) throw new Error("Invalid snapshot.");
  return results[0] as ISnapshotData;
}
