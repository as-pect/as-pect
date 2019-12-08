import { TestResult } from "../src/test/TestResult";

let t: TestResult;

describe("TestResult", () => {
  beforeEach(() => {
    t = new TestResult();
    t.performance = true;
    for (let i = 0; i < 1000; i++) {
      t.times.push(i);
    }
  });

  it("should caluculate varaince if std deviation is calculated", () => {
    t.calculateStandardDeviation();
    expect(t.hasVariance).toBeTruthy();
    expect(t.hasStdDev).toBeTruthy();
  });

  /**
   * There is a branch that bypasses variance calculation if the standard deviation was calculated
   * already. This test causes that branch to be executed.
   */
  it("should not calculate variance again if calculateVariance is called after calculateStandardDeviation", () => {
    t.calculateStandardDeviation();
    t.calculateVariance();
  });

  /**
   * There is a branch that bypasses variance calculation for the standard deviation if the variance was
   * already calculated. This test causes that branch to be executed.
   */
  it("should not calculate variance again if calculateVariance is called after calculateStandardDeviation", () => {
    t.calculateVariance();
    t.calculateStandardDeviation();
  });
});
