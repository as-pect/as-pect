/**
 * This function returns a string that formats the bytes into rows of 8 bytes with a space between
 * byte 4 and 5 on each row.
 *
 * @param {number[]} bytes - The byte array
 * @param {number} pointer - The pointer of the reference.
 * @param {number} offset - The offset of the reference.
 */
export function createReferenceString(bytes: number[], pointer: number, offset: number): string {
  const referenceEnd = pointer + offset;
  // start with a tabbed out string
  let result = `Range: [dec: ${pointer.toString()}~${referenceEnd.toString()}] [hex: 0x${pointer.toString(16)}~0x${referenceEnd.toString(16)}]`;
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
