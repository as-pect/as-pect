describe("performance", (): void => {
  performanceEnabled(true);
  test("this should have performance enabled", (): void => {
    assert(true, "");
  });

  performanceEnabled(true);
  reportVariance(true);
  test("this should have variance enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportMin(true);
  test("this should have min enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportMax(true);
  test("this should have max enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportStdDev(true);
  test("this should have stdDev enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportMedian(true);
  test("this should have stdDev enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportAverage(true);
  test("this should have average enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  roundDecimalPlaces(42);
  test("this should have set the decimal places", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  maxTestRunTime(10);
  test("this should only run for less than a second", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  maxSamples(400);
  test("this should only run for less than a second", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });
});


describe("performance with failures in beforeEach", () => {
  beforeEach(() => {
    assert(false, "failure in beforeEach");
  });

  performanceEnabled(true);
  it("should fail", () => {})
});

describe("performance with failures in afterEach", () => {
  afterEach(() => {
    assert(false, "failure in afterEach");
  });

  performanceEnabled(true);
  it("should fail", () => {})
});
