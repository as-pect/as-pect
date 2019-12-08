describe("performance", () => {
  Performance.enabled(true);
  test("this should have performance enabled", () => {
    assert(true, "");
  });

  Performance.enabled(true);
  Performance.reportVariance(true);
  test("this should have variance enabled", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.reportMin(true);
  test("this should have min enabled", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.reportMax(true);
  test("this should have max enabled", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.reportStdDev(true);
  test("this should have stdDev enabled", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.reportMedian(true);
  test("this should have stdDev enabled", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.reportAverage(true);
  test("this should have average enabled", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.roundDecimalPlaces(42);
  test("this should have set the decimal places", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.maxTestRunTime(10);
  test("this should only run for less than a second", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  Performance.enabled(true);
  Performance.maxSamples(400);
  test("this should only run for less than a second", () => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });
});


describe("performance with failures in beforeEach", () => {
  beforeEach(() => {
    assert(false, "failure in beforeEach");
  });

  Performance.enabled(true);
  it("should fail", () => {})
});

describe("performance with failures in afterEach", () => {
  afterEach(() => {
    assert(false, "failure in afterEach");
  });

  Performance.enabled(true);
  it("should fail", () => {})
});
