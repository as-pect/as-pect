export function median(input: number[]): number {
  const mid = Math.ceil(input.length * 0.5);
  input.sort((a, b) => a - b);
  return input.length & 1 ? input[mid] : (input[mid] + input[mid + 1]) * 0.5;
}
