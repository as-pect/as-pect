import { program } from "commander";
import process, { stdout } from "process";
import path from "path";
import { existsSync, promises as fs, readdirSync } from "fs";
import { readFileSync } from "fs";
import url from "url";
import chalk from "chalk";
import { printAsciiArt } from "./asciiArt.js";
import { promise as glob } from "glob-promise";
import { IAspectConfig } from "./IAspectConfig.js";

import { main as asc, version as ascVersion } from "assemblyscript/dist/asc.js";
import { init } from "./init.js";
import { TestContext } from "@as-pect/core";
import { Snapshot, SnapshotDiffResultType } from "@as-pect/snapshots";
import { collectReporter } from "./collectReporter.js";
import { instantiate } from "@assemblyscript/loader";

// set the cli options
// prettier-ignore
program
  .option("-n, --no-logo", "Don't display the as-pect logo.", false)
  .option("-c, --config <config_location>", "Specify the location of your [as-pect.config.js]", "./as-pect.config.js")
  .option( "-a, --as-config <asconfig_location>", "Specify the location of the as-pect asconfig. (default: `./as-pect.asconfig.json`)", "./as-pect.asconfig.json")
  .option("-v, --version", "Display the as-pect version.", false)
  .option("--init", "Initialize a testing project.", false)
  // memory options
  .option("--memory-size", "Initial size of imported memory in pages of 64kb. (Default: 10 pages)", "10")
  .option("--memory-max", "Set the maximum amount of memory pages the wasm test modules can use. (Default: -1, no max specified)", "-1")
  // testing options (regular arguments get passed as globs to find test files)
  .option("-t, --test", "Match tests with the following regex. (Default: `(:?)`)", "(:?)")
  .option("-g, --group", "Match test groups with the following regex. (Default `(:?)`)", "(:?)")
  .option("-d, --disclude <regex>", "Match test files with the following regex, disclude them from testing.", void 0)
  .option("-i, --include <globs>", "A comma seperated list of include globs that will include files for each test compilation.", void 0)
  .option("-o, --output-binary", "Output the wasm binary for each test file.", false)
  .option("--no-run", "Skip running tests, and output the binary files.", false)
  .option("-u, --update-snapshots", "Update the existing snapshots.", false)
  .option("--summary", "Use the summary reporter. {yellow (This is the default if no reporter is specified.)}", false)
  .option("--verbose", "Use a more verbose reporter.", false)
  .option("--csv", "Use the csv reporter (output results to csv files.)", false)
  .option("--json", "Use the json reporter (output results to json files.)", false)
  .option("--reporter", "Define a custom reporter (path or module)", false)
  // other options
  .option("-s, --show-stats", "Show compiler stats between compilations.", false);

// const __filename = url.fileURLToPath(import.meta.url);
const __dirname = url.fileURLToPath(new URL(".", import.meta.url));

export const enum SnapshotMode {
  WriteSnapshots,
  CompareSnapshots,
}

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

  // We print the ascii art if !n and !v
  if (!opts.noLogo && !opts.version) {
    printAsciiArt();
  }

  if (opts.init) {
    init().then(() => process.exit(0));
    return;
  }

  // always print the version and exit if v
  process.stdout.write(`⚡AS-pect⚡ Test suite runner ${chalk.bgGreenBright.bold.black(`[${version}]`)}\n`);
  if (opts.version) {
    process.exit(0);
  }

  // First collect the as-pect.config.js
  const configRelativeLocation = opts.config;
  const configLocation = path.join(cwd, configRelativeLocation);
  const aspectConfig = (await import("file://" + configLocation)).default as IAspectConfig;

  stdout.write(`Using config: ${configLocation}\n`);
  stdout.write(`ASC Version: ${ascVersion}\n`);
  // filter entries using array of regexp
  let entryFilterRegexes = [] as RegExp[];
  if (opts.disclue) entryFilterRegexes.push(new RegExp(opts.disclude));
  if (aspectConfig.disclude) entryFilterRegexes.push(...aspectConfig.disclude);
  const filterEntry = (str: string) => entryFilterRegexes.reduce((left, right) => left && !right.test(str), true);

  /** All the included entry points that get added to every compilation. */
  const includes = new Set<string>();
  /** All of the test entry points to be compiled. */
  const entries = new Set<string>();

  // Collect all the test files now, filtering out the entry points
  for (const arg of args.concat(aspectConfig.entries || [])) {
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

  const overallStats = {
    addedSnapshots: 0,
    removedSnapshots: 0,
    passedSnapshots: 0,
    totalSnapshots: 0,
    groups: 0,
    passedGroups: 0,
    tests: 0,
    passedTests: 0,
    pass: true,
  };

  if (aspectConfig.coverage) {
    log(`Using code coverage: ${aspectConfig.coverage.join(", ")}`);
  }

  // coverage happens on a global level

  /** Potentailly enable code coverage, using the configurated globs */
  let covers: import("@as-covers/glue").Covers | null = null;
  const coverageFiles = aspectConfig.coverage || [];
  if (coverageFiles.length !== 0) {
    log("Using coverage: " + coverageFiles.join(", "));
    const Covers = (await import("@as-covers/glue")).Covers;
    covers = new Covers({ files: coverageFiles });
  }

  // foreach entry point, we compile it
  for (const entry of entries) {
    const files = new Map<string, Uint8Array>();
    const dir = path.dirname(entry);
    const basename = path.basename(entry, path.extname(entry));
    const ascArgs = [entry, ...includes, "--config", asconfigLocation, "--target", covers ? "coverage" : "noCoverage"];

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
          const files = readdirSync(folder).filter((file) => /^(?!.*\.d\.ts$).*\.ts$/.test(file));
          folderMap.set(folder, files);
          return files;
        } catch (ex) {
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
    if (opts.showStats) process.stdout.write(compiled.stats.toString());
    const outputFileKey = Array.from(files.keys()).filter((e) => e.endsWith("output.wasm"))[0]!;
    const outputWatFileKey = Array.from(files.keys()).filter((e) => e.endsWith("output.wat"))[0]!;
    const binary = files.get(outputFileKey)!;
    const wat = files.get(outputWatFileKey)!;

    // output the wasm file
    if (opts.outputBinary || aspectConfig.outputBinary) {
      const baseName = path.join(dir, path.basename(entry, path.extname(entry)));
      await fs.writeFile(baseName + ".wasm", binary);
      await fs.writeFile(baseName + ".wat", wat);
    }

    // collect the snapshots for this entry in `{dir}/__snapshots__/{basename}.snap`
    const snapshotPath = path.join(dir, "__snapshots__", basename + ".snap");
    const snapshotMode = opts.updateSnapshots
      ? SnapshotMode.WriteSnapshots
      : SnapshotMode.CompareSnapshots;

    const snapshots =
      snapshotMode === SnapshotMode.CompareSnapshots && existsSync(snapshotPath)
        ? Snapshot.parse(await fs.readFile(snapshotPath, "utf8"))
        : void 0;

    // collect wasi if it exists
    let wasi: import("wasi").WASI | undefined = void 0;
    if (opts.wasi) {
      const { WASI } = await import("wasi");
      const wasiRelativeLocation = opts.wasi;
      const wasiLocation = path.join(cwd, wasiRelativeLocation);
      const wasiConfig = (await import("file://" + wasiLocation)).default;
      wasi = new WASI(wasiConfig);
    } else if (aspectConfig.wasi) {
      const { WASI } = await import("wasi");
      wasi = new WASI(aspectConfig.wasi);
    }

    const reporter = await collectReporter(opts, aspectConfig);

    // create the testing host
    const ctx = new TestContext({
      reporter,
      binary: binary,
      fileName: entry,
      groupRegex: new RegExp(opts.group),
      snapshots: snapshots,
      testRegex: new RegExp(opts.test),
      wasi: wasi,
    });

    const descriptor = {
      initial: parseInt(opts.memorySize),
    } as WebAssembly.MemoryDescriptor;
    if (opts.memoryMax) {
      const maximum = parseInt(opts.memoryMax);
      if (maximum !== -1) {
        descriptor.maximum = maximum;
      }
    }
    const memory = new WebAssembly.Memory(descriptor);

    // import the module by generating the assemblyscript imports
    const module = await aspectConfig.instantiate(
      memory,
      (...args: any[]) => (covers ? covers.installImports(ctx.createImports(...args)) : ctx.createImports(...args)),
      instantiate,
      binary,
    );

    covers?.registerLoader(module);
    ctx.run(module as any);
    overallStats.groups += ctx.groupCount;
    overallStats.tests += ctx.testCount;
    overallStats.passedGroups += ctx.groupPassCount;
    overallStats.passedTests += ctx.testPassCount;
    overallStats.pass = overallStats.pass && ctx.pass;

    // snapshot mode!
    if (snapshotMode === SnapshotMode.CompareSnapshots) {
      const expectedSnapshots = ctx.expectedSnapshots;
      // the diff is garunteed to exist at this point.
      const diff = ctx.snapshotDiff!;

      overallStats.totalSnapshots += expectedSnapshots.values.size;

      let addedSnapshots = 0;
      // first, loop over every diff, and add each snapshot that was added to the expected snapshots
      for (const [diffName, diffResult] of diff.results) {
        if (diffResult.type === SnapshotDiffResultType.Added) {
          addedSnapshots += 1;
          expectedSnapshots.add(diffName, diffResult.left!); // Left is the actual value
          // adding a snapshot is success
          overallStats.passedSnapshots += 1;
        }
        if (diffResult.type === SnapshotDiffResultType.Removed) {
          overallStats.removedSnapshots += 1;
        }
        if (diffResult.type === SnapshotDiffResultType.NoChange) {
          overallStats.passedSnapshots += 1;
        }
      }

      // if snapshots were added, we need to update them
      if (addedSnapshots > 0) {
        overallStats.addedSnapshots += addedSnapshots;
        await fs.writeFile(snapshotPath, expectedSnapshots.stringify(), "utf8");
      }
    } else {
      log("Creating Snapshots.");
      // we are creating the snapshots, make sure the directory exists
      const snapshotDir = path.dirname(snapshotPath);
      try {
        await fs.access(snapshotDir);
      } catch (ex) {
        await fs.mkdir(snapshotDir);
      }

      // if all the test nodes pass, we need to write the file output
      if (ctx.rootNode.pass) {
        const output = ctx.snapshots.stringify();
        await fs.writeFile(snapshotPath, output, "utf8");
      }
    }
  }

  // Coverage report
  if (covers) {
    stdout.write(chalk.green("\nCoverage Report:\n\n"));
    stdout.write(covers.stringify());
  }

  const summaryString = `
  [Summary]
    [Tests]: ${chalk.green(overallStats.passedTests)} / ${overallStats.tests}
   [Groups]: ${chalk.green(overallStats.passedGroups)} / ${overallStats.groups}
[Snapshots]: ${chalk.green(overallStats.passedSnapshots)} / ${overallStats.totalSnapshots}, Added ${
    overallStats.addedSnapshots
  }, Changed ${overallStats.removedSnapshots}
   [Result]: ${overallStats.pass ? chalk.green(`✔ Pass!`) : chalk.red(`❌ Fail`)}

   `;
  stdout.write(summaryString);
}
