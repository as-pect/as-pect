(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./TestSuite", "./TestGroup", "assemblyscript/lib/loader", "./TestResult", "../reporter/DefaultReporter"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestSuite_1 = require("./TestSuite");
    var TestGroup_1 = require("./TestGroup");
    var loader_1 = require("assemblyscript/lib/loader");
    var TestResult_1 = require("./TestResult");
    var DefaultReporter_1 = require("../reporter/DefaultReporter");
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
//# sourceMappingURL=TestRunner.js.map