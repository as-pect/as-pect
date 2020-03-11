import { unlink } from "fs";

/**
 * @ignore
 * This method promisifies the fs.writeFile function call, and is compatible with node 10.
 *
 * @param {string} file - The file location to write to.
 */
export function removeFile(file: string): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    unlink(file, err => {
      if (err) reject(err);
      else resolve();
    });
  });
}
