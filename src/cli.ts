
import chalk from "chalk";
import path from "path";
import { IConfiguration } from "./util/IConfiguration";
import glob from "glob";
import yargsparser from "yargs-parser";
import uniq from "lodash.uniq";

// import { TestRunner } from "./test/TestRunner";
import asc from "assemblyscript/cli/asc";
import { TestRunner } from "./test/TestRunner";
import fs from "fs";
import { DefaultReporter } from "./reporter/DefaultReporter";

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
    const typesFileSource = path.join(__dirname, "..", "init", "as-pect.d.ts");
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

    // obtain the configuration file
    const configurationPath = path.resolve(
      process.cwd(),
      (yargs.argv.c as string) || (yargs.argv.config as string) || "./as-pect.config.js",
    );
    console.log(chalk`{bgWhite.black [Log]} using configuration ${configurationPath}`);

    let configuration: IConfiguration | null = null;

    try {
      configuration = require(configurationPath);
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

    const reporter = configuration!.reporter || new DefaultReporter();
    // include all the file globs
    reporter.onLog(null, chalk`including files ${configuration!.include.join(", ")}`);

    let files: string[] = [];

    // for each pattern
    for (const pattern of configuration!.include) {

      // push all the resulting files
      files.push(...glob.sync(pattern));
    }

    // remove duplicate file locations
    files = uniq(files);

    // run the regex tests to find excluded tests
    const disclude: RegExp[] = configuration!.disclude || [];
    disclude.forEach(regexp => {
      files = files.filter(file => !regexp.test(file));
    });;

    // loop over each file and create a binary, index it on binaries
    let binaries: { [i: number]: Uint8Array } = {};

    // must include the assembly/index.ts file located in the package
    const entryPath = path.join(__dirname, "../assembly/index.ts");
    const relativeEntryPath = path.relative(process.cwd(), entryPath);

    // Create a test runner, and run each test
    let failed = false;
    let count = files.length;
    const runner = new TestRunner();

    // for each file, synchronously run each test
    files.forEach((file: string, i: number) => {
      reporter.onLog(null, chalk`Compiling: ${file} ${(i + 1).toString()} / ${files.length.toString()}`);

      // TODO: add compiler options?
      asc.main([
        file, relativeEntryPath,
        "--validate",
        "--debug",
        "--measure",
        "--binaryFile", "output.wasm",
      ], {
        // @ts-ignore: this is fine
        stdout: process.stdout,
        // @ts-ignore: this is fine
        stderr: process.stderr,
        writeFile(name: string, contents: Uint8Array) {
          // get the wasm file
          if (path.extname(name) === ".wasm") {
            binaries[i] = contents;
          }
        }
      }, function (error: Error): void {
        // if there are any compilation errors, stop the test suite
        if (error) {
          reporter.onLog(null, chalk`There was a compilation error when trying to create the wasm binary for file: ${file}.`);
          console.error(error);
          process.exit(1);
          return;
        }

        // if the binary wasn't emitted, stop the test suite
        if (!binaries[i]) {
          reporter.onLog(null, chalk`There was no output binary file: ${file}. Did you forget to emit the binary?`);
          process.exit(1);
          return;
        }

        // call run buffer because it's already compiled
        runner.runBuffer(
          file,
          binaries[i],
          Object.assign({}, configuration!.imports),
          configuration!.reporter || void 0,
        );

        count -= 1;
        failed = failed || !runner.passed;

        // if any tests failed, and they all ran, exit(1)
        if (count === 0 && failed) {
          process.exit(1);
        }
      });
    });
  }
}
