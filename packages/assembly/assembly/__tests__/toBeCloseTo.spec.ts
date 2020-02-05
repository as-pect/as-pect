/**
 * This test suite is designed to test the toBeClose to expectation assertion.
 */
describe("toBeCloseTo", () => {
  /**
   * This test uses default values to verify that a float value is close to
   * another float value.
   */
  it("should expect values that are close", () => {
    expect(1.0).toBeCloseTo(1.00001, 2, "1.000001 is close to 1.0");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if the expected values are close", () => {
    expect(1.0).not.toBeCloseTo(1.00001, 2);
  }, "1.000001 is close to 1.0, and should throw");

  /**
   * This test verifies that a value is not close to an expected value of a
   * much higher magnitude.
   */
  it("should assert if the expected value is not close", () => {
    expect(1.0).not.toBeCloseTo(100.0, 2, "100.0 is not close to 1.0");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if the expected value is not close", () => {
    expect(1.0).toBeCloseTo(100.0, 2);
  }, "1.0 is not close to 100.0, and should throw");

  /**
   * A NaN actual value should cause the expectation to throw.
   */
  throws("should throw if the actual value is NaN", () => {
    expect(NaN).toBeCloseTo(0.0);
  }, "The actual value NaN should cause the expectation to throw.");

  /**
   * A NaN expected value should cause the expectation to throw.
   */
  throws("should throw if the actual value is NaN", () => {
    expect(0.0).toBeCloseTo(NaN);
  }, "The expected value NaN should cause the expectation to throw.");

  /**
   * If both values are NaN, the expectation should throw.
   */
  throws("should throw if both values are NaN", () => {
    expect(NaN).toBeCloseTo(NaN);
  }, "The expected and actual value should cause the expectation to throw.");

  /**
   * A NaN actual value should cause the negated expectation to throw.
   */
  throws("should throw if the actual value is NaN", () => {
    expect(NaN).not.toBeCloseTo(0.0);
  }, "The actual value NaN should cause the expectation to throw.");

  /**
   * A NaN expected value should cause the negated expectation to throw.
   */
  throws("should throw if the actual value is NaN", () => {
    expect(0.0).not.toBeCloseTo(NaN);
  }, "The expected value NaN should cause the negated expectation to throw.");

  /**
   * If both values are NaN, the expectation should throw.
   */
  throws("should throw if both values are NaN", () => {
    expect(NaN).not.toBeCloseTo(NaN);
  }, "The expected and actual value should cause the negated expectation to throw.");
});
