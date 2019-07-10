/**
 * This test suite outputs some sample performance tests. Please see the DefaultTestReporter output
 * to verify that these performance values are output to the console.
 */
describe("performance", (): void => {
  /**
   * This method should output at most 1001 samples in the DefaultTestReporter output. All logs
   * should be ignored.
   */
  Performance.enabled(true);
  Performance.maxSamples(1001);
  test("This is a test with some performance values", (): void => {
    var a: f64 = 1;
    for (let i = 1; i < 10000; i++) {
      a = a * i / a + 1;
      log<f64>(a);
    }
  });

  /**
   * This test should log a value because performance is not enabled.
   */
  Performance.enabled(false);
  test("This is a test without performance enabled", (): void => {
    log<string>("This should be visible.");
  });
});
