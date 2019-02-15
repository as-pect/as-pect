var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./TestSuite", "./TestGroup", "assemblyscript/lib/loader", "./TestResult", "../reporter/DefaultReporter", "../util/LogValue", "../util/ActualValue"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestSuite_1 = require("./TestSuite");
    var TestGroup_1 = require("./TestGroup");
    var loader_1 = require("assemblyscript/lib/loader");
    var TestResult_1 = require("./TestResult");
    var DefaultReporter_1 = require("../reporter/DefaultReporter");
    var LogValue_1 = require("../util/LogValue");
    var ActualValue_1 = require("../util/ActualValue");
    var performance = require('perf_hooks').performance;
    var wasmFilter = function (input) { return /wasm/i.test(input); };
    /**
     * The test class that hooks up the web assembly imports, and runs each test group in a file.
     */
    var TestRunner = /** @class */ (function () {
        function TestRunner() {
            /**
             * This is the value set by the web assembly module whenever an expectation fails.
             */
            this.message = "";
            /**
             * This is the currently running TestSuite.
             */
            this.suite = null;
            /**
             * This is the ActualValue that represents the current actual value reported by an expectation.
             */
            this.actual = null;
            /**
             * This is the ActualValue that represents the current expected value reported by an expectation.
             */
            this.expected = null;
            /**
             * This boolean is set to true for every run, and is true if the test suite passed.
             */
            this.passed = true;
            /**
             * This is the web assembly module.
             */
            this.wasm = null;
            /**
             * The currently running test.
             */
            this.currentTest = null;
            /**
             * The currently running test group.
             */
            this.currentGroup = null;
            /**
             * The index of the next group log to be logged to the reporter.
             */
            this.groupLogIndex = 0;
            /**
             * The current reporter.
             */
            this.reporter = null;
            /**
             * The stack trace generated when the currently running test threw.
             */
            this.stack = "";
        }
        /**
         * This function generates web assembly imports object.
         *
         * @param {any} imports - The web assembly imports to be mixed in.
         */
        TestRunner.prototype.createImports = function (imports) {
            if (imports === void 0) { imports = {}; }
            imports.env = {
                abort: this.abort.bind(this),
            };
            imports.__aspect = {
                clearExpected: this.clearExpected.bind(this),
                tryCall: this.tryCall.bind(this),
                logNull: this.logNull.bind(this),
                logReference: this.logReference.bind(this),
                logString: this.logString.bind(this),
                logValue: this.logValue.bind(this),
                reportDescribe: this.reportDescribe.bind(this),
                reportTest: this.reportTest.bind(this),
                reportBeforeEach: this.reportBeforeEach.bind(this),
                reportBeforeAll: this.reportBeforeAll.bind(this),
                reportAfterEach: this.reportAfterEach.bind(this),
                reportAfterAll: this.reportAfterAll.bind(this),
                reportTodo: this.reportTodo.bind(this),
                reportActualNull: this.reportActualNull.bind(this),
                reportExpectedNull: this.reportExpectedNull.bind(this),
                reportActualValue: this.reportActualValue.bind(this),
                reportExpectedValue: this.reportExpectedValue.bind(this),
                reportActualReference: this.reportActualReference.bind(this),
                reportExpectedReference: this.reportExpectedReference.bind(this),
                reportActualString: this.reportActualString.bind(this),
                reportExpectedString: this.reportExpectedString.bind(this),
                reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
                reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
            };
            return imports;
        };
        /**
         * Runs a test suite from a compiled AssemblyScript module buffer.
         *
         * @param {string} filename - The name of the file.
         * @param {Uint8Array} buffer - The buffer containing the AssemblyScript module.
         * @param {any} imports - Custom web assembly imports object.
         * @param {Reporter} reporter - The reporter that reports each test and fail.
         */
        TestRunner.prototype.runBuffer = function (filename, buffer, imports, reporter) {
            if (imports === void 0) { imports = {}; }
            if (reporter === void 0) { reporter = new DefaultReporter_1.DefaultReporter(); }
            this.suite = new TestSuite_1.TestSuite();
            this.wasm = loader_1.instantiateBuffer(buffer, this.createImports(imports));
            this.reporter = reporter;
            this.run(filename);
        };
        /**
         * Runs a test suite from a fetched reponse object that resolves to an AssemblyScript module.
         *
         * @param {string} filename - The name of the file.
         * @param {Promise<Response>} response - The buffer containing the AssemblyScript module.
         * @param {any} imports - Custom web assembly imports object.
         * @param {Reporter} reporter - The reporter that reports each test and fail.
         */
        TestRunner.prototype.runStreaming = function (filename, response, imports, reporter) {
            if (imports === void 0) { imports = {}; }
            if (reporter === void 0) { reporter = new DefaultReporter_1.DefaultReporter(); }
            return __awaiter(this, void 0, void 0, function () {
                var _a;
                return __generator(this, function (_b) {
                    switch (_b.label) {
                        case 0:
                            this.suite = new TestSuite_1.TestSuite();
                            _a = this;
                            return [4 /*yield*/, loader_1.instantiateStreaming(response, this.createImports(imports))];
                        case 1:
                            _a.wasm = _b.sent();
                            this.reporter = reporter;
                            this.run(filename);
                            return [2 /*return*/];
                    }
                });
            });
        };
        /**
         * This function should be called after the test suite is initialized and the web assembly module
         * has been instantiated.
         *
         * @param {string} filename - The name of the test file.
         * @param {Reporter} reporter - The reporter that reports each test and fail.
         */
        TestRunner.prototype.run = function (filename) {
            if (!this.reporter) {
                throw new Error("Reporter is null, did you forget to set the reporter?");
            }
            var reporter = this.reporter;
            var start = 0;
            var end = 0;
            var groupstart = 0;
            var groupend = 0;
            var teststart = 0;
            var testend = 0;
            var suite = this.suite;
            var wasm = this.wasm;
            var passed = true;
            // set the filename
            suite.filename = filename;
            // report onStart
            reporter.onStart(suite);
            start = performance.now();
            // for each test group generated by the module
            groupLoop: for (var _i = 0, _a = suite.testGroups; _i < _a.length; _i++) {
                var group = _a[_i];
                this.groupLogIndex = 0;
                // set the group name
                var groupName = wasm.getString(group.suiteNamePointer);
                group.name = groupName;
                group.pass = true;
                this.currentGroup = group;
                // list each todo
                for (var _b = 0, _c = group.todoPointers; _b < _c.length; _b++) {
                    var todoPointer = _c[_b];
                    // dereference the todoPointer
                    var todo = wasm.getString(todoPointer);
                    // add it to the list, but don't report it yet.
                    group.todos.push(todo);
                }
                // update group and suite metadata
                group.todoCount = group.todoPointers.length;
                suite.todoCount += group.todoCount;
                // start reporting the group
                reporter.onGroupStart(group);
                for (var _d = 0, _e = group.todos; _d < _e.length; _d++) {
                    var todo = _e[_d];
                    // report each todo first before starting the timer
                    reporter.onTodo(group, todo);
                }
                // start the timer
                groupstart = performance.now();
                // run beforeAll
                var beforeAllResult = this.tryCall(group.beforeAllPointer);
                // if the callback throws an error
                if (beforeAllResult === 0) {
                    groupend = performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + groupName + " failed in beforeAll callback.";
                    passed = false;
                    continue;
                }
                // logged values can happen in the beforeAll callback
                this.flushGroupLogs();
                // for each test function
                for (var i = 0; i < group.testFunctionPointers.length; i++) {
                    // create a new test result
                    var result = new TestResult_1.TestResult();
                    this.currentTest = result;
                    var testname = wasm.getString(group.testNamePointers[i]);
                    result.testName = testname;
                    // run beforeEach
                    var beforeEachResult = this.tryCall(group.beforeEachPointer);
                    if (beforeEachResult === 0) {
                        groupend = performance.now();
                        group.pass = false;
                        group.reason = "Test suite " + groupName + " failed in beforeEach callback.";
                        passed = false;
                        continue groupLoop;
                    }
                    // logs can happen before each test
                    this.flushGroupLogs();
                    // report test start
                    reporter.onTestStart(group, result);
                    // start the test
                    teststart = performance.now();
                    // run the test
                    var testCallResult = this.tryCall(group.testFunctionPointers[i]);
                    // the test is ended
                    testend = performance.now();
                    group.totalCount++;
                    suite.totalTests++;
                    // calculate test time
                    var testtime = Math.round((testend - teststart) * 1000) / 1000;
                    // the test passed!
                    if (testCallResult === 1) {
                        // pass the test
                        result.pass = true;
                        result.time = testtime;
                        // increase group success count
                        group.successCount++;
                        // increase test suite success count
                        suite.successCount++;
                    }
                    else { // the test failed
                        // collect the metadata
                        result.pass = false;
                        result.message = this.message;
                        result.actual = this.actual;
                        result.expected = this.expected;
                        result.stack = this.stack;
                        // fail the group
                        group.failCount++;
                        group.pass = false;
                        // fail the suite
                        suite.failCount++;
                        passed = false;
                    }
                    // run afterEach
                    var afterEachResult = this.tryCall(group.afterEachPointer);
                    if (afterEachResult === 0) {
                        groupend = performance.now();
                        group.pass = false;
                        group.reason = "Test suite " + groupName + " failed in afterEach callback.";
                        passed = false;
                        continue groupLoop;
                    }
                    // report test finish
                    reporter.onTestFinish(group, result);
                    // logs can happen after each test
                    this.flushGroupLogs();
                    this.currentTest = null;
                }
                // run afterAll
                var afterAllResult = this.tryCall(group.afterAllPointer);
                if (afterAllResult === 0) {
                    groupend = performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + groupName + " failed in afterAll callback.";
                    passed = false;
                    continue groupLoop;
                }
                // logs can happen in afterAll callback
                this.flushGroupLogs();
                // end group timing
                groupend = performance.now();
                this.currentGroup = null;
                // calculate the group time
                var grouptime = Math.round((groupend - groupstart) * 1000) / 1000;
                group.reason = "Test suite " + groupName + " passed successfully.";
                group.time = grouptime;
                reporter.onGroupFinish(group);
            }
            // end the test suite timing
            end = performance.now();
            suite.time = Math.round((end - start) * 1000) / 1000;
            suite.pass = passed;
            this.passed = passed;
            // report finished
            reporter.onFinish(suite);
        };
        /**
         * Flush all the collected log values to the logger.
         */
        TestRunner.prototype.flushGroupLogs = function () {
            for (; this.groupLogIndex < this.currentGroup.log.length; this.groupLogIndex++) {
                this.reporter.onLog(this.currentGroup.log[this.groupLogIndex]);
            }
        };
        /**
         * This is a web assembly utility function that wraps a function call in a try catch block to
         * report success or failure.
         *
         * @param {number} pointer - The function pointer to call. It must accept no parameters and return
         * void.
         * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
         * returns 0.
         */
        TestRunner.prototype.tryCall = function (pointer) {
            if (pointer === -1)
                return 1;
            var func = this.wasm.getFunction(pointer);
            try {
                func();
            }
            catch (ex) {
                this.stack = this.getErrorStackTrace(ex);
                return 0;
            }
            return 1;
        };
        /**
         * This web assembly linked function creates a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It returns a pointer to the
         * suiteName string.
         *
         * @param {number} suiteNamePointer
         */
        TestRunner.prototype.reportDescribe = function (suiteNamePointer) {
            var group = new TestGroup_1.TestGroup();
            group.suiteNamePointer = suiteNamePointer;
            this.suite.testGroups.push(group);
        };
        /**
         * This web assembly linked function creates a test from the callback and the testNamePointer in
         * the current group. It assumes that the group has already been created with the describe
         * function. It is called when `it("description", callback)` or `test("description", callback)`
         * is called.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         */
        TestRunner.prototype.reportTest = function (testNamePointer, callback) {
            var group = this.suite.testGroups[this.suite.testGroups.length - 1];
            group.testFunctionPointers.push(callback);
            group.testNamePointers.push(testNamePointer);
        };
        /**
         * This web assembly linked function sets the group's "beforeEach" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test.
         */
        TestRunner.prototype.reportBeforeEach = function (callbackPointer) {
            var group = this.suite.testGroups[this.suite.testGroups.length - 1];
            group.beforeEachPointer = callbackPointer;
        };
        /**
         * This web assembly linked function sets the group's "beforeAll" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        TestRunner.prototype.reportBeforeAll = function (callbackPointer) {
            var group = this.suite.testGroups[this.suite.testGroups.length - 1];
            group.beforeAllPointer = callbackPointer;
        };
        /**
         * This web assembly linked function sets the group's "afterEach" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        TestRunner.prototype.reportAfterEach = function (callbackPointer) {
            var group = this.suite.testGroups[this.suite.testGroups.length - 1];
            group.afterEachPointer = callbackPointer;
        };
        /**
         * This web assembly linked function sets the group's "afterAll" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        TestRunner.prototype.reportAfterAll = function (callbackPointer) {
            var testGroup = this.suite.testGroups[this.suite.testGroups.length - 1];
            testGroup.afterAllPointer = callbackPointer;
        };
        /**
         * This function reports a single "todo" item in a test suite.
         *
         * @param {number} todoPointer - The todo description string pointer.
         */
        TestRunner.prototype.reportTodo = function (todoPointer) {
            var testGroup = this.suite.testGroups[this.suite.testGroups.length - 1];
            testGroup.todoPointers.push(todoPointer);
        };
        /**
         * This function reports an actual string value.
         *
         * @param {number} stringPointer - A pointer that points to the actual string.
         */
        TestRunner.prototype.reportActualString = function (stringPointer) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "\"" + this.wasm.getString(stringPointer).replace("\"", "\\\"") + "\"";
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            this.actual = value;
        };
        /**
         * This function reports an expected string value.
         *
         * @param {number} stringPointer - A pointer that points to the expected string.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestRunner.prototype.reportExpectedString = function (stringPointer, negated) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "\"" + this.wasm.getString(stringPointer).replace("\"", "\\\"") + "\"";
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual null value.
         */
        TestRunner.prototype.reportActualNull = function () {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            this.actual = value;
        };
        /**
         * This function reports an expected null value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestRunner.prototype.reportExpectedNull = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual numeric value.
         *
         * @param {number} numericValue - The value to be expected.
         */
        TestRunner.prototype.reportActualValue = function (numericValue) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            this.actual = value;
        };
        /**
         * This function reports an expected numeric value.
         *
         * @param {number} numericValue - The value to be expected
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestRunner.prototype.reportExpectedValue = function (numericValue, negated) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual reference value.
         *
         * @param {number} referencePointer - The actual reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         */
        TestRunner.prototype.reportActualReference = function (referencePointer, offset) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "Reference Type";
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            this.actual = value;
        };
        /**
         * This function reports an expected reference value.
         *
         * @param {number} referencePointer - The expected reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestRunner.prototype.reportExpectedReference = function (referencePointer, offset, negated) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "Reference Type";
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected truthy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestRunner.prototype.reportExpectedTruthy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "truthy";
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected falsy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestRunner.prototype.reportExpectedFalsy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.group = this.currentGroup;
            value.message = "falsy";
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function is called after each expectation if the expectation passes. This prevents other
         * unreachable() conditions that throw errors to report actual and expected values too.
         */
        TestRunner.prototype.clearExpected = function () {
            this.expected = null;
            this.actual = null;
            this.stack = "";
        };
        /**
         * This function overrides the provided AssemblyScript `env.abort()` function to catch abort
         * reasons.
         *
         * @param {number} reasonPointer - This points to the message value that causes the expectation to
         * fail.
         * @param {number} _fileNamePointer - The file name that reported the error. (Ignored)
         * @param {number} _line - The line that reported the error. (Ignored)
         * @param {number} _col - The column that reported the error. (Ignored)
         */
        TestRunner.prototype.abort = function (reasonPointer, _fileNamePointer, _line, _col) {
            this.message = this.wasm.getString(reasonPointer);
        };
        /**
         * This adds a logged string to the current test.
         *
         * @param {number} pointer - The pointer to the logged string reference.
         */
        TestRunner.prototype.logString = function (pointer) {
            var value = new LogValue_1.LogValue();
            value.group = this.currentGroup || null;
            value.message = "\"" + this.wasm.getString(pointer).replace("\"", "\\\"") + "\"";
            value.offset = 0;
            value.pointer = pointer;
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest || null;
            // add the log value to the current test
            if (this.currentTest) {
                this.currentTest.log.push(value);
            }
            // add the log value to the current group
            if (this.currentGroup) {
                this.currentGroup.log.push(value);
            }
        };
        /**
         * Log a reference to the reporter.
         *
         * @param {number} referencePointer - The pointer to the reference.
         * @param {number} offset - The offset of the reference.
         */
        TestRunner.prototype.logReference = function (referencePointer, offset) {
            var value = new LogValue_1.LogValue();
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.group = this.currentGroup || null;
            value.message = "Reference Type";
            value.offset = offset;
            value.pointer = referencePointer;
            value.stack = this.getLogStackTrace();
            value.test = this.currentTest || null;
            // add the log value to the current test
            if (this.currentTest) {
                this.currentTest.log.push(value);
            }
            // add the log value to the current group
            if (this.currentGroup) {
                this.currentGroup.log.push(value);
            }
        };
        /**
         * Log a numevalueric value to the reporter.
         *
         * @param {number} value - The value to be logged.
         */
        TestRunner.prototype.logValue = function (numericValue) {
            var value = new LogValue_1.LogValue();
            value.group = this.currentGroup || null;
            value.test = this.currentTest || null;
            value.stack = this.getLogStackTrace();
            value.message = "Value " + numericValue.toString();
            // add the log value to the current test
            if (this.currentTest) {
                this.currentTest.log.push(value);
            }
            // add the log value to the current group
            if (this.currentGroup) {
                this.currentGroup.log.push(value);
            }
        };
        /**
         * Log a null value to the reporter.
         */
        TestRunner.prototype.logNull = function () {
            // create a new log value
            var value = new LogValue_1.LogValue();
            // collect log metadata
            value.group = this.currentGroup || null;
            value.test = this.currentTest || null;
            value.stack = this.getLogStackTrace();
            value.message = "null";
            // add the log value to the current test
            if (this.currentTest) {
                this.currentTest.log.push(value);
            }
            // add the log value to the current group
            if (this.currentGroup) {
                this.currentGroup.log.push(value);
            }
        };
        /**
         * Gets a log stack trace.
         */
        TestRunner.prototype.getLogStackTrace = function () {
            try {
                throw new Error("Get stack trace.");
            }
            catch (ex) {
                return ex.stack.toString()
                    .split("\n")
                    .slice(1)
                    .filter(wasmFilter)
                    .join("\n");
            }
        };
        /**
         * Gets an error stack trace.
         */
        TestRunner.prototype.getErrorStackTrace = function (ex) {
            var stackItems = ex.stack.toString().split("\n");
            return [stackItems[0]].concat(stackItems.slice(1).filter(wasmFilter)).join("\n");
        };
        return TestRunner;
    }());
    exports.TestRunner = TestRunner;
});
//# sourceMappingURL=TestRunner.js.map