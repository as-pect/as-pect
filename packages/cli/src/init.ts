import chalk from "chalk";
import { existsSync, createReadStream, createWriteStream, mkdirSync } from "fs";
import { join } from "path";

/**
 * @ignore
 *
 * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
 * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
 */
export function init() {
  const assemblyFolder = join(process.cwd(), "assembly");
  const testFolder = join(assemblyFolder, "__tests__");
  const typesFileSource = require.resolve("@as-pect/cli/init/init-types.d.ts");
  const typesFile = join(testFolder, "as-pect.d.ts");

  console.log("");
  console.log(chalk`{bgWhite.black [Log]} Initializing test suite files.`);
  console.log("");
  // create the assembly folder if it doesn't exist
  if (!existsSync(assemblyFolder)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating folder: {yellow ./assembly/}`,
    );
    mkdirSync(assemblyFolder);
  }
  // Create the test folder if it doesn't exist
  if (!existsSync(testFolder)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating folder: {yellow ./assembly/__tests__/}`,
    );
    mkdirSync(testFolder);
    // create the example file only if the __tests__ folder does not exist
    const exampleFile = join(testFolder, "example.spec.ts");
    const exampleFileSource = join(__dirname, "../init/example.spec.ts");
    if (!existsSync(exampleFile)) {
      console.log(
        chalk`{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/example.spec.ts}`,
      );
      createReadStream(exampleFileSource, "utf-8").pipe(
        createWriteStream(exampleFile, "utf-8"),
      );
    }
  }
  // create the types file if it doesn't exist for typescript tooling users
  if (!existsSync(typesFile)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}`,
    );
    createReadStream(typesFileSource, "utf-8").pipe(
      createWriteStream(typesFile, "utf-8"),
    );
  }
  // create the default configuration file
  const configFile = join(process.cwd(), "as-pect.config.js");
  const configFileSource = join(__dirname, "../init/as-pect.config.js");
  if (!existsSync(configFile)) {
    console.log(
      chalk`{bgWhite.black [Log]} Creating file: {yellow ./as-pect.config.js}`,
    );
    createReadStream(configFileSource, "utf-8").pipe(
      createWriteStream(configFile, "utf-8"),
    );
  }
}
