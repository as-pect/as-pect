import { Vec3 } from "./setup/Vec3";

var vec1 = new Vec3(1, 2, 3);
var vec2 = new Vec3(4, 5, 6);

/**
 * This test suite is designed to test the AssemblyScript semantics of the greaterThanOrEqualTo
 * operator (>=). It performs simple expectations, and asserts that specific conditions actually
 * throw an `unreachable()` condition.
 */
describe("GreaterThanOrEqualTo (>=)", (): void => {
  /**
   * This test is the idiomatic greaterThanOrEqualTo test.
   */
  it("should validate that the actual value is greater than or equal to the expected value", (): void => {
    expect<i32>(42).toBeGreaterThanOrEqual(0, "Assertions with larger actual values should not throw.");
  });

  /**
   * This test verifies the negated version of the previous test actually throws an error.
   */
  throws("should throw when the expected value is less than the actual value", (): void => {
    expect<i32>(42).not.toBeGreaterThanOrEqual(0);
  }, "Negated toBeGreaterThanOrEqualTo assertions should throw when the actual value is less than the expected value.");

  /**
   * This test is the contrapositive of the first test, and should be valid as well.
   */
  it("should validate that the actual value is not greater than or equal to the expected value", (): void => {
    expect<i32>(0).not.toBeGreaterThanOrEqual(42);
  });

  /**
   * This test verifies that the negated version of the previous test actualy throws an error.
   */
  throws("should throw when the expected value is not greater than or equal to the actual value", (): void => {
    expect<i32>(0).toBeGreaterThanOrEqual(42);
  }, "It should throw when the actual value is less than the expected value.");

  /**
   * This test verifies that when values are equal, the negated expectation is successful.
   */
  it("should validate that equal values are greater than or equal to each other", (): void => {
    expect<i32>(42).toBeGreaterThanOrEqual(42);
  });

  /**
   * This test verifies that when values are equal, the expectation throws.
   */
  throws("should throw when the values are equal", (): void => {
    expect<i32>(42).not.toBeGreaterThanOrEqual(42);
  }, "It should throw when the actual value equals the expected value.");

  /**
   * This test verifies that when the actual value is NaN, the expectation throws.
   */
  throws("should throw when the actual value is NaN", (): void => {
    expect<f64>(NaN).toBeGreaterThanOrEqual(0);
  }, "It should throw when the actual value is NaN.");

  /**
   * This test verifies that when the expected value is NaN, the expectation throws.
   */
  throws("should throw when the expected value is NaN", (): void => {
    expect<f64>(0).toBeGreaterThanOrEqual(NaN);
  }, "It should throw when the expected value is NaN.");

  /**
   * This test verifies that reference types can be greater than others when operator overloading
   * is used.
   */
  it("should verify one reference is greater than another", (): void => {
    expect<Vec3>(vec2)
      .toBeGreaterThanOrEqual(vec1, "Operator overloading should allow references to verify that one reference is greater than another value");
  });

  /**
   * This test verifies that toBeGreaterThanOrEqualTo throws when the actual value is null.
   */
  throws("should throw if the actual value is null", (): void => {
    expect<Vec3>(null).toBeGreaterThanOrEqual(vec2);
  }, "The toBeGreaterThanOrEqualTo function should throw if the actual value is null.");

  /**
   * This test verifies that toBeGreaterThanOrEqualTo throws when the expected value is null.
   */
  throws("should throw if the expected value is null", (): void => {
    expect<Vec3>(vec2).toBeGreaterThanOrEqual(null);
  }, "The toBeGreaterThanOrEqualTo function should throw if the expected value is null.");
});
