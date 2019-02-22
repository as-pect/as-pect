import { Vec3 } from "./setup/Vec3";
var vec1: Vec3 = new Vec3(1, 2, 3);
var vec2: Vec3 = new Vec3(4, 5, 6);

/**
 * This test suite valides strict equality expectations. For value types, they should strictly
 * equal each other, and for reference types, they should be exactly equal pointers.
 */
describe("toBe", (): void => {
  /**
   * This test validates value type expectations of equality.
   */
  it("should expect equal value type values to be equal", (): void => {
    expect<i32>(42).toBe(42, "Two equal values should be equal.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if value types are equal", (): void => {
    expectFn((): void => {
      expect<i32>(42).not.toBe(42);
    }).toThrow("Negated toBe assertions with equal values should throw.");
  });

  /**
   * This test validates value type expectations of inequality.
   */
  it("should expect unequal value type values to unequal.", (): void => {
    expect<i32>(0).not.toBe(42, "Two unequal values should not be equal.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if value types are unequal", (): void => {
    expectFn((): void => {
      expect<i32>(0).toBe(42);
    }).toThrow("toBe assertions with unequal values should throw.");
  });

  /**
   * This test validates a reference equals itself.
   */
  it("should validate if a reference is itself", (): void => {
    expect<Vec3>(vec1).toBe(vec1, "The same reference should be itself");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if a reference is itself", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec1).not.toBe(vec1);
    }).toThrow("Negated toBe assertions of equal pointers should throw");
  });

  /**
   * This test validates that a reference is not expected to be itself.
   */
  it("should validate if a reference is not itself", (): void => {
    expect<Vec3>(vec1).not.toBe(vec2, "Two difference references aren't the same.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if a reference is itself", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec1).toBe(vec2);
    }).toThrow("toBe assertions of unequal pointers should throw");
  });

  /**
   * It should validate a null reference is expected to be null.
   */
  it("should expect nulls to be null", (): void => {
    expect<Vec3>(null).toBe(null);
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if null is not expected to be null", (): void => {
    expectFn((): void => {
      expect<Vec3>(null).not.toBe(null);
    }).toThrow("Negated toBe expectations of null should throw.")
  });

  /**
   * It should expect references not to be null.
   */
  it("should expect references not to be null", (): void => {
    expect<Vec3>(vec1).not.toBe(null, "A valid reference type should not be null.");
  });

  /**
   * This test is the contrapositive to the previous test.
   */
  it("should throw if reference type is not null", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec1).toBe(null);
    }).toThrow("A reference type expection to throw if it's not null.");
  });

  /**
   * NaN comparisons should always throw for actual values.
   */
  it("should always throw if actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBe(0);
    }).toThrow("An actual value can never be NaN.");
  });

  /**
   * NaN comparisons should always throw for expected values.
   */
  it("should always throw if expected value is NaN", (): void => {
    expectFn((): void => {
      expect<f64>(0).toBe(NaN);
    }).toThrow("An expected value can never be NaN.");
  });

  /**
   * NaN values should alway throw.
   */
  it("should always throw if both values are NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBe(NaN);
    }).toThrow("NaN is not ever equal to NaN.");
  });
});

