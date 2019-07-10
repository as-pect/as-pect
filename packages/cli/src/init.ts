import chalk from "chalk";
import path from "path";
import fs from "fs";

const assemblyFolder = path.join(process.cwd(), "assembly");
const testFolder = path.join(assemblyFolder, "__tests__");
const typesFileSource = require.resolve("@as-pect/core/types/as-pect.d.ts");
const typesFile = path.join(testFolder, "as-pect.d.ts");

/**
 * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
 * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
 */
export function init() {
  console.log("");
  console.log(chalk`{bgWhite.black [Log]} Initializing test suite files.`);
  console.log("");
  // create the assembly folder if it doesn't exist
  if (!fs.existsSync(assemblyFolder)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}`,
    );
    fs.mkdirSync(assemblyFolder);
  }
  // Create the test folder if it doesn't exist
  if (!fs.existsSync(testFolder)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}`,
    );
    fs.mkdirSync(testFolder);
    // create the example file only if the __tests__ folder does not exist
    const exampleFile = path.join(testFolder, "example.spec.ts");
    const exampleFileSource = path.join(
      __dirname,
      "../init/example.spec.ts",
    );
    if (!fs.existsSync(exampleFile)) {
      console.log(
        chalk`{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/example.spec.ts}`,
      );
      fs.createReadStream(exampleFileSource, "utf-8").pipe(
        fs.createWriteStream(exampleFile, "utf-8"),
      );
    }
  }
  // create the types file if it doesn't exist for typescript tooling users
  if (!fs.existsSync(typesFile)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating file: {yellow assembly/__tests__/as-pect.d.ts}`,
    );
    fs.createReadStream(typesFileSource, "utf-8").pipe(
      fs.createWriteStream(typesFile, "utf-8"),
    );
  }
  // create the default configuration file
  const configFile = path.join(process.cwd(), "as-pect.config.js");
  const configFileSource = path.join(__dirname, "../init/as-pect.config.js");
  if (!fs.existsSync(configFile)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating file: {yellow as-pect.config.js}`,
    );
    fs.createReadStream(configFileSource, "utf-8").pipe(
      fs.createWriteStream(configFile, "utf-8"),
    );
  }
}
