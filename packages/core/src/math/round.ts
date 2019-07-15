/**
 * @ignore
 * This method rounds a number value to a number of decimal places.
 *
 * @param {number} input - The number to be rounded.
 * @param {number} places - The number of decimal places used for rounding.
 */
export function round(input: number, places: number): number {
  let factor = Math.pow(10, places);
  return Math.round(input * factor) / factor;
}
