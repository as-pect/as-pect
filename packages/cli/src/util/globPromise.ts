import glob from "glob";

export async function globPromise(...patterns: string[]): Promise<Set<string>> {
  const matches = await Promise.all(
    patterns.map((pattern) => {
      return new Promise<string[]>((resolve, reject) => {
        glob(pattern, (err, matches) => {
          if (err) reject(err);
          else resolve(matches);
        });
      });
    }),
  );
  return new Set(([] as string[]).concat.apply([], matches));
}
