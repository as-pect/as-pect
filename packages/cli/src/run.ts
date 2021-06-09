import * as fs from "fs";
import { performance } from "perf_hooks";
import * as path from "path";
import chalk from "chalk";
import { TestContext, IWarning, IReporter } from "@as-pect/core";
import { IConfiguration, ICompilerFlags } from "./util/IConfiguration";
import glob from "glob";
import { collectReporter } from "./util/collectReporter";
import { getTestEntryFiles } from "./util/getTestEntryFiles";
import { Options } from "./util/CommandLineArg";
import { writeFile } from "./util/writeFile";
import { ICommand } from "./worklets/ICommand";
import { timeDifference } from "@as-pect/core/lib/util/timeDifference";
import { Snapshot, SnapshotDiffResultType } from "@as-pect/snapshots";
import { removeFile } from "./util/removeFile";

/**
 * @ignore
 * This method actually runs the test suites in sequential order synchronously.
 *
 * @param {Options} cliOptions - The command line arguments.
 * @param {string[]} compilerArgs - The `asc` compiler arguments.
 */
export function run(cliOptions: Options, compilerArgs: string[]): void {
  const start = performance.now();
  const worklets: any[] = [];

  /** Collect the assemblyscript module path. */
  const assemblyScriptFolder = cliOptions.compiler.startsWith(".")
    ? path.join(process.cwd(), cliOptions.compiler)
    : cliOptions.compiler;

  /**
   * Create the compiler worklets if the worker flag is not 0.
   */
  if (cliOptions.workers !== 0) {
    const Worker = require("worker_threads").Worker;

    if (!isFinite(cliOptions.workers)) {
      console.error(
        chalk`{red [Error]} Invalid worker configuration: {yellow ${cliOptions.workers.toString()}}`,
      );
      process.exit(1);
    }

    const workletPath = require.resolve("./worklets/compiler");
    for (let i = 0; i < cliOptions.workers; i++) {
      const worklet = new Worker(workletPath, {
        workerData: {
          assemblyScriptFolder,
        },
      });
      worklets.push(worklet);
    }

    console.log(
      chalk`{bgWhite.black [Log]} Using experimental compiler worklets: {yellow ${worklets.length.toString()} worklets}`,
    );
  }

  /**
   * Instead of using `import`, the strategy is to encourage node to start the testing process
   * as soon as possible. Calling require and measuring the performance of compiler loading shows
   * developers a meaningful explaination of why it takes a few seconds for the software to start
   * running.
   */
  console.log(chalk`{bgWhite.black [Log]} Loading asc compiler`);
  let asc: any;
  let instantiateSync: any;
  let parse: any;
  let exportTable: boolean = false;
  try {
    let folderUsed = "cli";
    try {
      console.log("Assemblyscript Folder:" + assemblyScriptFolder);
      /** Next, obtain the compiler, and assert it has a main function. */
      asc = require(path.join(assemblyScriptFolder, "cli", "asc"));
    } catch (ex) {
      try {
        folderUsed = "dist";
        asc = require(path.join(assemblyScriptFolder, "dist", "asc"));
      } catch (ex) {
        throw ex;
      }
    }
    if (!asc) {
      throw new Error(
        `${cliOptions.compiler}/${folderUsed}/asc has no exports.`,
      );
    }
    if (!asc.main) {
      throw new Error(
        `${cliOptions.compiler}/${folderUsed}/asc does not export a main() function.`,
      );
    }

    /** Next, collect the loader, and assert it has an instantiateSync method. */
    let loader;
    try {
      loader = require(path.join(assemblyScriptFolder, "lib", "loader"));
    } catch (ex) {
      loader = require(path.join(assemblyScriptFolder, "lib", "loader", "umd"));
    }
    if (!loader) {
      throw new Error(`${cliOptions.compiler}/lib/loader has no exports.`);
    }
    if (!loader.instantiateSync) {
      throw new Error(
        `${cliOptions.compiler}/lib/loader does not export an instantiateSync() method.`,
      );
    }
    instantiateSync = loader.instantiateSync;

    /** Finally, collect the cli options from assemblyscript. */
    let options = require(path.join(
      assemblyScriptFolder,
      "cli",
      "util",
      "options",
    ));
    if (!options) {
      throw new Error(`${cliOptions.compiler}/cli/util/options exports null`);
    }

    if (!options.parse) {
      throw new Error(
        `${cliOptions.compiler}/cli/util/options does not export a parse() method.`,
      );
    }

    if (asc.options.exportTable) {
      exportTable = true;
    }
    parse = options.parse;
  } catch (ex) {
    console.error(
      chalk`{bgRedBright.black [Error]} There was a problem loading {bold [${cliOptions.compiler}]}.`,
    );
    console.error(ex);
    process.exit(1);
  }
  console.log(
    chalk`{bgWhite.black [Log]} Compiler loaded in {yellow ${timeDifference(
      performance.now(),
      start,
    ).toString()}ms}.`,
  );

  // obtain the configuration file
  const configurationPath = path.resolve(process.cwd(), cliOptions.config);
  console.log(
    chalk`{bgWhite.black [Log]} Using configuration {yellow ${configurationPath}}`,
  );

  let configuration: IConfiguration = {};

  try {
    configuration = require(configurationPath) || {};
  } catch (ex) {
    console.error("");
    console.error(
      chalk`{bgRedBright.black [Error]} There was a problem loading {bold [${configurationPath}]}.`,
    );
    console.error(ex);
    process.exit(1);
  }

  // configuration must be an object
  if (!configuration) {
    console.error(
      chalk`{bgRedBright.black [Error]} Configuration at {bold [${configurationPath}]} is null or not an object.`,
    );
    process.exit(1);
  }

  const include: string[] = configuration.include || [
    "assembly/__tests__/**/*.spec.ts",
  ];
  const add: string[] = configuration.add || [
    "assembly/__tests__/**/*.include.ts",
  ];

  // parse passed cli compiler arguments and determine if there are any bad arguments.
  if (compilerArgs.length > 0) {
    const output = parse(compilerArgs, asc.options);
    // if there are any unknown flags, report them and exit 1
    if (output.unknown.length > 0) {
      console.error(
        chalk`{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [${output.unknown.join(
          ", ",
        )}]}.`,
      );
      process.exit(1);
    }
  }

  // Create the compiler flags
  const flags: ICompilerFlags = Object.assign({}, configuration.flags, {
    "--debug": [],
    "--binaryFile": ["output.wasm"],
    "--explicitStart": [],
  });

  if (
    !flags["--use"] ||
    flags["--use"].includes("ASC_RTRACE=1") ||
    !compilerArgs.includes("ASC_RTRACE=1")
  ) {
    if (!flags["--use"]) {
      flags["--use"] = ["ASC_RTRACE=1"];
      // inspect to see if the flag is used already
    } else if (!flags["--use"].includes("ASC_RTRACE=1")) {
      flags["--use"].push("--use", "ASC_RTRACE=1");
    }
  }

  /** If the export table flag exists on the cli options, use the export table flag. */
  if (exportTable) {
    flags["--exportTable"] = [];
  }

  /** Always import the memory now so that we expose the WebAssembly.Memory object to imports. */
  flags["--importMemory"] = [];

  /** It's useful to notify the user that optimizations will make test compile times slower. */
  if (
    flags.hasOwnProperty("-O3") ||
    flags.hasOwnProperty("-O2") ||
    flags.hasOwnProperty("--optimize") ||
    compilerArgs.includes("-O3") ||
    compilerArgs.includes("-O2") ||
    compilerArgs.includes("--optimize")
  ) {
    console.log(
      chalk`{yellow [Warning]} Using optimizations. This may result in slow test compilation times.`,
    );
  }

  const disclude: RegExp[] = configuration.disclude || [];

  // if a reporter is specified in cli arguments, override configuration
  const reporter: IReporter =
    configuration.reporter || collectReporter(cliOptions);

  // include all the file globs
  console.log(
    chalk`{bgWhite.black [Log]} Including files: ${include.join(", ")}`,
  );

  // Create the test and group matchers
  const testRegex = new RegExp(cliOptions.test, "i");
  configuration.testRegex = testRegex;
  console.log(
    chalk`{bgWhite.black [Log]} Running tests that match: {yellow ${testRegex.source}}`,
  );

  const groupRegex = new RegExp(cliOptions.group, "i");
  configuration.groupRegex = groupRegex;
  console.log(
    chalk`{bgWhite.black [Log]} Running groups that match: {yellow ${groupRegex.source}}`,
  );

  /**
   * Check to see if the binary files should be written to the fileSystem.
   */
  const outputBinary =
    (cliOptions.changed.has("outputBinary")
      ? cliOptions.outputBinary
      : configuration.outputBinary) ?? false;

  if (outputBinary) {
    console.log(chalk`{bgWhite.black [Log]} Outputing Binary *.wasm files.`);
  }

  /**
   * Check to see if the tests should be run in the first place.
   */
  const runTests = !cliOptions.norun;
  if (!runTests) {
    console.log(
      chalk`{bgWhite.black [Log]} Not running tests, only outputting files.`,
    );
  }

  /**
   * Check for memory flags from the cli options.
   */
  const memorySize =
    (cliOptions.changed.has("memorySize")
      ? cliOptions.memorySize
      : configuration.memorySize) ?? 10;
  const memoryMax =
    (cliOptions.changed.has("memoryMax")
      ? cliOptions.memoryMax
      : configuration.memoryMax) ?? -1;

  if (!Number.isInteger(memorySize) || memorySize <= 0) {
    console.error(
      chalk`{red [Error]} Invalid {yellow memorySize} value (${memorySize}) [valid range is a positive interger]`,
    );
    process.exit(1);
  }

  if (!Number.isInteger(memoryMax) || memoryMax < -1) {
    console.error(
      chalk`{red [Error]} Invalid {yellow memoryMax} value (${memoryMax}) [valid range is a positive interger greater than {yellow memorySize}]`,
    );
    process.exit(1);
  }

  if (memoryMax > 0 && memoryMax < memorySize) {
    console.error(
      chalk`{red [Error]} Invalid module memory configuration, memorySize (${memorySize}) is greater than memoryMax (${memoryMax}).`,
    );
    process.exit(1);
  }

  /**
   * Add the proper trasform.
   */
  flags["--transform"] = flags["--transform"] || [];
  flags["--transform"].push(require.resolve("@as-pect/core/lib/transform"));

  /**
   * Concatenate compiler flags.
   */
  if (compilerArgs.length > 0) {
    console.log(
      chalk`{bgWhite.black [Log]} Adding compiler arguments: ` +
        compilerArgs.join(" "),
    );
  }

  const addedTestEntryFiles = new Set<string>();

  /** Get all the test entry files. */
  const testEntryFiles = getTestEntryFiles(cliOptions, include, disclude);

  if (testEntryFiles.size === 0) {
    console.error(
      chalk`{red [Error]} No files matching the pattern were found.`,
    );
    process.exit(1);
  }

  for (const pattern of add) {
    // push all the added files to the added entry point list
    for (const entry of glob.sync(pattern)) {
      addedTestEntryFiles.add(entry);
    }
  }

  // If another extension is used create copy of assembly/**/*.ts files
  if (flags["--extension"]) {
    console.log(chalk`{bgWhite.black [Log]} Changing extension for injected assembly files`);
    const newExt = flags["--extension"][0].replace(".", ""); // withoud dot should work
    const dirs = [
      path.resolve(__dirname, "../../assembly/assembly"),
      path.resolve(__dirname, "../../assembly/assembly/internal"),
      path.resolve(__dirname, "../../assembly/assembly/internal/comparison")
    ];
    dirs.forEach(dir => {
      const files = fs.readdirSync(dir);
      files.forEach(file => {
        if (path.extname(file) === ".ts") {
          const filename = file.split('.').slice(0, -1).join('.');
          const newpath = `${dir}/${filename}.${newExt}`;
          if (!fs.existsSync(newpath)) {
            fs.copyFileSync(`${dir}/${file}`, newpath);
          }
        }
      });
    });
  }

  // must include the assembly/index.ts file located in the assembly package
  const entryExt = !flags["--extension"] ? "ts" : flags["--extension"][0].replace(".", "");
  const entryPath = require.resolve("@as-pect/assembly/assembly/index." + entryExt);
  const relativeEntryPath = path.relative(process.cwd(), entryPath);

  // add the relativeEntryPath of as-pect to the list of compiled files for each test
  addedTestEntryFiles.add(relativeEntryPath);

  // Create a test runner, and run each test
  let count = testEntryFiles.size;

  // create the array of compiler flags from the flags object
  const flagList: string[] = Object.entries(flags)
    .reduce(
      (args: string[], [flag, options]) =>
        args.concat(
          flag,
          options.length == 0 || typeof options == "string"
            ? options
            : options.join(","),
        ),
      [],
    )
    .concat(compilerArgs);

  let testCount = 0;
  let successCount = 0;
  let groupSuccessCount = 0;
  let groupCount = 0;
  let errors: IWarning[] = [];
  let filePromises: Promise<void>[] = [];
  let failed = false;

  const folderMap = new Map<string, string[]>();
  const fileMap = new Map<string, string>();
  console.log(chalk`{bgWhite.black [Log]} Effective command line args:`);
  console.log(
    chalk`  {green [TestFile.ts]} {yellow ${Array.from(
      addedTestEntryFiles,
    ).join(" ")}} ${flagList.join(" ")}`,
  );

  // add a line seperator between the next line and this line
  console.log("");

  const finalCompilerArguments = [
    ...Array.from(addedTestEntryFiles),
    ...flagList,
  ];

  function runBinary(
    error: Error | null,
    file: string,
    binary: Uint8Array,
  ): number {
    // if there are any compilation errors, stop the test suite
    if (error) {
      console.error(
        chalk`{red [Error]} There was a compilation error when trying to create the wasm binary for file: ${file}.`,
      );
      console.error(error);
      return process.exit(1);
    }

    // if the binary wasn't emitted, stop the test suite
    if (!binary) {
      console.error(
        chalk`{red [Error]} There was no output binary file: ${file}. Did you forget to emit the binary with {yellow --binaryFile}?`,
      );
      return process.exit(1);
    }

    if (runTests) {
      // get the folder and test basename
      const testFolderName = path.dirname(file);
      const testBaseName = path.basename(file, path.extname(file));

      const snapshotFolder = path.resolve(
        path.join(testFolderName, "__snapshots__"),
      );

      // collect the expected snapshots
      const snapshotsLocation = path.join(
        snapshotFolder,
        testBaseName + ".snap",
      );

      let wasi: import("wasi").WASI | null = null;
      if (configuration.wasi) {
        const { WASI } = require("wasi");
        wasi = new WASI(configuration.wasi);
      }
      // create a test runner
      const runner = new TestContext({
        fileName: file,
        groupRegex: configuration.groupRegex,
        testRegex: configuration.testRegex,
        reporter,
        binary,
        snapshots: fs.existsSync(snapshotsLocation)
          ? Snapshot.parse(fs.readFileSync(snapshotsLocation, "utf8"))
          : new Snapshot(),
        wasi,
      });

      // detect custom imports
      const customImportFileLocation = path.resolve(
        path.join(testFolderName, testBaseName + ".imports.js"),
      );

      const configurationImports = fs.existsSync(customImportFileLocation)
        ? require(customImportFileLocation)
        : configuration!.imports ?? {};

      const memoryDescriptor: WebAssembly.MemoryDescriptor = {
        initial: memorySize,
      };

      if (memoryMax > 0) {
        memoryDescriptor.maximum = memoryMax;
      }

      const memory = new WebAssembly.Memory(memoryDescriptor);

      let result: any;

      if (typeof configurationImports === "function") {
        const createImports = runner.createImports.bind(runner, {
          env: { memory },
        });
        result = configurationImports(
          memory,
          createImports,
          instantiateSync,
          binary,
        );
        if (!result) {
          console.error(
            chalk`{red [Error]} Imports configuration function did not return an AssemblyScript module. (Did you forget to return it?)`,
          );
          process.exit(1);
        }
      } else {
        const imports = runner.createImports(configurationImports);
        imports.env.memory = memory;
        result = instantiateSync(binary, imports);
      }

      if (runner.errors.length > 0) {
        errors.push(...runner.errors);
      } else {
        // call run buffer because it's already compiled
        runner.run(result);
        const runnerTestCount = runner.testCount;
        const runnerTestPassCount = runner.testPassCount;
        const runnerGroupCount = runner.groupCount;
        const runnerGroupPassCount = runner.groupPassCount;

        // a snapshot may have failed or a test may have failed
        if (!runner.pass) {
          // if we are updating snapshots
          if (cliOptions.update) {
            // check the pass count, because we are ignoring snapshot results
            if (
              runnerTestCount !== runnerTestPassCount ||
              runnerGroupCount !== runnerGroupPassCount
            ) {
              failed = true;
            }
          } else {
            failed = true;
          }
        }

        // statistics
        testCount += runnerTestCount;
        successCount += runnerTestPassCount;
        groupCount += runnerGroupCount;
        groupSuccessCount += runnerGroupPassCount;

        errors.push(...runner.errors); // if there are any errors, add them

        // if the update flag was passed, update the snapshots
        if (cliOptions.update) {
          const snapshots = runner.snapshots;
          if (snapshots.values.size > 0) {
            const output = snapshots.stringify();
            if (!fs.existsSync(snapshotFolder)) fs.mkdirSync(snapshotFolder);
            filePromises.push(writeFile(snapshotsLocation, output));
          } else {
            if (fs.existsSync(snapshotsLocation)) {
              filePromises.push(removeFile(snapshotsLocation));
            }
          }
        } else {
          // check for any added snapshots
          const result = runner.expectedSnapshots;
          const diff = runner.snapshotDiff;
          for (const [name, diffResult] of diff!.results.entries()) {
            if (diffResult.type === SnapshotDiffResultType.Added) {
              result.values.set(name, diffResult.left!);
            }
          }

          // if there are any snapshots to report, report them
          if (result.values.size > 0) {
            const output = result.stringify();
            if (!fs.existsSync(snapshotFolder)) fs.mkdirSync(snapshotFolder);
            filePromises.push(writeFile(snapshotsLocation, output));
          }
        }
      }
    }

    count -= 1;

    // if any tests failed, and they all ran, exit(1)
    if (count === 0) {
      if (runTests) {
        const end = performance.now();
        failed = failed || errors.length > 0;
        const result = failed ? chalk`{red ✖ FAIL}` : chalk`{green ✔ PASS}`;

        for (const error of errors) {
          console.log(chalk`
 [Error]: {red ${error.type}}: ${error.message}
 [Stack]: {yellow ${error.stackTrace.split("\n").join("\n            ")}}
`);
        }
        console.log(chalk`  [Result]: ${result}
   [Files]: ${testEntryFiles.size.toString()} total
  [Groups]: ${groupCount.toString()} count, ${groupSuccessCount.toString()} pass
   [Tests]: ${successCount.toString()} pass, ${(
          testCount - successCount
        ).toString()} fail, ${testCount.toString()} total
    [Time]: ${timeDifference(end, start).toString()}ms`);

        if (worklets.length > 0) {
          for (const worklet of worklets) {
            worklet.terminate();
          }
        }
      }

      Promise.all(filePromises).then(() => {
        if (failed) {
          console.error(errors);
          process.exit(1);
        }
      });
    }
    return 0;
  }

  if (worklets.length > 0) {
    let i = 0;
    let length = worklets.length;
    for (const entry of Array.from(testEntryFiles)) {
      const workload: ICommand = {
        type: "compile",
        props: {
          file: entry,
          args: [entry, ...finalCompilerArguments],
          outputBinary,
        },
      };

      worklets[i % length].postMessage(workload);
    }

    worklets.forEach((worklet) => {
      worklet.on("message", (e: ICommand) => {
        runBinary(e.props.error, e.props.file, e.props.binary);
      });
    });
  } else {
    // for each file, synchronously run each test
    Array.from(testEntryFiles).forEach((file: string) => {
      let binary: Uint8Array;

      asc.main(
        [file, ...finalCompilerArguments],
        {
          stdout: process.stdout as any, // use any type to quelch error
          stderr: process.stderr as any,
          listFiles(dirname: string, baseDir: string): string[] {
            const folder = path.join(baseDir, dirname);
            if (folderMap.has(folder)) {
              return folderMap.get(folder)!;
            }

            try {
              const results = fs
                .readdirSync(folder)
                .filter((file) => /^(?!.*\.d\.ts$).*\.ts$/.test(file));
              folderMap.set(folder, results);
              return results;
            } catch (e) {
              return [];
            }
          },
          readFile(filename: string, baseDir: string) {
            const fileName = path.join(baseDir, filename);
            if (fileMap.has(fileName)) {
              return fileMap.get(fileName)!;
            }

            try {
              const contents = fs.readFileSync(fileName, { encoding: "utf8" });
              fileMap.set(fileName, contents);
              return contents;
            } catch (e) {
              return null;
            }
          },
          writeFile(name: string, contents: Uint8Array, baseDir: string = ".") {
            const ext = path.extname(name);

            // get the wasm file
            if (ext === ".wasm") {
              binary = contents;
              if (!outputBinary) return;
            } else if (ext === ".ts") {
              filePromises.push(writeFile(path.join(baseDir, name), contents));
              return;
            }

            const outfileName = path.join(
              path.dirname(file),
              path.basename(file, path.extname(file)) + ext,
            );
            filePromises.push(writeFile(outfileName, contents));
          },
        },
        (error: any) => runBinary(error, file, binary),
      );
    });
  }
}
