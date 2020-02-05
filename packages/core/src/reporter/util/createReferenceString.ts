import { LogValue } from "../../util/LogValue";

const util = require("util");

/**
 * @ignore
 * This function returns a string that formats the bytes into rows of 8 bytes with a space between
 * byte 4 and 5 on each row.
 *
 * @param {LogValue} value - The log value.
 */
export function createReferenceString(value: LogValue): string {
  if (value.values.length > 0)
    return util.inspect(value.values, {
      colors: process.stdout.isTTY || false,
    });
  const { pointer, offset, bytes } = value;
  const referenceEnd = pointer + offset;
  // start with a tabbed out string
  let result = `Range: [dec: ${pointer.toString()}~${referenceEnd.toString()}] [hex: 0x${pointer.toString(
    16,
  )}~0x${referenceEnd.toString(16)}]`;
  result += "\n07 06 05 04   03 02 01 00";
  result += "\n~~~~~~~~~~~~~~~~~~~~~~~~~";
  result += "\n";

  // for each byte
  for (let i = 0; i < offset; i++) {
    // append a byte of string length 2 and an empty space
    result += bytes[i].toString(16).padStart(2, "0") + " ";
    if (i % 8 === 7) {
      // every 8 characters add a newline
      result += "\n";
    } else if (i % 4 === 3) {
      // every 4 characters add an extra two spaces
      result += "  ";
    }
  }

  // remove leading space
  return result.trimRight();
}
