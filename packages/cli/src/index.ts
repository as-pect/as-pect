import { Command } from "commander";
import process, { stdout } from "process";
import path from "path";
import { promises as fs } from "fs";
import url from "url";
import chalk from "chalk";
import { printAsciiArt } from "./asciiArt.js";
import type { IAspectConfig } from "./IAspectConfig.js";
import { importLocalModule } from "./importLocalModule.js";

import { version as ascVersion } from "assemblyscript/dist/asc.js";
import { init } from "./init.js";
import { createTestSessionConfig, formatTestSessionSummary, SnapshotMode, TestSession } from "./TestSession.js";

export function createCliProgram(): Command {
  // set the cli options
  // prettier-ignore
  return new Command()
    .argument("[globs...]", "Test entry globs")
    .option("-n, --no-logo", "Don't display the as-pect logo.")
    .option("-c, --config <config_location>", "Specify the location of your [as-pect.config.js]", "./as-pect.config.js")
    .option( "-a, --as-config <asconfig_location>", "Specify the location of the as-pect asconfig. (default: `./as-pect.asconfig.json`)", "./as-pect.asconfig.json")
    .option("-v, --version", "Display the as-pect version.", false)
    .option("--init", "Initialize a testing project.", false)
    // memory options
    .option("--memory-size <pages>", "Initial size of imported memory in pages of 64kb. (Default: 10 pages)", "10")
    .option("--memory-max <pages>", "Set the maximum amount of memory pages the wasm test modules can use. (Default: -1, no max specified)", "-1")
    // testing options (regular arguments get passed as globs to find test files)
    .option("-t, --test", "Match tests with the following regex. (Default: `(:?)`)", "(:?)")
    .option("-g, --group", "Match test groups with the following regex. (Default `(:?)`)", "(:?)")
    .option("-d, --disclude <regex>", "Match test files with the following regex, disclude them from testing.", void 0)
    .option("-i, --include <globs>", "A comma seperated list of include globs that will include files for each test compilation.", void 0)
    .option("-o, --output-binary", "Output the wasm binary for each test file.", false)
    .option("--no-run", "Skip running tests, and output the binary files.")
    .option("-u, --update-snapshots", "Update the existing snapshots.", false)
    .option("--summary", "Use the summary reporter. {yellow (This is the default if no reporter is specified.)}", false)
    .option("--verbose", "Use a more verbose reporter.", false)
    .option("--csv", "Use the csv reporter (output results to csv files.)", false)
    .option("--json", "Use the json reporter (output results to json files.)", false)
    .option("--reporter <reporter>", "Define a custom reporter (local path or package module)", void 0)
    // other options
    .option("-s, --show-stats", "Show compiler stats between compilations.", false);
}

export const program = createCliProgram();

// const __filename = url.fileURLToPath(import.meta.url);
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));

export { SnapshotMode };
export type {
  AspectCreateImports,
  AspectImports,
  AspectInstantiate,
  AspectInstantiateResult,
  IAspectConfig,
} from "./IAspectConfig.js";

export function log(str: string): void {
  stdout.write(chalk.bgWhite.black("[Log]") + `${str}\n`);
}

export function warning(str: string): void {
  stdout.write(chalk.bgYellow.black("[Warning]") + `${str}\n`);
}

export async function asp(argv: string[]): Promise<void> {
  const opts = program.parse(argv).opts();
  const pkgLocation = path.join(__dirname, "../package.json");
  // get the current cli package version
  const pkg = JSON.parse(await fs.readFile(pkgLocation, "utf8"));
  const version = pkg.version;
  const args = program.args;
  const cwd = process.cwd();

  // We print the ascii art if the logo has not been disabled and this is not a version request.
  if (opts.logo !== false && !opts.version) {
    printAsciiArt();
  }

  if (opts.init) {
    await init();
    process.exit(0);
  }

  // always print the version and exit if v
  process.stdout.write(`⚡AS-pect⚡ Test suite runner ${chalk.bgGreenBright.bold.black(`[${version}]`)}\n`);
  if (opts.version) {
    process.exit(0);
  }

  // First collect the as-pect.config.js
  const configRelativeLocation = opts.config;
  const configLocation = path.resolve(cwd, configRelativeLocation);
  const aspectConfig = (await importLocalModule<{ default: IAspectConfig }>(configLocation)).default;

  stdout.write(`Using config: ${configLocation}\n`);
  stdout.write(`ASC Version: ${ascVersion}\n`);

  let result;
  try {
    const session = new TestSession(
      createTestSessionConfig({
        args,
        aspectConfig,
        asconfigLocation: opts.asConfig,
        cwd,
        options: opts,
      }),
    );

    result = await session.run();
  } catch (ex) {
    console.error(ex);
    process.exit(1);
  }

  if (result.compilerError) {
    console.error(result.compilerError);
    process.exit(1);
  }

  if (result.coverageReport) {
    stdout.write(chalk.green("\nCoverage Report:\n\n"));
    stdout.write(result.coverageReport);
  }

  stdout.write(formatTestSessionSummary(result));

  if (!result.pass) {
    process.exit(1);
  }
}
