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
        define(["require", "exports", "../test/TestContext", "fs", "perf_hooks", "../util/timeDifference", "path", "chalk", "glob", "./util/collectReporter", "./util/getTestEntryFiles", "./util/writeFile"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestContext_1 = require("../test/TestContext");
    var fs = __importStar(require("fs"));
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
        var reporter = configuration.reporter || collectReporter_1.collectReporter(yargs);
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicnVuLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vLi4vc3JjL2NsaS9ydW4udHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7OztJQUNBLG1EQUFrRDtJQUNsRCxxQ0FBeUI7SUFFekIseUNBQXlDO0lBQ3pDLHlEQUF3RDtJQUV4RCx5Q0FBNkI7SUFDN0IsZ0RBQTBCO0lBRTFCLDhDQUF3QjtJQUN4QiwwREFBeUQ7SUFDekQsOERBQTZEO0lBRzdELDhDQUE2QztJQUU3Qzs7Ozs7T0FLRztJQUNILFNBQWdCLEdBQUcsQ0FBQyxLQUFjLEVBQUUsWUFBc0I7UUFDeEQsSUFBTSxLQUFLLEdBQUcsd0JBQVcsQ0FBQyxHQUFHLEVBQUUsQ0FBQztRQUVoQzs7Ozs7V0FLRztRQUNILE9BQU8sQ0FBQyxHQUFHLENBQUMsZUFBSywrR0FBQSw0Q0FBNEMsS0FBQyxDQUFDO1FBQy9ELElBQUksR0FBUSxDQUFDO1FBQ2IsSUFBSSxpQkFBc0IsQ0FBQztRQUMzQixJQUFJLEtBQVUsQ0FBQTtRQUNkLElBQUk7WUFDRiw4Q0FBOEM7WUFDOUMsSUFBTSxvQkFBb0IsR0FBRyxLQUFLLENBQUMsUUFBUSxDQUFDLFVBQVUsQ0FBQyxHQUFHLENBQUM7Z0JBQ3pELENBQUMsQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxHQUFHLEVBQUUsRUFBRSxLQUFLLENBQUMsUUFBUSxDQUFDO2dCQUMxQyxDQUFDLENBQUMsS0FBSyxDQUFDLFFBQVEsQ0FBQztZQUVuQixvRUFBb0U7WUFDcEUsR0FBRyxHQUFHLE9BQU8sQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDLG9CQUFvQixFQUFFLE1BQU0sRUFBRSxLQUFLLENBQUMsQ0FBQyxDQUFDO1lBQzlELElBQUksQ0FBQyxHQUFHLEVBQUM7Z0JBQ1AsTUFBTSxJQUFJLEtBQUssQ0FBSSxLQUFLLENBQUMsUUFBUSw4QkFBMkIsQ0FBQyxDQUFDO2FBQy9EO1lBQ0QsSUFBSSxDQUFDLEdB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