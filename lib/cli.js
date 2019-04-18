var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
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
        define(["require", "exports", "chalk", "path", "glob", "yargs-parser", "assemblyscript/cli/asc", "./test/TestContext", "fs", "assemblyscript/lib/loader", "./reporter/DefaultTestReporter", "perf_hooks", "./util/timeDifference"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var chalk_1 = __importDefault(require("chalk"));
    var path_1 = __importDefault(require("path"));
    var glob_1 = __importDefault(require("glob"));
    var yargs_parser_1 = __importDefault(require("yargs-parser"));
    // import { TestRunner } from "./test/TestRunner";
    var asc_1 = __importDefault(require("assemblyscript/cli/asc"));
    var TestContext_1 = require("./test/TestContext");
    var fs_1 = __importDefault(require("fs"));
    var loader_1 = require("assemblyscript/lib/loader");
    var DefaultTestReporter_1 = require("./reporter/DefaultTestReporter");
    var perf_hooks_1 = require("perf_hooks");
    var timeDifference_1 = require("./util/timeDifference");
    var pkg = require("../package.json");
    /**
     * This is the cli entry point and expects an array of arguments from the command line.
     *
     * @param {string[]} args - The arguments from the command line
     */
    function asp(args) {
        // parse the arguments
        var yargs = {
            argv: yargs_parser_1.default(args),
        };
        // Skip ascii art if asked for the version
        if (!(yargs.argv.v || yargs.argv.version)) {
            console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["{bold.bgWhite.black ", "       ___   _____                       __  \n      /   | / ___/      ____  ___  _____/ /_ \n     / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n   /_/  |_/____/     / .___/\\___/\\___/\\__/   \n                    /_/                      }\n\n  \u26A1AS-pect\u26A1 Test suite runner {bgGreenBright.black [", "]}\n  "], ["{bold.bgWhite.black ",
                "       ___   _____                       __  \n      /   | / ___/      ____  ___  _____/ /_ \n     / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/ \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n   /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/   \n                    /_/                      }\n\n  \u26A1AS-pect\u26A1 Test suite runner {bgGreenBright.black [", "]}\n  "])), "", pkg.version));
        }
        // init script
        if (yargs.argv.i || yargs.argv.init) {
            console.log("");
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["[Log] Initializing test suite files."], ["[Log] Initializing test suite files."]))));
            console.log("");
            // create the assembly folder if it doesn't exist
            var assemblyFolder = path_1.default.join(process.cwd(), "assembly");
            if (!fs_1.default.existsSync(assemblyFolder)) {
                console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["[Log] Creating folder: ./assembly/"], ["[Log] Creating folder: ./assembly/"]))));
                fs_1.default.mkdirSync(assemblyFolder);
            }
            // Create the test folder if it doesn't exist
            var testFolder = path_1.default.join(process.cwd(), "assembly", "__tests__");
            if (!fs_1.default.existsSync(testFolder)) {
                console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["[Log] Creating folder: ./assembly/__tests__/"], ["[Log] Creating folder: ./assembly/__tests__/"]))));
                fs_1.default.mkdirSync(testFolder);
                // create the example file only if the __tests__ folder does not exist
                var exampleFile = path_1.default.join(testFolder, "example.spec.ts");
                var exampleFileSource = path_1.default.join(__dirname, "..", "init", "example.spec.ts");
                if (!fs_1.default.existsSync(exampleFile)) {
                    console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["[Log] Creating file: ./assembly/__tests__/example.spec.ts"], ["[Log] Creating file: ./assembly/__tests__/example.spec.ts"]))));
                    fs_1.default.createReadStream(exampleFileSource, "utf-8")
                        .pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
                }
            }
            // create the types file if it doesn't exist for typescript tooling users
            var typesFileSource = path_1.default.join(__dirname, "..", "assembly", "__tests__", "as-pect.d.ts");
            var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
            if (!fs_1.default.existsSync(typesFile)) {
                console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["[Log] Creating file: assembly/__tests__/as-pect.d.ts"], ["[Log] Creating file: assembly/__tests__/as-pect.d.ts"]))));
                fs_1.default.createReadStream(typesFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
            }
            // create the default configuration file
            var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
            var configFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.config.js");
            if (!fs_1.default.existsSync(configFile)) {
                console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["[Log] Creating file: as-pect.config.js"], ["[Log] Creating file: as-pect.config.js"]))));
                fs_1.default.createReadStream(configFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
            }
        }
        else if (yargs.argv.v || yargs.argv.version) { // display the version
            console.log(pkg.version);
        }
        else if (yargs.argv.help || yargs.argv.h) { // display the help file
            console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --init                          Create a test config, an assembly/__tests__ folder and exit.\n    {bold.green asp} -i\n    {bold.green asp} --config as-pect.config.js      Use a specified configuration\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --version                       View the version.\n    {bold.green asp} -v\n\n  {bold.blueBright TEST OPTIONS}\n    {bold.green --performance}                        Enable performance statistics. {yellow (Default: true)}\n    {bold.green --min-samples [number]}               Set the minimum number of samples to run for each test. {yellow (Default: 10)}\n    {bold.green --max-samples [number]}               Set the maximum number of samples to run for each test. {yellow (Default: Infinity)}\n    {bold.green --min-test-run-time [number]}         Set the minimum test run time in milliseconds. {yellow (Default: 1000ms)}\n    {bold.green --max-test-run-time [number]}         Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}\n    {bold.green --report-median(=false)?}             Enable/Disable reporting of the median time. {yellow (Default: true)}\n    {bold.green --report-average(=false)?}            Enable reporting of the average time. {yellow (Default: true)}\n    {bold.green --report-standard-deviation(=false?)} Enable reporting of the standard deviation. {yellow (Default: false)}\n    {bold.green --report-max(=false?)}                Enable reporting of the largest run time. {yellow (Default: false)}\n    {bold.green --report-min(=false?)}                Enable reporting of the smallest run time. {yellow (Default: false)}\n  "], ["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --init                          Create a test config, an assembly/__tests__ folder and exit.\n    {bold.green asp} -i\n    {bold.green asp} --config as-pect.config.js      Use a specified configuration\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --version                       View the version.\n    {bold.green asp} -v\n\n  {bold.blueBright TEST OPTIONS}\n    {bold.green --performance}                        Enable performance statistics. {yellow (Default: true)}\n    {bold.green --min-samples [number]}               Set the minimum number of samples to run for each test. {yellow (Default: 10)}\n    {bold.green --max-samples [number]}               Set the maximum number of samples to run for each test. {yellow (Default: Infinity)}\n    {bold.green --min-test-run-time [number]}         Set the minimum test run time in milliseconds. {yellow (Default: 1000ms)}\n    {bold.green --max-test-run-time [number]}         Set the maximum test run time in milliseconds. {yellow (Default: 2000ms)}\n    {bold.green --report-median(=false)?}             Enable/Disable reporting of the median time. {yellow (Default: true)}\n    {bold.green --report-average(=false)?}            Enable reporting of the average time. {yellow (Default: true)}\n    {bold.green --report-standard-deviation(=false?)} Enable reporting of the standard deviation. {yellow (Default: false)}\n    {bold.green --report-max(=false?)}                Enable reporting of the largest run time. {yellow (Default: false)}\n    {bold.green --report-min(=false?)}                Enable reporting of the smallest run time. {yellow (Default: false)}\n  "]))));
        }
        else { // run the compiler and test suite
            var start_1 = perf_hooks_1.performance.now();
            // obtain the configuration file
            var configurationPath = path_1.default.resolve(process.cwd(), yargs.argv.c || yargs.argv.config || "./as-pect.config.js");
            console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["{bgWhite.black [Log]} using configuration ", ""], ["{bgWhite.black [Log]} using configuration ", ""])), configurationPath));
            var configuration_1 = {};
            try {
                configuration_1 = require(configurationPath) || {};
            }
            catch (ex) {
                console.log("");
                console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} There was a problem loading {bold [", "]}."])), configurationPath));
                console.log(ex);
                process.exit(1);
            }
            // configuration must be an object
            if (!configuration_1) {
                console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."])), configurationPath));
                process.exit(1);
            }
            var include = configuration_1.include || ["assembly/__tests__/**/*.spec.ts"];
            var add = configuration_1.add || ["assembly/__tests__/**/*.include.ts"];
            var flags = configuration_1.flags || {
                "--validate": [],
                "--debug": [],
                "--measure": [],
                "--sourceMap": [],
                /** This is required. Do not change this. */
                "--binaryFile": ["output.wasm"],
            };
            var disclude = configuration_1.disclude || [];
            var reporter_1 = configuration_1.reporter || new DefaultTestReporter_1.DefaultTestReporter();
            var performanceConfiguration = configuration_1.performance || {
                /** Enable performance statistics gathering. */
                enabled: true,
                /** Set the minimum number of samples to run for each test in milliseconds. */
                minSamples: 10,
                /** Set the maximum number of samples to run for each test. */
                maxSamples: Infinity,
                /** Set the minimum test run time in milliseconds. */
                minTestRunTime: 1000,
                /** Set the maximum test run time in milliseconds. */
                maxTestRunTime: 2000,
                /** Report the median time in the default reporter. */
                reportMedian: true,
                /** Report the average time in milliseconds. */
                reportAverage: true,
                /** Report the standard deviation. */
                reportStandardDeviation: false,
                /** Report the maximum run time in milliseconds. */
                reportMax: false,
                /** Report the minimum run time in milliseconds. */
                reportMin: false,
            };
            // setup performance options, overriding configured values if the flag is passed to the cli
            if (yargs.argv.hasOwnProperty("performance"))
                performanceConfiguration.enabled = yargs.argv.performance !== "false";
            // if performance is enabled, gather all the flags
            if (performanceConfiguration.enabled) {
                console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{bgWhite.black [Log]} Performance has been enabled on this test suite."], ["{bgWhite.black [Log]} Performance has been enabled on this test suite."]))));
                if (yargs.argv.hasOwnProperty("minSamples"))
                    performanceConfiguration.minSamples = parseFloat(yargs.argv.minSamples.toString());
                if (yargs.argv.hasOwnProperty("maxSamples"))
                    performanceConfiguration.maxSamples = parseFloat(yargs.argv.maxSamples.toString());
                if (yargs.argv.hasOwnProperty("minTestRunTime"))
                    performanceConfiguration.minTestRunTime = parseFloat(yargs.argv.minTestRunTime.toString());
                if (yargs.argv.hasOwnProperty("maxTestRunTime"))
                    performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
                if (yargs.argv.hasOwnProperty("maxTestRunTime"))
                    performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
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
            }
            // include all the file globs
            console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{bgWhite.black [Log]} Including files: ", ""], ["{bgWhite.black [Log]} Including files: ", ""])), include.join(", ")));
            // add a line seperator between the next line and this line
            console.log("");
            var testEntryFiles_1 = new Set();
            var addedTestEntryFiles_1 = new Set();
            // for each pattern
            for (var _i = 0, include_1 = include; _i < include_1.length; _i++) {
                var pattern = include_1[_i];
                // push all the resulting files so that each file gets tested individually
                entry: for (var _a = 0, _b = glob_1.default.sync(pattern); _a < _b.length; _a++) {
                    var entry = _b[_a];
                    // test for discludes
                    for (var _c = 0, disclude_1 = disclude; _c < disclude_1.length; _c++) {
                        var test = disclude_1[_c];
                        if (test.test(entry))
                            continue entry;
                    }
                    testEntryFiles_1.add(entry);
                }
            }
            for (var _d = 0, add_1 = add; _d < add_1.length; _d++) {
                var pattern = add_1[_d];
                // push all the added files to the added entry point list
                for (var _e = 0, _f = glob_1.default.sync(pattern); _e < _f.length; _e++) {
                    var entry = _f[_e];
                    addedTestEntryFiles_1.add(entry);
                }
            }
            // loop over each file and create a binary, index it on binaries
            var binaries_1 = {};
            var sourcemaps_1 = {};
            // must include the assembly/index.ts file located in the package
            var entryPath = path_1.default.join(__dirname, "../assembly/index.ts");
            var relativeEntryPath = path_1.default.relative(process.cwd(), entryPath);
            // add the relativeEntryPath of as-pect to the list of compiled files for each test
            addedTestEntryFiles_1.add(relativeEntryPath);
            // Create a test runner, and run each test
            var count_1 = testEntryFiles_1.size;
            // create the array of compiler flags from the flags object
            var flagList_1 = Object.entries(flags).reduce(function (args, _a) {
                var flag = _a[0], options = _a[1];
                return args.concat(flag, options);
            }, []);
            var testCount_1 = 0;
            var successCount_1 = 0;
            var groupSuccessCount_1 = 0;
            var groupCount_1 = 0;
            // for each file, synchronously run each test
            Array.from(testEntryFiles_1).forEach(function (file, i) {
                console.log("Compiling: " + file + " " + (i + 1).toString() + " / " + testEntryFiles_1.size.toString());
                asc_1.default.main([file].concat(Array.from(addedTestEntryFiles_1), flagList_1), {
                    stdout: process.stdout,
                    stderr: process.stderr,
                    writeFile: function (name, contents) {
                        var ext = path_1.default.extname(name);
                        // get the wasm file
                        if (ext === ".wasm") {
                            binaries_1[i] = contents;
                            return;
                        }
                        if (ext === ".map") {
                            sourcemaps_1[name] = contents;
                            return;
                        }
                        var outfileName = path_1.default.join(path_1.default.dirname(file), path_1.default.basename(file, path_1.default.extname(file)) + ext);
                        fs_1.default.writeFileSync(outfileName, contents);
                    }
                }, function (error) {
                    // if there are any compilation errors, stop the test suite
                    if (error) {
                        console.log("There was a compilation error when trying to create the wasm binary for file: " + file + ".");
                        console.error(error);
                        return process.exit(1);
                    }
                    // if the binary wasn't emitted, stop the test suite
                    if (!binaries_1[i]) {
                        console.log("There was no output binary file: " + file + ". Did you forget to emit the binary?");
                        return process.exit(1);
                    }
                    var runner = new TestContext_1.TestContext();
                    var imports = runner.createImports(configuration_1.imports || {});
                    var wasm = loader_1.instantiateBuffer(binaries_1[i], imports);
                    // call run buffer because it's already compiled
                    runner.run(wasm, reporter_1, file);
                    count_1 -= 1;
                    testCount_1 += runner.testGroups.reduce(function (left, right) { return left + right.tests.length; }, 0);
                    successCount_1 += runner.testGroups
                        .reduce(function (left, right) { return left + right.tests.filter(function (e) { return e.pass; }).length; }, 0);
                    groupCount_1 += runner.testGroups.length;
                    groupSuccessCount_1 = runner.testGroups.reduce(function (left, right) { return left + (right.pass ? 1 : 0); }, groupSuccessCount_1);
                    // if any tests failed, and they all ran, exit(1)
                    if (count_1 === 0) {
                        var end = perf_hooks_1.performance.now();
                        var failed = testCount_1 !== successCount_1;
                        var result = failed
                            ? chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"]))) : chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"])));
                        console.log("~".repeat(process.stdout.columns - 10));
                        console.log("\n  [Result]: " + result + "\n   [Files]: " + testEntryFiles_1.size + " total\n  [Groups]: " + groupCount_1 + " count, " + groupSuccessCount_1 + " pass\n [Summary]: " + successCount_1.toString() + " pass, " + (testCount_1 - successCount_1).toString() + " fail, " + testCount_1.toString() + " total\n    [Time]: " + timeDifference_1.timeDifference(end, start_1).toString() + "ms");
                        if (failed) {
                            process.exit(1);
                        }
                    }
                    return 0;
                });
            });
        }
    }
    exports.asp = asp;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15;
});
//# sourceMappingURL=cli.js.map