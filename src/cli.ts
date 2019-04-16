
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

  // init script
  if (yargs.argv.i || yargs.argv.init) {
    console.log("");
    console.log(chalk`[Log] Initializing test suite files.`);
    console.log("");

    // create the assembly folder if it doesn't exist
    const assemblyFolder = path.join(process.cwd(), "assembly");
    if (!fs.existsSync(assemblyFolder)) {
      console.log(chalk`[Log] Creating folder: ./assembly/`);
      fs.mkdirSync(assemblyFolder);
    }

    // Create the test folder if it doesn't exist
    const testFolder = path.join(process.cwd(), "assembly", "__tests__");
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
    const typesFileSource = path.join(__dirname, "..", "assembly", "__tests__", "as-pect.d.ts");
    const typesFile = path.join(testFolder, "as-pect.d.ts");
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
    {bold.green asp} --config as-pect.config.js
    {bold.green asp} -c as-pect.config.js
    {bold.green asp} --init
    {bold.green asp} -i
    {bold.green asp} --version
    {bold.green asp} -v

  {bold.blueBright OPTIONS}
    {bold.green --version, -v}         Prints the package version and exits.
    {bold.green --help, -h}            Prints this message and exits.
    {bold.green --config, -c}          Accepts a configuration file and runs the tests.
    {bold.green --init, -i}            Creates a test config, an assembly/__tests__ folder and exits.
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
    const reporter: TestReporter = configuration.reporter || new DefaultTestReporter();

    // include all the file globs
    console.log(`including files ${include.join(", ")}`);

    let testEntryFiles: Set<string> = new Set<string>();
    let addedTestEntryFiles: Set<string> = new Set<string>();


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
    let failed = false;
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
      console.log(`Compiling: ${file} ${(i + 1).toString()} / ${testEntryFiles.size.toString()}`);

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

        const runner = new TestContext();
        const imports = runner.createImports(configuration!.imports || {});
        const wasm = instantiateBuffer(binaries[i], imports);

        // call run buffer because it's already compiled
        runner.run(wasm, reporter, file);

        count -= 1;
        failed = failed || !runner.pass;

        testCount += runner.testGroups.reduce((left, right) => left + right.tests.length, 0);
        successCount += runner.testGroups
          .reduce((left, right) => left + right.tests.filter(e => e.pass).length, 0);
        groupCount += runner.testGroups.length;
        groupSuccessCount = runner.testGroups.reduce((left, right) => left + (right.pass ? 1 : 0), groupSuccessCount);
        // if any tests failed, and they all ran, exit(1)
        if (count === 0) {
          const end = performance.now();
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
