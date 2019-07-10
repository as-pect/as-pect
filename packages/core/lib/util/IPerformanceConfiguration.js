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
    function createDefaultPerformanceConfiguration() {
        return {
            /** Enable performance statistics gathering. */
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiSVBlcmZvcm1hbmNlQ29uZmlndXJhdGlvbi5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzIjpbIi4uLy4uL3NyYy91dGlsL0lQZXJmb3JtYW5jZUNvbmZpZ3VyYXRpb24udHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7SUE0QkEsU0FBZ0IscUNBQXFDO1FBQ25ELE9BQU87WUFDTCwrQ0FBK0M7WUFDL0MsT0FBTyxFQUFFLEtBQUs7WUFDZCw4REFBOEQ7WUFDOUQsVUFBVSxFQUFFLEtBQUs7WUFDakIscURBQXFEO1lBQ3JELGNBQWMsRUFBRSxJQUFJO1lBQ3BCLG9EQUFvRDtZQUNwRCxrQkFBa0IsRUFBRSxDQUFDO1lBQ3JCLHNEQUFzRDtZQUN0RCxZQUFZLEVBQUUsSUFBSTtZQUNsQiwrQ0FBK0M7WUFDL0MsYUFBYSxFQUFFLElBQUk7WUFDbkIscUNBQXFDO1lBQ3JDLHVCQUF1QixFQUFFLEtBQUs7WUFDOUIsbURBQW1EO1lBQ25ELFNBQVMsRUFBRSxLQUFLO1lBQ2hCLG1EQUFtRDtZQUNuRCxTQUFTLEVBQUUsS0FBSztZQUNoQiwyQkFBMkI7WUFDM0IsY0FBYyxFQUFFLEtBQUs7U0FDdEIsQ0FBQztJQUNKLENBQUM7SUF2QkQsc0ZBdUJDIn0=