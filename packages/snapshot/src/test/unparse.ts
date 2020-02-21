import { ISnapshotData } from "../parser";

const escapeTick = (input: string) => input.replace(/`/g, "\\`");

/**
 * Convert an ISnapshotData into a stringified representation.
 *
 * @param {ISnapshotData} data - The snapshot data to be converted.
 */
export function unparse(data: ISnapshotData): string {
  let output = "";

  for (const [groupName, group] of Object.entries(data)) {
    for (const [testName, test] of Object.entries(group)) {
      for (const [snapshotName, snapshot] of Object.entries(test)) {
        output += `exports[\`${escapeTick(groupName)}\`][\`${escapeTick(
          testName,
        )}\`][\`${escapeTick(snapshotName)}\`] = \`${escapeTick(
          snapshot,
        )}\`\n\n`;
      }
    }
  }

  return output;
}
