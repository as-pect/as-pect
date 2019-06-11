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
        define(["require", "exports", "assemblyscript/dist/asc", "../test/TestContext", "fs", "assemblyscript/lib/loader", "../reporter/DefaultTestReporter", "perf_hooks", "../util/timeDifference", "../util/IPerformanceConfiguration", "path", "chalk", "glob", "./util/collectPerformanceConfiguration", "./util/collectReporter", "./util/getTestEntryFiles", "./util/writeFile"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    // @ts-ignore
    var asc = __importStar(require("assemblyscript/dist/asc"));
    //@ts-ignore
    var parse = require("assemblyscript/cli/util/options").parse;
    var TestContext_1 = require("../test/TestContext");
    var fs = __importStar(require("fs"));
    var loader_1 = require("assemblyscript/lib/loader");
    var DefaultTestReporter_1 = require("../reporter/DefaultTestReporter");
    var perf_hooks_1 = require("perf_hooks");
    var timeDifference_1 = require("../util/timeDifference");
    var IPerformanceConfiguration_1 = require("../util/IPerformanceConfiguration");
    var path = __importStar(require("path"));
    var chalk_1 = __importDefault(require("chalk"));
    var glob_1 = __importDefault(require("glob"));
    var collectPerformanceConfiguration_1 = require("./util/collectPerformanceConfiguration");
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
        // obtain the configuration file
        var configurationPath = path.resolve(process.cwd(), yargs.argv.c || yargs.argv.config || "./as-pect.config.js");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} Using configuration ", ""], ["{bgWhite.black [Log]} Using configuration ", ""])), configurationPath));
        var configuration = {};
        try {
            configuration = require(configurationPath) || {};
        }
        catch (ex) {
            console.error("");
            console.error(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
            console.error(ex);
            process.exit(1);
        }
        // configuration must be an object
        if (!configuration) {
            console.error(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} Configuration at {bold [", "]} is null or not an object."])), configurationPath));
            process.exit(1);
        }
        var include = configuration.include || ["assembly/__tests__/**/*.spec.ts"];
        var add = configuration.add || ["assembly/__tests__/**/*.include.ts"];
        // parse passed cli compiler arguments and let them override defaults.
        var _a = compilerArgs.length > 0 ? parse(compilerArgs, asc.options) : { options: {}, unknown: [] }, ascOptions = _a.options, unknown = _a.unknown;
        if (unknown.length > 0) {
            console.error(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgRedBright.black [Error]} Unknown compiler arguments {bold [", "]}."], ["{bgRedBright.black [Error]} Unknown compiler arguments {bold [", "]}."])), unknown.join(", ")));
            process.exit(1);
        }
        var flags = Object.assign(ascOptions, configuration.flags, {
            "--validate": [],
            "--debug": [],
            /** This is required. Do not change this. */
            "--binaryFile": ["output.wasm"],
        });
        var disclude = configuration.disclude || [];
        // if a reporter is specified in cli arguments, override configuration
        var reporter = (yargs.argv.reporter || yargs.argv.r)
            ? collectReporter_1.collectReporter(yargs)
            : configuration.reporter || new DefaultTestReporter_1.DefaultTestReporter({});
        var performanceConfiguration = configuration.performance || IPerformanceConfiguration_1.createDefaultPerformanceConfiguration();
        // setup performance options, overriding configured values if the flag is passed to the cli
        collectPerformanceConfiguration_1.collectPerformanceConfiguration(yargs, performanceConfiguration);
        // include all the file globs
        console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{bgWhite.black [Log]} Including files: ", ""], ["{bgWhite.black [Log]} Including files: ", ""])), include.join(", ")));
        // Create the test and group matchers
        if (!configuration.testRegex) {
            var testRegex = new RegExp(yargs.argv.tests || yargs.argv.test || yargs.argv.t || ".*", "i");
            configuration.testRegex = testRegex;
            console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{bgWhite.black [Log]} Running tests that match: ", ""], ["{bgWhite.black [Log]} Running tests that match: ", ""])), testRegex.source));
        }
        if (!configuration.groupRegex) {
            var groupRegex = new RegExp(yargs.argv.groups || yargs.argv.group || yargs.argv.g || ".*", "i");
            configuration.groupRegex = groupRegex;
            console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["{bgWhite.black [Log]} Running groups that match: ", ""], ["{bgWhite.black [Log]} Running groups that match: ", ""])), groupRegex.source));
        }
        /**
         * Check to see if the binary files should be written to the fileSystem.
         */
        var outputBinary = !!(yargs.argv.outputBinary || yargs.argv.o || configuration.outputBinary);
        if (outputBinary) {
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["{bgWhite.black [Log]} Outputing Binary *.wasm files."], ["{bgWhite.black [Log]} Outputing Binary *.wasm files."]))));
        }
        /**
         * Check to see if rtrace is disabled.
         */
        var nortrace = !!(yargs.argv.nortrace || yargs.argv.nr);
        if (nortrace) {
            configuration.nortrace = true;
        }
        /**
         * If rtrace is enabled, add `--use ASC_RTRACE=1` to the command line parameters.
         */
        if (!configuration.nortrace) {
            console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgWhite.black [Log]} Reference Tracing is enabled."], ["{bgWhite.black [Log]} Reference Tracing is enabled."]))));
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
        var runTests = !(yargs.argv.norun || yargs.argv.n);
        if (!runTests) {
            console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{bgWhite.black [Log]} Not running tests, only outputting files."], ["{bgWhite.black [Log]} Not running tests, only outputting files."]))));
        }
        if (compilerArgs.length > 0) {
            console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{bgWhite.black [Log]} Adding compiler arguments: "], ["{bgWhite.black [Log]} Adding compiler arguments: "]))) + compilerArgs.join(" "));
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
        console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{bgWhite.black [Log]} Effective command line arguments:"], ["{bgWhite.black [Log]} Effective command line arguments:"]))));
        console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["  ", ""], ["  ", ""])), flagList.join(" ")));
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
                    console.error("There was a compilation error when trying to create the wasm binary for file: " + file + ".");
                    console.error(error);
                    return process.exit(1);
                }
                // if the binary wasn't emitted, stop the test suite
                if (!binaries[i]) {
                    console.error("There was no output binary file: " + file + ". Did you forget to emit the binary?");
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
                    var wasm = loader_1.instantiateBuffer(binaries[i], imports);
                    if (runner.errors.length > 0) {
                        errors.push.apply(errors, runner.errors);
                    }
                    else {
                        // call run buffer because it's already compiled
                        runner.run(wasm);
                        testCount += runner.testGroups.reduce(function (left, right) { return left + right.tests.length; }, 0);
                        successCount += runner.testGroups
                            .reduce(function (left, right) { return left + right.tests.filter(function (e) { return e.pass; }).length; }, 0);
                        groupCount += runner.testGroups.length;
                        groupSuccessCount = runner.testGroups.reduce(function (left, right) { return left + (right.pass ? 1 : 0); }, groupSuccessCount);
                    }
                }
                count -= 1;
                // if any tests failed, and they all ran, exit(1)
                if (count === 0) {
                    if (runTests) {
                        var end = perf_hooks_1.performance.now();
                        failed = testCount !== successCount || errors.length > 0;
                        var result = failed
                            ? chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                        console.log("~".repeat(process.stdout.columns - 10));
                        for (var _i = 0, errors_1 = errors; _i < errors_1.length; _i++) {
                            var error_1 = errors_1[_i];
                            console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject(["\n   [Error]: {red ", "}: ", "\n   [Stack]: {yellow ", "}\n  "], ["\n   [Error]: {red ", "}: ", "\n   [Stack]: {yellow ", "}\n  "])), error_1.type, error_1.message, error_1.stackTrace.split("\n").join("\n            ")));
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
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16;
});
//# sourceMappingURL=run.js.map