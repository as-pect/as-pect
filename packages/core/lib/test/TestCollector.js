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
        define(["require", "exports", "../util/LogValue", "../util/ActualValue", "./TestGroup", "../util/IPerformanceConfiguration", "./TestResult", "long", "../util/wasmTools"], factory);
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
    var wasmTools_1 = require("../util/wasmTools");
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
            this.nameSection = null;
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
             * This is the current number of net reallocations during the `TestContext` execution.
             */
            this.reallocationCount = 0;
            /**
             * This is the current number of net reallocations during the `TestGroup` execution.
             */
            this.groupReallocationCount = 0;
            /**
             * This is the current number of net reallocations during the `TestResult` execution.
             */
            this.testReallocationCount = 0;
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
                /* istanbul ignore next */
                if (props.binary)
                    this.nameSection = new wasmTools_1.NameSection(props.binary);
            }
        }
        /**
         * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
         * process of test collection.
         */
        TestCollector.prototype.collectTests = function () {
            var _a;
            // reset the performance values first, then collect the tests by calling `__main()`
            this.resetPerformanceValues();
            /**
             * In version >0.8.1 of assemblyscript, there was a __start function refactor that helped
             * conform assemblyscript to the wasi standard. The following line is used for backwards
             * compatibility to older versions of assemblyscript. Coverage is ignored because one branch
             * is impossible to test using assemblyscript latest.
             */
            /* istanbul ignore next */
            var startFunc = (_a = this.wasm.__start, (_a !== null && _a !== void 0 ? _a : this.wasm._start));
            startFunc();
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
                        getRTraceGroupReallocs: this.getRTraceGroupReallocs.bind(this),
                        getRTraceIncrements: this.getRTraceIncrements.bind(this),
                        getRTraceReallocs: this.getRTraceReallocs.bind(this),
                        getRTraceTestAllocations: this.getRTraceTestAllocations.bind(this),
                        getRTraceTestBlocks: this.getRTraceTestBlocks.bind(this),
                        getRTraceTestDecrements: this.getRTraceTestDecrements.bind(this),
                        getRTraceTestFrees: this.getRTraceTestFrees.bind(this),
                        getRTraceTestIncrements: this.getRTraceTestIncrements.bind(this),
                        getRTraceTestReallocs: this.getRTraceTestReallocs.bind(this),
                        getStackTrace: this.getStackTrace.bind(this),
                        logArray: this.logArray.bind(this),
                        logBool: this.logBool.bind(this),
                        logFunction: this.logFunction.bind(this),
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
                        reportActualFunction: this.reportActualFunction.bind(this),
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
                        reportExpectedFunction: this.reportExpectedFunction.bind(this),
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
                    onrealloc: this.onrealloc.bind(this),
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
         * Log a Function Index.
         *
         * @param {number} functionPointer - The function's pointer.
         */
        TestCollector.prototype.logFunction = function (functionPointer) {
            var _a, _b, _c;
            var value = new LogValue_1.LogValue();
            var target = this.logTarget;
            value.target = target;
            value.fnPointer = functionPointer;
            // Getting the function name is behind an asc feature flag --exportTable, ignore coverage for this
            /* istanbul ignore next */
            var func = (_b = (_a = this.wasm) === null || _a === void 0 ? void 0 : _a.table) === null || _b === void 0 ? void 0 : _b.get(functionPointer);
            /* istanbul ignore next */
            if (((_c = this.wasm) === null || _c === void 0 ? void 0 : _c.table) && func) {
                /* istanbul ignore next */
                value.message = "[Function " + functionPointer + ": " + this.funcName(parseInt(func.name)) + "]";
            }
            else {
                /* istanbul ignore next */
                value.message = "[Function " + functionPointer + "]";
            }
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
         * This function reports an expected function pointer index
         *
         * @param {number} functionPointer - A pointer that points to the expected string.
         * @param {1 | 0} negated  - An indicator if the expectation is negated.
         * @param stackTrace
         */
        TestCollector.prototype.reportExpectedFunction = function (functionPointer, negated, stackTrace) {
            var _a, _b, _c;
            var value = new ActualValue_1.ActualValue();
            // Getting the function name is behind an asc feature flag --exportTable, ignore coverage for this
            /* istanbul ignore next */
            var func = (_b = (_a = this.wasm) === null || _a === void 0 ? void 0 : _a.table) === null || _b === void 0 ? void 0 : _b.get(functionPointer);
            /* istanbul ignore next */
            if (((_c = this.wasm) === null || _c === void 0 ? void 0 : _c.table) && func) {
                /* istanbul ignore next */
                value.message = "[Function " + functionPointer + ": " + this.funcName(parseInt(func.name)) + "]";
            }
            else {
                /* istanbul ignore next */
                value.message = "[Function " + functionPointer + "]";
            }
            value.fnPointer = functionPointer;
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            value.negated = negated === 1;
            this.expected = value;
        };
        /**
         * This function reports an actual function pointer index
         *
         * @param {number} functionPointer - A pointer that points to the expected string.
         * @param {1 | 0} negated  - An indicator if the expectation is negated.
         * @param stackTrace
         */
        TestCollector.prototype.reportActualFunction = function (functionPointer, stackTrace) {
            var _a, _b, _c;
            var value = new ActualValue_1.ActualValue();
            // Getting the function name is behind an asc feature flag --exportTable, ignore coverage for this
            /* istanbul ignore next */
            var func = (_b = (_a = this.wasm) === null || _a === void 0 ? void 0 : _a.table) === null || _b === void 0 ? void 0 : _b.get(functionPointer);
            /* istanbul ignore next */
            if (((_c = this.wasm) === null || _c === void 0 ? void 0 : _c.table) && func) {
                /* istanbul ignore next */
                value.message = "[Function " + functionPointer + ": " + this.funcName(parseInt(func.name)) + "]";
            }
            else {
                /* istanbul ignore next */
                value.message = "[Function " + functionPointer + "]";
            }
            value.fnPointer = functionPointer;
            value.stack = this.stackTraces.get(stackTrace);
            value.target = this.logTarget;
            this.actual = value;
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
        TestCollector.prototype.onrealloc = function (oldBlock, newBlock) {
            this.reallocationCount += 1;
            this.groupReallocationCount += 1;
            this.testReallocationCount += 1;
            /**
             * This is impossible to test, but follows exactly from the AssemblyScript example located
             * at https://github.com/AssemblyScript/assemblyscript/blob/master/lib/rtrace/index.js.
             *
             * Please see this file for further information about how rtrace errors are reported.
             */
            /* istanbul ignore next */
            if (!this.blocks.has(oldBlock)) {
                /* istanbul ignore next */
                this.pushError({
                    message: "An orphaned realloc has occurred at old block: " +
                        oldBlock.toString(),
                    stackTrace: this.getLogStackTrace(),
                    type: "Orphaned Reallocation Error (old)",
                });
            }
            else {
                /* istanbul ignore next */
                if (!this.blocks.has(newBlock)) {
                    /* istanbul ignore next */
                    this.pushError({
                        message: "An orphaned realloc has occurred at new block: " +
                            newBlock.toString(),
                        stackTrace: this.getLogStackTrace(),
                        type: "Orphaned Reallocation Error (new)",
                    });
                }
                else {
                    /* istanbul ignore next */
                    var newRc = this.blocks.get(newBlock);
                    /* istanbul ignore next */
                    if (newRc != 0) {
                        /* istanbul ignore next */
                        this.pushError({
                            message: "An invalid realloc error has occurred from " + oldBlock + " to " + newBlock + ".",
                            stackTrace: this.getLogStackTrace(),
                            type: "Invalid Reallocation Error",
                        });
                    }
                    else {
                        var oldRc = this.blocks.get(oldBlock);
                        this.blocks.set(newBlock, oldRc);
                    }
                }
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
         * This linked method gets all the RTrace reallocations for the current TestContext.
         */
        TestCollector.prototype.getRTraceReallocs = function () {
            return this.reallocationCount;
        };
        /**
         * This linked method gets all the RTrace reallocations for the current TestGroup.
         */
        TestCollector.prototype.getRTraceGroupReallocs = function () {
            return this.groupReallocationCount;
        };
        /**
         * This linked method gets all the RTrace reallocations for the current TestResult.
         */
        TestCollector.prototype.getRTraceTestReallocs = function () {
            return this.testReallocationCount;
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
            value.message = "trace: " + this.getString(strPointer, "") + " " + args
                .slice(0, count)
                .join(", ");
            value.offset = 0;
            value.pointer = strPointer;
            value.stack = this.getLogStackTrace();
            value.target = target;
            value.value = null;
            // push the log value to the logs
            target.logs.push(value);
        };
        TestCollector.prototype.funcName = function (index) {
            /* istanbul ignore next */
            if (this.nameSection)
                return this.nameSection.fromIndex(index);
            /* istanbul ignore next */
            return "";
        };
        return TestCollector;
    }());
    exports.TestCollector = TestCollector;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdENvbGxlY3Rvci5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90ZXN0L1Rlc3RDb2xsZWN0b3IudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBQ0EsNkNBQTRDO0lBQzVDLG1EQUFrRDtJQUNsRCx5Q0FBd0M7SUFHeEMsK0VBRzJDO0lBQzNDLDJDQUEwQztJQUUxQywwREFBMEQ7SUFDMUQsOENBQXdCO0lBQ3hCLCtDQUFnRDtJQUVoRDs7Ozs7T0FLRztJQUNILElBQU0sVUFBVSxHQUFHLFVBQUMsS0FBYSxJQUFjLE9BQUEsZ0JBQWdCLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxFQUE1QixDQUE0QixDQUFDO0lBNkI1RTs7O09BR0c7SUFDSDtRQXNFRSx1QkFBWSxLQUFnQztZQXJFbEMsU0FBSSxHQUEwQixJQUFJLENBQUM7WUFDbkMsZ0JBQVcsR0FBdUIsSUFBSSxDQUFDO1lBRWpELG9CQUFvQjtZQUNaLGVBQVUsR0FBZ0IsQ0FBQyxJQUFJLHFCQUFTLEVBQUUsQ0FBQyxDQUFDO1lBQ3BELG1HQUFtRztZQUM1RixlQUFVLEdBQWdCLEVBQUUsQ0FBQztZQUVwQyxtQ0FBbUM7WUFDNUIsa0JBQWEsR0FBcUIsSUFBSSxDQUFDO1lBRXBDLGNBQVMsR0FBZSxJQUFJLENBQUMsVUFBVSxDQUFDLENBQUMsQ0FBQyxDQUFDO1lBRXJELHNFQUFzRTtZQUMvRCxXQUFNLEdBQWUsRUFBRSxDQUFDO1lBQy9CLHdFQUF3RTtZQUNqRSxhQUFRLEdBQWUsRUFBRSxDQUFDO1lBRWpDLGdEQUFnRDtZQUN6QyxhQUFRLEdBQVcsRUFBRSxDQUFDO1lBRTdCLDRCQUE0QjtZQUNsQixVQUFLLEdBQVcsRUFBRSxDQUFDO1lBQ25CLFlBQU8sR0FBVyxFQUFFLENBQUM7WUFDckIsV0FBTSxHQUF1QixJQUFJLENBQUM7WUFDbEMsYUFBUSxHQUF1QixJQUFJLENBQUM7WUFjOUMsb0NBQW9DO1lBQzVCLDZCQUF3QixH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