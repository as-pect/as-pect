import chalk from "chalk";
import { existsSync, createReadStream, createWriteStream, mkdirSync } from "fs";
import { join } from "path";

/**
 * @ignore
 *
 * This method creates a types file to the current testing directory located at
 * `./assembly/__tests__/` for the current project.
 */
export function types(): void {
  const assemblyFolder = join(process.cwd(), "assembly");
  const testFolder = join(assemblyFolder, "__tests__");
  const typesFileSource = require.resolve("@as-pect/cli/init/init-types.d.ts");
  const typesFile = join(testFolder, "as-pect.d.ts");

  console.log("");
  console.log(chalk`{bgWhite.black [Log]} Initializing types.`);
  console.log("");
  // Create the assembly folder if it doesn't exist
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
  }
  // Always create the types file
  console.log(
    chalk`{bgWhite.black [Log]} Creating file: {yellow ./assembly/__tests__/as-pect.d.ts}`,
  );
  createReadStream(typesFileSource, "utf-8").pipe(
    createWriteStream(typesFile, "utf-8"),
  );
}
