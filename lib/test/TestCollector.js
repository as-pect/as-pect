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
    var wasmFilter = function (input) { return /wasm-function/i.test(input); };
    /**
     * This class is responsible for collecting all the tests in a test binary.
     */
    var TestCollector = /** @class */ (function () {
        function TestCollector(props) {
            this.wasm = null;
            // test group values
            this.groupStack = [new TestGroup_1.TestGroup()];
            this.testGroups = [];
            this.logTarget = this.groupStack[0];
            // public warning/error lists
            this.errors = [];
            this.warnings = [];
            // public fileName
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
            var result = Object.assign.apply(Object, [{}].concat(imports, [// get all the user defined imports
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
            value.message = JSON.stringify(this.wasm.__getArray(arrayPointer));
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
         * @param suiteNamePointer - The boxed long value's pointer.
         */
        TestCollector.prototype.logLong = function (boxPointer, signed) {
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            var long = new long_1.default.fromBytesLE(this.wasm.U8.slice(boxPointer, boxPointer + 8), !signed);
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
            if (!group.willRun)
                return;
            var name = this.getString(testNamePointer, "No test() name provided.");
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
            if (!group.willRun)
                return;
            var name = this.getString(testNamePointer, "No test() name provided.");
            if (!this.testRegex.test(name))
                return;
            var test = new TestResult_1.TestResult();
            test.functionPointer = callback;
            test.name = "Throws: " + name;
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
            var long = new long_1.default.fromBytesLE(this.wasm.U8.slice(boxPointer, boxPointer + 8), !signed);
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
        TestCollector.prototype.reportExpectedReference = function (referencePointer, offset, negated, stackTrace) {
            var value = new ActualValue_1.ActualValue();
            value.message = "Reference Value";
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.pointer = referencePointer;
            value.offset = offset;
            value.bytes = Array.from(this.wasm.U8.slice(referencePointer, referencePointer + offset));
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
            var long = new long_1.default.fromBytesLE(this.wasm.U8.slice(boxPointer, boxPointer + 8), !signed);
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
            return [stackItems[0]].concat(stackItems.slice(1).filter(wasmFilter)).join("\n");
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
        return TestCollector;
    }());
    exports.TestCollector = TestCollector;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdENvbGxlY3Rvci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90ZXN0L1Rlc3RDb2xsZWN0b3IudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7SUFDQSw2Q0FBNEM7SUFDNUMsbURBQWtEO0lBQ2xELHlDQUF3QztJQUd4QywrRUFHMkM7SUFDM0MsMkNBQTBDO0lBRTFDLDBEQUEwRDtJQUMxRCw4Q0FBd0I7SUFFeEIsSUFBTSxVQUFVLEdBQUcsVUFBQyxLQUFhLElBQWMsT0FBQSxnQkFBZ0IsQ0FBQyxJQUFJLENBQUMsS0FBSyxDQUFDLEVBQTVCLENBQTRCLENBQUM7SUFVNUU7O09BRUc7SUFDSDtRQStERSx1QkFBWSxLQUFnQztZQTlEbEMsU0FBSSxHQUEwQixJQUFJLENBQUM7WUFFN0Msb0JBQW9CO1lBQ1osZUFBVSxHQUFnQixDQUFDLElBQUkscUJBQVMsRUFBRSxDQUFDLENBQUM7WUFDN0MsZUFBVSxHQUFnQixFQUFFLENBQUM7WUFDMUIsY0FBUyxHQUFlLElBQUksQ0FBQyxVQUFVLENBQUMsQ0FBQyxDQUFDLENBQUM7WUFFckQsNkJBQTZCO1lBQ3RCLFdBQU0sR0FBZSxFQUFFLENBQUM7WUFDeEIsYUFBUSxHQUFlLEVBQUUsQ0FBQztZQUVqQyxrQkFBa0I7WUFDWCxhQUFRLEdBQVcsRUFBRSxDQUFDO1lBRTdCLDRCQUE0QjtZQUNsQixVQUFLLEdBQVcsRUFBRSxDQUFDO1lBQ25CLFlBQU8sR0FBVyxFQUFFLENBQUM7WUFDckIsV0FBTSxHQUF1QixJQUFJLENBQUM7WUFDbEMsYUFBUSxHQUF1QixJQUFJLENBQUM7WUFjOUMsb0NBQW9DO1lBQzVCLDZCQUF3QixHQUU1QixpRUFBcUMsRUFBRSxDQUFDO1lBRTVDOzs7OztlQUtHO1lBQ08sVUFBSyxHQUFZLEtBQUssQ0FBQztZQUVqQzs7O2VBR0c7WUFDTyxjQUFTLEdBQVcsSUFBSSxNQUFNLENBQUMsRUFBRSxDQUFDLENBQUM7WUFDbkMsZUFBVSxH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