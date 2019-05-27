import fs from "fs";

export function writeFile(file: string, contents: Uint8Array): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    fs.writeFile(file, contents, (err) => {
      if (err) reject(err);
      else resolve();
    });
  });
}
