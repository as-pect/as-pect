import { Vec3 } from "./setup/Vec3";

var vec1: Vec3 = new Vec3(1, 2, 3);

/**
 * This test suite is designed to test the toBeClose to expectation assertion.
 */
describe("toBeCloseTo", (): void => {

  /**
   * This test uses default values to verify that a float value is close to
   * another float value.
   */
  it("should expect values that are close", (): void => {
    expect<f64>(1.0).toBeCloseTo(1.00001, 2, "1.000001 is close to 1.0");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if the expected values are close", (): void => {
    expectFn((): void => {
      expect<f64>(1.0).not.toBeCloseTo(1.00001, 2);
    }).toThrow("1.000001 is close to 1.0, and should throw");
  });

  /**
   * This test verifies that a value is not close to an expected value of a
   * much higher magnitude.
   */
  it("should assert if the expected value is not close", (): void => {
    expect<f64>(1.0).not.toBeCloseTo(100.0, 2, "100.0 is not close to 1.0");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if the expected value is not close", (): void => {
    expectFn((): void => {
      expect<f64>(1.0).toBeCloseTo(100.0, 2);
    }).toThrow("1.0 is not close to 100.0, and should throw");
  });

  /**
   * A NaN actual value should cause the expectation to throw.
   */
  it("should throw if the actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBeCloseTo(0.0);
    }).toThrow("The actual value NaN should cause the expectation to throw.");
  });

  /**
   * A NaN expected value should cause the expectation to throw.
   */
  it("should throw if the actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(0.0).toBeCloseTo(NaN);
    }).toThrow("The expected value NaN should cause the expectation to throw.");
  });

  /**
   * If both values are NaN, the expectation should throw.
   */
  it("should throw if both values are NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBeCloseTo(NaN);
    }).toThrow("The expected and actual value should cause the expectation to throw.")
  });

  /**
   * A NaN actual value should cause the negated expectation to throw.
   */
  it("should throw if the actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).not.toBeCloseTo(0.0);
    }).toThrow("The actual value NaN should cause the expectation to throw.");
  });

  /**
   * A NaN expected value should cause the negated expectation to throw.
   */
  it("should throw if the actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(0.0).not.toBeCloseTo(NaN);
    }).toThrow("The expected value NaN should cause the negated expectation to throw.");
  });

  /**
   * If both values are NaN, the expectation should throw.
   */
  it("should throw if both values are NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).not.toBeCloseTo(NaN);
    }).toThrow("The expected and actual value should cause the negated expectation to throw.")
  });

  /**
   * A reference type should not be used with toBeCloseTo assertions.
   */
  it("should throw if a reference type is used for a toBeCloseTo assertion", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec1).toBeCloseTo(vec1);
    }).toThrow("Reference types should throw when used with toBeCloseTo assertions.");
  });

  /**
   * A reference type should not be used with toBeCloseTo assertions.
   */
  it("should throw if a reference type is used for a negated toBeCloseTo assertion", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec1).not.toBeCloseTo(vec1);
    }).toThrow("Reference types should throw when used with toBeCloseTo assertions.");
  });
});
