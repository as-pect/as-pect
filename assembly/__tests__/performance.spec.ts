describe("performance", (): void => {
  performanceEnabled(true);
  minSamples(1000);
  maxSamples(1001);
  test("This is a test with some performance values", (): void => {
    var a: f64 = 1;
    for (let i = 1; i < 10000; i++) {
      a = a * i / a + 1;
    }
  });

  performanceEnabled(false);
  test("This is a test without performance enabled", (): void => {
    log<string>("This should be visible.");
  });
});