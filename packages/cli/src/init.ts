import chalk from "chalk";
import { existsSync, promises as fs } from "fs";
import { join } from "path";
import url from "url";
const __dirname = url.fileURLToPath(new URL('.', import.meta.url));

/**
 * @ignore
 *
 * This method initializes a new test project. It is opinionated and reflects the needs of 99% of
 * AssemblyScript developers following the standard way of creating a new AssemblyScript project.
 */
export async function init() {
  const assemblyFolder = join(process.cwd(), "assembly");
  const testFolder = join(assemblyFolder, "__tests__");
  const typesFileSource = join(__dirname, "../init/init-types.d.ts");
  const typesFileLocation = join(testFolder, "as-pect.d.ts");

  console.log("");
  console.log(`${chalk.bgWhite.black("[Log]")} Initializing test suite files.`);
  console.log("");
  // create the assembly folder if it doesn't exist
  if (!existsSync(assemblyFolder)) {
    console.log(
      `${chalk.bgWhite.black ("[Log]")} Creating folder: ${chalk.yellow("./assembly/")}`,
    );
    await fs.mkdir(assemblyFolder);
  }
  // Create the test folder if it doesn't exist
  if (!existsSync(testFolder)) {
    console.log(
      `${chalk.bgWhite.black("[Log]")} Creating folder: ${chalk.yellow("./assembly/__tests__/")}`,
    );
    await fs.mkdir(testFolder);
    // create the example file only if the __tests__ folder does not exist
    const exampleFileLocation = join(testFolder, "example.spec.ts");
    const exampleFileSource = join(__dirname, "../init/example.spec.ts");
    if (!existsSync(exampleFileLocation)) {
      console.log(
        `${chalk.bgWhite.black("[Log]")} Creating file: ${chalk.yellow("./assembly/__tests__/example.spec.ts")}`,
      );
      const exampleFile = await fs.readFile(exampleFileSource, "utf8");
      await fs.writeFile(exampleFileLocation, exampleFile, "utf8");
    }
  }
  // create the types file if it doesn't exist for typescript tooling users
  if (!existsSync(typesFileLocation)) {
    console.log(
      `${chalk.bgWhite.black("[Log]")} Creating file: ${chalk.yellow("./assembly/__tests__/as-pect.d.ts")}`,
    );
    const typesFile = await fs.readFile(typesFileSource, "utf8");
    await fs.writeFile(typesFileLocation, typesFile, "utf8");
  }

  // create the default configuration file
  const configFileLocation = join(process.cwd(), "as-pect.config.js");
  const configFileSource = join(__dirname, "../init/as-pect.config.js");
  if (!existsSync(configFileLocation)) {
    console.log(
      `${chalk.bgWhite.black("[Log]")} Creating file: ${chalk.yellow("./as-pect.config.js")}`,
    );
    const configFile = await fs.readFile(configFileSource, "utf8");
    await fs.writeFile(configFileLocation, configFile, "utf8");
  }

  const asconfigFileLocation = join(process.cwd(), "as-pect.asconfig.json");
  const asconfigFileSource = join(__dirname, "../init/as-pect.asconfig.json");
  // create the default asconfig file for aspect (which overrides the default asconfig provided by AS)
  if (!existsSync(asconfigFileLocation)) {
    console.log(
      `${chalk.bgWhite.black("[Log]")} Creating file: ${chalk.yellow("./as-pect.asconfig.json")}`,
    );
    const asconfigFile = await fs.readFile(asconfigFileSource, "utf8");
    await fs.writeFile(asconfigFileLocation, asconfigFile, "utf8");
  }
}
