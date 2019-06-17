import chalk from "chalk";
import fs from "fs";

/**
 * This method creates a types file to the current testing directory located at
 * `./assembly/__tests__/` for the current project.
 *
 * @param {string} assemblyFolder - The current `./assembly/` folder.
 * @param {string} testFolder - The current `./assembly/__tests__` folder.
 * @param {string} typesFile - The current types file location.
 * @param {string} typesFileSource - The types file source location.
 */
export function types(assemblyFolder: string, testFolder: string, typesFile: string, typesFileSource: string) {
  console.log("");
  console.log(chalk`{bgWhite.black [Log]} Initializing types.`);
  console.log("");
  // Create the assembly folder if it doesn't exist
  if (!fs.existsSync(assemblyFolder)) {
    console.log(chalk`{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}`);
    fs.mkdirSync(assemblyFolder);
  }
  // Create the test folder if it doesn't exist
  if (!fs.existsSync(testFolder)) {
    console.log(chalk`{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}`);
    fs.mkdirSync(testFolder);
  }
  // Create the types file if it doesn't exist
  if (!fs.existsSync(typesFile)) {
    console.log(chalk`{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}`);
    fs.createReadStream(typesFileSource, "utf-8")
      .pipe(fs.createWriteStream(typesFile, "utf-8"));
  }
}
