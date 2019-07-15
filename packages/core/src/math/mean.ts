/**
 * @ignore
 * This method calculates the average of the input set of numbers.
 *
 * @param {number[]} input - The set of numbers to be averaged.
 */
export function mean(input: number[]): number {
  if (input.length === 0) return 0;
  let sum = 0;
  for (let i = 0; i < input.length; i++) {
    sum += input[i];
  }
  return sum / input.length;
}
