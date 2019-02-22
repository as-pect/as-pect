import { Vec3 } from "./setup/Vec3";

var vec1 = new Vec3(1, 2, 3);
var vec2 = new Vec3(1, 2, 3);
var vec3 = new Vec3(4, 5, 6);

/**
 * This test suite is designed to test the AssemblyScript semantics of the greaterThan operator (>).
 * It performs simple expectations, and asserts that specific conditions actually throw an
 * `unreachable()` condition.
 */
describe("GreaterThan (>)", (): void => {
  /**
   * This test is the idiomatic greaterThan test.
   */
  it("should validate that the actual value is greater than the expected value", (): void => {
    expect<i32>(42).toBeGreaterThan(0, "Assertions with larger actual values should not throw.");
  });

  /**
   * This test verifies the negated version of the previous test actually throws an error.
   */
  it("should throw when the expected value is less than the actual value", (): void => {
    expectFn((): void => {
      expect<i32>(42).not.toBeGreaterThan(0);
    }).toThrow("Negated toBeGreaterThan assertions should throw when the actual value is less than the expected value.");
  });

  /**
   * This test is the contrapositive of the first test, and should be valid as well.
   */
  it("should validate that the actual value is not greater than the expected value", (): void => {
    expect<i32>(0).not.toBeGreaterThan(42);
  });

  /**
   * This test verifies that the negated version of the previous test actualy throws an error.
   */
  it("should throw when the expected value is not greater than the actual value", (): void => {
    expectFn((): void => {
      expect<i32>(0).toBeGreaterThan(42);
    }).toThrow("It should throw when the actual value is less than the expected value.")
  });

  /**
   * This test verifies that when values are equal, the negated expectation is successful.
   */
  it("should validate that equal values are not greater than each other", (): void => {
    expect<i32>(42).not.toBeGreaterThan(42);
  });

  /**
   * This test verifies that when values are equal, the expectation throws.
   */
  it("should throw when the values are equal", (): void => {
    expectFn((): void => {
      expect<i32>(42).toBeGreaterThan(42);
    }).toThrow("It should throw when the actual value equals the expected value.");
  });

  /**
   * This test verifies that when the actual value is NaN, the expectation throws.
   */
  it("should throw when the actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBeGreaterThan(0);
    }).toThrow("It should throw when the actual value is NaN.");
  });

  /**
   * This test verifies that when the expected value is NaN, the expectation throws.
   */
  it("should throw when the expected value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(0).toBeGreaterThan(NaN);
    }).toThrow("It should throw when the expected value is NaN.");
  });

  /**
   * This test verifies that reference types can be greater than others when operator overloading
   * is used.
   */
  it("should verify one reference is greater than another", (): void => {
    expect<Vec3>(vec3)
      .toBeGreaterThan(vec1, "Operator overloading should allow references to verify that one reference is greater than another value");
  });

  /**
   * This test verifies that toBeGreaterThan throws when the actual value is null.
   */
  it("should throw if the actual value is null", (): void => {
    expectFn((): void => {
      expect<Vec3>(null).toBeGreaterThan(vec3);
    }).toThrow("The toBeGreaterThan function should throw if the actual value is null.");
  });

  /**
   * This test verifies that toBeGreaterThan throws when the expected value is null.
   */
  it("should throw if the expected value is null", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec3).toBeGreaterThan(null);
    }).toThrow("The toBeGreaterThan function should throw if the expected value is null.");
  });
});
