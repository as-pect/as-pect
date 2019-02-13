var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
define("test/TestResult", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestResult = /** @class */ (function () {
        function TestResult() {
            this.description = "";
            this.pass = false;
            this.time = 0;
            this.actual = "";
            this.expected = "";
            this.reason = "";
        }
        return TestResult;
    }());
    exports.TestResult = TestResult;
});
define("test/TestGroup", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestGroup = /** @class */ (function () {
        function TestGroup() {
            this.describe = -1;
            this.beforeAll = -1;
            this.beforeEach = -1;
            this.testFunctionPointers = [];
            this.testNamePointers = [];
            this.success = 0;
            this.fail = 0;
            this.total = 0;
            this.afterEach = -1;
            this.afterAll = -1;
            this.todoPointers = [];
            this.name = "";
            this.pass = false;
            this.time = 0;
            this.results = [];
            this.todos = [];
            this.reason = "";
        }
        return TestGroup;
    }());
    exports.TestGroup = TestGroup;
});
define("test/TestSuite", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestSuite = /** @class */ (function () {
        function TestSuite() {
            this.groups = [];
            this.total = 0;
            this.success = 0;
            this.fail = 0;
            this.filename = "";
            this.time = 0;
            this.passed = false;
        }
        return TestSuite;
    }());
    exports.TestSuite = TestSuite;
});
define("reporter/Reporter", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var Reporter = /** @class */ (function () {
        function Reporter() {
        }
        return Reporter;
    }());
    exports.Reporter = Reporter;
});
define("reporter/DefaultReporter", ["require", "exports", "reporter/Reporter", "chalk"], function (require, exports, Reporter_1, chalk_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_1 = __importDefault(chalk_1);
    var DefaultReporter = /** @class */ (function (_super) {
        __extends(DefaultReporter, _super);
        function DefaultReporter() {
            return _super !== null && _super.apply(this, arguments) || this;
        }
        DefaultReporter.prototype.onStart = function (suite) {
            console.log("");
            console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["[Log] Running: ", ""], ["[Log] Running: ", ""])), suite.filename));
            console.log("");
        };
        DefaultReporter.prototype.onGroupStart = function (group) {
            console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["[Describe]: ", ""], ["[Describe]: ", ""])), group.name));
            console.log("");
        };
        DefaultReporter.prototype.onGroupFinish = function (group) {
            var result = group.pass
                ? chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["{green \u2714 PASS}"], ["{green \u2714 PASS}"]))) : chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["{red \u2716 FAIL}"], ["{red \u2716 FAIL}"])));
            console.log("");
            console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
            console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["   [Tests]: ", " pass, ", " fail, ", " total"], ["   [Tests]: ", " pass, ", " fail, ", " total"])), group.success.toString(), group.fail.toString(), group.total.toString()));
            console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), group.time.toString()));
        };
        DefaultReporter.prototype.onTestStart = function (_group, _test) { };
        DefaultReporter.prototype.onTestFinish = function (_group, test) {
            if (test.pass) {
                console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject(["  {green [Success] \u2714} ", ""], ["  {green [Success] \u2714} ", ""])), test.description));
            }
            else {
                console.log("");
                console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["     {red [Fail] \u2716} ", ""], ["     {red [Fail] \u2716} ", ""])), test.description));
                console.log("");
                console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["   [Actual]: {red ", "}"], ["   [Actual]: {red ", "}"])), test.actual));
                console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject([" [Expected]: {green ", "}"], [" [Expected]: {green ", "}"])), test.expected));
            }
        };
        DefaultReporter.prototype.onFinish = function (suite) {
            var result = suite.passed
                ? chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["{green \u2714 Pass} "], ["{green \u2714 Pass} "]))) : chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["{red \u2716 Fail}"], ["{red \u2716 Fail}"])));
            console.log("");
            console.log(chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["    [File]: ", ""], ["    [File]: ", ""])), suite.filename));
            console.log(chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["  [Result]: ", ""], ["  [Result]: ", ""])), result));
            console.log(chalk_1.default(templateObject_16 || (templateObject_16 = __makeTemplateObject([" [Summary]: ", " pass, ", " fail, ", " total"], [" [Summary]: ", " pass, ", " fail, ", " total"])), suite.success.toString(), suite.fail.toString(), suite.total.toString()));
            console.log(chalk_1.default(templateObject_17 || (templateObject_17 = __makeTemplateObject(["    [Time]: ", "ms"], ["    [Time]: ", "ms"])), suite.time.toString()));
            console.log("");
        };
        return DefaultReporter;
    }(Reporter_1.Reporter));
    exports.DefaultReporter = DefaultReporter;
    var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15, templateObject_16, templateObject_17;
});
define("test/TestRunner", ["require", "exports", "test/TestSuite", "test/TestGroup", "assemblyscript/lib/loader", "test/TestResult", "reporter/DefaultReporter"], function (require, exports, TestSuite_1, TestGroup_1, loader_1, TestResult_1, DefaultReporter_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var performance = require('perf_hooks').performance;
    var hex = function (value) {
        var result = value.toString(16);
        if (result.length === 1)
            return "0" + result;
        return result;
    };
    var TestRunner = /** @class */ (function () {
        function TestRunner() {
            this.reason = "";
            this.suite = null;
            this.actual = "";
            this.expected = "";
            this.passed = true;
            this.wasm = null;
        }
        TestRunner.prototype.createImports = function (imports) {
            if (imports === void 0) { imports = {}; }
            imports.env = {
                abort: this.abort.bind(this),
            };
            imports.__aspect = {
                clearExpected: this.clearExpected.bind(this),
                tryCall: this.tryCall.bind(this),
                reportDescribe: this.reportDescribe.bind(this),
                reportTest: this.reportTest.bind(this),
                reportBeforeEach: this.reportBeforeEach.bind(this),
                reportBeforeAll: this.reportBeforeAll.bind(this),
                reportAfterEach: this.reportAfterEach.bind(this),
                reportAfterAll: this.reportAfterAll.bind(this),
                reportTodo: this.reportTodo.bind(this),
                reportExpectedReference: this.reportExpectedReference.bind(this),
                reportExpectedValue: this.reportExpectedValue.bind(this),
                reportExpectedNull: this.reportExpectedNull.bind(this),
            };
            return imports;
        };
        TestRunner.prototype.run = function (filename, buffer, imports, reporter) {
            if (imports === void 0) { imports = {}; }
            if (reporter === void 0) { reporter = new DefaultReporter_1.DefaultReporter(); }
            var start = 0;
            var end = 0;
            var groupstart = 0;
            var groupend = 0;
            var teststart = 0;
            var testend = 0;
            this.passed = true;
            this.suite = new TestSuite_1.TestSuite();
            this.wasm = loader_1.instantiateBuffer(buffer, this.createImports(imports));
            this.suite.filename = filename;
            reporter.onStart(this.suite);
            start = performance.now();
            groupLoop: for (var _i = 0, _a = this.suite.groups; _i < _a.length; _i++) {
                var group = _a[_i];
                // set the group name
                var groupName = this.wasm.getString(group.describe);
                group.name = groupName;
                group.pass = true;
                reporter.onGroupStart(group);
                // start the timer
                groupstart = performance.now();
                // run beforeAll
                var beforeAllResult = this.tryCall(group.beforeAll);
                // if the callback throws an error
                if (beforeAllResult === 0) {
                    groupend = performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + groupName + " failed in beforeAll callback.";
                    this.passed = false;
                    continue;
                }
                // for each test function
                for (var i = 0; i < group.testFunctionPointers.length; i++) {
                    // create a new test result
                    var result = new TestResult_1.TestResult();
                    var testname = this.wasm.getString(group.testNamePointers[i]);
                    result.description = testname;
                    // run beforeEach
                    var beforeEachResult = this.tryCall(group.beforeEach);
                    if (beforeEachResult === 0) {
                        groupend = performance.now();
                        group.pass = false;
                        group.reason = "Test suite " + groupName + " failed in beforeEach callback.";
                        this.passed = false;
                        continue groupLoop;
                    }
                    reporter.onTestStart(group, result);
                    // start the test
                    teststart = performance.now();
                    // run the test
                    var testCallResult = this.tryCall(group.testFunctionPointers[i]);
                    // the test is ended
                    testend = performance.now();
                    group.total++;
                    this.suite.total++;
                    // calculate test time
                    var testtime = Math.round((testend - teststart) * 1000) / 1000;
                    // the test passed!
                    if (testCallResult === 1) {
                        result.pass = true;
                        result.time = testtime;
                        group.success++;
                        this.suite.success++;
                    }
                    else { // the test failed
                        result.pass = false;
                        result.reason = this.reason;
                        result.actual = this.actual;
                        result.expected = this.expected;
                        group.fail++;
                        this.suite.fail++;
                        this.passed = false;
                    }
                    // run afterEach
                    var afterEachResult = this.tryCall(group.afterEach);
                    if (afterEachResult === 0) {
                        groupend = performance.now();
                        group.pass = false;
                        group.reason = "Test suite " + groupName + " failed in afterEach callback.";
                        this.passed = false;
                        continue groupLoop;
                    }
                    reporter.onTestFinish(group, result);
                }
                // run afterAll
                var afterAllResult = this.tryCall(group.afterAll);
                if (afterAllResult === 0) {
                    groupend = performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + groupName + " failed in afterAll callback.";
                    this.passed = false;
                    continue groupLoop;
                }
                groupend = performance.now();
                var grouptime = Math.round((groupend - groupstart) * 1000) / 1000;
                group.reason = "Test suite " + groupName + " passed successfully.";
                group.time = grouptime;
                reporter.onGroupFinish(group);
            }
            end = performance.now();
            this.suite.time = Math.round((end - start) * 1000) / 1000;
            this.suite.passed = this.passed;
            reporter.onFinish(this.suite);
        };
        TestRunner.prototype.tryCall = function (pointer) {
            if (pointer === -1)
                return 1;
            var func = this.wasm.getFunction(pointer);
            try {
                func();
            }
            catch (ex) {
                return 0;
            }
            return 1;
        };
        TestRunner.prototype.reportDescribe = function (suiteName) {
            var group = new TestGroup_1.TestGroup();
            group.describe = suiteName;
            this.suite.groups.push(group);
        };
        TestRunner.prototype.reportTest = function (testName, callback) {
            var group = this.suite.groups[this.suite.groups.length - 1];
            group.testFunctionPointers.push(callback);
            group.testNamePointers.push(testName);
        };
        TestRunner.prototype.reportBeforeEach = function (cb) {
            var group = this.suite.groups[this.suite.groups.length - 1];
            group.beforeEach = cb;
        };
        TestRunner.prototype.reportBeforeAll = function (cb) {
            var group = this.suite.groups[this.suite.groups.length - 1];
            group.beforeAll = cb;
        };
        TestRunner.prototype.reportAfterEach = function (cb) {
            var group = this.suite.groups[this.suite.groups.length - 1];
            group.afterEach = cb;
        };
        TestRunner.prototype.reportAfterAll = function (cb) {
            var group = this.suite.groups[this.suite.groups.length - 1];
            group.afterAll = cb;
        };
        TestRunner.prototype.reportExpectedReference = function (expected, actual, offset, negated) {
            this.expected = (negated === 1 ? "not " : "") +
                (expected === 0
                    ? "null"
                    : Array.from(this.wasm.U8.slice(expected, expected + offset)).map(hex).join(" "));
            this.actual = (actual === 0
                ? "null"
                : Array.from(this.wasm.U8.slice(actual, actual + offset)).map(hex).join(" "));
        };
        TestRunner.prototype.reportExpectedValue = function (expected, actual, negated) {
            this.expected = (negated ? "not " : "") + expected.toString();
            this.actual = actual.toString();
        };
        TestRunner.prototype.reportTodo = function (description) {
            var group = this.suite.groups[this.suite.groups.length - 1];
            group.todoPointers.push(description);
        };
        TestRunner.prototype.reportExpectedNull = function (negated) {
            this.expected = negated ? "not null" : "null";
            this.actual = negated ? "null" : "not null";
        };
        TestRunner.prototype.clearExpected = function () {
            this.expected = "";
            this.actual = "";
        };
        TestRunner.prototype.abort = function (reasonPointer, _fileNamePointer, _c, _d) {
            this.reason = this.wasm.getString(reasonPointer);
        };
        return TestRunner;
    }());
    exports.TestRunner = TestRunner;
});
define("util/IConfiguration", ["require", "exports"], function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
});
define("cli", ["require", "exports", "chalk", "path", "glob", "yargs-parser", "assemblyscript/cli/asc", "test/TestRunner", "fs"], function (require, exports, chalk_2, path_1, glob_1, yargs_parser_1, asc_1, TestRunner_1, fs_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    chalk_2 = __importDefault(chalk_2);
    path_1 = __importDefault(path_1);
    glob_1 = __importDefault(glob_1);
    yargs_parser_1 = __importDefault(yargs_parser_1);
    asc_1 = __importDefault(asc_1);
    fs_1 = __importDefault(fs_1);
    var pkg = require("../package.json");
    function asp(args) {
        var yargs = {
            argv: yargs_parser_1.default(args),
        };
        if (!(yargs.argv.v || yargs.argv.version)) {
            console.log(chalk_2.default(templateObject_18 || (templateObject_18 = __makeTemplateObject(["{bold.bgWhite.black ", "     ___   _____                       __  \n      /   | / ___/      ____  ___  _____/ /_ \n    / /| | \\__ \\______/ __ \\/ _ \\/ ___/ __/ \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n  /_/  |_/____/     / .___/\\___/\\___/\\__/   \n                    /_/                      }\n\n  AS-pect Test suite runner {bgGreenBright.black [", "]}\n  "], ["{bold.bgWhite.black ",
                "     ___   _____                       __  \n      /   | / ___/      ____  ___  _____/ /_ \n    / /| | \\\\__ \\\\______/ __ \\\\/ _ \\\\/ ___/ __/ \n    / ___ |___/ /_____/ /_/ /  __/ /__/ /_   \n  /_/  |_/____/     / .___/\\\\___/\\\\___/\\\\__/   \n                    /_/                      }\n\n  AS-pect Test suite runner {bgGreenBright.black [", "]}\n  "])), "", pkg.version));
        }
        if (yargs.argv.i || yargs.argv.init) {
            console.log("");
            console.log(chalk_2.default(templateObject_19 || (templateObject_19 = __makeTemplateObject(["[Log] Initializing test suite files."], ["[Log] Initializing test suite files."]))));
            console.log("");
            // Create the test folder
            var testFolder = path_1.default.join(process.cwd(), "assembly", "__tests__");
            if (!fs_1.default.existsSync(testFolder)) {
                console.log(chalk_2.default(templateObject_20 || (templateObject_20 = __makeTemplateObject(["[Log] Creating folder: assembly/__tests__"], ["[Log] Creating folder: assembly/__tests__"]))));
                fs_1.default.mkdirSync(testFolder);
            }
            var exampleFile = path_1.default.join(testFolder, "example.spec.ts");
            var exampleFileSource = path_1.default.join(__dirname, "..", "init", "example.spec.ts");
            if (!fs_1.default.existsSync(exampleFile)) {
                console.log(chalk_2.default(templateObject_21 || (templateObject_21 = __makeTemplateObject(["[Log] Creating file: assembly/__tests__/example.spec.ts"], ["[Log] Creating file: assembly/__tests__/example.spec.ts"]))));
                fs_1.default.createReadStream(exampleFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(exampleFile, "utf-8"));
            }
            var typesFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.d.ts");
            var typesFile = path_1.default.join(testFolder, "as-pect.d.ts");
            if (!fs_1.default.existsSync(typesFile)) {
                console.log(chalk_2.default(templateObject_22 || (templateObject_22 = __makeTemplateObject(["[Log] Creating file: assembly/__tests__/as-pect.d.ts"], ["[Log] Creating file: assembly/__tests__/as-pect.d.ts"]))));
                fs_1.default.createReadStream(typesFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(typesFile, "utf-8"));
            }
            var configFile = path_1.default.join(process.cwd(), "as-pect.config.js");
            var configFileSource = path_1.default.join(__dirname, "..", "init", "as-pect.config.js");
            if (!fs_1.default.existsSync(configFile)) {
                console.log(chalk_2.default(templateObject_23 || (templateObject_23 = __makeTemplateObject(["[Log] Creating file: as-pect.config.js"], ["[Log] Creating file: as-pect.config.js"]))));
                fs_1.default.createReadStream(configFileSource, "utf-8")
                    .pipe(fs_1.default.createWriteStream(configFile, "utf-8"));
            }
        }
        else if (yargs.argv.c || yargs.argv.config) {
            var configurationPath = path_1.default.resolve(process.cwd(), yargs.argv.c || yargs.argv.config);
            console.log(chalk_2.default(templateObject_24 || (templateObject_24 = __makeTemplateObject(["{bgWhite.black [Log]} using configuration ", ""], ["{bgWhite.black [Log]} using configuration ", ""])), configurationPath));
            var configuration_1 = null;
            try {
                configuration_1 = require(configurationPath);
            }
            catch (ex) {
                console.log("");
                console.log(chalk_2.default(templateObject_25 || (templateObject_25 = __makeTemplateObject(["{bgRedBright.black [Error]} problem loading {bold [", "]}."], ["{bgRedBright.black [Error]} problem loading {bold [", "]}."])), configurationPath));
                console.log(ex);
                process.exit(1);
            }
            if (!(typeof configuration_1 === "object")) {
                console.log("");
                console.log(chalk_2.default(templateObject_26 || (templateObject_26 = __makeTemplateObject(["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."], ["{bgRedBright.black [Error]} configuration at {bold [", "]} is null or not an object."])), configurationPath));
                process.exit(1);
            }
            console.log(chalk_2.default(templateObject_27 || (templateObject_27 = __makeTemplateObject(["[Log] including files ", ""], ["[Log] including files ", ""])), configuration_1.include.join(", ")));
            console.log("");
            console.log("");
            var files_1 = [];
            for (var _i = 0, _a = configuration_1.include; _i < _a.length; _i++) {
                var pattern = _a[_i];
                files_1.push.apply(files_1, glob_1.default.sync(pattern));
            }
            var disclude = configuration_1.disclude || [];
            disclude.forEach(function (regexp) {
                files_1 = files_1.filter(function (file) { return !regexp.test(file); });
            });
            ;
            var binaries_1 = {};
            var entryPath = path_1.default.join(__dirname, "../assembly/index.ts");
            var relativePath_1 = path_1.default.relative(process.cwd(), entryPath);
            var failed_1 = false;
            var count_1 = files_1.length;
            var runner_1 = new TestRunner_1.TestRunner();
            files_1.forEach(function (file, i) {
                console.log(chalk_2.default(templateObject_28 || (templateObject_28 = __makeTemplateObject(["[Log] Compiling: ", " ", " / ", ""], ["[Log] Compiling: ", " ", " / ", ""])), file, (i + 1).toString(), files_1.length.toString()));
                console.log("");
                asc_1.default.main([
                    file, relativePath_1,
                    "--validate",
                    "--debug",
                    "--measure",
                    "--binaryFile", "output.wasm",
                ], {
                    // @ts-ignore: this is fine
                    stdout: process.stdout,
                    // @ts-ignore: this is fine
                    stderr: process.stderr,
                    writeFile: function (name, contents) {
                        if (path_1.default.extname(name) === ".wasm") {
                            binaries_1[i] = contents;
                        }
                    }
                }, function (error) {
                    if (error) {
                        console.log(chalk_2.default(templateObject_29 || (templateObject_29 = __makeTemplateObject(["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."], ["{red [Error]} There was a compilation error when trying to create the wasm binary for file: ", "."])), file));
                        console.log(error);
                        process.exit(1);
                        return;
                    }
                    if (!binaries_1[i]) {
                        console.log(chalk_2.default(templateObject_30 || (templateObject_30 = __makeTemplateObject(["{red [Error]} There was no output binary file: ", "."], ["{red [Error]} There was no output binary file: ", "."])), file));
                        process.exit(1);
                        return;
                    }
                    runner_1.run(file, binaries_1[i], Object.assign({}, configuration_1.imports), configuration_1.reporter || void 0);
                    count_1 -= 1;
                    failed_1 = failed_1 || !runner_1.passed;
                    if (count_1 === 0 && failed_1) {
                        process.exit(1);
                    }
                });
            });
        }
        else if (yargs.argv.v || yargs.argv.version) {
            console.log(pkg.version);
        }
        else {
            console.log(chalk_2.default(templateObject_31 || (templateObject_31 = __makeTemplateObject(["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --config as-pect.config.js\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --init\n    {bold.green asp} -i\n    {bold.green asp} --version\n    {bold.green asp} -v\n\n  {bold.blueBright OPTIONS}\n    {bold.green --version, -v}         Prints the package version and exits.\n    {bold.green --help, -h}            Prints this message and exits.\n    {bold.green --config, -c}          Accepts a configuration file and runs the tests.\n    {bold.green --init, -i}            Creates a test config, an assembly/__tests__ folder and exits.\n  "], ["\n  {bold.blueBright SYNTAX}\n    {bold.green asp} --config as-pect.config.js\n    {bold.green asp} -c as-pect.config.js\n    {bold.green asp} --init\n    {bold.green asp} -i\n    {bold.green asp} --version\n    {bold.green asp} -v\n\n  {bold.blueBright OPTIONS}\n    {bold.green --version, -v}         Prints the package version and exits.\n    {bold.green --help, -h}            Prints this message and exits.\n    {bold.green --config, -c}          Accepts a configuration file and runs the tests.\n    {bold.green --init, -i}            Creates a test config, an assembly/__tests__ folder and exits.\n  "]))));
        }
    }
    exports.default = asp;
    var templateObject_18, templateObject_19, templateObject_20, templateObject_21, templateObject_22, templateObject_23, templateObject_24, templateObject_25, templateObject_26, templateObject_27, templateObject_28, templateObject_29, templateObject_30, templateObject_31;
});
define("as-pect", ["require", "exports", "test/TestGroup", "test/TestResult", "test/TestRunner", "test/TestSuite", "reporter/DefaultReporter", "reporter/Reporter", "cli"], function (require, exports, TestGroup_2, TestResult_2, TestRunner_2, TestSuite_2, DefaultReporter_2, Reporter_2, cli_1) {
    "use strict";
    function __export(m) {
        for (var p in m) if (!exports.hasOwnProperty(p)) exports[p] = m[p];
    }
    Object.defineProperty(exports, "__esModule", { value: true });
    cli_1 = __importDefault(cli_1);
    __export(TestGroup_2);
    __export(TestResult_2);
    __export(TestRunner_2);
    __export(TestSuite_2);
    __export(DefaultReporter_2);
    __export(Reporter_2);
    exports.asp = cli_1.default;
});
define("test", ["require", "exports", "cli"], function (require, exports, cli_2) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    cli_2 = __importDefault(cli_2);
    cli_2.default(process.argv.slice(2));
});
//# sourceMappingURL=as-pect.amd.js.map