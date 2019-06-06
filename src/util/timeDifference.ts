/**
 * This method calculates the start and end time difference, rounding off to the nearest thousandth
 * of a millisecond.
 *
 * @param {number} end - The end time.
 * @param {number} start - The start time.
 */
export const timeDifference = (end: number, start: number) => Math.round((end - start) * 1000) / 1000;
