function autoPass(): void {}

describe("invalid performance configurations", () => {
  maxSamples(999999999);
  it("test 1", autoPass);

  maxSamples(-1)
  it("test 2", autoPass);

  maxTestRunTime(19999);
  it("test 3", autoPass);

  maxTestRunTime(-1);
  it("test 4", autoPass);
});
