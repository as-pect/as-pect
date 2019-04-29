
import chalk from "chalk";
import path from "path";
import { IConfiguration, ICompilerFlags } from "./util/IConfiguration";
import glob from "glob";
import yargsparser from "yargs-parser";

// import { TestRunner } from "./test/TestRunner";
import asc from "assemblyscript/cli/asc";
import { TestContext } from "./test/TestContext";
import fs from "fs";
import { instantiateBuffer } from "assemblyscript/lib/loader";
import { TestReporter } from "./test/TestReporter";
import { DefaultTestReporter } from "./reporter/DefaultTestReporter";
import { performance } from "perf_hooks";
import { timeDifference } from "./util/timeDifference";
import { createDefaultPerformanceConfiguration } from "./util/IPerformanceConfiguration";
import { EmptyReporter } from "./reporter/EmptyReporter";
import { SummaryTestReporter } from "./reporter/SummaryTestReporter";

const pkg = require("../package.json");

/**
 * This is the cli entry point and expects an array of arguments from the command line.
 *
 * @param {string[]} args - The arguments from the command line
 */
export function asp(args: string[]) {
  // parse the arguments
  const yargs = {
    argv: yargsparser(args),
  };

  // Skip ascii art if asked for the version
  if (!(yargs.argv.v || yargs.argv.version)) {
    console.log(chalk`{bold.bgWhite.black ${""
  }       ___   _____                       __  
      /   | / ___/      ____  ___  _____/ /_ 
     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ 
    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   
   /_/  |_/____/     / .___/\\___/\\___/\\__/   
                    /_/                      }

  ⚡AS-pect⚡ Test suite runner {bgGreenBright.black [${pkg.version}]}
  `);
  }

  const assemblyFolder = path.join(process.cwd(), "assembly");
  const testFolder = path.join(process.cwd(), "assembly", "__tests__");
  const typesFileSource = path.join(__dirname, "..", "assembly", "__tests__", "as-pect.d.ts");
  const typesFile = path.join(testFolder, "as-pect.d.ts");

  if (yargs.argv.t || yargs.argv.types) {
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
  } else if (yargs.argv.i || yargs.argv.init) {
    // init script
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
      const exampleFileSource = path.join(__dirname, "..", "init", "example.spec.ts");
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
    const configFileSource = path.join(__dirname, "..", "init", "as-pect.config.js");
    if (!fs.existsSync(configFile)) {
      console.log(chalk`[Log] Creating file: as-pect.config.js`);
      fs.createReadStream(configFileSource, "utf-8")
        .pipe(fs.createWriteStream(configFile, "utf-8"));
    }
  } else if (yargs.argv.v || yargs.argv.version) { // display the version
    console.log(pkg.version);
  } else if (yargs.argv.help || yargs.argv.h) { // display the help file
    console.log(chalk`
  {bold.blueBright SYNTAX}
    {bold.green asp} --init                          Create a test config, an assembly/__tests__ folder and exit.
    {bold.green asp} -i
    {bold.green asp} --config=as-pect.config.js      Use a specified configuration
    {bold.green asp} -c as-pect.config.js
    {bold.green asp} --version                       View the version.
    {bold.green asp} -v
    {bold.green asp} --help                          Show this help screen.
    {bold.green asp} -h
    {bold.green asp} --types                         Copy the types file to assembly/__tests__/as-pect.d.ts
    {bold.green asp} -t

  {bold.blueBright TEST OPTIONS}
    {bold.green --reporter}                           Define the reporter to be used. {yellow (Default: DefaultTestReporter)}
      {bold.green --reporter=SummaryTestReporter}     Use the summary reporter.
      {bold.green --reporter=DefaultTestReporter}     Use the default test reporter.
      {bold.green --reporter=EmptyReporter}           Use the empty reporter. {yellow (This reporter reports nothing)}
      {bold.green --reporter=./path/to/reporter.js}   Use the default exported object from this module as the reporter.

    {bold.green --performance}                        Enable performance statistics. {yellow (Default: false)}
    {bold.green --max-samples=[number]}               Set the maximum number of samples to run for each test. {yellow (Default: 10000 samples)}
    {bold.green --max-test-run-time=[number]}         Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}
    {bold.green --round-decimal-places=[number]}      Set the number of decimal places to round to. {yellow (Default: 3)}
    {bold.green --report-median(=false)?}             Enable/Disable reporting of the median time. {yellow (Default: true)}
    {bold.green --report-average(=false)?}            Enable/Disable reporting of the average time. {yellow (Default: true)}
    {bold.green --report-standard-deviation(=false)?} Enable/Disable reporting of the standard deviation. {yellow (Default: false)}
    {bold.green --report-max(=false)?}                Enable/Disable reporting of the largest run time. {yellow (Default: false)}
    {bold.green --report-min(=false)?}                Enable/Disable reporting of the smallest run time. {yellow (Default: false)}
    {bold.green --report-variance(=false)?}           Enable/Disable reporting of the variance. {yellow (Default: false)}
  `);
  } else { // run the compiler and test suite
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

    // for each pattern
    for (const pattern of include) {
      // push all the resulting files so that each file gets tested individually
      entry:
      for (const entry of glob.sync(pattern)) {
        // test for discludes
        for (const test of disclude) {
          if (test.test(entry)) continue entry;
        }
        testEntryFiles.add(entry);
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
    const entryPath = path.join(__dirname, "../assembly/index.ts");
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

        // call run buffer because it's already compiled
        runner.run(wasm);

        count -= 1;

        testCount += runner.testGroups.reduce((left, right) => left + right.tests.length, 0);
        successCount += runner.testGroups
          .reduce((left, right) => left + right.tests.filter(e => e.pass).length, 0);
        groupCount += runner.testGroups.length;
        groupSuccessCount = runner.testGroups.reduce((left, right) => left + (right.pass ? 1 : 0), groupSuccessCount);
        // if any tests failed, and they all ran, exit(1)
        if (count === 0) {
          const end = performance.now();
          const failed = testCount !== successCount;
          const result = failed
            ? chalk`{red ✖ FAIL}`
            : chalk`{green ✔ PASS}`;
          console.log("~".repeat(process.stdout.columns! - 10));
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
}
