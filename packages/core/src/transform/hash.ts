export function hash(str: string): number {
  const points = Array.from(str);
  let h = 0;
  for (let p = 0; p < points.length; p++)
    h = 37 * h + points[p].codePointAt(0)!;
  return h;
}
