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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../reporter/VerboseReporter", "perf_hooks", "../util/timeDifference", "./TestCollector"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var VerboseReporter_1 = __importDefault(require("../reporter/VerboseReporter"));
    var perf_hooks_1 = require("perf_hooks");
    var timeDifference_1 = require("../util/timeDifference");
    var TestCollector_1 = require("./TestCollector");
    var TestContext = /** @class */ (function (_super) {
        __extends(TestContext, _super);
        function TestContext(props) {
            var _this = _super.call(this, props) || this;
            _this.time = 0;
            _this.pass = true;
            _this.startupTime = 0;
            _this.reporter = new VerboseReporter_1.default({});
            /* istanbul ignore next */
            _this.stdout = typeof process !== "undefined"
                ? process.stdout
                : null;
            /* istanbul ignore next */
            _this.stderr = typeof process !== "undefined"
                ? process.stderr
                : null;
            _this.endGroup = false;
            /* istanbul ignore next */
            if (props) {
                /* istanbul ignore next */
                if (props.reporter)
                    _this.reporter = props.reporter;
                /* istanbul ignore next */
                if (props.stdout)
                    _this.stdout = props.stdout;
                /* istanbul ignore next */
                if (props.stderr)
                    _this.stderr = props.stderr;
            }
            return _this;
        }
        /**
         * Run the tests on the wasm module.
         */
        TestContext.prototype.run = function (wasm) {
            // set wasm immediately
            this.wasm = wasm;
            // start the timer
            var start = perf_hooks_1.performance.now();
            try {
                // start the module up
                _super.prototype.collectTests.call(this);
                if (!this.rtraceEnabled) {
                    wasm.__disableRTrace();
                }
                // calculate startuptime
                this.startupTime = timeDifference_1.timeDifference(perf_hooks_1.performance.now(), start);
            }
            catch (ex) {
                /** This skipped line is related to the message coalescing, which is just a fallback. */
                /* istanbul ignore next */
                this.pushError({
                    message: "TestCollectionError: " + (this.message || ex.message),
                    stackTrace: this.getErrorStackTrace(ex),
                    type: "TestCollectionError"
                });
            }
            if (this.errors.length > 0)
                return;
            // start the test suite
            this.reporter.onStart(this);
            for (var _i = 0, _a = this.testGroups; _i < _a.length; _i++) {
                var group = _a[_i];
                this.runGroup(group);
                this.stackTraces.clear();
                this.stackTraces.set(-1, "");
            }
            var end = perf_hooks_1.performance.now();
            this.time = timeDifference_1.timeDifference(end, start);
            this.reporter.onFinish(this);
        };
        TestContext.prototype.runGroup = function (group) {
            this.endGroup = false;
            if (this.rtraceEnabled) {
                // reset all the reference counting properties
                this.groupAllocationCount = 0;
                this.groupFreeCount = 0;
                this.groupDecrementCount = 0;
                this.groupIncrementCount = 0;
                group.rtraceStart = this.blocks.size;
                this.groupBlocks.clear();
            }
            // set the group starttime
            group.start = perf_hooks_1.performance.now();
            // set the log target
            this.logTarget = group;
            // for each beforeAllCallback
            this.runBeforeAll(group);
            // report the group as started, and log all the beforeAll logs outside the describe block
            this.reporter.onGroupStart(group);
            if (this.endGroup)
                return;
            for (var _i = 0, _a = group.tests; _i < _a.length; _i++) {
                var result = _a[_i];
                this.runTest(group, result);
                if (this.endGroup)
                    return;
                this.reporter.onTestFinish(group, result);
                this.logTarget = group;
            }
            // for each afterAllCallback
            this.runAfterAll(group);
            if (this.endGroup) {
                group.pass = false;
                group.reason = "Test suite " + group.name + " failed because of an afterAll() callback occurred.";
                return;
            }
            if (this.rtraceEnabled) {
                // calculate reference counts for the group
                group.allocationCount = this.groupAllocationCount;
                group.freeCount = this.groupFreeCount;
                group.decrementCount = this.groupDecrementCount;
                group.incrementCount = this.groupIncrementCount;
                group.rtraceEnd = this.blocks.size;
                group.rtraceDelta = group.rtraceEnd - group.rtraceStart;
            }
            // finish the group
            group.end = perf_hooks_1.performance.now();
            group.time = timeDifference_1.timeDifference(group.end, group.start);
            this.reporter.onGroupFinish(group);
        };
        /**
         * Run a given test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current run group.
         * @param {number} testIndex - The current test index.
         */
        TestContext.prototype.runTest = function (group, result) {
            // set the log target
            this.logTarget = result;
            this.reporter.onTestStart(group, result);
            result.ran = true;
            if (this.rtraceEnabled) {
                // reset all the reference counting properties
                this.testAllocationCount = 0;
                this.testFreeCount = 0;
                this.testDecrementCount = 0;
                this.testIncrementCount = 0;
                result.rtraceStart = this.blocks.size;
                this.testBlocks.clear();
            }
            result.start = perf_hooks_1.performance.now();
            // If performance is enabled, use the performance values, otherwise, just run once.
            if (result.performance) {
                // we must ignore the log values to increase performance execution speed
                this.wasm.__ignoreLogs(1);
                var runCount = 0;
                var testStartTime = perf_hooks_1.performance.now();
                var currentTestRunTime = 0;
                // run the test loop
                while (true) { // always run at least once
                    this.runBeforeEach(group, result);
                    /**
                     * Especially because the performance functions are run repeatedly, if an error occurs, assume the
                     * worst and skip the test group. These functions definitely are assumed to be safe by the test context.
                     */
                    if (this.endGroup) {
                        this.wasm.__ignoreLogs(0);
                        this.wasm.__cleanup();
                        this.wasm.__collect();
                        return;
                    }
                    this.runTestCall(group, result);
                    this.runAfterEach(group, result);
                    // check to see if the afterEach functions errored (see above)
                    if (this.endGroup) {
                        this.wasm.__ignoreLogs(0);
                        this.wasm.__cleanup();
                        this.wasm.__collect();
                        return;
                    }
                    currentTestRunTime = perf_hooks_1.performance.now() - testStartTime; // calculate how long the current test has run
                    runCount += 1; // increase the run count
                    if (runCount >= result.maxSamples) {
                        this.wasm.__ignoreLogs(0);
                        break; // if we have reached the max sample count
                    }
                    if (currentTestRunTime >= result.maxRuntime) {
                        this.wasm.__ignoreLogs(0);
                        break; // weve collected enough samples and the test is over
                    }
                }
                this.wasm.__ignoreLogs(0);
                if (result.calculateAverageValue)
                    result.calculateAverage();
                if (result.calculateMaxValue)
                    result.calculateMax();
                if (result.calculateMedianValue)
                    result.calculateMedian();
                if (result.calculateMinValue)
                    result.calculateMin();
                if (result.calculateVarianceValue)
                    result.calculateVariance();
                if (result.calculateStandardDeviationValue)
                    result.calculateStandardDeviation();
            }
            else {
                this.runBeforeEach(group, result);
                if (this.endGroup)
                    return;
                this.runTestCall(group, result);
                this.runAfterEach(group, result);
                if (this.endGroup)
                    return;
            }
            if (this.rtraceEnabled) {
                // calculate reference counts for the group
                result.allocationCount = this.groupAllocationCount;
                result.freeCount = this.groupFreeCount;
                result.decrementCount = this.groupDecrementCount;
                result.incrementCount = this.groupIncrementCount;
                result.rtraceEnd = this.blocks.size;
                result.rtraceDelta = result.rtraceEnd - result.rtraceStart;
            }
            /**
             * In the chance that some kind of memory error occurs as a result of executing the test,
             * this should end the test unsuccesfully. Since most errors that end with some kind of
             * runtime error using `unreachable()`, it's impossible to test this branch meaningfully.
             * This if statement is ignored because it's a failsafe in case some kind of error occurs
             * that doesn't cause an unreachable state.
             */
            /* istanbul ignore next */
            if (result.errors.length > 0)
                result.pass = false;
            result.end = perf_hooks_1.performance.now();
            result.runTime = timeDifference_1.timeDifference(result.end, result.start);
        };
        /**
         * Run the current test once and collect statistics.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         * @param {number} testIndex - The current test index.
         */
        TestContext.prototype.runTestCall = function (group, result) {
            var start = perf_hooks_1.performance.now();
            var testCallResult = this.tryCall(result.functionPointer);
            var end = perf_hooks_1.performance.now();
            result.times.push(timeDifference_1.timeDifference(end, start));
            result.pass = result.negated
                ? (testCallResult === 0)
                : (testCallResult === 1);
            if (!result.pass) {
                group.pass = false;
                // if it's not negated then set the message, the actual, expected, and stack values
                if (!result.negated) {
                    this.wasm.__sendActual();
                    this.wasm.__sendExpected();
                    result.actual = this.actual;
                    result.expected = this.expected;
                    result.message = this.message;
                    result.stack = this.stack;
                }
            }
            if (testCallResult === 0) {
                this.wasm.__cleanup();
                this.wasm.__collect();
            }
            // always clear the values
            this.message = "";
            this.actual = null;
            this.expected = null;
            this.stack = "";
        };
        /**
         * Run the afterEach callbacks before running the test.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         * @param {TestResult} result - The current test result.
         */
        TestContext.prototype.runAfterEach = function (group, result) {
            if (group.parent)
                this.runAfterEach(group.parent, result);
            // for each afterEach callback function pointer
            for (var _i = 0, _a = group.afterEachPointers; _i < _a.length; _i++) {
                var afterEachCallback = _a[_i];
                var afterEachResult = this.tryCall(afterEachCallback);
                // if afterEach fails
                if (afterEachResult === 0) {
                    this.wasm.__collect();
                    this.endGroup = true;
                    group.end = result.end = perf_hooks_1.performance.now();
                    group.pass = false;
                    this.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in an afterEach() callback.";
                    result.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.reporter.onTestFinish(group, result);
                    this.reporter.onGroupFinish(group);
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
        TestContext.prototype.runBeforeEach = function (group, result) {
            if (group.parent)
                this.runBeforeEach(group.parent, result);
            // for each beforeEach callback function pointer
            for (var _i = 0, _a = group.beforeEachPointers; _i < _a.length; _i++) {
                var beforeEachCallback = _a[_i];
                var beforeEachResult = this.tryCall(beforeEachCallback);
                // if beforeEach fails
                if (beforeEachResult === 0) {
                    this.wasm.__collect();
                    result.end = group.end = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in a beforeEach() callback.";
                    result.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.reporter.onTestFinish(group, result);
                    this.reporter.onGroupFinish(group);
                    this.endGroup = true;
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
        TestContext.prototype.runAfterAll = function (group) {
            if (group.parent)
                this.runAfterAll(group.parent);
            for (var _i = 0, _a = group.afterAllPointers; _i < _a.length; _i++) {
                var afterAllCallback = _a[_i];
                // call each afterAll callback
                var afterAllResult = this.tryCall(afterAllCallback);
                // if the test fails
                if (afterAllResult === 0) {
                    group.end = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in an afterAll() callback.";
                    this.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.reporter.onGroupFinish(group);
                    this.endGroup = true;
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
        TestContext.prototype.runBeforeAll = function (group) {
            if (group.parent)
                this.runBeforeAll(group.parent);
            for (var _i = 0, _a = group.beforeAllPointers; _i < _a.length; _i++) {
                var beforeAllCallback = _a[_i];
                // call each beforeAll callback
                var beforeAllResult = this.tryCall(beforeAllCallback);
                // if the test fails
                if (beforeAllResult === 0) {
                    group.end = perf_hooks_1.performance.now();
                    group.pass = false;
                    group.reason = "Test suite " + group.name + " failed because an error occurred in a beforeAll() callback.";
                    this.pass = false;
                    group.time = timeDifference_1.timeDifference(group.end, group.start);
                    this.endGroup = true;
                    return;
                }
            }
        };
        return TestContext;
    }(TestCollector_1.TestCollector));
    exports.TestContext = TestContext;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdENvbnRleHQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdGVzdC9UZXN0Q29udGV4dC50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFHQSxnRkFBMEQ7SUFDMUQseUNBQXlDO0lBQ3pDLHlEQUF3RDtJQUV4RCxpREFBMEU7SUFTMUU7UUFBaUMsK0JBQWE7UUFrQjVDLHFCQUFZLEtBQThCO1lBQTFDLFlBQ0Usa0JBQU0sS0FBSyxDQUFDLFNBV2I7WUE1Qk0sVUFBSSxHQUFXLENBQUMsQ0FBQztZQUNqQixVQUFJLEdBQVksSUFBSSxDQUFDO1lBQ3JCLGlCQUFXLEdBQVcsQ0FBQyxDQUFDO1lBQ3hCLGNBQVEsR0FBaUIsSUFBSSx5QkFBZSxDQUFDLEVBQUUsQ0FBQyxDQUFDO1lBRXhELDBCQUEwQjtZQUNuQixZQUFNLEdBQXFCLE9BQU8sT0FBTyxLQUFLLFdBQVc7Z0JBQzlELENBQUMsQ0FBQyxPQUFPLENBQUMsTUFBTTtnQkFDaEIsQ0FBQyxDQUFDLElBQUksQ0FBQztZQUNULDBCQUEwQjtZQUNuQixZQUFNLEdBQXFCLE9BQU8sT0FBTyxLQUFLLFdBQVc7Z0JBQzlELENBQUMsQ0FBQyxPQUFPLENBQUMsTUFBTTtnQkFDaEIsQ0FBQyxDQUFDLElBQUksQ0FBQztZQUVELGNBQVEsR0FBWSxLQUFLLENBQUM7WUFLaEMsMEJBQTBCO1lBQzFCLElBQUksS0FBSyxFQUFFO2dCQUNULDBCQUEwQjtnQkFDMUIsSUFBSSxLQUFLLENBQUMsUUFBUTtvQkFBRSxLQUFJLENBQUMsUUFBUSxHQUFHLEtBQUssQ0FBQyxRQUFRLENBQUM7Z0JBQ25ELDBCQUEwQjtnQkFDMUIsSUFBSSxLQUFLLENBQUMsTUFBTTtvQkFBRSxLQUFJLENBQUMsTUFBTSxHQUFHLEtBQUssQ0FBQyxNQUFNLENBQUM7Z0JBQzdDLDBCQUEwQjtnQkFDMUIsSUFBSSxLQUFLLENBQUMsTUFBTTtvQkFBRSxLQUFJLENBQUMs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