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
        var instantiateBuffer;
        var parse;
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
            /** Next, collect the loader, and assert it has an instantiateBuffer method. */
            var loader = require(path.join(assemblyScriptFolder, "lib", "loader"));
            if (!loader) {
                throw new Error(cliOptions.compiler + "/lib/loader has no exports.");
            }
            if (!loader.instantiateBuffer) {
                throw new Error(cliOptions.compiler + "/lib/loader does not export an instantiateBuffer() method.");
            }
            instantiateBuffer = loader.instantiateBuffer;
            /** Finally, collect the cli options from assemblyscript. */
            var options = require(path.join(assemblyScriptFolder, "cli", "util", "options"));
            if (!options) {
                throw new Error(cliOptions.compiler + "/cli/util/options exports null");
            }
            if (!options.parse) {
                throw new Error(cliOptions.compiler + "/cli/util/options does not export a parse() method.");
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
            if (!flags["--use"] || flags["--use"].includes("ASC_RTRACE=1") || !compilerArgs.includes("ASC_RTRACE=1")) {
                if (!flags["--use"]) {
                    flags["--use"] = ["ASC_RTRACE=1"];
                    // inspect to see if the flag is used already
                }
                else if (!flags["--use"].includes("ASC_RTRACE=1")) {
                    flags["--use"].push("--use", "ASC_RTRACE=1");
                }
            }
        }
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
        var outputBinary = !!(cliOptions.outputBinary || configuration.outputBinary);
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
        if (compilerArgs.length > 0) {
            console.log(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["{bgWhite.black [Log]} Adding compiler arguments: "], ["{bgWhite.black [Log]} Adding compiler arguments: "]))) +
                compilerArgs.join(" "));
        }
        var addedTestEntryFiles = new Set();
        /** Get all the test entry files. */
        var testEntryFiles = getTestEntryFiles_1.getTestEntryFiles(cliOptions, include, disclude);
        for (var _i = 0, add_1 = add; _i < add_1.length; _i++) {
            var pattern = add_1[_i];
            // push all the added files to the added entry point list
            for (var _a = 0, _b = glob_1.default.sync(pattern); _a < _b.length; _a++) {
                var entry = _b[_a];
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
        var flagList = Object.entries(flags).reduce(function (args, _a) {
            var flag = _a[0], options = _a[1];
            return args.concat(flag, options);
        }, []).concat(compilerArgs);
        var testCount = 0;
        var successCount = 0;
        var groupSuccessCount = 0;
        var groupCount = 0;
        var errors = [];
        var filePromises = [];
        var failed = false;
        var folderMap = new Map();
        var fileMap = new Map();
        console.log(chalk_1.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{bgWhite.black [Log]} Effective command line args:"], ["{bgWhite.black [Log]} Effective command line args:"]))));
        console.log(chalk_1.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["  {green [TestFile.ts]} {yellow ", "} ", ""], ["  {green [TestFile.ts]} {yellow ",
            "} ", ""])), Array.from(addedTestEntryFiles).join(" "), flagList.join(" ")));
        // add a line seperator between the next line and this line
        console.log("");
        var finalCompilerArguments = __spreadArrays(Array.from(addedTestEntryFiles), flagList);
        function runBinary(error, file, binary) {
            // if there are any compilation errors, stop the test suite
            if (error) {
                console.error(chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
                console.error(error);
                return process.exit(1);
            }
            // if the binary wasn't emitted, stop the test suite
            if (!binary) {
                console.error(chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"], ["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"])), file));
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
                });
                // detect custom imports
                var customImportFileLocation = path.resolve(path.join(path.dirname(file), path.basename(file, path.extname(file)) + ".imports.js"));
                var imports = runner.createImports((fs.existsSync(customImportFileLocation)
                    ? require(customImportFileLocation)
                    : configuration.imports) || {});
                // instantiate the module
                var wasm = instantiateBuffer(binary, imports);
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
                    var result = failed ? chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_1.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                    console.log("~".repeat(process.stdout.columns - 10));
                    for (var _i = 0, errors_1 = errors; _i < errors_1.length; _i++) {
                        var error_1 = errors_1[_i];
                        console.log(chalk_1.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"], ["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"])), error_1.type, error_1.message, error_1.stackTrace.split("\n").join("\n            ")));
                    }
                    console.log(chalk_1.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["\n  [Result]: ", "\n   [Files]: ", " total\n  [Groups]: ", " count, ", " pass\n   [Tests]: ", " pass, ", " fail, ", " total\n    [Time]: ", "ms"], ["\n  [Result]: ", "\n   [Files]: ", " total\n  [Groups]: ", " count, ", " pass\n   [Tests]: ", " pass, ",
                        " fail, ", " total\n    [Time]: ", "ms"])), result, testEntryFiles.size.toString(), groupCount.toString(), groupSuccessCount.toString(), successCount.toString(), (testCount - successCount).toString(), testCount.toString(), timeDifference_1.timeDifference(end, start).toString()));
                    if (worklets.length > 0) {
                        for (var _a = 0, worklets_1 = worklets; _a < worklets_1.length; _a++) {
                            var worklet = worklets_1[_a];
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
            for (var _c = 0, _d = Array.from(testEntryFiles); _c < _d.length; _c++) {
                var entry = _d[_c];
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
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicnVuLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vc3JjL3J1bi50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUNBLHFDQUF5QjtJQUN6Qix5Q0FBeUM7SUFDekMseUNBQTZCO0lBQzdCLGdEQUEwQjtJQUMxQixzQ0FBb0Y7SUFFcEYsOENBQXdCO0lBQ3hCLDBEQUF5RDtJQUN6RCw4REFBNkQ7SUFFN0QsOENBQTZDO0lBRTdDLHdFQUF5RTtJQUV6RTs7Ozs7O09BTUc7SUFDSCxTQUFnQixHQUFHLENBQUMsVUFBbUIsRUFBRSxZQUFzQjtRQUM3RCxJQUFNLEtBQUssR0FBRyx3QkFBVyxDQUFDLEdBQUcsRUFBRSxDQUFDO1FBQ2hDLElBQU0sUUFBUSxHQUFVLEVBQUUsQ0FBQztRQUUzQiw4Q0FBOEM7UUFDOUMsSUFBTSxvQkFBb0IsR0FBRyxVQUFVLENBQUMsUUFBUSxDQUFDLFVBQVUsQ0FBQyxHQUFHLENBQUM7WUFDOUQsQ0FBQyxDQUFDLElBQUksQ0FBQyxJQUFJLENBQUMsT0FBTyxDQUFDLEdBQUcsRUFBRSxFQUFFLFVBQVUsQ0FBQyxRQUFRLENBQUM7WUFDL0MsQ0FBQyxDQUFDLFVBQVUsQ0FBQyxRQUFRLENBQUM7UUFFeEI7O1dBRUc7UUFDSCxJQUFJLFVBQVUsQ0FBQyxPQUFPLEtBQUssQ0FBQyxFQUFFO1lBQzVCLElBQU0sUUFBTSxHQUFHLE9BQU8sQ0FBQyxnQkFBZ0IsQ0FBQyxDQUFDLE1BQU0sQ0FBQztZQUVoRCxJQUFJLENBQUMsUUFBUSxDQUFDLFVBQVUsQ0FBQyxPQUFPLENBQUMsRUFBRTtnQkFDakMsT0FBTyxDQUFDLEtBQUssQ0FDWCxlQUFLLDhIQUFBLHNEQUF1RCxFQUE2QixHQUFHLEtBQWhDLFVBQVUsQ0FBQyxPQUFPLENBQUMsUUFBUSxFQUFFLEVBQzFGLENBQUM7Z0JBQ0YsT0FBTyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQzthQUNqQjtZQUVELElB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