describe("performance", (): void => {
  performanceEnabled(true);
  test("This is a test with some performance values", (): void => {
    for (let i = 0; i < 10000; i++) {}
  });

  performanceEnabled(false);
  test("This is a test without performance enabled", (): void => {
    log<string>("This should be visible.");
  });
});