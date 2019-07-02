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
            _this.stdout = typeof process !== "undefined" ? process.stdout : null;
            /* istanbul ignore next */
            _this.stderr = typeof process !== "undefined" ? process.stderr : null;
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
                    type: "TestCollectionError",
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
                while (true) {
                    // always run at least once
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
            result.pass = result.negated ? testCallResult === 0 : testCallResult === 1;
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdENvbnRleHQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi9zcmMvdGVzdC9UZXN0Q29udGV4dC50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7SUFHQSxnRkFBMEQ7SUFDMUQseUNBQXlDO0lBQ3pDLHlEQUF3RDtJQUV4RCxpREFBMEU7SUFTMUU7UUFBaUMsK0JBQWE7UUFlNUMscUJBQVksS0FBOEI7WUFBMUMsWUFDRSxrQkFBTSxLQUFLLENBQUMsU0FXYjtZQTFCTSxVQUFJLEdBQVcsQ0FBQyxDQUFDO1lBQ2pCLFVBQUksR0FBWSxJQUFJLENBQUM7WUFDckIsaUJBQVcsR0FBVyxDQUFDLENBQUM7WUFDeEIsY0FBUSxHQUFpQixJQUFJLHlCQUFlLENBQUMsRUFBRSxDQUFDLENBQUM7WUFFeEQsMEJBQTBCO1lBQ25CLFlBQU0sR0FDWCxPQUFPLE9BQU8sS0FBSyxXQUFXLENBQUMsQ0FBQyxDQUFDLE9BQU8sQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLElBQUksQ0FBQztZQUN6RCwwQkFBMEI7WUFDbkIsWUFBTSxHQUNYLE9BQU8sT0FBTyxLQUFLLFdBQVcsQ0FBQyxDQUFDLENBQUMsT0FBTyxDQUFDLE1BQU0sQ0FBQyxDQUFDLENBQUMsSUFBSSxDQUFDO1lBRWpELGNBQVEsR0FBWSxLQUFLLENBQUM7WUFLaEMsMEJBQTBCO1lBQzFCLElBQUksS0FBSyxFQUFFO2dCQUNULDBCQUEwQjtnQkFDMUIsSUFBSSxLQUFLLENBQUMsUUFBUTtvQkFBRSxLQUFJLENBQUMsUUFBUSxHQUFHLEtBQUssQ0FBQyxRQUFRLENBQUM7Z0JBQ25ELDBCQUEwQjtnQkFDMUIsSUFBSSxLQUFLLENBQUMsTUFBTTtvQkFBRSxLQUFJLENBQUMsTUFBTSxHQUFHLEtBQUssQ0FBQyxNQUFNLENBQUM7Z0JBQzdDLDBCQUEwQjtnQkFDMUIsSUFBSSxLQUFLLENBQUMsTUFBTTtvQkFBRSxLQUFJLENBQUMsTUFBTSxHQUFH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