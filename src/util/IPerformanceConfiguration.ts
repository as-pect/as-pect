/**
 * This is the interface for performance configuration provided to the TestContext object, before
 * tests are run.
 */
export interface IPerformanceConfiguration {
  /** Enable performance statistics gathering. */
  enabled?: boolean;
  /** Set the minimum number of samples to run for each test in milliseconds. */
  minSamples?: number;
  /** Set the maximum number of samples to run for each test. */
  maxSamples?: number;
  /** Set the minimum test run time in milliseconds. */
  minTestRunTime?: number;
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
}

export function createDefaultPerformanceConfiguration(): IPerformanceConfiguration {
  return {
    /** Enable performance statistics gathering. */
    enabled: false, // the default must be false because of backwards compatibility
    /** Set the minimum number of samples to run for each test in milliseconds. */
    minSamples: 10,
    /** Set the maximum number of samples to run for each test. */
    maxSamples: Infinity,
    /** Set the minimum test run time in milliseconds. */
    minTestRunTime: 1000,
    /** Set the maximum test run time in milliseconds. */
    maxTestRunTime: 2000,
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
  };
}
