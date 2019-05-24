(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./TestGroup", "../util/LogValue", "../util/ActualValue", "./TestResult", "../reporter/DefaultTestReporter", "perf_hooks", "../util/timeDifference", "./RunContext", "../util/IPerformanceConfiguration"], factory);
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
    var timeDifference_1 = require("../util/timeDifference");
    var RunContext_1 = require("./RunContext");
    var IPerformanceConfiguration_1 = require("../util/IPerformanceConfiguration");
    var wasmFilter = function (input) { return /wasm-function/i.test(input); };
    ;
    var TestContext = /** @class */ (function () {
        function TestContext(reporter, file, performanceConfiguration) {
            if (reporter === void 0) { reporter = new DefaultTestReporter_1.DefaultTestReporter(); }
            if (file === void 0) { file = ""; }
            if (performanceConfiguration === void 0) { performanceConfiguration = IPerformanceConfiguration_1.createDefaultPerformanceConfiguration(); }
            this.reporter = reporter;
            this.file = file;
            this.performanceConfiguration = performanceConfiguration;
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
            this.startupTime = 0;
            /**
             * This value is used to detect if an `expect()` function call was used outside of a test
             * function. If a reportExpected or reportActual function is called before the `context.run()`
             * method is called, it should prevent the `run()` method from running the tests and report a
             * failure.
             */
            this.ready = false;
            this.errors = [];
            this.resetPerformanceValues();
        }
        /**
         * Run the tests on the wasm module.
         */
        TestContext.prototype.run = function (wasm) {
            // create a test context
            var runContext = new RunContext_1.RunContext(wasm, this.reporter);
            // set wasm
            this.wasm = wasm;
            // start the timer
            runContext.start = perf_hooks_1.performance.now();
            // start the module up
            wasm.__main();
            // calculate startuptime
            this.startupTime = timeDifference_1.timeDifference(perf_hooks_1.performance.now(), runContext.start);
            if (this.errors.length > 0)
                return;
            this.ready = true;
            // start the test suite
            this.reporter.onStart(this);
            testgroup: for (var _i = 0, _a = this.testGroups; _i < _a.length; _i++) {
                var group = _a[_i];
                this.runGroup(runContext, group);
            }
            runContext.end = perf_hooks_1.performance.now();
            this.time = timeDifference_1.timeDifference(runContext.end, runContext.start);
            this.pass = runContext.passed;
            this.reporter.onFinish(this);
        };
        TestContext.prototype.runGroup = function (runContext, group) {
            // get the group's name
            runContext.endGroup = false;
            // set the group starttime
            runContext.groupstart = perf_hooks_1.performance.now();
            // set the log target
            this.logTarget = group;
            // for each beforeAllCallback
            this.runBeforeAll(runContext, group);
            // report the group as started, and log all the beforeAll logs outside the describe block
            this.reporter.onGroupStart(group);
            if (runContext.endGroup)
                return;
            for (var i = 0; i < group.testFunctionPointers.length; i++) {
                var result = this.runTest(runContext, group, i);
                if (runContext.endGroup)
                    return;
                this.reporter.onTestFinish(group, result);
                this.logTarget = group;
            }
            // for each afterAllCallback
            this.runAfterAll(runContext, group);
            if (runContext.endGroup)
                return;
            // finish the group
            runContext.groupend = perf_hooks_1.performance.now();
            group.time = timeDifference_1.timeDifference(runContext.groupend, runContext.groupstart);
            group.reason = "Test suite " + group.name + " passed successfully.";
            this.reporter.onGroupFinish(group);
        };
        /**
         * Run a given test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current run group.
         * @param {number} testIndex - The current test index.
         */
        TestContext.prototype.runTest = function (runContext, group, testIndex) {
            // create the test result
            var result = new TestResult_1.TestResult();
            var performanceEnabled = group.performanceEnabled[testIndex];
            group.tests.push(result);
            // set the log target
            this.logTarget = result;
            // initialize the test name
            result.name = group.testNames[testIndex];
            this.reporter.onTestStart(group, result);
            result.start = perf_hooks_1.performance.now();
            // If performance is enabled, use the performance values, otherwise, just run once.
            if (performanceEnabled) {
                var runCount = 0;
                result.performance = true;
                // collect performance variables
                var reportAverage = group.reportAverage[testIndex];
                var reportMax = group.reportMax[testIndex];
                var reportMedian = group.reportMedian[testIndex];
                var reportMin = group.reportMin[testIndex];
                var reportVariance = group.reportVariance[testIndex];
                var reportStandardDeviation = group.reportStandardDeviation[testIndex];
                // sample collection configuration
                var maxSamplesValue = group.maxSamples[testIndex];
                var maxTestRuntimeValue = group.maxTestRuntime[testIndex];
                var decimalPlacesValue = group.roundDecimalPlaces[testIndex];
                // calculate effective values
                var maxSamples = !isFinite(maxSamplesValue)
                    ? 10000 /* MaxSamples */
                    : Math.min(maxSamplesValue, 10000 /* MaxSamples */);
                var maxTestRuntime = !isFinite(maxTestRuntimeValue)
                    ? 5000 /* MaxTestRuntime */
                    : Math.min(maxTestRuntimeValue, 5000 /* MaxTestRuntime */);
                var decimalPlaces = !isFinite(decimalPlacesValue)
                    ? 3
                    : Math.max(decimalPlacesValue, 0 /* MinimumDecimalPlaces */);
                result.decimalPlaces = Math.round(decimalPlaces); // could be a float number
                var testStartTime = perf_hooks_1.performance.now();
                var currentTestRunTime = 0;
                // run the test loop
                while (true) { // always run at least once
                    this.runBeforeEach(runContext, group, result);
                    /**
                     * Especially because the performance functions are run repeatedly, if an error occurs, assume the
                     * worst and skip the test group. These functions definitely are assumed to be safe by the test context.
                     */
                    if (runContext.endGroup)
                        return;
                    this.runTestCall(runContext, group, result, testIndex);
                    this.runAfterEach(runContext, group, result);
                    if (runContext.endGroup)
                        return; // check to see if the afterEach functions errored (see above)
                    currentTestRunTime = perf_hooks_1.performance.now() - testStartTime; // calculate how long the current test has run
                    runCount += 1; // increase the run count
                    if (runCount >= maxSamples)
                        break; // if we have reached the max sample count
                    if (currentTestRunTime >= maxTestRuntime)
                        break; // weve collected enough samples and the test is over
                }
                if (reportAverage)
                    result.calculateAverage();
                if (reportMax)
                    result.calculateMax();
                if (reportMedian)
                    result.calculateMedian();
                if (reportMin)
                    result.calculateMin();
                if (reportVariance)
                    result.calculateVariance();
                if (reportStandardDeviation)
                    result.calculateStandardDeviation();
            }
            else {
                this.runBeforeEach(runContext, group, result);
                if (runContext.endGroup)
                    return;
                this.runTestCall(runContext, group, result, testIndex);
                this.runAfterEach(runContext, group, result);
                if (runContext.endGroup)
                    return;
            }
            result.end = perf_hooks_1.performance.now();
            result.runTime = result.start - result.end;
            return result;
        };
        /**
         * Run the current test once and collect statistics.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         * @param {number} testIndex - The current test index.
         */
        TestContext.prototype.runTestCall = function (runContext, group, result, testIndex) {
            var testFunctionCallback = group.testFunctionPointers[testIndex];
            var start = perf_hooks_1.performance.now();
            var testCallResult = this.tryCall(testFunctionCallback);
            var end = perf_hooks_1.performance.now();
            var throws = group.testThrows[testIndex];
            runContext.testend = perf_hooks_1.performance.now();
            result.times.push(timeDifference_1.timeDifference(end, start));
            result.pass = throws
                ? (testCallResult === 0)
                : (testCallResult === 1);
            result.negated = throws;
            if (!result.pass) {
                group.pass = false;
                // if it throws...
                if (throws) {
                    // only set the message
                    result.message = group.testMessages[testIndex];
                }
                else {
                    // set the message, the actual, expected, and stack values
                    result.message = this.message;
                    result.actual = this.actual;
                    result.expected = this.expected;
                    result.stack = this.stack;
                }
            }
        };
        /**
         * Run the afterEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        TestContext.prototype.runAfterEach = function (runContext, group, result) {
            // for each afterEach callback function pointer
            for (var _i = 0, _a = group.afterEachPointers; _i < _a.length; _i++) {
                var afterEachCallback = _a[_i];
                var afterEachResult = this.tryCall(afterEachCallback);
                // if afterEach fails
                if (afterEachResult === 0) {
                    runContext.testend = perf_hooks_1.performance.now();
                    runContext.groupend = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = group.reason = "Test suite " + group.name + " failed in afterEach callback.";
                    result.pass = false;
                    group.time = timeDifference_1.timeDifference(runContext.groupend, runContext.groupstart);
                    this.reporter.onTestFinish(group, result);
                    this.reporter.onGroupFinish(group);
                    runContext.endGroup = true;
                    return;
                }
            }
        };
        /**
         * Run the beforeEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        TestContext.prototype.runBeforeEach = function (runContext, group, result) {
            // for each beforeEach callback function pointer
            for (var _i = 0, _a = group.beforeEachPointers; _i < _a.length; _i++) {
                var beforeEachCallback = _a[_i];
                var beforeEachResult = this.tryCall(beforeEachCallback);
                // if beforeEach fails
                if (beforeEachResult === 0) {
                    runContext.testend = perf_hooks_1.performance.now();
                    runContext.groupend = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = group.reason = "Test suite " + group.name + " failed in beforeEach callback.";
                    result.pass = false;
                    group.time = timeDifference_1.timeDifference(runContext.groupend, runContext.groupstart);
                    this.reporter.onTestFinish(group, result);
                    this.reporter.onGroupFinish(group);
                    runContext.endGroup = true;
                    return;
                }
            }
        };
        /**
         * Run the afterAll callbacks with the given runContext and group.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        TestContext.prototype.runAfterAll = function (runContext, group) {
            for (var _i = 0, _a = group.afterAllPointers; _i < _a.length; _i++) {
                var afterAllCallback = _a[_i];
                // call each afterAll callback
                var afterAllResult = this.tryCall(afterAllCallback);
                // if the test fails
                if (afterAllResult === 0) {
                    runContext.groupend = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed in afterAll callback.";
                    runContext.passed = false;
                    group.time = timeDifference_1.timeDifference(runContext.groupend, runContext.groupstart);
                    this.reporter.onGroupFinish(group);
                    runContext.endGroup = true;
                    return;
                }
            }
        };
        /**
         * Run the beforeAll callbacks with the given runContext and group.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        TestContext.prototype.runBeforeAll = function (runContext, group) {
            for (var _i = 0, _a = group.beforeAllPointers; _i < _a.length; _i++) {
                var beforeAllCallback = _a[_i];
                // call each beforeAll callback
                var beforeAllResult = this.tryCall(beforeAllCallback);
                // if the test fails
                if (beforeAllResult === 0) {
                    runContext.groupend = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed in beforeAll callback.";
                    runContext.passed = false;
                    group.time = timeDifference_1.timeDifference(runContext.groupend, runContext.groupstart);
                    runContext.endGroup = true;
                    return;
                }
            }
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
                        performanceEnabled: this.performanceEnabled.bind(this),
                        maxSamples: this.maxSamples.bind(this),
                        maxTestRunTime: this.maxTestRunTime.bind(this),
                        roundDecimalPlaces: this.roundDecimalPlaces.bind(this),
                        reportAverage: this.reportAverage.bind(this),
                        reportMedian: this.reportMedian.bind(this),
                        reportStdDev: this.reportStdDev.bind(this),
                        reportMax: this.reportMax.bind(this),
                        reportMin: this.reportMin.bind(this),
                        reportVariance: this.reportVariance.bind(this),
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
            nextGroup.name = group.name + this.wasm.getString(suiteNamePointer);
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
            /**
             * If a describe finishes first, it happens BEFORE other describes. This means
             * inner describe blocks run at lower priority than outer describe blocks.
             */
            this.testGroups.unshift(next);
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
            try {
                this.wasm.__call(pointer);
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
            value.message = this.wasm.getString(pointer);
            value.offset = 0;
            value.pointer = pointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            value.value = pointer;
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
            value.value = referencePointer;
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
            value.value = numericValue;
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
            group.testNames.push(this.wasm.getString(testNamePointer));
            group.testMessages.push("");
            group.testThrows.push(false);
            group.performanceEnabled.push(this.performanceEnabledValue);
            group.maxSamples.push(this.maxSamplesValue);
            group.maxTestRuntime.push(this.maxTestRunTimeValue);
            group.roundDecimalPlaces.push(this.roundDecimalPlacesValue);
            group.reportAverage.push(this.recordAverageValue);
            group.reportMedian.push(this.recordMedianValue);
            group.reportStandardDeviation.push(this.recordStdDevValue);
            group.reportMax.push(this.recordMaxValue);
            group.reportMin.push(this.recordMinValue);
            group.reportVariance.push(this.recordVariance);
            this.resetPerformanceValues();
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
            group.testNames.push(this.wasm.getString(testNamePointer));
            group.testMessages.push(this.wasm.getString(message));
            group.testThrows.push(true);
            group.performanceEnabled.push(this.performanceEnabledValue);
            group.maxSamples.push(this.maxSamplesValue);
            group.maxTestRuntime.push(this.maxTestRunTimeValue);
            group.roundDecimalPlaces.push(this.roundDecimalPlacesValue);
            group.reportAverage.push(this.recordAverageValue);
            group.reportMedian.push(this.recordMedianValue);
            group.reportStandardDeviation.push(this.recordStdDevValue);
            group.reportMax.push(this.recordMaxValue);
            group.reportMin.push(this.recordMinValue);
            group.reportVariance.push(this.recordVariance);
            this.resetPerformanceValues();
        };
        /**
         * This function reports a single "todo" item in a test suite.
         *
         * @param {number} todoPointer - The todo description string pointer.
         */
        TestContext.prototype.reportTodo = function (todoPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.todos.push(this.wasm.getString(todoPointer));
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
            if (!this.ready) {
                this.reportInvalidExpectCall();
                return;
            }
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.value = null;
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
            value.value = null;
            this.expected = value;
        };
        /**
         * This function reports an actual numeric value.
         *
         * @param {number} numericValue - The value to be expected.
         */
        TestContext.prototype.reportActualValue = function (numericValue) {
            if (!this.ready) {
                this.reportInvalidExpectCall();
                return;
            }
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.value = numericValue;
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
            value.value = numericValue;
            this.expected = value;
        };
        /**
         * This function reports an actual reference value.
         *
         * @param {number} referencePointer - The actual reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         */
        TestContext.prototype.reportActualReference = function (referencePointer, offset) {
            if (!this.ready) {
                this.reportInvalidExpectCall();
                return;
            }
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.value = referencePointer;
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
            value.message = "Reference Value";
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
            value.negated = negated === 1;
            value.value = referencePointer;
            this.expected = value;
        };
        /**
         * This function reports an expected truthy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestContext.prototype.reportExpectedTruthy = function (negated) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Truthy Value";
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
            value.message = "Falsy Value";
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
            value.message = "Finite Value";
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
            if (!this.ready) {
                this.reportInvalidExpectCall();
                return;
            }
            var value = new ActualValue_1.ActualValue();
            value.message = this.wasm.getString(stringPointer);
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.value = stringPointer;
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
            value.message = this.wasm.getString(stringPointer);
            value.pointer = stringPointer;
            value.stack = this.getLogStackTrace();
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = stringPointer;
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
        /**
         * Reset all the performance values to the configured values.
         */
        TestContext.prototype.resetPerformanceValues = function () {
            this.performanceEnabledValue = this.performanceConfiguration.enabled;
            this.maxSamplesValue = this.performanceConfiguration.maxSamples;
            this.maxTestRunTimeValue = this.performanceConfiguration.maxTestRunTime;
            this.roundDecimalPlacesValue = this.performanceConfiguration.roundDecimalPlaces;
            this.recordAverageValue = this.performanceConfiguration.reportAverage;
            this.recordMedianValue = this.performanceConfiguration.reportMedian;
            this.recordStdDevValue = this.performanceConfiguration.reportStandardDeviation;
            this.recordMaxValue = this.performanceConfiguration.reportMax;
            this.recordMinValue = this.performanceConfiguration.reportMin;
            this.recordVariance = this.performanceConfiguration.reportVariance;
        };
        /**
         * This web assembly linked function modifies the state machine to enable
         * performance for the following test.
         *
         * @param {1 | 0} value - A value indicating if performance should be enabled.
         */
        TestContext.prototype.performanceEnabled = function (value) {
            this.performanceEnabledValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to set the maximum number of
         * samples for the following test.
         *
         * @param {number} value - The maximum number of samples to collect for the following test.
         */
        TestContext.prototype.maxSamples = function (value) {
            this.maxSamplesValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to set the maximum amount of
         * time to run the following test in milliseconds
         *
         * @param {number} value - The maximum number of milliseconds to run the following test.
         */
        TestContext.prototype.maxTestRunTime = function (value) {
            this.maxTestRunTimeValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to set the number of decimal places
         * to round all the statistics to.
         *
         * @param {number} value - The number of decimal places to round to.
         */
        TestContext.prototype.roundDecimalPlaces = function (value) {
            this.roundDecimalPlacesValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an average run time.
         *
         * @param {1 | 0} value - A boolean indicating if the average should be reported.
         */
        TestContext.prototype.reportAverage = function (value) {
            this.recordAverageValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an median run time.
         *
         * @param {1 | 0} value - A boolean indicating if the median should be reported.
         */
        TestContext.prototype.reportMedian = function (value) {
            this.recordMedianValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * a standard deviation calculation on the run times.
         *
         * @param {1 | 0} value - A boolean indicating if the standard deviation should be reported.
         */
        TestContext.prototype.reportStdDev = function (value) {
            this.recordStdDevValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the maximum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the max should be reported.
         */
        TestContext.prototype.reportMax = function (value) {
            this.recordMaxValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the minimum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        TestContext.prototype.reportMin = function (value) {
            this.recordMinValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the variance of the run times for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        TestContext.prototype.reportVariance = function (value) {
            this.recordVariance = value === 1;
        };
        /**
         * This method reports to the TestContext that an expect function call was used outside of the
         * intended test functions.
         */
        TestContext.prototype.reportInvalidExpectCall = function () {
            this.errors.push({
                type: "InvalidExpectCall",
                message: "An expect() function call was used outside of a test function in " + this.file + ".",
                stackTrace: this.getLogStackTrace(),
            });
        };
        return TestContext;
    }());
    exports.TestContext = TestContext;
});
//# sourceMappingURL=TestContext.js.map