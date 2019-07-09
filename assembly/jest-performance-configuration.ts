function autoPass(): void {}

describe("invalid performance configurations", () => {
  Performance.maxSamples(999999999);
  it("test 1", autoPass);

  Performance.maxSamples(-1)
  it("test 2", autoPass);

  Performance.maxTestRunTime(19999);
  it("test 3", autoPass);

  Performance.maxTestRunTime(-1);
  it("test 4", autoPass);

  Performance.roundDecimalPlaces(100);
  it("test 5", autoPass);

  Performance.roundDecimalPlaces(-1);
  it("test 6", autoPass);
});
