var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (Object.hasOwnProperty.call(mod, k)) result[k] = mod[k];
    result["default"] = mod;
    return result;
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "assemblyscript/cli/asc", "../test/TestContext", "fs", "assemblyscript/lib/loader", "../reporter/DefaultTestReporter", "perf_hooks", "../util/timeDifference", "../util/IPerformanceConfiguration", "../reporter/EmptyReporter", "../reporter/SummaryTestReporter", "path", "chalk", "glob"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var asc_1 = __importDefault(require("assemblyscript/cli/asc"));
    var TestContext_1 = require("../test/TestContext");
    var fs = __importStar(require("fs"));
    var loader_1 = require("assemblyscript/lib/loader");
    var DefaultTestReporter_1 = require("../reporter/DefaultTestReporter");
    var perf_hooks_1 = require("perf_hooks");
    var timeDifference_1 = require("../util/timeDifference");
    var IPerformanceConfiguration_1 = require("../util/IPerformanceConfiguration");
    var EmptyReporter_1 = require("../reporter/EmptyReporter");
    var SummaryTestReporter_1 = require("../reporter/SummaryTestReporter");
    var path = __importStar(require("path"));
    var chalk_1 = __importDefault(require("chalk"));
    var glob_1 = __importDefault(require("glob"));
    function run(yargs) {
        var start = perf_hooks_1.performance.now();
        // obtain the configuration file
        var configurationPath = path.resolve(process.cwd(), yargs.argv.c || yargs.argv.config || "./as-pect.config.js");
        console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bgWhite.black [Log]} using configuration ", ""], ["{bgWhite.black [Log]} using configuration ", ""])), configurationPath));
        var configuration = {};
        try {
            configuration = require(configurationPath) || {};
        }
        catch (ex) {
            console.log("");
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
            console.log(ex);
            process.exit(1);
        }
        // configuration must be an object
        if (!configuration) {
            console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."])), configurationPath));
            process.exit(1);
        }
        var include = configuration.include || ["assembly/__tests__/**/*.spec.ts"];
        var add = configuration.add || ["assembly/__tests__/**/*.include.ts"];
        var flags = configuration.flags || {
            "--validate": [],
            "--debug": [],
            "--measure": [],
            "--sourceMap": [],
            /** This is required. Do not change this. */
            "--binaryFile": ["output.wasm"],
        };
        var disclude = configuration.disclude || [];
        var reporter = configuration.reporter || new DefaultTestReporter_1.DefaultTestReporter();
        var performanceConfiguration = configuration.performance || IPerformanceConfiguration_1.createDefaultPerformanceConfiguration();
        // setup performance options, overriding configured values if the flag is passed to the cli
        if (yargs.argv.hasOwnProperty("performance"))
            performanceConfiguration.enabled = yargs.argv.performance !== "false";
        // gather all the flags
        if (yargs.argv.hasOwnProperty("maxSamples"))
            performanceConfiguration.maxSamples = parseFloat(yargs.argv.maxSamples.toString());
        if (yargs.argv.hasOwnProperty("maxTestRunTime"))
            performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
        if (yargs.argv.hasOwnProperty("maxTestRunTime"))
            performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
        if (yargs.argv.hasOwnProperty("roundDecimalPlaces"))
            performanceConfiguration.roundDecimalPlaces = parseFloat(yargs.argv.roundDecimalPlaces.toString());
        if (yargs.argv.hasOwnProperty("reportMedian"))
            performanceConfiguration.reportMedian = yargs.argv.reportMedian !== "false";
        if (yargs.argv.hasOwnProperty("reportAverage"))
            performanceConfiguration.reportAverage = yargs.argv.reportAverage !== "false";
        if (yargs.argv.hasOwnProperty("reportStandardDeviation"))
            performanceConfiguration.reportStandardDeviation = yargs.argv.reportStandardDeviation !== "false";
        if (yargs.argv.hasOwnProperty("reportMax"))
            performanceConfiguration.reportMax = yargs.argv.reportMax !== "false";
        if (yargs.argv.hasOwnProperty("reportMin"))
            performanceConfiguration.reportMin = yargs.argv.reportMin !== "false";
        if (yargs.argv.hasOwnProperty("reportVariance"))
            performanceConfiguration.reportVariance = yargs.argv.reportVariance !== "false";
        // if a reporter is specified in cli arguments, override configuration
        if (yargs.argv.reporter || yargs.argv.r) {
            var targetReporter = yargs.argv.reporter || yargs.argv.r;
            // get relative reporters
            if (targetReporter.startsWith(".")) {
                try {
                    var result = require(path.join(process.cwd(), targetReporter));
                    // if something is returned
                    if (result) {
                        if (typeof result === "function") { // instantiate it if it's a default exported class
                            reporter = new result();
                        }
                        if (typeof result.default === "function") {
                            reporter = new result.default();
                        }
                        else {
                            reporter = result.default || result;
                        }
                    }
                    else {
                        reporter = new DefaultTestReporter_1.DefaultTestReporter();
                    }
                }
                catch (ex) {
                    console.log("Cannot find target reporter at", path.join(process.cwd(), targetReporter));
                    console.log(ex);
                    process.exit(1);
                }
            }
            else if (targetReporter === "EmptyReporter") {
                reporter = new EmptyReporter_1.EmptyReporter();
            }
            else if (targetReporter === "SummaryTestReporter") {
                reporter = new SummaryTestReporter_1.SummaryTestReporter();
            }
            else {
                reporter = new DefaultTestReporter_1.DefaultTestReporter();
            }
        }
        // include all the file globs
        console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{bgWhite.black [Log]} Including files: ", ""], ["{bgWhite.black [Log]} Including files: ", ""])), include.join(", ")));
        // add a line seperator between the next line and this line
        console.log("");
        var testEntryFiles = new Set();
        var addedTestEntryFiles = new Set();
        /**
         * Read in the file regex arg. Only test files that match this regular expression will have
         * their tests run.
         */
        var fileRegexArg = yargs.argv.file || yargs.argv.f || ".*";
        var fileRegex = new RegExp(fileRegexArg);
        // for each pattern to be included
        for (var _i = 0, include_1 = include; _i < include_1.length; _i++) {
            var pattern = include_1[_i];
            // push all the resulting files so that each file gets tested individually
            entry: for (var _a = 0, _b = glob_1.default.sync(pattern); _a < _b.length; _a++) {
                var entry = _b[_a];
                // test for discludes
                for (var _c = 0, disclude_1 = disclude; _c < disclude_1.length; _c++) {
                    var test_1 = disclude_1[_c];
                    if (test_1.test(entry))
                        continue entry;
                }
                // if the fileRegex matches the test, add it to the entry file Set
                if (fileRegex.test(entry))
                    testEntryFiles.add(entry);
            }
        }
        for (var _d = 0, add_1 = add; _d < add_1.length; _d++) {
            var pattern = add_1[_d];
            // push all the added files to the added entry point list
            for (var _e = 0, _f = glob_1.default.sync(pattern); _e < _f.length; _e++) {
                var entry = _f[_e];
                addedTestEntryFiles.add(entry);
            }
        }
        // loop over each file and create a binary, index it on binaries
        var binaries = {};
        var sourcemaps = {};
        // must include the assembly/index.ts file located in the package
        var entryPath = path.join(__dirname, "../../assembly/index.ts");
        var relativeEntryPath = path.relative(process.cwd(), entryPath);
        // add the relativeEntryPath of as-pect to the list of compiled files for each test
        addedTestEntryFiles.add(relativeEntryPath);
        // Create a test runner, and run each test
        var count = testEntryFiles.size;
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
        // for each file, synchronously run each test
        Array.from(testEntryFiles).forEach(function (file, i) {
            asc_1.default.main([file].concat(Array.from(addedTestEntryFiles), flagList), {
                stdout: process.stdout,
                stderr: process.stderr,
                writeFile: function (name, contents) {
                    var ext = path.extname(name);
                    // get the wasm file
                    if (ext === ".wasm") {
                        binaries[i] = contents;
                        return;
                    }
                    // capture the sourcemap, not sure what to do with this yet.
                    if (ext === ".map") {
                        sourcemaps[name] = contents;
                        return;
                    }
                    var outfileName = path.join(path.dirname(file), path.basename(file, path.extname(file)) + ext);
                    fs.writeFileSync(outfileName, contents);
                }
            }, function (error) {
                // if there are any compilation errors, stop the test suite
                if (error) {
                    console.log("There was a compilation error when trying to create the wasm binary for file: " + file + ".");
                    console.error(error);
                    return process.exit(1);
                }
                // if the binary wasn't emitted, stop the test suite
                if (!binaries[i]) {
                    console.log("There was no output binary file: " + file + ". Did you forget to emit the binary?");
                    return process.exit(1);
                }
                // create a test runner
                var runner = new TestContext_1.TestContext(reporter, file, performanceConfiguration);
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
                count -= 1;
                // if any tests failed, and they all ran, exit(1)
                if (count === 0) {
                    var end = perf_hooks_1.performance.now();
                    var failed = testCount !== successCount || errors.length > 0;
                    var result = failed
                        ? chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                    console.log("~".repeat(process.stdout.columns - 10));
                    for (var _i = 0, errors_1 = errors; _i < errors_1.length; _i++) {
                        var error_1 = errors_1[_i];
                        console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"], ["\n [Error]: {red ", "}: ", "\n [Stack]: {yellow ", "}\n"])), error_1.type, error_1.message, error_1.stackTrace.split("\n").join("\n            ")));
                    }
                    console.log("\n[Result]: " + result + "\n [Files]: " + testEntryFiles.size + " total\n[Groups]: " + groupCount + " count, " + groupSuccessCount + " pass\n[Summary]: " + successCount.toString() + " pass, " + (testCount - successCount).toString() + " fail, " + testCount.toString() + " total\n  [Time]: " + timeDifference_1.timeDifference(end, start).toString() + "ms");
                    if (failed) {
                        process.exit(1);
                    }
                }
                return 0;
            });
        });
    }
    exports.run = run;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7;
});
//# sourceMappingURL=run.js.map