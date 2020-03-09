/**
 * A simple djb2hash that returns a hash of a given string. See http://www.cse.yorku.ca/~oz/hash.html
 * for implementation details.
 *
 * @param {string} str - The string to be hashed
 * @returns {number} The hash of the string
 */
export function djb2Hash(str: string): number {
  const points = Array.from(str);
  let h = 5381;
  for (let p = 0; p < points.length; p++)
    // h = h * 33 + c;
    h = (h << 5) + h + points[p].codePointAt(0)!;
  return h;
}
