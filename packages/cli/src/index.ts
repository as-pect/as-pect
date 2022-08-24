import { program } from "commander";
import process from "process";
import path from "path";
import { promises as fs, readdirSync } from "fs";
import { readFileSync } from "fs";
import url from "url";
import chalk from "chalk-template";
import { printAsciiArt } from "./asciiArt.js"
import { promise as glob } from "glob-promise";
import { IAspectConfig } from "./IAspectConfig.js";

const { main } = await import("assemblyscript/dist/asc.js");
const asc = main;


program
  .option("-n, --no-logo", "Don't display the as-pect logo.", false)
  .option("-c, --config <config_location>", "Specify the location of your [as-pect.config.js]", "./as-pect.config.js")
  .option("-a, --as-config <asconfig_location>", "Specify the location of the as-pect asconfig. (default: `./as-pect.asconfig.json`)", "./as-pect.asconfig.json")
  .option("-v, --version", "Display the as-pect version.", false)
  // memory options
  .option("--memory-size", "Initial size of imported memory in pages of 64kb. (Default: 10 pages)", "10")
  .option("--memory-max", "Set the maximum amount of memory pages the wasm test modules can use. (Default: -1, no max specified)", "-1")
  // testing options (regular arguments get passed as globs to find test files)
  .option("-t, --test", "Match tests with the following regex. (Default: `(:?)`)", "(:?)")
  .option("-g, --group", "Match test groups with the following regex. (Default `(:?)`)", "(:?)")
  .option("-d, --disclude <regex>", "Match test files with the following regex, disclude them from testing.", void 0)
  .option("-i, --include <globs>", "A comma seperated list of include globs that will include files for each test compilation.", void 0)
  .option("-o, --output-binary", "Output the wasm binary for each test file.", true)
  .option("--no-run", "Skip running tests, and output the binary files.", false)
  .option("-u, --update-snapshots", "Update the existing snapshots.", false)
  .option("--summary", "Use the summary reporter. {yellow (This is the default if no reporter is specified.)}", false)
  .option("--verbose","Use a more verbose reporter.", false)
  .option("--csv", "Use the csv reporter (output results to csv files.)", false)
  .option("--json", "Use the json reporter (output results to json files.)", false)
  .option("--reporter", "Define a custom reporter (path or module)", false)
  // other options
  .option("-s, --show-stats", "Show compiler stats between compilations.", false);

// const __filename = url.fileURLToPath(import.meta.url);
const __dirname = url.fileURLToPath(new URL('.', import.meta.url));

export async function asp(argv = process.argv): Promise<void> {
  const opts = program.parse(argv).opts();
  const pkgLocation = path.join(__dirname, "../package.json");
  // get the current cli package version
  const pkg = JSON.parse(await fs.readFile(pkgLocation, "utf8"));
  const version = pkg.version;
  const args = program.args;
  const cwd = process.cwd();

  // We print the ascii art if !n and !v
  if (!opts.noLogo && !opts.version) {
    printAsciiArt();
  }

  // always print the version and exit if v
  process.stdout.write(chalk`⚡AS-pect⚡ Test suite runner {bgGreenBright.bold.black [${version}]}`);
  if (opts.version) {
    process.exit(0);
  }

  // First collect the as-pect.config.js
  const configRelativeLocation = opts.config;
  const configLocation = path.join(cwd, configRelativeLocation);
  const aspectConfig = (await import("file://" + configLocation)).default as IAspectConfig;

  // filter entries using array of regexp
  let entryFilterRegexes = [] as RegExp[];
  if (opts.disclue) entryFilterRegexes.push(new RegExp(opts.disclude));
  if (aspectConfig.disclude) entryFilterRegexes.push(...aspectConfig.disclude);
  const filterEntry = (str: string) => entryFilterRegexes
    .reduce((left, right) => left && !right.test(str), true);

  /** All the included entry points that get added to every compilation. */
  const includes = new Set<string>();
  /** All of the test entry points to be compiled. */
  const entries = new Set<string>();

  // Collect all the test files now, filtering out the entry points
  for (const arg of args) {
    const entryPoints = await glob(arg);
    for (const entryPoint of entryPoints) {
      // we need to create a test file for each entry point
      if (filterEntry(entryPoint)) entries.add(entryPoint);
    }
  }

  // Now collect all the additional included entry points.
  // This must include an entry that ends with `@as-pect/assembly/assembly/index.ts`
  const includedGlobs = [] as string[];

  // opts.I is a comma seperated list of globs
  if (opts.include) includedGlobs.push(...opts.I.split(","));
  if (aspectConfig.include) includedGlobs.push(...aspectConfig.include);

  // if no files are specified to be included, then we include the following glob pattern
  if (includedGlobs.length === 0) includedGlobs.push("assembly/__tests__/**/*.include.ts");

  // for each glob, add them to the set of included files
  for (const includedGlob of includedGlobs) {
    const includedFiles = await glob(includedGlob);
    for (const includedFile of includedFiles) {
      includes.add(includedFile);
    }
  }

  // grab cli options here
  const asconfigLocation = opts.asConfig;

  const fileMap = new Map<string, string>();
  const folderMap = new Map<string, string[]>();

  // foreach entry point, we compile it
  for (const entry of entries) {
    const files = new Map<string, Uint8Array>();
    const dir = path.dirname(entry);
    const ascArgs = [entry, ...includes, "--config", asconfigLocation];
    console.log(ascArgs);
    process.exit(0);
    const compiled = await asc(ascArgs, {
      readFile(filename, baseDir) {
        const filePath = path.join(baseDir, filename);
        if (fileMap.has(filePath)) return fileMap.get(filePath)!;
        try {
          const contents = readFileSync(filePath, "utf8");
          fileMap.set(filePath, contents);
          return contents;
        } catch (ex) {
          return null;
        }
      },
      writeFile(filename, contents, _baseDir) {
        files.set(filename, contents);
      },
      listFiles(dirname, baseDir) {
        const folder = path.join(baseDir, dirname);
        if (folderMap.has(folder)) return folderMap.get(folder)!;

        try {
          const files = readdirSync(folder).filter(
            file => /^(?!.*\.d\.ts$).*\.ts$/.test(file)
          );
          folderMap.set(folder, files);
          return files;
        } catch(ex) {
          return null;
        }
      },
      stderr: process.stderr,
      stdout: process.stdout,
    });

    if (compiled.error) {
      console.error(compiled.error);
      process.exit(1);
    }

    // for emitting compiler stats
    if (opts.S) process.stdout.write(compiled.stats.toString());

    // output the wasm file
    if (opts.O || aspectConfig.outputBinary) await fs.writeFile(
      path.join(dir, path.basename(entry, path.extname(entry))) + ".wasm",
      files.get("output.wasm")!,
    );
  }
}
