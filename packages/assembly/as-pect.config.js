module.exports = {
  /**
   * A set of globs passed to the glob package that qualify typescript files for testing.
   */
  include: ["assembly/__tests__/**/*.spec.ts"],
  /**
   * A set of globs passed to the glob package that quality files to be added to each test.
   */
  add: ["assembly/__tests__/**/*.include.ts"],
  /**
   * All the compiler flags needed for this test suite. Make sure that a binary file is output.
   */
  flags: {
    /** To output a wat file, uncomment the following line. */
    "--textFile": ["output.wat"],
    /** To select an appropriate runtime, use the --runtime compiler flag. */
    "--runtime": ["full"], // Acceptable values are: full, half, stub (arena), and none
    /** Exports the function table to resolve names of exported function pointers.  */
    "--exportTable": [],
  },
  /**
   * A set of regexp that will disclude source files from testing.
   */
  disclude: [/node_modules/i],
  /**
   * Add your required AssemblyScript imports here.
   */
  imports: {},
  /**
   * All performance statistics reporting can be configured here.
   */
  performance: {
    /** Enable performance statistics gathering. */
    enabled: false,
    /** Set the maximum number of samples to run for each test. */
    maxSamples: 1000,
    /** Set the number of decimal places to round to. */
    roundDecimalPlaces: 3,
    /** Set the maximum test run time in milliseconds. */
    maxTestRunTime: 5000,
    /** Report the median time in the default reporter. */
    reportMedian: true,
    /** Report the average time in milliseconds. */
    reportAverage: true,
    /** Report the standard deviation. */
    reportStandardDeviation: true,
    /** Report the maximum run time in milliseconds. */
    reportMax: true,
    /** Report the minimum run time in milliseconds. */
    reportMin: true,
    /** Report the variance. */
    reportVariance: true,
  },
  /** Use the summary reporter. */
  // reporter: new SummaryTestReporter(),
};
