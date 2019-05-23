import chalk from "chalk";
import path from "path";
import fs from "fs";

export function init(assemblyFolder: string, testFolder: string, typesFile: string, typesFileSource: string) {
  console.log("");
  console.log(chalk`[Log] Initializing test suite files.`);
  console.log("");
  // create the assembly folder if it doesn't exist
  if (!fs.existsSync(assemblyFolder)) {
    console.log(chalk`[Log] Creating folder: ./assembly/`);
    fs.mkdirSync(assemblyFolder);
  }
  // Create the test folder if it doesn't exist
  if (!fs.existsSync(testFolder)) {
    console.log(chalk`[Log] Creating folder: ./assembly/__tests__/`);
    fs.mkdirSync(testFolder);
    // create the example file only if the __tests__ folder does not exist
    const exampleFile = path.join(testFolder, "example.spec.ts");
    const exampleFileSource = path.join(__dirname, "../../init/example.spec.ts");
    if (!fs.existsSync(exampleFile)) {
      console.log(chalk`[Log] Creating file: ./assembly/__tests__/example.spec.ts`);
      fs.createReadStream(exampleFileSource, "utf-8")
        .pipe(fs.createWriteStream(exampleFile, "utf-8"));
    }
  }
  // create the types file if it doesn't exist for typescript tooling users
  if (!fs.existsSync(typesFile)) {
    console.log(chalk`[Log] Creating file: assembly/__tests__/as-pect.d.ts`);
    fs.createReadStream(typesFileSource, "utf-8")
      .pipe(fs.createWriteStream(typesFile, "utf-8"));
  }
  // create the default configuration file
  const configFile = path.join(process.cwd(), "as-pect.config.js");
  const configFileSource = path.join(__dirname, "../../init/as-pect.config.js");
  if (!fs.existsSync(configFile)) {
    console.log(chalk`[Log] Creating file: as-pect.config.js`);
    fs.createReadStream(configFileSource, "utf-8")
      .pipe(fs.createWriteStream(configFile, "utf-8"));
  }
}
