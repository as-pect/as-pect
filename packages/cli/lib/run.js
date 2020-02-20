var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "fs", "perf_hooks", "path", "chalk", "@as-pect/core", "glob", "./util/collectReporter", "./util/getTestEntryFiles", "./util/writeFile", "@as-pect/core/lib/util/timeDifference"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var fs = __importStar(require("fs"));
    var perf_hooks_1 = require("perf_hooks");
    var path = __importStar(require("path"));
    var chalk_1 = __importDefault(require("chalk"));
    var core_1 = require("@as-pect/core");
    var glob_1 = __importDefault(require("glob"));
    var collectReporter_1 = require("./util/collectReporter");
    var getTestEntryFiles_1 = require("./util/getTestEntryFiles");
    var writeFile_1 = require("./util/writeFile");
    var timeDifference_1 = require("@as-pect/core/lib/util/timeDifference");
    /**
     * @ignore
     * This method actually runs the test suites in sequential order synchronously.
     *
     * @param {Options} cliOptions - The command line arguments.
     * @param {string[]} compilerArgs - The `asc` compiler arguments.
     */
    function run(cliOptions, compilerArgs) {
        var _a, _b, _c;
        var start = perf_hooks_1.performance.now();
        var worklets = [];
        /** Collect the assemblyscript module path. */
        var assemblyScriptFolder = cliOptions.compiler.startsWith(".")
            ? path.join(process.cwd(), cliOptions.compiler)
            : cliOptions.compiler;
        /**
         * Create the compiler worklets if the worker flag is not 0.
         */
        if (cliOptions.workers !== 0) {
            var Worker_1 = require("worker_threads").Worker;
            if (!isFinite(cliOptions.workers)) {
                console.error(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{red [Error]} Invalid worker configuration: {yellow ", "}"], ["{red [Error]} Invalid worker configuration: {yellow ", "}"])), cliOptions.workers.toString()));
                process.exit(1);
            }
            var workletPath = require.resolve("./worklets/compiler");
            for (var i = 0; i < cliOptions.workers; i++) {
                var worklet = new Worker_1(workletPath, {
                    workerData: {
                        assemblyScriptFolder: assemblyScriptFolder,
                    },
                });
                worklets.push(worklet);
            }
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgWhite.black [Log]} Using experimental compiler worklets: {yellow ", " worklets}"], ["{bgWhite.black [Log]} Using experimental compiler worklets: {yellow ", " worklets}"])), worklets.length.toString()));
        }
        /**
         * Instead of using `import`, the strategy is to encourage node to start the testing process
         * as soon as possible. Calling require and measuring the performance of compiler loading shows
         * developers a meaningful explaination of why it takes a few seconds for the software to start
         * running.
         */
        console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Loading asc compiler"], ["{bgWhite.black [Log]} Loading asc compiler"]))));
        var asc;
        var instantiateSync;
        var parse;
        var exportTable = false;
        try {
            var folderUsed = "cli";
            try {
                /** Next, obtain the compiler, and assert it has a main function. */
                asc = require(path.join(assemblyScriptFolder, "cli", "asc"));
            }
            catch (ex) {
                try {
                    folderUsed = "dist";
                    asc = require(path.join(assemblyScriptFolder, "dist", "asc"));
                }
                catch (ex) {
                    throw ex;
                }
            }
            if (!asc) {
                throw new Error(cliOptions.compiler + "/" + folderUsed + "/asc has no exports.");
            }
            if (!asc.main) {
                throw new Error(cliOptions.compiler + "/" + folderUsed + "/asc does not export a main() function.");
            }
            /** Next, collect the loader, and assert it has an instantiateSync method. */
            var loader = require(path.join(assemblyScriptFolder, "lib", "loader"));
            if (!loader) {
                throw new Error(cliOptions.compiler + "/lib/loader has no exports.");
            }
            if (!loader.instantiateSync) {
                throw new Error(cliOptions.compiler + "/lib/loader does not export an instantiateSync() method.");
            }
            instantiateSync = loader.instantiateSync;
            /** Finally, collect the cli options from assemblyscript. */
            var options = require(path.join(assemblyScriptFolder, "cli", "util", "options"));
            if (!options) {
                throw new Error(cliOptions.compiler + "/cli/util/options exports null");
            }
            if (!options.parse) {
                throw new Error(cliOptions.compiler + "/cli/util/options does not export a parse() method.");
            }
            if (asc.options.exportTable) {
                exportTable = true;
            }
            parse = options.parse;
        }
        catch (ex) {
            console.error(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), cliOptions.compiler));
            console.error(ex);
            process.exit(1);
        }
        console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgWhite.black [Log]} Compiler loaded in {yellow ", "ms}."], ["{bgWhite.black [Log]} Compiler loaded in {yellow ",
            "ms}."])), timeDifference_1.timeDifference(perf_hooks_1.performance.now(), start).toString()));
        // obtain the configuration file
        var configurationPath = path.resolve(process.cwd(), cliOptions.config);
        console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Using configuration {yellow ", "}"], ["{bgWhite.black [Log]} Using configuration {yellow ", "}"])), configurationPath));
        var configuration = {};
        try {
            configuration = require(configurationPath) || {};
        }
        catch (ex) {
            console.error("");
            console.error(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
            console.error(ex);
            process.exit(1);
        }
        // configuration must be an object
        if (!configuration) {
            console.error(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."])), configurationPath));
            process.exit(1);
        }
        var include = configuration.include || [
            "assembly/__tests__/**/*.spec.ts",
        ];
        var add = configuration.add || [
            "assembly/__tests__/**/*.include.ts",
        ];
        // parse passed cli compiler arguments and determine if there are any bad arguments.
        if (compilerArgs.length > 0) {
            var output = parse(compilerArgs, asc.options);
            // if there are any unknown flags, report them and exit 1
            if (output.unknown.length > 0) {
                console.error(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [", "]}."], ["{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [",
                    "]}."])), output.unknown.join(", ")));
                process.exit(1);
            }
        }
        // Create the compiler flags
        var flags = Object.assign({}, configuration.flags, {
            "--validate": [],
            "--debug": [],
            "--binaryFile": ["output.wasm"],
            "--explicitStart": [],
        });
        /**
         * Check to see if rtrace is disabled.
         */
        if (cliOptions.nortrace) {
            configuration.nortrace = true;
        }
        /** RTrace is enabled, and the --use ASC_RTRACE=1 cli option must be present. */
        if (!configuration.nortrace) {
            if (!flags["--use"] ||
                flags["--use"].includes("ASC_RTRACE=1") ||
                !compilerArgs.includes("ASC_RTRACE=1")) {
                if (!flags["--use"]) {
                    flags["--use"] = ["ASC_RTRACE=1"];
                    // inspect to see if the flag is used already
                }
                else if (!flags["--use"].includes("ASC_RTRACE=1")) {
                    flags["--use"].push("--use", "ASC_RTRACE=1");
                }
            }
        }
        /** If the export table flag exists on the cli options, use the export table flag. */
        if (exportTable) {
            flags["--exportTable"] = [];
        }
        /** Always import the memory now so that we expose the WebAssembly.Memory object to imports. */
        flags["--importMemory"] = [];
        /** It's useful to notify the user that optimizations will make test compile times slower. */
        if (flags.hasOwnProperty("-O3") ||
            flags.hasOwnProperty("-O2") ||
            flags.hasOwnProperty("--optimize") ||
            compilerArgs.includes("-O3") ||
            compilerArgs.includes("-O2") ||
            compilerArgs.includes("--optimize")) {
            console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{yellow [Warning]} Using optimizations. This may result in slow test compilation times."], ["{yellow [Warning]} Using optimizations. This may result in slow test compilation times."]))));
        }
        var disclude = configuration.disclude || [];
        // if a reporter is specified in cli arguments, override configuration
        var reporter = configuration.reporter || collectReporter_1.collectReporter(cliOptions);
        if (configuration.performance) {
            Object.getOwnPropertyNames(configuration.performance).forEach(function (option) {
                if (cliOptions.changed.has("performance." + option)) {
                    cliOptions.performance[option] = configuration.performance[option];
                }
            });
        }
        var performanceConfiguration = cliOptions.performance;
        // include all the file globs
        console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{bgWhite.black [Log]} Including files: ", ""], ["{bgWhite.black [Log]} Including files: ", ""])), include.join(", ")));
        // Create the test and group matchers
        var testRegex = new RegExp(cliOptions.test, "i");
        configuration.testRegex = testRegex;
        console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{bgWhite.black [Log]} Running tests that match: {yellow ", "}"], ["{bgWhite.black [Log]} Running tests that match: {yellow ", "}"])), testRegex.source));
        var groupRegex = new RegExp(cliOptions.group, "i");
        configuration.groupRegex = groupRegex;
        console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{bgWhite.black [Log]} Running groups that match: {yellow ", "}"], ["{bgWhite.black [Log]} Running groups that match: {yellow ", "}"])), groupRegex.source));
        /**
         * Check to see if the binary files should be written to the fileSystem.
         */
        var outputBinary = (_a = (cliOptions.changed.has("outputBinary")
            ? cliOptions.outputBinary
            : configuration.outputBinary), (_a !== null && _a !== void 0 ? _a : false));
        if (outputBinary) {
            console.log(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{bgWhite.black [Log]} Outputing Binary *.wasm files."], ["{bgWhite.black [Log]} Outputing Binary *.wasm files."]))));
        }
        /**
         * If rtrace is enabled, add `--use ASC_RTRACE=1` to the command line parameters.
         */
        if (configuration.nortrace) {
            console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{bgWhite.black [Log]} Reference Tracing is disabled."], ["{bgWhite.black [Log]} Reference Tracing is disabled."]))));
        }
        /**
         * Check to see if the tests should be run in the first place.
         */
        var runTests = !cliOptions.norun;
        if (!runTests) {
            console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{bgWhite.black [Log]} Not running tests, only outputting files."], ["{bgWhite.black [Log]} Not running tests, only outputting files."]))));
        }
        /**
         * Check for memory flags from the cli options.
         */
        var memorySize = (_b = (cliOptions.changed.has("memorySize")
            ? cliOptions.memorySize
            : configuration.memorySize), (_b !== null && _b !== void 0 ? _b : 10));
        var memoryMax = (_c = (cliOptions.changed.has("memoryMax")
            ? cliOptions.memoryMax
            : configuration.memoryMax), (_c !== null && _c !== void 0 ? _c : -1));
        if (!Number.isInteger(memorySize) || memorySize <= 0) {
            console.error(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["{red [Error]} Invalid {yellow memorySize} value (", ") [valid range is a positive interger]"], ["{red [Error]} Invalid {yellow memorySize} value (", ") [valid range is a positive interger]"])), memorySize));
            process.exit(1);
        }
        if (!Number.isInteger(memoryMax) || memoryMax < -1) {
            console.error(chalk_1.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{red [Error]} Invalid {yellow memoryMax} value (", ") [valid range is a positive interger greater than {yellow memorySize}]"], ["{red [Error]} Invalid {yellow memoryMax} value (", ") [valid range is a positive interger greater than {yellow memorySize}]"])), memoryMax));
            process.exit(1);
        }
        if (memoryMax > 0 && memoryMax < memorySize) {
            console.error(chalk_1.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["{red [Error]} Invalid module memory configuration, memorySize (", ") is greater than memoryMax (", ")."], ["{red [Error]} Invalid module memory configuration, memorySize (", ") is greater than memoryMax (", ")."])), memorySize, memoryMax));
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
            console.log(chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{bgWhite.black [Log]} Adding compiler arguments: "], ["{bgWhite.black [Log]} Adding compiler arguments: "]))) +
                compilerArgs.join(" "));
        }
        var addedTestEntryFiles = new Set();
        /** Get all the test entry files. */
        var testEntryFiles = getTestEntryFiles_1.getTestEntryFiles(cliOptions, include, disclude);
        for (var _i = 0, add_1 = add; _i < add_1.length; _i++) {
            var pattern = add_1[_i];
            // push all the added files to the added entry point list
            for (var _d = 0, _e = glob_1.default.sync(pattern); _d < _e.length; _d++) {
                var entry = _e[_d];
                addedTestEntryFiles.add(entry);
            }
        }
        // must include the assembly/index.ts file located in the assembly package
        var entryPath = require.resolve("@as-pect/assembly/assembly/index.ts");
        var relativeEntryPath = path.relative(process.cwd(), entryPath);
        // add the relativeEntryPath of as-pect to the list of compiled files for each test
        addedTestEntryFiles.add(relativeEntryPath);
        // Create a test runner, and run each test
        var count = testEntryFiles.size;
        // create the array of compiler flags from the flags object
        var flagList = Object.entries(flags)
            .reduce(function (args, _a) {
            var flag = _a[0], options = _a[1];
            return args.concat(flag, options.length == 0 || typeof options == "string"
                ? options
                : options.join(","));
        }, [])
            .concat(compilerArgs);
        var testCount = 0;
        var successCount = 0;
        var groupSuccessCount = 0;
        var groupCount = 0;
        var errors = [];
        var filePromises = [];
        var failed = false;
        var folderMap = new Map();
        var fileMap = new Map();
        console.log(chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{bgWhite.black [Log]} Effective command line args:"], ["{bgWhite.black [Log]} Effective command line args:"]))));
        console.log(chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["  {green [TestFile.ts]} {yellow ", "} ", ""], ["  {green [TestFile.ts]} {yellow ",
            "} ", ""])), Array.from(addedTestEntryFiles).join(" "), flagList.join(" ")));
        // add a line seperator between the next line and this line
        console.log("");
        var finalCompilerArguments = __spreadArrays(Array.from(addedTestEntryFiles), flagList);
        function runBinary(error, file, binary) {
            var _a;
            // if there are any compilation errors, stop the test suite
            if (error) {
                console.error(chalk_1.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
                console.error(error);
                return process.exit(1);
            }
            // if the binary wasn't emitted, stop the test suite
            if (!binary) {
                console.error(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"], ["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"])), file));
                return process.exit(1);
            }
            if (runTests) {
                // create a test runner
                var runner = new core_1.TestContext({
                    fileName: file,
                    groupRegex: configuration.groupRegex,
                    testRegex: configuration.testRegex,
                    performanceConfiguration: performanceConfiguration,
                    reporter: reporter,
                    binary: binary,
                });
                // detect custom imports
                var customImportFileLocation = path.resolve(path.join(path.dirname(file), path.basename(file, path.extname(file)) + ".imports.js"));
                var configurationImports = fs.existsSync(customImportFileLocation)
                    ? require(customImportFileLocation)
                    : (_a = configuration.imports, (_a !== null && _a !== void 0 ? _a : {}));
                var memoryDescriptor = {
                    initial: memorySize,
                };
                if (memoryMax > 0) {
                    memoryDescriptor.maximum = memoryMax;
                }
                var memory = new WebAssembly.Memory(memoryDescriptor);
                var stagedImports = typeof configurationImports === "function"
                    ? configurationImports(memory)
                    : configurationImports;
                var imports = runner.createImports(stagedImports);
                imports.env.memory = memory;
                // instantiate the module
                var wasm = instantiateSync(binary, imports);
                if (runner.errors.length > 0) {
                    errors.push.apply(errors, runner.errors);
                }
                else {
                    // call run buffer because it's already compiled
                    runner.run(wasm);
                    testCount += runner.testGroups.reduce(function (left, right) { return left + right.tests.length; }, 0);
                    successCount += runner.testGroups.reduce(function (left, right) { return left + right.tests.filter(function (e) { return e.pass; }).length; }, 0);
                    groupCount += runner.testGroups.length;
                    groupSuccessCount = runner.testGroups.reduce(function (left, right) { return left + (right.pass ? 1 : 0); }, groupSuccessCount);
                    errors.push.apply(errors, runner.errors); // if there are any runtime allocation errors add them
                }
            }
            count -= 1;
            // if any tests failed, and they all ran, exit(1)
            if (count === 0) {
                if (runTests) {
                    var end = perf_hooks_1.performance.now();
                    failed = testCount !== successCount || errors.length > 0;
                    var result = failed ? chalk_1.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_1.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                    console.log("~".repeat(Math.max(process.stdout.columns - 10, 10)));
                    for (var _i = 0, errors_1 = errors; _i < errors_1.length; _i++) {
                        var error_1 = errors_1[_i];
                        console.log(chalk_1.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"], ["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"])), error_1.type, error_1.message, error_1.stackTrace.split("\n").join("\n            ")));
                    }
                    console.log(chalk_1.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["\n  [Result]: ", "\n   [Files]: ", " total\n  [Groups]: ", " count, ", " pass\n   [Tests]: ", " pass, ", " fail, ", " total\n    [Time]: ", "ms"], ["\n  [Result]: ", "\n   [Files]: ", " total\n  [Groups]: ", " count, ", " pass\n   [Tests]: ", " pass, ",
                        " fail, ", " total\n    [Time]: ", "ms"])), result, testEntryFiles.size.toString(), groupCount.toString(), groupSuccessCount.toString(), successCount.toString(), (testCount - successCount).toString(), testCount.toString(), timeDifference_1.timeDifference(end, start).toString()));
                    if (worklets.length > 0) {
                        for (var _b = 0, worklets_1 = worklets; _b < worklets_1.length; _b++) {
                            var worklet = worklets_1[_b];
                            worklet.terminate();
                        }
                    }
                }
                Promise.all(filePromises).then(function () {
                    if (failed)
                        process.exit(1);
                });
            }
            return 0;
        }
        if (worklets.length > 0) {
            var i = 0;
            var length_1 = worklets.length;
            for (var _f = 0, _g = Array.from(testEntryFiles); _f < _g.length; _f++) {
                var entry = _g[_f];
                var workload = {
                    type: "compile",
                    props: {
                        file: entry,
                        args: __spreadArrays([entry], finalCompilerArguments),
                        outputBinary: outputBinary,
                    },
                };
                worklets[i % length_1].postMessage(workload);
            }
            worklets.forEach(function (worklet) {
                worklet.on("message", function (e) {
                    runBinary(e.props.error, e.props.file, e.props.binary);
                });
            });
        }
        else {
            // for each file, synchronously run each test
            Array.from(testEntryFiles).forEach(function (file) {
                var binary;
                asc.main(__spreadArrays([file], finalCompilerArguments), {
                    stdout: process.stdout,
                    stderr: process.stderr,
                    listFiles: function (dirname, baseDir) {
                        var folder = path.join(baseDir, dirname);
                        if (folderMap.has(folder)) {
                            return folderMap.get(folder);
                        }
                        try {
                            var results = fs
                                .readdirSync(folder)
                                .filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
                            folderMap.set(folder, results);
                            return results;
                        }
                        catch (e) {
                            return [];
                        }
                    },
                    readFile: function (filename, baseDir) {
                        var fileName = path.join(baseDir, filename);
                        if (fileMap.has(fileName)) {
                            return fileMap.get(fileName);
                        }
                        try {
                            var contents = fs.readFileSync(fileName, { encoding: "utf8" });
                            fileMap.set(fileName, contents);
                            return contents;
                        }
                        catch (e) {
                            return null;
                        }
                    },
                    writeFile: function (name, contents, baseDir) {
                        if (baseDir === void 0) { baseDir = "."; }
                        var ext = path.extname(name);
                        // get the wasm file
                        if (ext === ".wasm") {
                            binary = contents;
                            if (!outputBinary)
                                return;
                        }
                        else if (ext === ".ts") {
                            filePromises.push(writeFile_1.writeFile(path.join(baseDir, name), contents));
                            return;
                        }
                        var outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
                        filePromises.push(writeFile_1.writeFile(outfileName, contents));
                    },
                }, function (error) { return runBinary(error, file, binary); });
            });
        }
    }
    exports.run = run;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicnVuLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vc3JjL3J1bi50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUFBLHFDQUF5QjtJQUN6Qix5Q0FBeUM7SUFDekMseUNBQTZCO0lBQzdCLGdEQUEwQjtJQUMxQixzQ0FLdUI7SUFFdkIsOENBQXdCO0lBQ3hCLDBEQUF5RDtJQUN6RCw4REFBNkQ7SUFFN0QsOENBQTZDO0lBRTdDLHdFQUF1RTtJQUV2RTs7Ozs7O09BTUc7SUFDSCxTQUFnQixHQUFHLENBQUMsVUFBbUIsRUFBRSxZQUFzQjs7UUFDN0QsSUFBTSxLQUFLLEdBQUcsd0JBQVcsQ0FBQyxHQUFHLEVBQUUsQ0FBQztRQUNoQyxJQUFNLFFBQVEsR0FBVSxFQUFFLENBQUM7UUFFM0IsOENBQThDO1FBQzlDLElBQU0sb0JBQW9CLEdBQUcsVUFBVSxDQUFDLFFBQVEsQ0FBQyxVQUFVLENBQUMsR0FBRyxDQUFDO1lBQzlELENBQUMsQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxHQUFHLEVBQUUsRUFBRSxVQUFVLENBQUMsUUFBUSxDQUFDO1lBQy9DLENBQUMsQ0FBQyxVQUFVLENBQUMsUUFBUSxDQUFDO1FBRXhCOztXQUVHO1FBQ0gsSUFBSSxVQUFVLENBQUMsT0FBTyxLQUFLLENBQUMsRUFBRTtZQUM1QixJQUFNLFFBQU0sR0FBRyxPQUFPLENBQUMsZ0JBQWdCLENBQUMsQ0FBQyxNQUFNLENBQUM7WUFFaEQsSUFBSSxDQUFDLFFBQVEsQ0FBQyxVQUFVLENBQUMsT0FBTyxDQUFDLEVBQUU7Z0JBQ2pDLE9BQU8sQ0FBQyxLQUFLLENBQ1gsZUFBSyw4SEFBQSxzREFBdUQsRUFBNkIsR0FBRyxLQUFoQyxVQUFVLENBQUMsT0FBTyxDQUFDLFFBQVEsRUFBRSxFQUMxRixDQUFDO2dCQUNGLE9BQU8sQ0FBQyxJQUFJLENBQUMsQ0FBQyxDQUFDLENBQUM7YUFDakI7WUFFRCxJ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