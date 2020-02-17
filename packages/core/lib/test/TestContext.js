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
            this.runGroup(this.topLevelGroup);
            var end = perf_hooks_1.performance.now();
            this.time = timeDifference_1.timeDifference(end, start);
            this.reporter.onFinish(this);
        };
        TestContext.prototype.runGroup = function (group) {
            if (!group.willRun) {
                /* istanbul ignore next */
                for (var _i = 0, _a = group.children; _i < _a.length; _i++) {
                    var child = _a[_i];
                    /* istanbul ignore next */
                    this.runGroup(child);
                    /* istanbul ignore next */
                    if (this.endGroup)
                        return;
                }
            }
            this.endGroup = false;
            if (this.rtraceEnabled) {
                // reset all the reference counting properties
                this.groupAllocationCount = 0;
                this.groupFreeCount = 0;
                this.groupDecrementCount = 0;
                this.groupIncrementCount = 0;
                this.groupReallocationCount = 0;
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
            for (var _b = 0, _c = group.tests; _b < _c.length; _b++) {
                var result = _c[_b];
                this.runTest(group, result);
                if (this.endGroup)
                    return;
                this.reporter.onTestFinish(group, result);
                this.logTarget = group;
            }
            // run the children
            for (var _d = 0, _e = group.children; _d < _e.length; _d++) {
                var child = _e[_d];
                this.runGroup(child);
            }
            // for each afterAllCallback
            this.runAfterAll(group);
            if (this.endGroup) {
                this.pass = false;
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
                group.reallocationCount = this.groupReallocationCount;
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
                this.testReallocationCount = 0;
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
                        this.wasm.__collect();
                        return;
                    }
                    this.runTestCall(group, result);
                    this.runAfterEach(group, result);
                    // check to see if the afterEach functions errored (see above)
                    if (this.endGroup) {
                        this.wasm.__ignoreLogs(0);
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
                // calculate reference counts for the test
                result.allocationCount = this.testAllocationCount;
                result.freeCount = this.testFreeCount;
                result.decrementCount = this.testDecrementCount;
                result.incrementCount = this.testIncrementCount;
                result.reallocationCount = this.testReallocationCount;
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
            if (result.errors.length > 0) {
                this.pass = false;
                result.pass = false;
            }
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
                this.pass = false;
                group.pass = false;
                // if it's not negated then set the message, the actual, expected, and stack values
                if (!result.negated) {
                    result.actual = this.actual;
                    result.expected = this.expected;
                    result.message = this.message;
                    result.stack = this.stack;
                }
            }
            if (testCallResult === 0) {
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
                    this.pass = false;
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
         * Run the beforeAll callbacks with the given runContext and group. This
         * method only calls the current group's beforeAll callbacks.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        TestContext.prototype.runAfterAll = function (group) {
            for (var _i = 0, _a = group.afterAllPointers; _i < _a.length; _i++) {
                var afterAllCallback = _a[_i];
                // call each afterAll callback
                var afterAllResult = this.tryCall(afterAllCallback);
                // if the test fails
                if (afterAllResult === 0) {
                    group.end = perf_hooks_1.performance.now();
                    this.pass = false;
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
         * Run the beforeAll callbacks with the given runContext and group. This
         * method only calls the current group's beforeAll callbacks.
         *
         * @param {RunContext} runContext - The current run context.
         * @param {TestGroup} group - The current test group.
         */
        TestContext.prototype.runBeforeAll = function (group) {
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