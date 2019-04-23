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

export function createDefaultPerformanceConfiguration(): IPerformanceConfiguration {
  return {
    /** Enable performance statistics gathering. */
    enabled: false, // the default must be false because of backwards compatibility
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
