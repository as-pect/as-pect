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
            return args.concat(flag, options);
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