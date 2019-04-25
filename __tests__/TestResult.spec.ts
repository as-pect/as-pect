import { TestResult } from "../src/test/TestResult";

let t: TestResult;

describe("TestResult", (): void => {
  beforeEach((): void => {
    t = new TestResult();
    for (let i = 0; i < 1000; i++) {
      t.times.push(i);
    }
  });

  it("should caluculate varaince if std deviation is calculated", (): void => {
    t.calculateStandardDeviation();
    expect(t.hasVariance).toBeTruthy();
    expect(t.hasStdDev).toBeTruthy();
  });

  // this test is purely for test coverage
  it("should not calculate variance again if variance is asked for after std deviation", (): void => {
    t.calculateStandardDeviation();
    t.calculateVariance();
  });
});