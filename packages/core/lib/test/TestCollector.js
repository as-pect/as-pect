var __spreadArrays = (this && this.__spreadArrays) || function () {
    for (var s = 0, i = 0, il = arguments.length; i < il; i++) s += arguments[i].length;
    for (var r = Array(s), k = 0, i = 0; i < il; i++)
        for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
            r[k] = a[j];
    return r;
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
        define(["require", "exports", "../util/LogValue", "../util/ActualValue", "./TestGroup", "../util/IPerformanceConfiguration", "./TestResult", "long"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var LogValue_1 = require("../util/LogValue");
    var ActualValue_1 = require("../util/ActualValue");
    var TestGroup_1 = require("./TestGroup");
    var IPerformanceConfiguration_1 = require("../util/IPerformanceConfiguration");
    var TestResult_1 = require("./TestResult");
    // @ts-ignore: Constructor is new Long(low, high, signed);
    var long_1 = __importDefault(require("long"));
    /**
     * @ignore
     * This function is a filter for stack trace lines.
     *
     * @param {string} input - The stack trace line.
     */
    var wasmFilter = function (input) { return /wasm-function/i.test(input); };
    /**
     * @ignore
     * This is an internal class that is responsible for collecting all the tests in a test binary.
     */
    var TestCollector = /** @class */ (function () {
        function TestCollector(props) {
            this.wasm = null;
            // test group values
            this.groupStack = [new TestGroup_1.TestGroup()];
            /** A collection of `TestGroup` objects that ran tests after `testContext.run(wasm)` was called. */
            this.testGroups = [];
            /** The root `TestGroup` object. */
            this.topLevelGroup = null;
            this.logTarget = this.groupStack[0];
            /** A set of errors that were collected during the testing process. */
            this.errors = [];
            /** A set of warnings that were collected during the testing process. */
            this.warnings = [];
            /** The name of the AssemblyScript test file. */
            this.fileName = "";
            // test state machine values
            this.stack = "";
            this.message = "";
            this.actual = null;
            this.expected = null;
            // partial performance configuration
            this.performanceConfiguration = IPerformanceConfiguration_1.createDefaultPerformanceConfiguration();
            /**
             * This value is used to detect if an `expect()` function call was used outside of a test
             * function. If a reportExpected or reportActual function is called before the `context.run()`
             * method is called, it should prevent the `run()` method from running the tests and report a
             * failure.
             */
            this.ready = false;
            /**
             * These are the test and group filters for the binary. They must be provided before collection
             * begins.
             */
            this.testRegex = new RegExp("");
            this.groupRegex = new RegExp("");
            /**
             * RTrace is a funciton that helps with debugging reference counting and can be used to find
             * leaks. If it is enabled, it will be included automatically by the bootstrap in the
             * assemblyscript imports.
             */
            this.rtraceEnabled = true;
            // This map collects the starting values for the labels created by `RTrace.start()`
            this.rtraceLabels = new Map();
            /**
             * This is the current number of net allocations that occurred during `TestContext` execution.
             */
            this.allocationCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestGroup` execution.
             */
            this.groupAllocationCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestResult` execution.
             */
            this.testAllocationCount = 0;
            /**
             * This is the current number of net dellocations that occurred during `TestContext` execution.
             */
            this.freeCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestGroup` execution.
             */
            this.groupFreeCount = 0;
            /**
             * This is the current number of net allocations that occured during `TestGroup` execution.
             */
            this.testFreeCount = 0;
            /**
             * This is the current number of net increments that occurred during `TestContext` execution.
             */
            this.incrementCount = 0;
            /**
             * This is the current number of net increments that occurred during `TestGroup` execution.
             */
            this.groupIncrementCount = 0;
            /**
             * This is the current number of net increments that occurred during `TestResult` execution.
             */
            this.testIncrementCount = 0;
            /**
             * This is the current number of net decrements that occurred during `TestContext` execution.
             */
            this.decrementCount = 0;
            /**
             * This is the current number of net decrements that occurred during `TestGroup` execution.
             */
            this.groupDecrementCount = 0;
            /**
             * This is the current number of net decrements that occurred during `TestResult` execution.
             */
            this.testDecrementCount = 0;
            /**
             * This map is responsible for keeping track of which blocks are currently allocated by their id.
             */
            this.blocks = new Map();
            /**
             * This set contains all the blocks currently allocated for the current test.
             */
            this.testBlocks = new Set();
            /**
             * This set contains all the blocks currently allocated for the current group.
             */
            this.groupBlocks = new Set();
            this.stackID = 0;
            this.stackTraces = new Map([[-1, ""]]);
            /* istanbul ignore next */
            if (props) {
                /* istanbul ignore next */
                if (props.fileName)
                    this.fileName = props.fileName;
                /* istanbul ignore next */
                if (props.testRegex)
                    this.testRegex = props.testRegex;
                /* istanbul ignore next */
                if (props.groupRegex)
                    this.groupRegex = props.groupRegex;
                /* istanbul ignore next */
                if (props.performanceConfiguration)
                    this.performanceConfiguration = props.performanceConfiguration;
                if (this.performanceConfiguration.maxSamples != null) {
                    if (this.performanceConfiguration.maxSamples >
                        10000 /* MaxSamples */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxSamples exceeds " +
                                10000 /* MaxSamples */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                    if (this.performanceConfiguration.maxSamples < 0) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxSamples less than 0.",
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                }
                if (this.performanceConfiguration.maxTestRunTime != null) {
                    if (this.performanceConfiguration.maxTestRunTime >
                        5000 /* MaxTestRuntime */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxTestRunTime exceeds " +
                                5000 /* MaxTestRuntime */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                    if (this.performanceConfiguration.maxTestRunTime < 0) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: maxTestRunTime less than 0.",
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                }
                if (this.performanceConfiguration.roundDecimalPlaces != null) {
                    if (this.performanceConfiguration.roundDecimalPlaces >
                        8 /* MaximumDecimalPlaces */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: roundDecimalPlaces exceeds " +
                                8 /* MaximumDecimalPlaces */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                    if (this.performanceConfiguration.roundDecimalPlaces <
                        0 /* MinimumDecimalPlaces */) {
                        /* istanbul ignore next */
                        this.pushWarning({
                            message: "Invalid Performance Configuration: roundDecimalPlaces less than " +
                                0 /* MinimumDecimalPlaces */,
                            stackTrace: new Error().stack || "",
                            type: "PerformanceConfigurationWarning",
                        });
                    }
                }
                /* istanbul ignore next */
                if (props.nortrace)
                    this.rtraceEnabled = false;
            }
        }
        /**
         * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
         * process of test collection.
         */
        TestCollector.prototype.collectTests = function () {
            // reset the performance values first, then collect the tests by calling `__main()`
            this.resetPerformanceValues();
            this.wasm.__start();
            this.wasm.__ready();
            var topLevelGroup = this.groupStack[0];
            topLevelGroup.willRun = this.groupRegex.test(topLevelGroup.name);
            this.reportEndDescribe();
            this.topLevelGroup = topLevelGroup;
            /* istanbul ignore next */
            if (!topLevelGroup || this.groupStack.length > 0) {
                /* istanbul ignore next */
                this.errors.push({
                    message: "Invalid TestContext state after test collection.",
                    stackTrace: this.getLogStackTrace(),
                    type: "InvalidTestContextState",
                });
            }
        };
        /**
         * This method creates a WebAssembly imports object with all the TestContext functions
         * bound to the TestContext.
         *
         * @param {any[]} imports - Every import item specified.
         */
        TestCollector.prototype.createImports = function () {
            var _this = this;
            var imports = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                imports[_i] = arguments[_i];
            }
            var result = Object.assign.apply(Object, __spreadArrays([{}], imports, [// get all the user defined imports
                {
                    __aspect: {
                        debug: this.debug.bind(this),
                        endRTrace: this.endRTrace.bind(this),
                        getRTraceAllocations: this.getRTraceAllocations.bind(this),
                        getRTraceBlocks: this.getRTraceBlocks.bind(this),
                        getRTraceCount: this.getRTraceCount.bind(this),
                        getRTraceDecrements: this.getRTraceDecrements.bind(this),
                        getRTraceFrees: this.getRTraceFrees.bind(this),
                        getRTraceGroupAllocations: this.getRTraceGroupAllocations.bind(this),
                        getRTraceGroupBlocks: this.getRTraceGroupBlocks.bind(this),
                        getRTraceGroupDecrements: this.getRTraceGroupDecrements.bind(this),
                        getRTraceGroupFrees: this.getRTraceGroupFrees.bind(this),
                        getRTraceGroupIncrements: this.getRTraceGroupIncrements.bind(this),
                        getRTraceIncrements: this.getRTraceIncrements.bind(this),
                        getRTraceTestAllocations: this.getRTraceTestAllocations.bind(this),
                        getRTraceTestBlocks: this.getRTraceTestBlocks.bind(this),
                        getRTraceTestDecrements: this.getRTraceTestDecrements.bind(this),
                        getRTraceTestFrees: this.getRTraceTestFrees.bind(this),
                        getRTraceTestIncrements: this.getRTraceTestIncrements.bind(this),
                        getStackTrace: this.getStackTrace.bind(this),
                        logArray: this.logArray.bind(this),
                        logBool: this.logBool.bind(this),
                        logLong: this.logLong.bind(this),
                        logNull: this.logNull.bind(this),
                        logReference: this.logReference.bind(this),
                        logString: this.logString.bind(this),
                        logValue: this.logValue.bind(this),
                        maxSamples: this.maxSamples.bind(this),
                        maxTestRunTime: this.maxTestRunTime.bind(this),
                        performanceEnabled: this.performanceEnabled.bind(this),
                        reportActualArray: this.reportActualArray.bind(this),
                        reportActualBool: this.reportActualBool.bind(this),
                        reportActualLong: this.reportActualLong.bind(this),
                        reportActualNull: this.reportActualNull.bind(this),
                        reportActualReference: this.reportActualReference.bind(this),
                        reportActualString: this.reportActualString.bind(this),
                        reportActualValue: this.reportActualValue.bind(this),
                        reportAfterAll: this.reportAfterAll.bind(this),
                        reportAfterEach: this.reportAfterEach.bind(this),
                        reportAverage: this.reportAverage.bind(this),
                        reportBeforeAll: this.reportBeforeAll.bind(this),
                        reportBeforeEach: this.reportBeforeEach.bind(this),
                        reportDescribe: this.reportDescribe.bind(this),
                        reportEndDescribe: this.reportEndDescribe.bind(this),
                        reportExpectedArray: this.reportExpectedArray.bind(this),
                        reportExpectedBool: this.reportExpectedBool.bind(this),
                        reportExpectedFalsy: this.reportExpectedFalsy.bind(this),
                        reportExpectedFinite: this.reportExpectedFinite.bind(this),
                        reportExpectedLong: this.reportExpectedLong.bind(this),
                        reportExpectedNull: this.reportExpectedNull.bind(this),
                        reportExpectedReference: this.reportExpectedReference.bind(this),
                        reportExpectedString: this.reportExpectedString.bind(this),
                        reportExpectedTruthy: this.reportExpectedTruthy.bind(this),
                        reportExpectedValue: this.reportExpectedValue.bind(this),
                        reportInvalidExpectCall: this.reportInvalidExpectCall.bind(this),
                        reportMax: this.reportMax.bind(this),
                        reportMedian: this.reportMedian.bind(this),
                        reportMin: this.reportMin.bind(this),
                        reportNegatedTest: this.reportNegatedTest.bind(this),
                        reportStdDev: this.reportStdDev.bind(this),
                        reportTest: this.reportTest.bind(this),
                        reportTodo: this.reportTodo.bind(this),
                        reportVariance: this.reportVariance.bind(this),
                        roundDecimalPlaces: this.roundDecimalPlaces.bind(this),
                        startRTrace: this.startRTrace.bind(this),
                        tryCall: this.tryCall.bind(this),
                    },
                }]));
            /** If RTrace is enabled, add it to the imports. */
            if (this.rtraceEnabled)
                result.rtrace = {
                    onalloc: this.onalloc.bind(this),
                    onfree: this.onfree.bind(this),
                    onincrement: this.onincrement.bind(this),
                    ondecrement: this.ondecrement.bind(this),
                };
            /** add an env object */
            result.env = result.env || {};
            /** Override the abort function */
            var previousAbort = result.env.abort || (function () { });
            result.env.abort = function () {
                var args = [];
                for (var _i = 0; _i < arguments.length; _i++) {
                    args[_i] = arguments[_i];
                }
                previousAbort.apply(void 0, args);
                // @ts-ignore
                _this.abort.apply(_this, args);
            };
            /** Override trace completely. */
            result.env.trace = this.trace.bind(this);
            return result;
        };
        /**
         * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
         */
        /* istanbul ignore next */
        TestCollector.prototype.debug = function () {
            /* istanbul ignore next */
            debugger;
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
        TestCollector.prototype.tryCall = function (pointer) {
            /** This is a safety net conditional, no reason to test it. */
            /* istanbul ignore next */
            if (pointer < 0)
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
         * Log a null value to the reporter.
         */
        TestCollector.prototype.logBool = function (boolValue) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.stack = this.getLogStackTrace();
            value.message = "Value " + !!boolValue;
            value.value = boolValue;
            value.target = target;
        };
        /**
         * Log a null value to the reporter.
         */
        TestCollector.prototype.logNull = function () {
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
         * Log an array to the reporter.
         *
         * @param arrayPointer - The array pointer.
         */
        TestCollector.prototype.logArray = function (arrayPointer) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.stack = this.getLogStackTrace();
            value.values = this.wasm.__getArray(arrayPointer);
            value.message = JSON.stringify(value.values);
            value.target = target;
            target.logs.push(value);
        };
        /**
         * Log a reference to the reporter.
         *
         * @param {number} referencePointer - The pointer to the reference.
         * @param {number} offset - The offset of the reference.
         */
        TestCollector.prototype.logReference = function (referencePointer, offset) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.bytes = Array.from(new Uint8Array(this.wasm.memory.buffer, referencePointer, offset));
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
         * This adds a logged string to the current test.
         *
         * @param {number} pointer - The pointer to the logged string reference.
         */
        TestCollector.prototype.logString = function (pointer) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.message = this.getString(pointer, "");
            value.offset = 0;
            value.pointer = pointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            value.value = pointer;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Log a numevalueric value to the reporter.
         *
         * @param {number} value - The value to be logged.
         * @param {1 | 0} signed - The value indicating if the number is signed.
         */
        TestCollector.prototype.logValue = function (numericValue, signed) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            // convert to unsigned value if the integer is not signed
            numericValue = signed === 1 ? numericValue : numericValue >>> 0;
            value.stack = this.getLogStackTrace();
            value.message = "Value " + numericValue.toString();
            value.value = numericValue;
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * Log a long value.
         *
         * @param {number} boxPointer - The boxed long value's pointer.
         * @param {1 | 0} signed - An indicator if the long is signed.
         */
        TestCollector.prototype.logLong = function (boxPointer, signed) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            var long = new long_1.default.fromBytesLE(new Uint8Array(this.wasm.memory.buffer, boxPointer, 8), !signed);
            value.stack = this.getLogStackTrace();
            value.message = "Value " + long.toString();
            value.target = target;
            // push the log value to the logs
            target.logs.push(value);
        };
        /**
         * This web assembly linked function creates a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It receives a pointer to
         * the description of the tests, forks the top level test group, pushes the suiteName to a list,
         * then pushes the forked group to the top of the test context stack.
         *
         * @param {number} suiteNamePointer
         */
        TestCollector.prototype.reportDescribe = function (suiteNamePointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            var nextGroup = group.fork();
            nextGroup.name =
                group.name +
                    this.getString(suiteNamePointer, "No describe() name provided.");
            nextGroup.willRun = this.groupRegex.test(nextGroup.name);
            this.groupStack.push(nextGroup);
            this.logTarget = nextGroup;
        };
        /**
         * This web assembly linked function finishes a test group. It's called when the test suite calls
         * the describe("test", callback) function from within AssemblyScript. It pops the current
         * test group from the test context stack and pushes it to the final test group list.
         */
        TestCollector.prototype.reportEndDescribe = function () {
            var next = this.groupStack.pop();
            var testCount = next.tests.length;
            /**
             * If a describe finishes first, it happens BEFORE other describes. This means
             * inner describe blocks run at lower priority than outer describe blocks. It also should be
             * pushed if it willRun.
             */
            if (next.willRun && testCount > 0) {
                this.testGroups.unshift(next);
            }
            this.logTarget = this.groupStack[this.groupStack.length - 1];
        };
        /**
         * This web assembly linked function sets the group's "beforeEach" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test.
         */
        TestCollector.prototype.reportBeforeEach = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.beforeEachPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function adds the group's "beforeAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        TestCollector.prototype.reportBeforeAll = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.beforeAllPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function sets the group's "afterEach" callback pointer.
         *
         * @param {number} callbackPointer - The callback that should run before each test group.
         */
        TestCollector.prototype.reportAfterEach = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.afterEachPointers.push(callbackPointer);
        };
        /**
         * This web assembly linked function adds the group's "afterAll" callback pointer to
         * the current groupStackItem.
         *
         * @param {number} callbackPointer - The callback that should run before each test in the
         * current context.
         */
        TestCollector.prototype.reportAfterAll = function (callbackPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.afterAllPointers.push(callbackPointer);
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
        TestCollector.prototype.reportTest = function (testNamePointer, callback) {
            var group = this.groupStack[this.groupStack.length - 1];
            /* istanbul ignore next */
            if (!group.willRun)
                return;
            var name = this.getString(testNamePointer, "No test() name provided.");
            /* istanbul ignore next */
            if (!this.testRegex.test(name))
                return;
            var test = new TestResult_1.TestResult();
            test.functionPointer = callback;
            test.name = name;
            test.message = "";
            test.negated = false;
            test.performance = this.performanceEnabledValue || false;
            if (test.performance) {
                test.maxSamples = !isFinite(this.maxSamplesValue)
                    ? 10000 /* MaxSamples */
                    : Math.min(this.maxSamplesValue, 10000 /* MaxSamples */);
                test.maxRuntime = !isFinite(this.maxTestRunTimeValue)
                    ? 5000 /* MaxTestRuntime */
                    : Math.min(this.maxTestRunTimeValue, 5000 /* MaxTestRuntime */);
                test.decimalPlaces = !isFinite(this.roundDecimalPlacesValue)
                    ? 3
                    : Math.max(Math.round(this.roundDecimalPlacesValue), 0 /* MinimumDecimalPlaces */);
                if (test.decimalPlaces > 8 /* MaximumDecimalPlaces */) {
                    test.decimalPlaces = 8 /* MaximumDecimalPlaces */;
                }
                test.calculateAverageValue = this.recordAverageValue || false;
                test.calculateMedianValue = this.recordMedianValue || false;
                test.calculateStandardDeviationValue = this.recordStdDevValue || false;
                test.calculateMaxValue = this.recordMaxValue || false;
                test.calculateMinValue = this.recordMinValue || false;
                test.calculateVarianceValue = this.recordVariance || false;
            }
            group.tests.push(test);
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
        TestCollector.prototype.reportNegatedTest = function (testNamePointer, callback, message) {
            var group = this.groupStack[this.groupStack.length - 1];
            /* istanbul ignore next */
            if (!group.willRun)
                return;
            var name = this.getString(testNamePointer, "No test() name provided.");
            /* istanbul ignore next */
            if (!this.testRegex.test(name))
                return;
            var test = new TestResult_1.TestResult();
            test.functionPointer = callback;
            test.name = name;
            test.message = this.getString(message, "");
            test.negated = true;
            test.performance = this.performanceEnabledValue || false;
            /* istanbul ignore next */
            if (test.performance) {
                /* istanbul ignore next */
                test.maxSamples = !isFinite(this.maxSamplesValue)
                    ? 10000 /* MaxSamples */
                    : Math.min(this.maxSamplesValue, 10000 /* MaxSamples */);
                /* istanbul ignore next */
                test.maxRuntime = !isFinite(this.maxTestRunTimeValue)
                    ? 5000 /* MaxTestRuntime */
                    : Math.min(this.maxTestRunTimeValue, 5000 /* MaxTestRuntime */);
                /* istanbul ignore next */
                test.decimalPlaces = !isFinite(this.roundDecimalPlacesValue)
                    ? 3
                    : Math.max(Math.round(this.roundDecimalPlacesValue), 0 /* MinimumDecimalPlaces */);
                /* istanbul ignore next */
                test.calculateAverageValue = this.recordAverageValue || false;
                /* istanbul ignore next */
                test.calculateMedianValue = this.recordMedianValue || false;
                /* istanbul ignore next */
                test.calculateStandardDeviationValue = this.recordStdDevValue || false;
                /* istanbul ignore next */
                test.calculateMaxValue = this.recordMaxValue || false;
                /* istanbul ignore next */
                test.calculateMinValue = this.recordMaxValue || false;
                /* istanbul ignore next */
                test.calculateVarianceValue = this.recordVariance || false;
            }
            group.tests.push(test);
            this.resetPerformanceValues();
        };
        /**
         * This function reports a single "todo" item in a test suite.
         *
         * @param {number} todoPointer - The todo description string pointer.
         */
        TestCollector.prototype.reportTodo = function (todoPointer) {
            var group = this.groupStack[this.groupStack.length - 1];
            group.todos.push(this.getString(todoPointer, "No todo() value provided."));
        };
        /**
         * This function reports an actual null value.
         */
        TestCollector.prototype.reportActualNull = function (stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.value = null;
            this.actual = value;
        };
        /**
         * This function reports an expected null value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedNull = function (negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "null";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = null;
            this.expected = value;
        };
        /**
         * This function reports an actual numeric value.
         *
         * @param {number} numericValue - The value to be expected.
         * @param {1 | 0} signed - The value indicating if the value is signed.
         */
        TestCollector.prototype.reportActualValue = function (numericValue, signed, stackTrace) {
            // flip the sign bits if it's unsigned
            numericValue = signed === 1 ? numericValue : numericValue >>> 0;
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.value = numericValue;
            this.actual = value;
        };
        /**
         * This function reports an actual numeric value.
         *
         * @param {number} numericValue - The value to be expected.
         * @param {1 | 0} signed - The value indicating if the value is signed.
         */
        TestCollector.prototype.reportActualBool = function (boolValue, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = (!!boolValue).toString();
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.value = boolValue;
            this.actual = value;
        };
        /**
         * This function reports an expected numeric value.
         *
         * @param {number} numericValue - The expected value.
         * @param {1 | 0} signed - The value indicating if the value is signed.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedValue = function (numericValue, signed, negated, stackTrace) {
            // convert to unsigned if the value is unsigned
            numericValue = signed === 1 ? numericValue : numericValue >>> 0;
            var value = new ActualValue_1.ActualValue();
            value.message = numericValue.toString();
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = numericValue;
            this.expected = value;
        };
        /**
         * This function reports an expected numeric value.
         *
         * @param {number} numericValue - The expected value.
         * @param {1 | 0} signed - The value indicating if the value is signed.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedBool = function (boolValue, negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = (!!boolValue).toString();
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            value.value = boolValue;
            this.expected = value;
        };
        /**
         * This function reports an actual long value.
         *
         * @param {number} boxPointer - The expected box pointer.
         * @param {1 | 0} signed - An indicator if the long value is signed.
         */
        TestCollector.prototype.reportActualLong = function (boxPointer, signed, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            var long = new long_1.default.fromBytesLE(new Uint8Array(this.wasm.memory.buffer, boxPointer, 8), !signed);
            value.message = "Long Value: " + long.toString();
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            this.actual = value;
        };
        /**
         * This function reports an actual reference value.
         *
         * @param {number} referencePointer - The actual reference pointer.
         * @param {number} offset - The size of the reference in bytes.
         */
        TestCollector.prototype.reportActualReference = function (referencePointer, offset, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Value";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(new Uint8Array(this.wasm.memory.buffer, referencePointer, offset));
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
        TestCollector.prototype.reportExpectedReference = function (referencePointer, offset, negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Value";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(new Uint8Array(this.wasm.memory.buffer, referencePointer, offset));
            value.negated = negated === 1;
            value.value = referencePointer;
            this.expected = value;
        };
        /**
         * This function reports an expected long value.
         *
         * @param {number} boxPointer - The expected box pointer.
         * @param {1 | 0} signed - An indicator if the long value is signed.
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedLong = function (boxPointer, signed, negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            var long = new long_1.default.fromBytesLE(new Uint8Array(this.wasm.memory.buffer, boxPointer, 8), !signed);
            value.message = "Long Value: " + long.toString();
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected truthy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedTruthy = function (negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Truthy Value";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected falsy value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedFalsy = function (negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Falsy Value";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an expected finite value.
         *
         * @param {1 | 0} negated - An indicator if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedFinite = function (negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Finite Value";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual string value.
         *
         * @param {number} stringPointer - A pointer that points to the actual string.
         */
        TestCollector.prototype.reportActualString = function (stringPointer, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = this.getString(stringPointer, "Null actual string.");
            value.pointer = stringPointer;
            value.stack = this.stackTraces.get(stackTrace);
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
        TestCollector.prototype.reportExpectedString = function (stringPointer, negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = this.getString(stringPointer, "Null expected string.");
            value.pointer = stringPointer;
            value.stack = this.stackTraces.get(stackTrace);
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
        TestCollector.prototype.abort = function (reasonPointer, _fileNamePointer, _line, _col) {
            this.message = this.getString(reasonPointer, "No assertion message provided.");
        };
        /**
         * This web assembly linked function modifies the state machine to enable
         * performance for the following test.
         *
         * @param {1 | 0} value - A value indicating if performance should be enabled.
         */
        TestCollector.prototype.performanceEnabled = function (value) {
            this.performanceEnabledValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to set the maximum number of
         * samples for the following test.
         *
         * @param {number} value - The maximum number of samples to collect for the following test.
         */
        TestCollector.prototype.maxSamples = function (value) {
            if (value > 10000 /* MaxSamples */) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxSamples exceeds " +
                        10000 /* MaxSamples */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            if (value < 0) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxSamples less than 0.",
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            this.maxSamplesValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to set the maximum amount of
         * time to run the following test in milliseconds
         *
         * @param {number} value - The maximum number of milliseconds to run the following test.
         */
        TestCollector.prototype.maxTestRunTime = function (value) {
            if (value > 5000 /* MaxTestRuntime */) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxTestRunTime exceeds " +
                        5000 /* MaxTestRuntime */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            if (value < 0) {
                this.pushWarning({
                    message: "Invalid Performance Configuration: maxTestRunTime less than 0.",
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            this.maxTestRunTimeValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to set the number of decimal places
         * to round all the statistics to.
         *
         * @param {number} value - The number of decimal places to round to.
         */
        TestCollector.prototype.roundDecimalPlaces = function (value) {
            if (value > 8 /* MaximumDecimalPlaces */) {
                /* istanbul ignore next */
                this.pushWarning({
                    message: "Invalid Performance Configuration: roundDecimalPlaces exceeds " +
                        8 /* MaximumDecimalPlaces */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            if (value < 0 /* MinimumDecimalPlaces */) {
                /* istanbul ignore next */
                this.pushWarning({
                    message: "Invalid Performance Configuration: roundDecimalPlaces less than " +
                        0 /* MinimumDecimalPlaces */,
                    stackTrace: this.getLogStackTrace(),
                    type: "PerformanceConfigurationWarning",
                });
            }
            this.roundDecimalPlacesValue = value;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an average run time.
         *
         * @param {1 | 0} value - A boolean indicating if the average should be reported.
         */
        TestCollector.prototype.reportAverage = function (value) {
            this.recordAverageValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * an median run time.
         *
         * @param {1 | 0} value - A boolean indicating if the median should be reported.
         */
        TestCollector.prototype.reportMedian = function (value) {
            this.recordMedianValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * a standard deviation calculation on the run times.
         *
         * @param {1 | 0} value - A boolean indicating if the standard deviation should be reported.
         */
        TestCollector.prototype.reportStdDev = function (value) {
            this.recordStdDevValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the maximum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the max should be reported.
         */
        TestCollector.prototype.reportMax = function (value) {
            this.recordMaxValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the minimum run time for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        TestCollector.prototype.reportMin = function (value) {
            this.recordMinValue = value === 1;
        };
        /**
         * This web assembly linked function modifies the state machine to cause the next test to report
         * the variance of the run times for this test.
         *
         * @param {1 | 0} value - A boolean indicating if the min should be reported.
         */
        TestCollector.prototype.reportVariance = function (value) {
            this.recordVariance = value === 1;
        };
        /**
         * This method reports to the TestContext that an expect function call was used outside of the
         * intended test functions.
         */
        TestCollector.prototype.reportInvalidExpectCall = function () {
            this.pushError({
                type: "InvalidExpectCall",
                message: "An expect() function call was used outside of a test function in " + this.fileName + ".",
                stackTrace: this.getLogStackTrace(),
            });
        };
        /**
         * This method reports an actual array value.
         *
         * @param {number} arrayPointer - The Array pointer.
         */
        TestCollector.prototype.reportActualArray = function (arrayPointer, stackTrace) {
            var array = this.wasm.__getArray(arrayPointer);
            var value = new ActualValue_1.ActualValue();
            value.values = array;
            value.message = JSON.stringify(array);
            value.target = this.logTarget;
            value.stack = this.stackTraces.get(stackTrace);
            this.actual = value;
        };
        /**
         * This  method reports an expected array value.
         *
         * @param {number} arrayPointer - The Array pointer.
         * @param {1 | 0} negated - Is `1` if the expectation is negated.
         */
        TestCollector.prototype.reportExpectedArray = function (arrayPointer, negated) {
            var array = this.wasm.__getArray(arrayPointer);
            var value = new ActualValue_1.ActualValue();
            value.values = array;
            value.message = JSON.stringify(array);
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * Gets an error stack trace.
         */
        TestCollector.prototype.getErrorStackTrace = function (ex) {
            var stackItems = ex.stack.toString().split("\n");
            return __spreadArrays([stackItems[0]], stackItems.slice(1).filter(wasmFilter)).join("\n");
        };
        /**
         * Reset all the performance values to the configured values.
         */
        TestCollector.prototype.resetPerformanceValues = function () {
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
         * Gets a log stack trace.
         */
        TestCollector.prototype.getLogStackTrace = function () {
            return new Error("Get stack trace.")
                .stack.toString()
                .split("\n")
                .slice(1)
                .filter(wasmFilter)
                .join("\n");
        };
        /**
         * This method returns the current rtrace count.
         */
        TestCollector.prototype.getRTraceCount = function () {
            return this.blocks.size;
        };
        /**
         * This method starts a new rtrace count label.
         *
         * @param {number} label - The RTrace label.
         */
        TestCollector.prototype.startRTrace = function (label) {
            this.rtraceLabels.set(label, this.blocks.size);
        };
        /**
         * This method ends an RTrace label and returns the difference between the current and the
         * starting reference counts.
         *
         * @param {number} label - The RTrace label.
         * @returns {number}
         */
        TestCollector.prototype.endRTrace = function (label) {
            var result = this.blocks.size - this.rtraceLabels.get(label);
            this.rtraceLabels.delete(label);
            return result;
        };
        /**
         * This method is called when a memory block is allocated on the heap.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.onalloc = function (block) {
            this.allocationCount += 1;
            this.groupAllocationCount += 1;
            this.testAllocationCount += 1;
            /**
             * This is impossible to test but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "A duplicate allocation has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Allocation Error",
                });
            }
            else {
                this.blocks.set(block, 0);
            }
            this.testBlocks.add(block);
            this.groupBlocks.add(block);
        };
        /**
         * This method is called when a memory block is deallocated from the heap.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.onfree = function (block) {
            this.freeCount += 1;
            this.groupFreeCount += 1;
            this.testFreeCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned dellocation has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Deallocation Error",
                });
            }
            else {
                this.blocks.delete(block);
            }
            this.testBlocks.delete(block);
            this.groupBlocks.delete(block);
        };
        /**
         * This method is called when a memory block reference count is incremented.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.onincrement = function (block) {
            this.incrementCount += 1;
            this.groupIncrementCount += 1;
            this.testIncrementCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned increment has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Increment Error",
                });
            }
            else {
                var count = this.blocks.get(block);
                this.blocks.set(block, count + 1);
            }
        };
        /**
         * This method is called when a memory block reference count is decremented.
         *
         * @param {number} block - This is a unique identifier for the affected block.
         */
        TestCollector.prototype.ondecrement = function (block) {
            this.decrementCount += 1;
            this.groupDecrementCount += 1;
            this.testDecrementCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(block)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned decrement has occurred at block: " + block.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Decrement Error",
                });
            }
            else {
                var count = this.blocks.get(block);
                this.blocks.set(block, count - 1);
            }
        };
        /**
         * This method reports an error to the current logTarget and the `TestContext`.
         *
         * @param {IWarning} error - The error being reported.
         */
        TestCollector.prototype.pushError = function (error) {
            this.errors.push(error);
            /**
             * All the tests will always have a log target set. There is no reason to test this branch.
             */
            /* istanbul ignore next */
            if (this.logTarget)
                this.logTarget.errors.push(error);
        };
        TestCollector.prototype.pushWarning = function (warning) {
            this.warnings.push(warning);
            /* istanbul ignore next */
            if (this.logTarget)
                this.logTarget.warnings.push(warning);
        };
        /**
         * This linked method gets all the RTrace increments for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceIncrements = function () {
            return this.incrementCount;
        };
        /**
         * This linked method gets all the RTrace decrements for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceDecrements = function () {
            return this.decrementCount;
        };
        /**
         * This linked method gets all the RTrace increments for the current group up until this point.
         */
        TestCollector.prototype.getRTraceGroupIncrements = function () {
            return this.groupIncrementCount;
        };
        /**
         * This linked method gets all the RTrace decrements for the current group up until this point.
         */
        TestCollector.prototype.getRTraceGroupDecrements = function () {
            return this.groupDecrementCount;
        };
        /**
         * This linked method gets all the RTrace increments for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestIncrements = function () {
            return this.testIncrementCount;
        };
        /**
         * This linked method gets all the RTrace decrements for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestDecrements = function () {
            return this.testDecrementCount;
        };
        /**
         * This linked method gets all the RTrace allocations for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceAllocations = function () {
            return this.allocationCount;
        };
        /**
         * This linked method gets all the RTrace frees for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceFrees = function () {
            return this.freeCount;
        };
        /**
         * This linked method gets all the RTrace increments for this entire test up until this point.
         */
        TestCollector.prototype.getRTraceGroupAllocations = function () {
            return this.groupAllocationCount;
        };
        /**
         * This linked method gets all the RTrace frees for the current group up until this point.
         */
        TestCollector.prototype.getRTraceGroupFrees = function () {
            return this.groupFreeCount;
        };
        /**
         * This linked method gets all the RTrace allocations for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestAllocations = function () {
            return this.testAllocationCount;
        };
        /**
         * This linked method gets all the RTrace allocations for the current test up until this point.
         */
        TestCollector.prototype.getRTraceTestFrees = function () {
            return this.testFreeCount;
        };
        /**
         * This linked method gets all the current RTrace allocations and adds them to an array.
         */
        TestCollector.prototype.getRTraceBlocks = function () {
            return this.wasm.__allocArray(this.wasm.__getUsizeArrayId(), Array.from(this.blocks.keys()));
        };
        /**
         * This linked method gets all the current RTrace allocations for the current group.
         */
        TestCollector.prototype.getRTraceGroupBlocks = function () {
            return this.wasm.__allocArray(this.wasm.__getUsizeArrayId(), Array.from(this.groupBlocks));
        };
        /**
         * This linked method gets all the current RTrace allocations for the current test.
         */
        TestCollector.prototype.getRTraceTestBlocks = function () {
            return this.wasm.__allocArray(this.wasm.__getUsizeArrayId(), Array.from(this.testBlocks));
        };
        /**
         * This function gets a stack trace, sets it to a number and returns it to web assembly. Later,
         * when actual and expected values are reporter, this number will be used to get the correct
         * stack trace.
         */
        TestCollector.prototype.getStackTrace = function () {
            var id = this.stackID;
            this.stackID += 1;
            this.stackTraces.set(id, this.getLogStackTrace());
            return id;
        };
        /**
         * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
         * a default value.
         */
        TestCollector.prototype.getString = function (pointer, defaultValue) {
            return pointer === 0 ? defaultValue : this.wasm.__getString(pointer);
        };
        /**
         * An override implementation of the AssemblyScript trace function.
         *
         * @param {number} strPointer - The trace string.
         * @param {number} count - The number of arguments to be traced.
         * @param {number[]} args - The traced arguments.
         */
        TestCollector.prototype.trace = function (strPointer, count) {
            var args = [];
            for (var _i = 2; _i < arguments.length; _i++) {
                args[_i - 2] = arguments[_i];
            }
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.message = "trace: " + this.getString(strPointer, "") + " " + args.slice(0, count).join(", ");
            value.offset = 0;
            value.pointer = strPointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            value.value = null;
            // push the log value to the logs
            target.logs.push(value);
        };
        return TestCollector;
    }());
    exports.TestCollector = TestCollector;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdENvbGxlY3Rvci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90ZXN0L1Rlc3RDb2xsZWN0b3IudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQ0EsNkNBQTRDO0lBQzVDLG1EQUFrRDtJQUNsRCx5Q0FBd0M7SUFHeEMsK0VBRzJDO0lBQzNDLDJDQUEwQztJQUUxQywwREFBMEQ7SUFDMUQsOENBQXdCO0lBRXhCOzs7OztPQUtHO0lBQ0gsSUFBTSxVQUFVLEdBQUcsVUFBQyxLQUFhLElBQWMsT0FBQSxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLEVBQTVCLENBQTRCLENBQUM7SUE0QjVFOzs7T0FHRztJQUNIO1FBcUVFLHVCQUFZLEtBQWdDO1lBcEVsQyxTQUFJLEdBQTBCLElBQUksQ0FBQztZQUU3QyxvQkFBb0I7WUFDWixlQUFVLEdBQWdCLENBQUMsSUFBSSxxQkFBUyxFQUFFLENBQUMsQ0FBQztZQUNwRCxtR0FBbUc7WUFDNUYsZUFBVSxHQUFnQixFQUFFLENBQUM7WUFFcEMsbUNBQW1DO1lBQzVCLGtCQUFhLEdBQXFCLElBQUksQ0FBQztZQUVwQyxjQUFTLEdBQWUsSUFBSSxDQUFDLFVBQVUsQ0FBQyxDQUFDLENBQUMsQ0FBQztZQUVyRCxzRUFBc0U7WUFDL0QsV0FBTSxHQUFlLEVBQUUsQ0FBQztZQUMvQix3RUFBd0U7WUFDakUsYUFBUSxHQUFlLEVBQUUsQ0FBQztZQUVqQyxnREFBZ0Q7WUFDekMsYUFBUSxHQUFXLEVBQUUsQ0FBQztZQUU3Qiw0QkFBNEI7WUFDbEIsVUFBSyxHQUFXLEVBQUUsQ0FBQztZQUNuQixZQUFPLEdBQVcsRUFBRSxDQUFDO1lBQ3JCLFdBQU0sR0FBdUIsSUFBSSxDQUFDO1lBQ2xDLGFBQVEsR0FBdUIsSUFBSSxDQUFDO1lBYzlDLG9DQUFvQztZQUM1Qiw2QkFBd0IsR0FFNUIsaUVBQXFDLEVBQUUsQ0FBQztZQUU1Qzs7Ozs7ZUFLRztZQUNP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