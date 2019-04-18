import { TestReporter } from "../test/TestReporter";

export interface ICompilerFlags {
  [flag: string]: string[];
}

export interface IConfiguration {
  /**
   * A string of globs to find the files that will be included in the test suite.
   */
  include?: string[];
  /**
   * A set of globs passed to the glob package that quality files to be added to each test.
   */
  add?: string[],
  /**
   * All the compiler flags needed for this test suite. Make sure that a binary file is output.
   */
  flags?: ICompilerFlags,
  /**
   * And array of regular expressions that are tested against the file names. If they match, the
   * files will be discluded.
   */
  disclude?: RegExp[];
  /**
   * If the test module requires a set of imports to be loaded, it can be set here.
   */
  imports?: any;
  /**
   * Set the default performance measurement values.
   */
  performance?: {
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
  /**
   * A custom reporter that extends the `TestReporter` class, and is responsible for generating log
   * output.
   */
  reporter?: TestReporter;
}
