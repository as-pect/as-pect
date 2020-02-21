(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    /** This method creates a default performance configuration. */
    function createDefaultPerformanceConfiguration() {
        return {
            /** Enable performance statistics gathering for each test. */
            enabled: false,
            /** Set the maximum number of samples to run for each test. */
            maxSamples: 10000,
            /** Set the maximum test run time in milliseconds. */
            maxTestRunTime: 2000,
            /** Set the number of decimal places to round to. */
            roundDecimalPlaces: 3,
            /** Report the median time in the default reporter. */
            reportMedian: true,
            /** Report the average time in milliseconds. */
            reportAverage: true,
            /** Report the standard deviation. */
            reportStandardDeviation: false,
            /** Report the maximum run time in milliseconds. */
            reportMax: false,
            /** Report the minimum run time in milliseconds. */
            reportMin: false,
            /** Report the variance/ */
            reportVariance: false,
        };
    }
    exports.createDefaultPerformanceConfiguration = createDefaultPerformanceConfiguration;
});
//# sourceMappingURL=IPerformanceConfiguration.js.map