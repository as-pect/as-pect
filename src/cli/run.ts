
import asc from "assemblyscript/cli/asc";
import { TestContext } from "../test/TestContext";
import * as fs from "fs";
import { instantiateBuffer } from "assemblyscript/lib/loader";
import { TestReporter } from "../test/TestReporter";
import { DefaultTestReporter } from "../reporter/DefaultTestReporter";
import { performance } from "perf_hooks";
import { timeDifference } from "../util/timeDifference";
import { createDefaultPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { EmptyReporter } from "../reporter/EmptyReporter";
import { SummaryTestReporter } from "../reporter/SummaryTestReporter";
import { IWarning } from "../test/IWarning";
import yargsparser from "yargs-parser";
import * as path from "path";
import chalk from "chalk";
import { IConfiguration, ICompilerFlags } from "../util/IConfiguration";
import glob from "glob";

interface IYargs {
  argv: yargsparser.Arguments;
}

export function run(yargs: IYargs): void {
  const start = performance.now();
  // obtain the configuration file
  const configurationPath = path.resolve(
    process.cwd(),
    (yargs.argv.c as string) || (yargs.argv.config as string) || "./as-pect.config.js",
  );
  console.log(chalk`{bgWhite.black [Log]} using configuration ${configurationPath}`);

  let configuration: IConfiguration = {};

  try {
    configuration = require(configurationPath) || {};
  } catch (ex) {
    console.log("");
    console.log(chalk`{bgRedBright.black [Error]} There was a problem loading {bold [${configurationPath}]}.`);
    console.log(ex);
    process.exit(1);
  }

  // configuration must be an object
  if (!configuration) {
    console.log(chalk`{bgRedBright.black [Error]} configuration at {bold [${configurationPath}]} is null or not an object.`);
    process.exit(1);
  }

  const include: string[] = configuration.include || ["assembly/__tests__/**/*.spec.ts"];
  const add: string[] = configuration.add || ["assembly/__tests__/**/*.include.ts"];
  const flags: ICompilerFlags = configuration.flags || {
    "--validate": [],
    "--debug": [],
    "--measure": [],
    "--sourceMap":[],
    /** This is required. Do not change this. */
    "--binaryFile": ["output.wasm"],
  };
  const disclude: RegExp[] = configuration.disclude || [];
  let reporter: TestReporter = configuration.reporter || new DefaultTestReporter();

  const performanceConfiguration = configuration.performance || createDefaultPerformanceConfiguration();

  // setup performance options, overriding configured values if the flag is passed to the cli
  if (yargs.argv.hasOwnProperty("performance")) performanceConfiguration.enabled = yargs.argv.performance !== "false";

  // gather all the flags
  if (yargs.argv.hasOwnProperty("maxSamples")) performanceConfiguration.maxSamples = parseFloat(yargs.argv.maxSamples.toString());
  if (yargs.argv.hasOwnProperty("maxTestRunTime")) performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
  if (yargs.argv.hasOwnProperty("maxTestRunTime")) performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
  if (yargs.argv.hasOwnProperty("roundDecimalPlaces")) performanceConfiguration.roundDecimalPlaces = parseFloat(yargs.argv.roundDecimalPlaces.toString());
  if (yargs.argv.hasOwnProperty("reportMedian")) performanceConfiguration.reportMedian = yargs.argv.reportMedian !== "false";
  if (yargs.argv.hasOwnProperty("reportAverage")) performanceConfiguration.reportAverage = yargs.argv.reportAverage !== "false";
  if (yargs.argv.hasOwnProperty("reportStandardDeviation")) performanceConfiguration.reportStandardDeviation = yargs.argv.reportStandardDeviation !== "false";
  if (yargs.argv.hasOwnProperty("reportMax")) performanceConfiguration.reportMax = yargs.argv.reportMax !== "false";
  if (yargs.argv.hasOwnProperty("reportMin")) performanceConfiguration.reportMin = yargs.argv.reportMin !== "false";
  if (yargs.argv.hasOwnProperty("reportVariance")) performanceConfiguration.reportVariance = yargs.argv.reportVariance !== "false";

  // if a reporter is specified in cli arguments, override configuration
  if (yargs.argv.reporter || yargs.argv.r) {
    const targetReporter: string = yargs.argv.reporter || yargs.argv.r;

    // get relative reporters
    if (targetReporter.startsWith(".")) {
      try {
        const result = require(path.join(process.cwd(), targetReporter));
        // if something is returned
        if (result) {
          if (typeof result === "function") { // instantiate it if it's a default exported class
            reporter = new result();
          } if (typeof result.default === "function") {
            reporter = new result.default();
          } else {
            reporter = result.default || result;
          }
        } else {
          reporter = new DefaultTestReporter();
        }
      } catch(ex) {
        console.log("Cannot find target reporter at", path.join(process.cwd(), targetReporter));
        console.log(ex);
        process.exit(1);
      }
    } else if (targetReporter === "EmptyReporter") {
      reporter = new EmptyReporter();
    } else if (targetReporter === "SummaryTestReporter") {
      reporter = new SummaryTestReporter();
    } else {
      reporter = new DefaultTestReporter();
    }
  }

  // include all the file globs
  console.log(chalk`{bgWhite.black [Log]} Including files: ${include.join(", ")}`);

  // add a line seperator between the next line and this line
  console.log("");

  const testEntryFiles: Set<string> = new Set<string>();
  const addedTestEntryFiles: Set<string> = new Set<string>();

  /**
   * Read in the file regex arg. Only test files that match this regular expression will have
   * their tests run.
   */
  const fileRegexArg = yargs.argv.file || yargs.argv.f || ".*";
  const fileRegex: RegExp = new RegExp(fileRegexArg);

  // for each pattern to be included
  for (const pattern of include) {
    // push all the resulting files so that each file gets tested individually
    entry:
    for (const entry of glob.sync(pattern)) {
      // test for discludes
      for (const test of disclude) {
        if (test.test(entry)) continue entry;
      }

      // if the fileRegex matches the test, add it to the entry file Set
      if (fileRegex.test(entry)) testEntryFiles.add(entry);
    }
  }

  for (const pattern of add) {
    // push all the added files to the added entry point list
    for (const entry of glob.sync(pattern)) {
      addedTestEntryFiles.add(entry);
    }
  }

  // loop over each file and create a binary, index it on binaries
  let binaries: { [i: number]: Uint8Array } = {};
  let sourcemaps: { [inex: string]: Uint8Array } = {};

  // must include the assembly/index.ts file located in the package
  const entryPath = path.join(__dirname, "../../assembly/index.ts");
  const relativeEntryPath = path.relative(process.cwd(), entryPath);

  // add the relativeEntryPath of as-pect to the list of compiled files for each test
  addedTestEntryFiles.add(relativeEntryPath);

  // Create a test runner, and run each test
  let count = testEntryFiles.size;

  // create the array of compiler flags from the flags object
  const flagList: string[] = Object.entries(flags).reduce((args: string[], [flag, options]) => {
    return args.concat(flag, options);
  }, []);

  let testCount = 0;
  let successCount = 0;
  let groupSuccessCount = 0;
  let groupCount = 0;
  let errors: IWarning[] = [];

  // for each file, synchronously run each test
  Array.from(testEntryFiles).forEach((file: string, i: number) => {
    asc.main([file, ...Array.from(addedTestEntryFiles), ...flagList], {
      stdout: process.stdout as any, // use any type to quelch error
      stderr: process.stderr as any,
      writeFile(name: string, contents: Uint8Array) {
        const ext = path.extname(name)
        // get the wasm file
        if (ext === ".wasm") {
          binaries[i] = contents;
          return;
        }

        // capture the sourcemap, not sure what to do with this yet.
        if (ext === ".map") {
          sourcemaps[name] = contents;
          return;
        }

        const outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
        fs.writeFileSync(outfileName, contents);
      }
    }, function (error: Error | null): number {
      // if there are any compilation errors, stop the test suite
      if (error) {
        console.log(`There was a compilation error when trying to create the wasm binary for file: ${file}.`);
        console.error(error);
        return process.exit(1);
      }

      // if the binary wasn't emitted, stop the test suite
      if (!binaries[i]) {
        console.log(`There was no output binary file: ${file}. Did you forget to emit the binary?`);
        return process.exit(1);
      }

      // create a test runner
      const runner = new TestContext(reporter, file, performanceConfiguration);

      // detect custom imports
      const customImportFileLocation = path.resolve(
        path.join(
          path.dirname(file),
          path.basename(file, path.extname(file)) + ".imports.js",
        ),
      );
      const imports = runner.createImports(
        (fs.existsSync(customImportFileLocation)
          ? require(customImportFileLocation)
          : configuration!.imports
        ) || {},
      );

      // instantiate the module
      const wasm = instantiateBuffer(binaries[i], imports);

      if (runner.errors.length > 0) {
        errors.push(...runner.errors);
      } else {
        // call run buffer because it's already compiled
        runner.run(wasm);
        testCount += runner.testGroups.reduce((left, right) => left + right.tests.length, 0);
        successCount += runner.testGroups
          .reduce((left, right) => left + right.tests.filter(e => e.pass).length, 0);
        groupCount += runner.testGroups.length;
        groupSuccessCount = runner.testGroups.reduce((left, right) => left + (right.pass ? 1 : 0), groupSuccessCount);
      }

      count -= 1;

      // if any tests failed, and they all ran, exit(1)
      if (count === 0) {
        const end = performance.now();
        const failed = testCount !== successCount || errors.length > 0;
        const result = failed
          ? chalk`{red ✖ FAIL}`
          : chalk`{green ✔ PASS}`;
        console.log("~".repeat(process.stdout.columns! - 10));

        for (const error of errors) {
          console.log(chalk`
 [Error]: {red ${error.type}}: ${error.message}
 [Stack]: {yellow ${error.stackTrace.split("\n").join("\n            ")}}
`)
        }
        console.log(`
[Result]: ${result}
 [Files]: ${testEntryFiles.size} total
[Groups]: ${groupCount} count, ${groupSuccessCount} pass
[Summary]: ${successCount.toString()} pass, ${(testCount - successCount).toString()} fail, ${testCount.toString()} total
  [Time]: ${timeDifference(end, start).toString()}ms`);
        if (failed) {
          process.exit(1);
        }
      }
      return 0;
    });
  });
}
