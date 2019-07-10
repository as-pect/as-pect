var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
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
        define(["require", "exports", "fs", "perf_hooks", "path", "chalk", "@as-pect/core", "glob", "./util/collectReporter", "./util/getTestEntryFiles", "./util/writeFile"], factory);
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
    var timeDifference = require("@as-pect/core/lib/util/timeDifference").timeDifference;
    /**
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
            /** Next, obtain the compiler, and assert it has a main function. */
            asc = require(path.join(assemblyScriptFolder, "dist", "asc"));
            if (!asc) {
                throw new Error(cliOptions.compiler + "/dist/asc has no exports.");
            }
            if (!asc.main) {
                throw new Error(cliOptions.compiler + "/dist/asc does not export a main() function.");
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
            "ms}."])), timeDifference(perf_hooks_1.performance.now(), start).toString()));
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
        // parse passed cli compiler arguments and let them override defaults.
        var _a = compilerArgs.length > 0
            ? parse(compilerArgs, asc.options)
            : { options: {}, unknown: [] }, ascOptions = _a.options, unknown = _a.unknown;
        // if there are any unknown flags, report them and exit 1
        if (unknown.length > 0) {
            console.error(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [", "]}."], ["{bgRedBright.black [Error]} Unknown compiler arguments {bold.yellow [",
                "]}."])), unknown.join(", ")));
            process.exit(1);
        }
        // Create the compiler flags
        var flags = Object.assign(ascOptions, configuration.flags, {
            "--validate": [],
            "--debug": [],
            /** This is required. Do not change this. */
            "--binaryFile": ["output.wasm"],
        });
        /** It's useful to notify the user that optimizations will make test compile times slower. */
        if (flags.hasOwnProperty("-O3") ||
            flags.hasOwnProperty("-O2") ||
            flags.hasOwnProperty("--optimize")) {
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
         * Check to see if rtrace is disabled.
         */
        configuration.nortrace = cliOptions.nortrace;
        /**
         * If rtrace is enabled, add `--use ASC_RTRACE=1` to the command line parameters.
         */
        if (!configuration.nortrace) {
            console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{bgWhite.black [Log]} Reference Tracing is enabled."], ["{bgWhite.black [Log]} Reference Tracing is enabled."]))));
            if (flags["--use"]) {
                flags["--use"].push("--use", "ASC_RTRACE=1");
            }
            else {
                flags["--use"] = ["ASC_RTRACE=1"];
            }
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
            for (var _b = 0, _c = glob_1.default.sync(pattern); _b < _c.length; _b++) {
                var entry = _c[_b];
                addedTestEntryFiles.add(entry);
            }
        }
        // must include the assembly/index.ts file located in the package
        var entryPath = require.resolve("@as-pect/core/assembly/index.ts");
        var relativeEntryPath = path.relative(process.cwd(), entryPath);
        // add the relativeEntryPath of as-pect to the list of compiled files for each test
        addedTestEntryFiles.add(relativeEntryPath);
        // Create a test runner, and run each test
        var count = testEntryFiles.size;
        flags["--explicitStart"] = [];
        // create the array of compiler flags from the flags object
        var flagList = Object.entries(flags).reduce(function (args, _a) {
            var flag = _a[0], options = _a[1];
            return args.concat(flag, options);
        }, []);
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
        var finalCompilerArguments = Array.from(addedTestEntryFiles).concat(flagList);
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
                    console.log("\n[Result]: " + result + "\n [Files]: " + testEntryFiles.size + " total\n[Groups]: " + groupCount + " count, " + groupSuccessCount + " pass\n [Tests]: " + successCount.toString() + " pass, " + (testCount - successCount).toString() + " fail, " + testCount.toString() + " total\n  [Time]: " + timeDifference(end, start).toString() + "ms");
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
            for (var _d = 0, _e = Array.from(testEntryFiles); _d < _e.length; _d++) {
                var entry = _e[_d];
                var workload = {
                    type: "compile",
                    props: {
                        file: entry,
                        args: [entry].concat(finalCompilerArguments),
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
                asc.main([file].concat(finalCompilerArguments), {
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
                    writeFile: function (name, contents) {
                        var ext = path.extname(name);
                        // get the wasm file
                        if (ext === ".wasm") {
                            binary = contents;
                            if (!outputBinary)
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
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicnVuLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vc3JjL3J1bi50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQ0EscUNBQXlCO0lBQ3pCLHlDQUF5QztJQUN6Qyx5Q0FBNkI7SUFDN0IsZ0RBQTBCO0lBQzFCLHNDQU91QjtJQUN2Qiw4Q0FBd0I7SUFDeEIsMERBQXlEO0lBQ3pELDhEQUE2RDtJQUU3RCw4Q0FBNkM7SUFFckMsSUFBQSxnRkFBYyxDQUFzRDtJQUc1RTs7Ozs7T0FLRztJQUNILFNBQWdCLEdBQUcsQ0FBQyxVQUFtQixFQUFFLFlBQXNCO1FBQzdELElBQU0sS0FBSyxHQUFHLHdCQUFXLENBQUMsR0FBRyxFQUFFLENBQUM7UUFDaEMsSUFBTSxRQUFRLEdBQVUsRUFBRSxDQUFDO1FBRTNCLDhDQUE4QztRQUM5QyxJQUFNLG9CQUFvQixHQUFHLFVBQVUsQ0FBQyxRQUFRLENBQUMsVUFBVSxDQUFDLEdBQUcsQ0FBQztZQUM5RCxDQUFDLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsVUFBVSxDQUFDLFFBQVEsQ0FBQztZQUMvQyxDQUFDLENBQUMsVUFBVSxDQUFDLFFBQVEsQ0FBQztRQUV4Qjs7V0FFRztRQUNILElBQUksVUFBVSxDQUFDLE9BQU8sS0FBSyxDQUFDLEVBQUU7WUFDNUIsSUFBTSxRQUFNLEdBQUcsT0FBTyxDQUFDLGdCQUFnQixDQUFDLENBQUMsTUFBTSxDQUFDO1lBRWhELElBQUksQ0FBQyxRQUFRLENBQUMsVUFBVSxDQUFDLE9BQU8sQ0FBQyxFQUFFO2dCQUNqQyxPQUFPLENBQUMsS0FBSyxDQUNYLGVBQUssOEhBQUEsc0RBQXVELEVBQTZCLEdBQUcsS0FBaEMsVUFBVSxDQUFDLE9BQU8sQ0FBQyxRQUFRLEVBQUUsRUFDMUYsQ0FBQztnQkFDRixPQUFPLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxDQUFDO2FBQ2pCO1lBRUQs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