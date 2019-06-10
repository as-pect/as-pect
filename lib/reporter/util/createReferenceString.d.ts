/**
 * This function generates a 2 digit hexadecimal string from the given number.
 *
 * @param {number} value - A number from [0-255].
 * @returns {string} - The hexadecimal string representing the byte
 */
export declare function hex(value: number): string;
/**
 * This function returns a string that formats the bytes into rows of 8 bytes with a space between
 * byte 4 and 5 on each row.
 *
 * @param {number[]} bytes - The byte array
 * @param {number} pointer - The pointer of the reference.
 * @param {number} offset - The offset of the reference.
 */
export declare function createReferenceString(bytes: number[], pointer: number, offset: number): string;
//# sourceMappingURL=createReferenceString.d.ts.map