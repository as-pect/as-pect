"use strict";
var __makeTemplateObject = (this && this.__makeTemplateObject) || function (cooked, raw) {
    if (Object.defineProperty) { Object.defineProperty(cooked, "raw", { value: raw }); } else { cooked.raw = raw; }
    return cooked;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var TestSuite_1 = require("./TestSuite");
var chalk_1 = __importDefault(require("chalk"));
var loader_1 = require("assemblyscript/lib/loader");
var hex = function (value) {
    var result = value.toString(16);
    if (result.length === 1)
        return "0" + result;
    return result;
};
var TestRunner = /** @class */ (function () {
    function TestRunner(buffer, imports) {
        this.reason = "";
        this.suites = [];
        this.actual = "";
        this.expected = "";
        this.wasm = loader_1.instantiateBuffer(buffer, this.createImports(imports));
    }
    TestRunner.prototype.createImports = function (imports) {
        if (imports === void 0) { imports = {}; }
        imports.env = {
            abort: this.abort.bind(this),
        };
        imports.__aspect = {
            tryCall: this.tryCall.bind(this),
            reportDescribe: this.reportDescribe.bind(this),
            reportTest: this.reportTest.bind(this),
            reportBeforeEach: this.reportBeforeEach.bind(this),
            reportBeforeAll: this.reportBeforeAll.bind(this),
            reportAfterEach: this.reportAfterEach.bind(this),
            reportAfterAll: this.reportAfterAll.bind(this),
            reportTodo: this.reportTodo.bind(this),
        };
        return imports;
    };
    TestRunner.prototype.run = function () {
        var start = Date.now();
        var failed = 0;
        var success = 0;
        var total = 0;
        for (var _i = 0, _a = this.suites; _i < _a.length; _i++) {
            var suite = _a[_i];
            console.log("");
            console.log(chalk_1.default(templateObject_1 || (templateObject_1 = __makeTemplateObject(["Describe {bold ", "}:"], ["Describe {bold ", "}:"])), suite.describe));
            for (var _b = 0, _e = suite.todos; _b < _e.length; _b++) {
                var todo = _e[_b];
                console.log(chalk_1.default(templateObject_2 || (templateObject_2 = __makeTemplateObject(["  {bgWhite.black [TODO]} ", ""], ["  {bgWhite.black [TODO]} ", ""])), this.wasm.getString(todo)));
            }
            console.log("");
            var beforeAllResult = this.tryCall(suite.beforeAll);
            if (beforeAllResult === 0) {
                console.log(chalk_1.default(templateObject_3 || (templateObject_3 = __makeTemplateObject(["  {bgBrightRed.black [Failure]} Test suite ", " failed in beforeAll callback."], ["  {bgBrightRed.black [Failure]} Test suite ", " failed in beforeAll callback."])), suite.describe));
                console.log(chalk_1.default(templateObject_4 || (templateObject_4 = __makeTemplateObject(["    {bgWhite.black [Reason]} ", ""], ["    {bgWhite.black [Reason]} ", ""])), this.reason));
            }
            for (var i = 0; i < suite.tests.length; i++) {
                var beforeEachResult = this.tryCall(suite.beforeEach);
                if (beforeEachResult === 0) {
                    console.log(chalk_1.default(templateObject_5 || (templateObject_5 = __makeTemplateObject(["  {beRedBright.black [Failure]} Test suite ", " failed in beforeEach callback."], ["  {beRedBright.black [Failure]} Test suite ", " failed in beforeEach callback."])), suite.describe));
                    console.log(chalk_1.default(templateObject_6 || (templateObject_6 = __makeTemplateObject(["    {bgWhite.black [Reason]} ", ""], ["    {bgWhite.black [Reason]} ", ""])), this.reason));
                    break;
                }
                var testName = suite.testNames[i];
                var testResult = this.tryCall(suite.tests[i]);
                total += 1;
                if (testResult === 1) {
                    success += 1;
                    console.log(chalk_1.default(templateObject_7 || (templateObject_7 = __makeTemplateObject(["  {bgWhite.black [Success]} ", ""], ["  {bgWhite.black [Success]} ", ""])), testName));
                }
                else {
                    failed += 1;
                    console.log("");
                    console.log(chalk_1.default(templateObject_8 || (templateObject_8 = __makeTemplateObject([" {bgRedBright.black [Failure]} ", ""], [" {bgRedBright.black [Failure]} ", ""])), testName));
                    console.log(chalk_1.default(templateObject_9 || (templateObject_9 = __makeTemplateObject(["    {bgWhite.black [Reason]} ", ""], ["    {bgWhite.black [Reason]} ", ""])), this.reason));
                    console.log(chalk_1.default(templateObject_10 || (templateObject_10 = __makeTemplateObject(["    {bgWhite.black [Actual]} {red ", "}"], ["    {bgWhite.black [Actual]} {red ", "}"])), this.actual));
                    console.log(chalk_1.default(templateObject_11 || (templateObject_11 = __makeTemplateObject(["    {bgWhite.black [Expected]} {greenBright ", "}"], ["    {bgWhite.black [Expected]} {greenBright ", "}"])), this.actual));
                    console.log("");
                    console.log("");
                }
                var afterEachResult = this.tryCall(suite.afterEach);
                if (afterEachResult === 0) {
                    console.log(chalk_1.default(templateObject_12 || (templateObject_12 = __makeTemplateObject(["  {beRedBright.black [Failure]} Test suite ", " failed in afterEach callback."], ["  {beRedBright.black [Failure]} Test suite ", " failed in afterEach callback."])), suite.describe));
                    console.log(chalk_1.default(templateObject_13 || (templateObject_13 = __makeTemplateObject(["    {bgWhite.black [Reason]} ", ""], ["    {bgWhite.black [Reason]} ", ""])), this.reason));
                    break;
                }
            }
        }
        var end = Date.now();
        console.log("");
        console.log("");
        console.log("Test suite " + (failed === 0 ? chalk_1.default(templateObject_14 || (templateObject_14 = __makeTemplateObject(["{bgGreenBright.black PASS}"], ["{bgGreenBright.black PASS}"]))) : chalk_1.default(templateObject_15 || (templateObject_15 = __makeTemplateObject(["{bgRedBright.white FAIL}"], ["{bgRedBright.white FAIL}"])))));
        console.log("Tests:      " + success + " passed, " + total + " total");
        console.log("Time:       " + (end - start) + "ms");
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
        var suite = new TestSuite_1.TestSuite();
        suite.describe = this.wasm.getString(suiteName);
        this.suites.push(suite);
    };
    TestRunner.prototype.reportTest = function (testName, callback) {
        var suite = this.suites[this.suites.length - 1];
        suite.tests.push(callback);
        suite.testNames.push(this.wasm.getString(testName));
    };
    TestRunner.prototype.reportBeforeEach = function (cb) {
        var suite = this.suites[this.suites.length - 1];
        suite.beforeEach = cb;
    };
    TestRunner.prototype.reportBeforeAll = function (cb) {
        var suite = this.suites[this.suites.length - 1];
        suite.beforeAll = cb;
    };
    TestRunner.prototype.reportAfterEach = function (cb) {
        var suite = this.suites[this.suites.length - 1];
        suite.afterEach = cb;
    };
    TestRunner.prototype.reportAfterAll = function (cb) {
        var suite = this.suites[this.suites.length - 1];
        suite.afterAll = cb;
    };
    TestRunner.prototype.reportExpectedReference = function (expected, actual, offset) {
        this.expected = Array.from(this.wasm.U8.slice(expected, expected + offset)).map(hex).join(" ");
        this.actual = Array.from(this.wasm.U8.slice(actual, actual + offset)).map(hex).join(" ");
    };
    TestRunner.prototype.reportExpectedValue = function (expected, actual) {
        this.expected = expected.toString();
        this.actual = actual.toString();
    };
    TestRunner.prototype.reportTodo = function (description) {
        var suite = this.suites[this.suites.length - 1];
        suite.todos.push(description);
    };
    TestRunner.prototype.abort = function (reasonPointer, _fileNamePointer, _c, _d) {
        this.reason = this.wasm.getString(reasonPointer);
    };
    return TestRunner;
}());
exports.TestRunner = TestRunner;
var templateObject_1, templateObject_2, templateObject_3, templateObject_4, templateObject_5, templateObject_6, templateObject_7, templateObject_8, templateObject_9, templateObject_10, templateObject_11, templateObject_12, templateObject_13, templateObject_14, templateObject_15;
