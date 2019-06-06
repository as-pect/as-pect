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
    /**
     * This method collects the performance configuration values byref.
     *
     * @param {IYargs} yargs - The command line arguments
     * @param {IPerformanceConfiguration} performanceConfiguration - The effective performance configuration.
     */
    function collectPerformanceConfiguration(yargs, performanceConfiguration) {
        if (yargs.argv.hasOwnProperty("performance"))
            performanceConfiguration.enabled = yargs.argv.performance !== "false";
        // gather all the flags
        if (yargs.argv.hasOwnProperty("maxSamples"))
            performanceConfiguration.maxSamples = parseFloat(yargs.argv.maxSamples.toString());
        if (yargs.argv.hasOwnProperty("maxTestRunTime"))
            performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
        if (yargs.argv.hasOwnProperty("maxTestRunTime"))
            performanceConfiguration.maxTestRunTime = parseFloat(yargs.argv.maxTestRunTime.toString());
        if (yargs.argv.hasOwnProperty("roundDecimalPlaces"))
            performanceConfiguration.roundDecimalPlaces = parseFloat(yargs.argv.roundDecimalPlaces.toString());
        if (yargs.argv.hasOwnProperty("reportMedian"))
            performanceConfiguration.reportMedian = yargs.argv.reportMedian !== "false";
        if (yargs.argv.hasOwnProperty("reportAverage"))
            performanceConfiguration.reportAverage = yargs.argv.reportAverage !== "false";
        if (yargs.argv.hasOwnProperty("reportStandardDeviation"))
            performanceConfiguration.reportStandardDeviation = yargs.argv.reportStandardDeviation !== "false";
        if (yargs.argv.hasOwnProperty("reportMax"))
            performanceConfiguration.reportMax = yargs.argv.reportMax !== "false";
        if (yargs.argv.hasOwnProperty("reportMin"))
            performanceConfiguration.reportMin = yargs.argv.reportMin !== "false";
        if (yargs.argv.hasOwnProperty("reportVariance"))
            performanceConfiguration.reportVariance = yargs.argv.reportVariance !== "false";
    }
    exports.collectPerformanceConfiguration = collectPerformanceConfiguration;
});
//# sourceMappingURL=collectPerformanceConfiguration.js.map