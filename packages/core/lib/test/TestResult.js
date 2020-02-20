(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../math/mean", "../math/round", "../math/median", "../math/variance"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var mean_1 = require("../math/mean");
    var round_1 = require("../math/round");
    var median_1 = require("../math/median");
    var variance_1 = require("../math/variance");
    /**
     * This is the data class that contains all the data about each `test()` or `it()` function defined
     * in the `AssemblyScript` module.
     */
    var TestResult = /** @class */ (function () {
        function TestResult() {
            /** This is the test function pointer. */
            this.functionPointer = -1;
            /** The actual test's name or description. */
            this.name = "";
            /** The indicator to see if the test passed. */
            this.pass = false;
            /** The indicated to see if a test actually ran. */
            this.ran = false;
            /** The time in milliseconds indicating how long the test ran for each run. */
            this.times = [];
            /** The reported actual value description. */
            this.actual = null;
            /** The reported expected value description. */
            this.expected = null;
            /** If the test failed, this is the message describing why the test failed. */
            this.message = "";
            /** A set of strings logged by the test itself. */
            this.logs = [];
            /** The generated stack trace if the test errored. */
            this.stack = null;
            /** This value is set to true if the test is expected to throw. */
            this.negated = false;
            /** This value indicates if performance statistics were collected for this test. */
            this.performance = false;
            /** This value indicates the maximum number of samples to collect. */
            this.maxSamples = 10000 /* MaxSamples */;
            /** This value indicates the maximum test runtime. */
            this.maxRuntime = 5000 /* MaxTestRuntime */;
            /** The number of decimal places used for rounding. */
            this.decimalPlaces = 0 /* MinimumDecimalPlaces */;
            /** This value indicates if an average should be calculated */
            this.calculateAverageValue = false;
            /** This value indicates if an average was calculated. */
            this.hasAverage = false;
            /** This is the average (mean) value. */
            this.average = 0;
            /** This value indicates if a max value should be calculated. */
            this.calculateMaxValue = false;
            /** This value indicates if a max was calculated. */
            this.hasMax = false;
            /** This is the max time. */
            this.max = 0;
            /** This value indicates if a median value should be calculated. */
            this.calculateMedianValue = false;
            /** This value indicates if a median value was calculated. */
            this.hasMedian = false;
            /** This is the calculated median time. */
            this.median = 0;
            /** This value indicated if a min value should be calculated. */
            this.calculateMinValue = false;
            /** This value indicates if a min value was calculated. */
            this.hasMin = false;
            /** This is the calculated min time. */
            this.min = 0;
            /** This value indicates if a standard deviation value should be calculated. */
            this.calculateStandardDeviationValue = false;
            /** This value indicates if a standard deviation value was calculated. */
            this.hasStdDev = false;
            /** This is the calculated standard deviation of the times collected. */
            this.stdDev = 0;
            /** This value indicates if the variance should be calculated. */
            this.calculateVarianceValue = false;
            /** A boolean indicating if the variance was calcluated. */
            this.hasVariance = false;
            /** The raw variance calculation before rounding was applied. */
            this.rawVariance = 0;
            /** This value indicates the calculated variance used for standard deviation calculations. */
            this.variance = 0;
            /** This is the timestamp for when the test started in milliseconds. */
            this.start = 0;
            /** This is the timestamp for when the test ended in milliseconds. */
            this.end = 0;
            /** This is the run time for the test in milliseconds. */
            this.runTime = 0;
            /**
             * If the test group did not error, this is the number of allocations that occurred durring the
             * the test's exection.
             */
            this.allocationCount = 0;
            /**
             * If the test group did not error, this is the number of deallocations that occurred durring the
             * the test's exection.
             */
            this.freeCount = 0;
            /**
             * If the test group did not error, this is the number of block decrements that occurred during
             * the test's exection.
             */
            this.decrementCount = 0;
            /**
             * If the test group did not error, this is the number of block increments that occurred during
             * the test's exection.
             */
            this.incrementCount = 0;
            /**
             * If the test did not error, this is the number of block increments that occurred during
             * the test's exection.
             */
            this.reallocationCount = 0;
            /**
             * This is the number of allocations currently on the heap when the `TestResult` execution starts.
             */
            this.rtraceStart = 0;
            /**
             * If the test group completed, this is the number of allocations currently on the heap when the
             * `TestResult` execution ends.
             */
            this.rtraceEnd = 0;
            /**
             * If the test group completed, this is the delta number of allocations that occured during the
             * `TestResult` execution.
             */
            this.rtraceDelta = 0;
            /**
             * A set of errors that were reported for this test.
             */
            this.errors = [];
            /**
             * A set of warnings that were reported for this test.
             */
            this.warnings = [];
        }
        /**
         * Caclculate the average value of the collected times.
         */
        TestResult.prototype.calculateAverage = function () {
            this.hasAverage = true;
            this.average = round_1.round(mean_1.mean(this.times), this.decimalPlaces);
        };
        /**
         * Calculate the max time of the collected times.
         */
        TestResult.prototype.calculateMax = function () {
            this.hasMax = true;
            this.max = Math.max.apply(Math, this.times);
        };
        /**
         * Calculate the median value of the collected times.
         */
        TestResult.prototype.calculateMedian = function () {
            this.hasMedian = true;
            this.median = round_1.round(median_1.median(this.times), this.decimalPlaces);
        };
        /**
         * Calculate the min value of the collected times.
         */
        TestResult.prototype.calculateMin = function () {
            this.hasMin = true;
            this.min = Math.min.apply(Math, this.times);
        };
        /**
         * Calculate the standard deviation of the collected times.
         */
        TestResult.prototype.calculateStandardDeviation = function () {
            if (!this.hasVariance) {
                this.calculateVariance();
            }
            this.hasStdDev = true;
            this.stdDev = round_1.round(Math.sqrt(this.rawVariance), this.decimalPlaces);
        };
        /**
         * Calculate the variance.
         */
        TestResult.prototype.calculateVariance = function () {
            if (this.hasVariance)
                return;
            this.hasVariance = true;
            this.rawVariance = variance_1.variance(this.times); // biased calculation
            this.variance = round_1.round(this.rawVariance, this.decimalPlaces);
        };
        return TestResult;
    }());
    exports.TestResult = TestResult;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiVGVzdFJlc3VsdC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy90ZXN0L1Rlc3RSZXN1bHQudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUFHQSxxQ0FBb0M7SUFDcEMsdUNBQXNDO0lBQ3RDLHlDQUF3QztJQUN4Qyw2Q0FBNEM7SUFHNUM7OztPQUdHO0lBQ0g7UUFBQTtZQUNFLHlDQUF5QztZQUNsQyxvQkFBZSxHQUFXLENBQUMsQ0FBQyxDQUFDO1lBQ3BDLDZDQUE2QztZQUN0QyxTQUFJLEdBQVcsRUFBRSxDQUFDO1lBQ3pCLCtDQUErQztZQUN4QyxTQUFJLEdBQVksS0FBSyxDQUFDO1lBQzdCLG1EQUFtRDtZQUM1QyxRQUFHLEdBQVksS0FBSyxDQUFDO1lBQzVCLDhFQUE4RTtZQUN2RSxVQUFLLEdBQWEsRUFBRSxDQUFDO1lBQzVCLDZDQUE2QztZQUN0QyxXQUFNLEdBQTBCLElBQUksQ0FBQztZQUM1QywrQ0FBK0M7WUFDeEMsYUFBUSxHQUEwQixJQUFJLENBQUM7WUFDOUMsOEVBQThFO1lBQ3ZFLFlBQU8sR0FBVyxFQUFFLENBQUM7WUFDNUIsa0RBQWtEO1lBQzNDLFNBQUksR0FBcUIsRUFBRSxDQUFDO1lBQ25DLHFEQUFxRDtZQUM5QyxVQUFLLEdBQWtCLElBQUksQ0FBQztZQUNuQyxrRUFBa0U7WUFDM0QsWUFBTyxHQUFZLEtBQUssQ0FBQztZQUNoQyxtRkFBbUY7WUFDNUUsZ0JBQVcsR0FBWSxLQUFLLENBQUM7WUFDcEMscUVBQXFFO1lBQzlELGVBQVUsMEJBQXdDO1lBQ3pELHFEQUFxRDtZQUM5QyxlQUFVLDZCQUE0QztZQUM3RCxzREFBc0Q7WUFDL0Msa0JBQWEsZ0NBQWtEO1lBQ3RFLDhEQUE4RDtZQUN2RCwwQkFBcUIsR0FBWSxLQUFLLENBQUM7WUFDOUMseURBQXlEO1lBQ2xELGVBQVUsR0FBWSxLQUFLLENBQUM7WUFDbkMsd0NBQXdDO1lBQ2pDLFlBQU8sR0FBVyxDQUFDLENBQUM7WUFDM0Is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