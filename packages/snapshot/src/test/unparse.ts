import { SnapshotData } from "../parser";

const escapeTick = (input: string) => input.replace(/`/g, "\\`");

/**
 * Convert an ISnapshotData into a stringified representation.
 *
 * @param {SnapshotData} data - The snapshot data to be converted.
 */
export function unparse(data: SnapshotData): string {
  let output = "";

  for (const groupKey of data.keys()) {
    const group = data.get(groupKey);
    /* istanbul ignore next */
    if (!group) continue;

    for (const testKey of group.keys()) {
      const test = group.get(testKey);
      /* istanbul ignore next */
      if (!test) continue;

      for (const snapshotKey of test.keys()) {
        const snapshot = test.get(snapshotKey);
        /* istanbul ignore next */
        if (typeof snapshot !== "string") continue;

        output += `exports[\`${escapeTick(groupKey)}\`][\`${escapeTick(
          testKey,
        )}\`][\`${escapeTick(snapshotKey)}\`] = \`${escapeTick(
          snapshot,
        )}\`\n\n`;
      }
    }
  }

  return output;
}
