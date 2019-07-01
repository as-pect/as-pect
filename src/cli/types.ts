import chalk from "chalk";
import fs from "fs";
import path from "path";

const assemblyFolder = path.join(process.cwd(), "assembly");
const testFolder = path.join(assemblyFolder, "__tests__");
const typesFileSource = path.join(__dirname, "../../assembly/__tests__/as-pect.d.ts");
const typesFile = path.join(testFolder, "as-pect.d.ts");

/**
 * This method creates a types file to the current testing directory located at
 * `./assembly/__tests__/` for the current project.
 */
export function types() {
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
  // Always create the types file
  console.log(chalk`{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}`);
  fs.createReadStream(typesFileSource, "utf-8")
    .pipe(fs.createWriteStream(typesFile, "utf-8"));
}
