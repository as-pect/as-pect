import { Vec3 } from "./setup/Vec3";

var vec1 = new Vec3(1, 2, 3);
var vec2 = new Vec3(1, 2, 3);
var vec3 = new Vec3(4, 5, 6);

/**
 * This test suite is designed to test the AssemblyScript semantics of the lessThanOrEqualTo
 * operator (>=). It performs simple expectations, and asserts that specific conditions actually
 * throw an `unreachable()` condition.
 */
describe("LessThanOrEqualTo (<=)", (): void => {
  /**
   * This test is the idiomatic lessThanOrEqualTo test.
   */
  it("should validate that the actual value is less than or equal to the expected value", (): void => {
    expect<i32>(0).toBeLessThanOrEqualTo(42, "Assertions with smaller actual values should not throw.");
  });

  /**
   * This test verifies the negated version of the previous test actually throws an error.
   */
  it("should throw when the expected value is less than the actual value", (): void => {
    expectFn((): void => {
      expect<i32>(0).not.toBeLessThanOrEqualTo(42);
    }).toThrow("Negated toBeLessThanOrEqualTo assertions should throw when the actual value is not less than the expected value.");
  });

  /**
   * This test is the contrapositive of the first test, and should be valid as well.
   */
  it("should validate that the actual value is not less than or equal to the expected value", (): void => {
    expect<i32>(42).not.toBeLessThanOrEqualTo(0);
  });

  /**
   * This test verifies that the negated version of the previous test actualy throws an error.
   */
  it("should throw when the expected value is not less than or equal to the actual value", (): void => {
    expectFn((): void => {
      expect<i32>(42).toBeLessThanOrEqualTo(0);
    }).toThrow("It should throw when the actual value is less than the expected value.")
  });

  /**
   * This test verifies that when values are equal, the expectation is successful.
   */
  it("should validate that equal values are less than or equal to each other", (): void => {
    expect<i32>(42).toBeLessThanOrEqualTo(42);
  });

  /**
   * This test verifies that when values are equal, the expectation throws.
   */
  it("should throw when the values are equal", (): void => {
    expectFn((): void => {
      expect<i32>(42).not.toBeLessThanOrEqualTo(42);
    }).toThrow("It should throw when the actual value equals the expected value.");
  });

  /**
   * This test verifies that when the actual value is NaN, the expectation throws.
   */
  it("should throw when the actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBeLessThanOrEqualTo(0);
    }).toThrow("It should throw when the actual value is NaN.");
  });

  /**
   * This test verifies that when the expected value is NaN, the expectation throws.
   */
  it("should throw when the expected value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(0).toBeLessThanOrEqualTo(NaN);
    }).toThrow("It should throw when the expected value is NaN.");
  });

  /**
   * This test verifies that reference types can be less than others when operator overloading
   * is used.
   */
  it("should verify one reference is less than another", (): void => {
    expect<Vec3>(vec1)
      .toBeLessThanOrEqualTo(vec3, "Operator overloading should allow references to verify that one reference is less than another value");
  });

  /**
   * This test verifies that toBeLessThanOrEqualTo throws when the actual value is null.
   */
  it("should throw if the actual value is null", (): void => {
    expectFn((): void => {
      expect<Vec3>(null).toBeLessThanOrEqualTo(vec3);
    }).toThrow("The toBeLessThanOrEqualTo function should throw if the actual value is null.");
  });

  /**
   * This test verifies that toBeLessThanOrEqualTo throws when the expected value is null.
   */
  it("should throw if the expected value is null", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec3).toBeLessThanOrEqualTo(null);
    }).toThrow("The toBeLessThanOrEqualTo function should throw if the expected value is null.");
  });
});
