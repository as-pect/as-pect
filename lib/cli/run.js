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
        define(["require", "exports", "../test/TestContext", "fs", "../reporter/DefaultTestReporter", "perf_hooks", "../util/timeDifference", "path", "chalk", "glob", "./util/collectReporter", "./util/getTestEntryFiles", "./util/writeFile"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestContext_1 = require("../test/TestContext");
    var fs = __importStar(require("fs"));
    var DefaultTestReporter_1 = require("../reporter/DefaultTestReporter");
    var perf_hooks_1 = require("perf_hooks");
    var timeDifference_1 = require("../util/timeDifference");
    var path = __importStar(require("path"));
    var chalk_1 = __importDefault(require("chalk"));
    var glob_1 = __importDefault(require("glob"));
    var collectReporter_1 = require("./util/collectReporter");
    var getTestEntryFiles_1 = require("./util/getTestEntryFiles");
    var writeFile_1 = require("./util/writeFile");
    /**
     * This method actually runs the test suites in sequential order synchronously.
     *
     * @param {IYargs} yargs - The command line arguments.
     * @param {string[]} compilerArgs - The `asc` compiler arguments.
     */
    function run(yargs, compilerArgs) {
        var start = perf_hooks_1.performance.now();
        /**
         * Instead of using `import`, the strategy is to encourage node to start the testing process
         * as soon as possible. Calling require and measuring the performance of compiler loading shows
         * developers a meaningful explaination of why it takes a few seconds for the software to start
         * running.
         */
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Loading asc compiler"], ["{bgWhite.black [Log]} Loading asc compiler"]))));
        var asc;
        var instantiateBuffer;
        var parse;
        try {
            /** Collect the assemblyscript module path. */
            var assemblyScriptFolder = yargs.compiler.startsWith(".")
                ? path.join(process.cwd(), yargs.compiler)
                : yargs.compiler;
            /** Next, obtain the compiler, and assert it has a main function. */
            asc = require(path.join(assemblyScriptFolder, "dist", "asc"));
            if (!asc) {
                throw new Error(yargs.compiler + "/dist/asc has no exports.");
            }
            if (!asc.main) {
                throw new Error(yargs.compiler + "/dist/asc does not export a main() function.");
            }
            /** Next, collect the loader, and assert it has an instantiateBuffer method. */
            var loader = require(path.join(assemblyScriptFolder, "lib", "loader"));
            if (!loader) {
                throw new Error(yargs.compiler + "/lib/loader has no exports.");
            }
            if (!loader.instantiateBuffer) {
                throw new Error(yargs.compiler + "/lib/loader does not export an instantiateBuffer() method.");
            }
            instantiateBuffer = loader.instantiateBuffer;
            /** Finally, collect the cli options from assemblyscript. */
            var options = require(path.join(assemblyScriptFolder, "cli", "util", "options"));
            if (!options) {
                throw new Error(yargs.compiler + "/cli/util/options exports null");
            }
            if (!options.parse) {
                throw new Error(yargs.compiler + "/cli/util/options does not export a parse() method.");
            }
            parse = options.parse;
        }
        catch (ex) {
            console.error(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), yargs.compiler));
            console.error(ex);
            process.exit(1);
        }
        console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgWhite.black [Log]} Compiler loaded in ", "ms."], ["{bgWhite.black [Log]} Compiler loaded in ", "ms."])), timeDifference_1.timeDifference(perf_hooks_1.performance.now(), start).toString()));
        // obtain the configuration file
        var configurationPath = path.resolve(process.cwd(), yargs.config);
        console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Using configuration ", ""], ["{bgWhite.black [Log]} Using configuration ", ""])), configurationPath));
        var configuration = {};
        try {
            configuration = require(configurationPath) || {};
        }
        catch (ex) {
            console.error("");
            console.error(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
            console.error(ex);
            process.exit(1);
        }
        // configuration must be an object
        if (!configuration) {
            console.error(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."])), configurationPath));
            process.exit(1);
        }
        var include = configuration.include || ["assembly/__tests__/**/*.spec.ts"];
        var add = configuration.add || ["assembly/__tests__/**/*.include.ts"];
        // parse passed cli compiler arguments and let them override defaults.
        var _a = compilerArgs.length > 0
            ? parse(compilerArgs, asc.options)
            : { options: {}, unknown: [] }, ascOptions = _a.options, unknown = _a.unknown;
        if (unknown.length > 0) {
            console.error(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgRedBright.black [Error]} Unknown compiler arguments {bold [", "]}."], ["{bgRedBright.black [Error]} Unknown compiler arguments {bold [", "]}."])), unknown.join(", ")));
            process.exit(1);
        }
        var flags = Object.assign(ascOptions, configuration.flags, {
            "--validate": [],
            "--debug": [],
            /** This is required. Do not change this. */
            "--binaryFile": ["output.wasm"],
        });
        /** It's useful to notify the user that optimizations will make test compile times slower. */
        if (flags.hasOwnProperty("-O3") || flags.hasOwnProperty("-O2") || flags.hasOwnProperty("--optimize")) {
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{yellow [Warning]} Using optimizations. This may result in slow test compilation times."], ["{yellow [Warning]} Using optimizations. This may result in slow test compilation times."]))));
        }
        var disclude = configuration.disclude || [];
        // if a reporter is specified in cli arguments, override configuration
        var reporter = yargs.reporter
            ? collectReporter_1.collectReporter(yargs)
            : configuration.reporter || new DefaultTestReporter_1.DefaultTestReporter();
        if (configuration.performance) {
            Object.getOwnPropertyNames(configuration.performance).forEach(function (option) {
                if (yargs.changed.has("performance." + option)) {
                    yargs.performance[option] = configuration.performance[option];
                }
            });
        }
        var performanceConfiguration = yargs.performance;
        // include all the file globs
        console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgWhite.black [Log]} Including files: ", ""], ["{bgWhite.black [Log]} Including files: ", ""])), include.join(", ")));
        // Create the test and group matchers
        var testRegex = new RegExp(yargs.test, "i");
        configuration.testRegex = testRegex;
        console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{bgWhite.black [Log]} Running tests that match: ", ""], ["{bgWhite.black [Log]} Running tests that match: ", ""])), testRegex.source));
        var groupRegex = new RegExp(yargs.group, "i");
        configuration.groupRegex = groupRegex;
        console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{bgWhite.black [Log]} Running groups that match: ", ""], ["{bgWhite.black [Log]} Running groups that match: ", ""])), groupRegex.source));
        /**
         * Check to see if the binary files should be written to the fileSystem.
         */
        var outputBinary = !!(yargs.outputBinary || configuration.outputBinary);
        if (outputBinary) {
            console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{bgWhite.black [Log]} Outputing Binary *.wasm files."], ["{bgWhite.black [Log]} Outputing Binary *.wasm files."]))));
        }
        /**
         * Check to see if rtrace is disabled.
         */
        configuration.nortrace = yargs.nortrace;
        /**
         * If rtrace is enabled, add `--use ASC_RTRACE=1` to the command line parameters.
         */
        if (!configuration.nortrace) {
            console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{bgWhite.black [Log]} Reference Tracing is enabled."], ["{bgWhite.black [Log]} Reference Tracing is enabled."]))));
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
        var runTests = !yargs.norun;
        if (!runTests) {
            console.log(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{bgWhite.black [Log]} Not running tests, only outputting files."], ["{bgWhite.black [Log]} Not running tests, only outputting files."]))));
        }
        if (compilerArgs.length > 0) {
            console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{bgWhite.black [Log]} Adding compiler arguments: "], ["{bgWhite.black [Log]} Adding compiler arguments: "]))) + compilerArgs.join(" "));
        }
        var addedTestEntryFiles = new Set();
        /** Get all the test entry files. */
        var testEntryFiles = getTestEntryFiles_1.getTestEntryFiles(yargs, include, disclude);
        for (var _i = 0, add_1 = add; _i < add_1.length; _i++) {
            var pattern = add_1[_i];
            // push all the added files to the added entry point list
            for (var _b = 0, _c = glob_1.default.sync(pattern); _b < _c.length; _b++) {
                var entry = _c[_b];
                addedTestEntryFiles.add(entry);
            }
        }
        // loop over each file and create a binary, index it on binaries
        var binaries = {};
        // must include the assembly/index.ts file located in the package
        var entryPath = path.join(__dirname, "../../assembly/index.ts");
        var relativeEntryPath = path.relative(process.cwd(), entryPath);
        // add the relativeEntryPath of as-pect to the list of compiled files for each test
        addedTestEntryFiles.add(relativeEntryPath);
        // Create a test runner, and run each test
        var count = testEntryFiles.size;
        flags["--explicitStart"] = [];
        // create the array of compiler flags from the flags object
        var flagList = Object.entries(flags)
            .reduce(function (args, _a) {
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
        console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["{bgWhite.black [Log]} Effective command line args:"], ["{bgWhite.black [Log]} Effective command line args:"]))));
        console.log(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["  {green [TestFile.ts]} {yellow ", "} ", ""], ["  {green [TestFile.ts]} {yellow ", "} ", ""])), Array.from(addedTestEntryFiles).join(" "), flagList.join(" ")));
        // add a line seperator between the next line and this line
        console.log("");
        // for each file, synchronously run each test
        Array.from(testEntryFiles).forEach(function (file, i) {
            asc.main([file].concat(Array.from(addedTestEntryFiles), flagList), {
                stdout: process.stdout,
                stderr: process.stderr,
                listFiles: function (dirname, baseDir) {
                    var folder = path.join(baseDir, dirname);
                    if (folderMap.has(folder)) {
                        return folderMap.get(folder);
                    }
                    try {
                        var results = fs.readdirSync(folder).filter(function (file) { return /^(?!.*\.d\.ts$).*\.ts$/.test(file); });
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
                        binaries[i] = contents;
                        if (!outputBinary)
                            return;
                    }
                    var outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
                    filePromises.push(writeFile_1.writeFile(outfileName, contents));
                }
            }, function (error) {
                // if there are any compilation errors, stop the test suite
                if (error) {
                    console.error(chalk_1.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
                    console.error(error);
                    return process.exit(1);
                }
                // if the binary wasn't emitted, stop the test suite
                if (!binaries[i]) {
                    console.error(chalk_1.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"], ["{red [Error]} There was no output binary file: ", ". Did you forget to emit the binary with {yellow --binaryFile}?"])), file));
                    return process.exit(1);
                }
                if (runTests) {
                    // create a test runner
                    var runner = new TestContext_1.TestContext({
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
                    var wasm = instantiateBuffer(binaries[i], imports);
                    if (runner.errors.length > 0) {
                        errors.push.apply(errors, runner.errors);
                    }
                    else {
                        // call run buffer because it's already compiled
                        runner.run(wasm);
                        testCount += runner.testGroups
                            .reduce(function (left, right) { return left + right.tests.length; }, 0);
                        successCount += runner.testGroups
                            .reduce(function (left, right) { return left + right.tests.filter(function (e) { return e.pass; }).length; }, 0);
                        groupCount += runner.testGroups.length;
                        groupSuccessCount = runner.testGroups
                            .reduce(function (left, right) { return left + (right.pass ? 1 : 0); }, groupSuccessCount);
                        errors.push.apply(errors, runner.errors); // if there are any runtime allocation errors add them
                    }
                }
                count -= 1;
                // if any tests failed, and they all ran, exit(1)
                if (count === 0) {
                    if (runTests) {
                        var end = perf_hooks_1.performance.now();
                        failed = testCount !== successCount || errors.length > 0;
                        var result = failed
                            ? chalk_1.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_1.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                        console.log("~".repeat(process.stdout.columns - 10));
                        for (var _i = 0, errors_1 = errors; _i < errors_1.length; _i++) {
                            var error_1 = errors_1[_i];
                            console.log(chalk_1.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["\n   [Error]: {red ", "}: ", "\n   [Stack]: {yellow ", "}\n  "], ["\n   [Error]: {red ", "}: ", "\n   [Stack]: {yellow ", "}\n  "])), error_1.type, error_1.message, error_1.stackTrace.split("\n").join("\n            ")));
                        }
                        console.log("\n  [Result]: " + result + "\n   [Files]: " + testEntryFiles.size + " total\n  [Groups]: " + groupCount + " count, " + groupSuccessCount + " pass\n   [Tests]: " + successCount.toString() + " pass, " + (testCount - successCount).toString() + " fail, " + testCount.toString() + " total\n    [Time]: " + timeDifference_1.timeDifference(end, start).toString() + "ms");
                    }
                    Promise.all(filePromises).then(function () {
                        if (failed)
                            process.exit(1);
                    });
                }
                return 0;
            });
        });
    }
    exports.run = run;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17, templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicnVuLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL2NsaS9ydW4udHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUNBLG1EQUFrRDtJQUNsRCxxQ0FBeUI7SUFFekIsdUVBQXNFO0lBQ3RFLHlDQUF5QztJQUN6Qyx5REFBd0Q7SUFFeEQseUNBQTZCO0lBQzdCLGdEQUEwQjtJQUUxQiw4Q0FBd0I7SUFDeEIsMERBQXlEO0lBQ3pELDhEQUE2RDtJQUc3RCw4Q0FBNkM7SUFFN0M7Ozs7O09BS0c7SUFDSCxTQUFnQixHQUFHLENBQUMsS0FBYyxFQUFFLFlBQXNCO1FBQ3hELElBQU0sS0FBSyxHQUFHLHdCQUFXLENBQUMsR0FBRyxFQUFFLENBQUM7UUFFaEM7Ozs7O1dBS0c7UUFDSCxPQUFPLENBQUMsR0FBRyxDQUFDLGVBQUssK0dBQUEsNENBQTRDLEtBQUMsQ0FBQztRQUMvRCxJQUFJLEdBQVEsQ0FBQztRQUNiLElBQUksaUJBQXNCLENBQUM7UUFDM0IsSUFBSSxLQUFVLENBQUE7UUFDZCxJQUFJO1lBQ0YsOENBQThDO1lBQzlDLElBQU0sb0JBQW9CLEdBQUcsS0FBSyxDQUFDLFFBQVEsQ0FBQyxVQUFVLENBQUMsR0FBRyxDQUFDO2dCQUN6RCxDQUFDLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxPQUFPLENBQUMsR0FBRyxFQUFFLEVBQUUsS0FBSyxDQUFDLFFBQVEsQ0FBQztnQkFDMUMsQ0FBQyxDQUFDLEtBQUssQ0FBQyxRQUFRLENBQUM7WUFFbkIsb0VBQW9FO1lBQ3BFLEdBQUcsR0FBRyxPQUFPLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxvQkFBb0IsRUFBRSxNQUFNLEVBQUUsS0FBSyxDQUFDLENBQUMsQ0FBQztZQUM5RCxJQUFJLENBQUMsR0FBRyxFQUFDO2dCQUNQLE1BQU0sSUFBSSxLQUFLLENBQUksS0FBSyxDQUFDLFFBQVEsOEJBQTJCLENBQUMsQ0FBQzthQUMvRDtZQUNE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