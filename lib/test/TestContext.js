(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./TestGroup", "../util/LogValue", "../util/ActualValue", "./TestResult", "../reporter/DefaultTestReporter", "perf_hooks"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var TestGroup_1 = require("./TestGroup");
    var LogValue_1 = require("../util/LogValue");
    var ActualValue_1 = require("../util/ActualValue");
    var TestResult_1 = require("./TestResult");
    var DefaultTestReporter_1 = require("../reporter/DefaultTestReporter");
    var perf_hooks_1 = require("perf_hooks");
    var wasmFilter = function (input) { return /wasm/i.test(input); };
    var timeDifference = function (end, start) { return Math.round((end - start) * 1000) / 1000; };
    var TestContext = /** @class */ (function () {
        function TestContext() {
            this.groupStack = [new TestGroup_1.TestGroup()];
            this.testGroups = [];
            this.logTarget = this.groupStack[0];
            this.wasm = null;
            // test state machine values
            this.stack = "";
            this.message = "";
            this.actual = null;
            this.expected = null;
            this.time = 0;
            this.pass = true;
        }
        /**
         * Run the tests on the wasm module.
         */
        TestContext.prototype.run = function (wasm, reporter) {
            if (reporter === void 0) { reporter = new DefaultTestReporter_1.DefaultTestReporter(); }
            this.wasm = wasm;
            var start = 0;
            var end = 0;
            var groupstart = 0;
            var groupend = 0;
            var teststart = 0;
            var testend = 0;
            var passed = true;
            // start the test suite
            reporter.onStart(this);
            start = perf_hooks_1.performance.now();
            testgroup: for (var _i = 0, _a = this.testGroups; _i < _a.length; _i++) {
                var group = _a[_i];
                // get the group's name
                var groupName = group.describePointers
                    .map(function (pointer) { return wasm.getString(pointer); })
                    .join(" ");
                group.name = groupName;
                // report the group as started
                reporter.onGroupStart(group);
                for (var _b = 0, _c = group.todos; _b < _c.length; _b++) {
                    var todo = _c[_b];
                    reporter.onTodo(group, wasm.getString(todo));
                }
                groupstart = perf_hooks_1.performance.now();
                // set the log target
                this.logTarget = group;
                // for each beforeAllCallback
                for (var _d = 0, _e = group.beforeAllPointers; _d < _e.length; _d++) {
                    var beforeAllCallback = _e[_d];
                    // call each beforeAll callback
                    var beforeAllResult = this.tryCall(beforeAllCallback);
                    // if the test fails
                    if (beforeAllResult === 0) {
                        groupend = perf_hooks_1.performance.now();
                        group.pass = false;
                        group.reason = "Test suite " + groupName + " failed in beforeAll callback.";
                        passed = false;
                        group.time = timeDifference(groupend, groupstart);
                        continue testgroup;
                    }
                }
                test: for (var i = 0; i < group.testFunctionPointers.length; i++) {
                    var testFunctionCallback = group.testFunctionPointers[i];
                    // create the test result
                    var result = new TestResult_1.TestResult();
                    group.tests.push(result);
                    this.logTarget = result;
                    result.testName = wasm.getString(group.testNamePointers[i]);
                    reporter.onTestStart(group, result);
                    teststart = perf_hooks_1.performance.now();
                    // for each beforeEach callback function pointer
                    for (var _f = 0, _g = group.beforeEachPointers; _f < _g.length; _f++) {
                        var beforeEachCallback = _g[_f];
                        var beforeEachResult = this.tryCall(beforeEachCallback);
                        // if beforeEach fails
                        if (beforeEachResult === 0) {
                            testend = perf_hooks_1.performance.now();
                            groupend = perf_hooks_1.performance.now();
                            group.pass = false;
                            group.reason = group.reason = "Test suite " + groupName + " failed in beforeEach callback.";
                            result.pass = false;
                            group.time = timeDifference(groupend, groupstart);
                            result.time = timeDifference(testend, teststart);
                            reporter.onTestFinish(group, result);
                            reporter.onGroupFinish(group);
                            continue testgroup;
                        }
                    }
                    var testCallResult = this.tryCall(testFunctionCallback);
                    var throws = group.testThrows[i];
                    testend = perf_hooks_1.performance.now();
                    result.time = timeDifference(testend, teststart);
                    result.pass = throws
                        ? (testCallResult === 0)
                        : (testCallResult === 1);
                    result.negated = throws;
                    if (!result.pass) {
                        // if it throws...
                        if (throws) {
                            // only set the message
                            result.message = this.wasm.getString(group.testMessagePointers[i]);
                        }
                        else {
                            // set the message, the actual, expected, and stack values
                            result.message = this.message;
                            result.actual = this.actual;
                            result.expected = this.expected;
                            result.stack = this.stack;
                        }
                    }
                    // for each afterEach callback function pointer
                    for (var _h = 0, _j = group.afterEachPointers; _h < _j.length; _h++) {
                        var afterEachCallback = _j[_h];
                        var afterEachResult = this.tryCall(afterEachCallback);
                        // if afterEach fails
                        if (afterEachResult === 0) {
                            testend = perf_hooks_1.performance.now();
                            groupend = perf_hooks_1.performance.now();
                            group.pass = false;
                            group.reason = group.reason = "Test suite " + groupName + " failed in afterEach callback.";
                            result.pass = false;
                            group.time = timeDifference(groupend, groupstart);
                            result.time = timeDifference(testend, teststart);
                            reporter.onTestFinish(group, result);
                            reporter.onGroupFinish(group);
                            continue testgroup;
                        }
                    }
                    reporter.onTestFinish(group, result);
                    this.logTarget = group;
                }
                // for each afterAllCallback
                for (var _k = 0, _l = group.afterAllPointers; _k < _l.length; _k++) {
                    var afterAllCallback = _l[_k];
                    // call each afterAll callback
                    var afterAllResult = this.tryCall(afterAllCallback);
                    // if the test fails
                    if (afterAllResult === 0) {
                        groupend = perf_hooks_1.performance.now();
                        group.pass = false;
                        group.reason = "Test suite " + groupName + " failed in beforeAll callback.";
                        passed = false;
                        group.time = timeDifference(groupend, groupstart);
                        reporter.onGroupFinish(group);
                        continue testgroup;
                    }
                }
                // finish the group
                groupend = perf_hooks_1.performance.now();
                group.time = timeDifference(groupend, groupstart);
                group.reason = "Test suite " + groupName + " passed successfully.";
                reporter.onGroupFinish(group);
            }
            end = perf_hooks_1.performance.now();
            this.time = timeDifference(end, start);
            this.pass = passed;
            reporter.onFinish(this);
        };
        /**
         * This method creates a WebAssembly imports object with all the TestContext functions
         * bound to the TestContext.
         *
         * @param {any[]} imports - Every import item specified.
         */
        TestContext.prototype.createImports = function () {
            var _this = this;
            var imports = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                imports[_i] = arguments[_i];
            }
            var result = Object.assign.apply(Object, [{}].concat(imports, [{
                    __aspect: {
                        clearExpected: this.clearExpected.bind(this),
                        debug: this.debug.bind(this),
                        tryCall: this.tryCall.bind(this),
                        logNull: this.logNull.bind(this),
                        logReference: this.logReference.bind(this),
                        logString: this.logString.bind(this),
                        logValue: this.logValue.bind(this),
                        reportDescribe: this.reportDescribe.bind(this),
                        reportEndDescribe: this.reportEndDescribe.bind(this),
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
                        reportExpectedFinite: this.reportExpectedFinite.bind(this),
                        reportNegatedTest: this.reportNegatedTest.bind(this),
                    },
                }]));
            result.env = result.env || {};
            var previousAbort = (result.env.abort) || (function () { });
            result.env.abort = function () {
                var args = [];
                for (var _i = 0; _i < arguments.length; _i++) {
                    args[_i] = arguments[_i];
                }
                previousAbort.apply(void 0, args);
                // @ts-ignore
                _this.abort.apply(_this, args);
            };
            return result;
        };
        /**
         * This web assembly linked function creates a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It receives a pointer to
         * the description of the tests, forks the top level test group, pushes the suiteName to a list,
         * then pushes the forked group to the top of the test context stack.
         *
         * @param {number} suiteNamePointer
         */
        TestContext.prototype.reportDescribe = function (suiteNamePointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            var nextGroup = group.fork();
            nextGroup.describePointers.push(suiteNamePointer);
            this.groupStack.push(nextGroup);
            this.logTarget = nextGroup;
        };
        /**
         * This web assembly linked function finishes a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It pops the current
         * test group from the test context stack and pushes it to the final test group list.
         */
        TestContext.prototype.reportEndDescribe = function () {
            var next = this.groupStack.pop();
            this.testGroups.push(next);
            this.logTarget = this.groupStack[this.groupStack.length - 1];
        };
        /**
         * This web assembly linked function sets the group's "beforeEach" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test.
         */
        TestContext.prototype.reportBeforeEach = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            ;
            group.beforeEachPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function adds the group's "beforeAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        TestContext.prototype.reportBeforeAll = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            ;
            group.beforeAllPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function sets the group's "afterEach" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        TestContext.prototype.reportAfterEach = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            ;
            group.afterEachPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function adds the group's "afterAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        TestContext.prototype.reportAfterAll = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            ;
            group.afterAllPointers.push(callbackPointer);
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
        TestContext.prototype.tryCall = function (pointer) {
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
         * This adds a logged string to the current test.
         *
         * @param {number} pointer - The pointer to the logged string reference.
         */
        TestContext.prototype.logString = function (pointer) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.message = "\"" + this.wasm.getString(pointer).replace("\"", "\\\"") + "\"";
            value.offset = 0;
            value.pointer = pointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Log a reference to the reporter.
         *
         * @param {number} referencePointer - The pointer to the reference.
         * @param {number} offset - The offset of the reference.
         */
        TestContext.prototype.logReference = function (referencePointer, offset) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.message = "Reference Type";
            value.offset = offset;
            value.pointer = referencePointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Log a numevalueric value to the reporter.
         *
         * @param {number} value - The value to be logged.
         */
        TestContext.prototype.logValue = function (numericValue) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.stack = this.getLogStackTrace();
            value.message = "Value " + numericValue.toString();
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Log a null value to the reporter.
         */
        TestContext.prototype.logNull = function () {
            // create a new log value
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            // collect log metadata
            value.stack = this.getLogStackTrace();
            value.message = "null";
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Gets a log stack trace.
         */
        TestContext.prototype.getLogStackTrace = function () {
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
        TestContext.prototype.getErrorStackTrace = function (ex) {
            var stackItems = ex.stack.toString().split("\n");
            return [stackItems[0]].concat(stackItems.slice(1).filter(wasmFilter)).join("\n");
        };
        /**
         * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
         */
        TestContext.prototype.debug = function () { debugger; };
        /**
         * This web assembly linked function creates a test from the callback and the testNamePointer in
         * the current group. It assumes that the group has already been created with the describe
         * function. It is called when `it("description", callback)` or `test("description", callback)`
         * is called.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         */
        TestContext.prototype.reportTest = function (testNamePointer, callback) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.testFunctionPointers.push(callback);
            group.testNamePointers.push(testNamePointer);
            group.testMessagePointers.push(-1);
            group.testThrows.push(false);
        };
        /**
         * This web assembly linked function is responsible for reporting tests that are expected
         * to fail. This is useful for verifying that specific application states will throw.
         *
         * @param {number} testNamePointer - The test's name pointer.
         * @param {number} callback - The test's function.
         * @param {number} message - The message associated with this test if it does not throw.
         */
        TestContext.prototype.reportNegatedTest = function (testNamePointer, callback, message) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.testFunctionPointers.push(callback);
            group.testNamePointers.push(testNamePointer);
            group.testMessagePointers.push(message);
            group.testThrows.push(true);
        };
        /**
         * This function reports a single "todo" item in a test suite.
         *
         * @param {number} todoPointer - The todo description string pointer.
         */
        TestContext.prototype.reportTodo = function (todoPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.todos.push(todoPointer);
        };
        /**
          * This function is called after each expectation if the expectation passes. This prevents other
          * unreachable() conditions that throw errors to report actual and expected values too.
          */
        TestContext.prototype.clearExpected = function () {
            this.expected = null;
            this.actual = null;
            this.stack = "";
        };
        /**
         * This function reports an actual null value.
         */
        TestContext.prototype.reportActualNull = function () {
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            this.actual = value;
        };
        /**
         * This function reports an expected null value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedNull = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual numeric value.
         *
         * @param {number} numericValue - The value to be expected.
         */
        TestContext.prototype.reportActualValue = function (numericValue) {
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            this.actual = value;
        };
        /**
         * This function reports an expected numeric value.
         *
         * @param {number} numericValue - The value to be expected
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedValue = function (numericValue, negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual reference value.
         *
         * @param {number} referencePointer - The actual reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         */
        TestContext.prototype.reportActualReference = function (referencePointer, offset) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Type";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
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
        TestContext.prototype.reportExpectedReference = function (referencePointer, offset, negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Type";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
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
        TestContext.prototype.reportExpectedTruthy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "truthy value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected falsy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedFalsy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "falsy value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected finite value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedFinite = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "finite value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual string value.
         *
         * @param {number} stringPointer - A pointer that points to the actual string.
         */
        TestContext.prototype.reportActualString = function (stringPointer) {
            var value = new ActualValue_1.ActualValue();
            value.message = "\"" + this.wasm.getString(stringPointer).replace("\"", "\\\"") + "\"";
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            this.actual = value;
        };
        /**
         * This function reports an expected string value.
         *
         * @param {number} stringPointer - A pointer that points to the expected string.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedString = function (stringPointer, negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "\"" + this.wasm.getString(stringPointer).replace("\"", "\\\"") + "\"";
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
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
        TestContext.prototype.abort = function (reasonPointer, _fileNamePointer, _line, _col) {
            this.message = this.wasm.getString(reasonPointer);
        };
        return TestContext;
    }());
    exports.TestContext = TestContext;
});
//# sourceMappingURL=TestContext.js.map