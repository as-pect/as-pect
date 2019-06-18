export function round(input: number, places: number): number {
  let factor = Math.pow(10, places);
  return Math.round(input * factor) / factor;
}
