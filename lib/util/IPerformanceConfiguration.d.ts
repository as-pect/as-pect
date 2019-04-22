/**
 * This is the interface for performance configuration provided to the TestContext object, before
 * tests are run.
 */
export interface IPerformanceConfiguration {
    /** Enable performance statistics gathering. */
    enabled?: boolean;
    /** Set the minimum number of samples to run for each test in milliseconds. */
    maxSamples?: number;
    /** Set the maximum test run time in milliseconds. */
    maxTestRunTime?: number;
    /** Report the median time in the default reporter. */
    reportMedian?: boolean;
    /** Report the average time in milliseconds. */
    reportAverage?: boolean;
    /** Report the standard deviation. */
    reportStandardDeviation?: boolean;
    /** Report the maximum run time in milliseconds. */
    reportMax?: boolean;
    /** Report the minimum run time in milliseconds. */
    reportMin?: boolean;
    /** Report the variance. */
    reportVariance?: boolean;
    /** Set the number of decimal places to round to. */
    roundDecimalPlaces?: number;
}
export declare function createDefaultPerformanceConfiguration(): IPerformanceConfiguration;
//# sourceMappingURL=IPerformanceConfiguration.d.ts.map