import { mean } from "./mean";

export function variance(input: number[]): number {
  const average = mean(input);
  const count = input.length;

  const differences: number[] = [];

  for (let i = 0; i < count; i++) {
    let difference = input[i] - average;
    differences.push(difference * difference);
  }

  /** Biased mean of the differences, returns sum(differences) / (length + 1). */
  let result = 0;
  for (let i = 0; i < count; i++) {
    result += differences[i];
  }

  return result / (count + 1);
}
