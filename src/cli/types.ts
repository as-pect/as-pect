import chalk from "chalk";
import fs from "fs";

export function types(assemblyFolder: string, testFolder: string, typesFile: string, typesFileSource: string) {
  console.log("");
  console.log(chalk`[Log] Initializing types.`);
  console.log("");
  // Create the assembly folder if it doesn't exist
  if (!fs.existsSync(assemblyFolder)) {
    console.log(chalk`[Log] Creating folder: ./assembly/`);
    fs.mkdirSync(assemblyFolder);
  }
  // Create the test folder if it doesn't exist
  if (!fs.existsSync(testFolder)) {
    console.log(chalk`[Log] Creating folder: ./assembly/__tests__/`);
    fs.mkdirSync(testFolder);
  }
  // Create the types file if it doesn't exist
  if (!fs.existsSync(typesFile)) {
    console.log(chalk`[Log] Creating file: assembly/__tests__/as-pect.d.ts`);
    fs.createReadStream(typesFileSource, "utf-8")
      .pipe(fs.createWriteStream(typesFile, "utf-8"));
  }
}
