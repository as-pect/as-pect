import { Vec3 } from "./setup/Vec3";
import { Listener, listener, anotherListener, initializeDispatcher } from "./setup/Event";
var vec1: Vec3 = new Vec3(1, 2, 3);
var vec2: Vec3 = new Vec3(4, 5, 6);

var eventDispatcher = initializeDispatcher();



/**
 * This test suite valides strict equality expectations. For value types, they should strictly
 * equal each other, and for reference types, they should be exactly equal pointers.
 */
describe("toBe", () => {
  /**
   * This test validates value type expectations of equality.
   */
  it("should expect equal value type values to be equal", () => {
    expect<i32>(42).toBe(42, "Two equal values should be equal.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if value types are equal", () => {
    expect<i32>(42).not.toBe(42);
  }, "Negated toBe assertions with equal values should throw.");

  /**
   * This test validates value type expectations of inequality.
   */
  it("should expect unequal value type values to unequal.", () => {
    expect<i32>(0).not.toBe(42, "Two unequal values should not be equal.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if value types are unequal", () => {
    expect<i32>(0).toBe(42);
  }, "toBe assertions with unequal values should throw.");

  /**
   * This test validates a reference equals itself.
   */
  it("should validate if a reference is itself", () => {
    expect<Vec3>(vec1).toBe(vec1, "The same reference should be itself");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if a reference is itself", () => {
    expect<Vec3>(vec1).not.toBe(vec1);
  }, "Negated toBe assertions of equal pointers should throw");

  /**
   * This test validates that a reference is not expected to be itself.
   */
  it("should validate if a reference is not itself", () => {
    expect<Vec3>(vec1).not.toBe(vec2, "Two difference references aren't the same.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if a reference is itself", () => {
    expect<Vec3>(vec1).toBe(vec2);
  }, "toBe assertions of unequal pointers should throw");

  /**
   * It should validate a null reference is expected to be null.
   */
  it("should expect nulls to be null", () => {
    expect<Vec3 | null>(null).toBe(null);
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if null is not expected to be null", () => {
    expect<Vec3 | null>(null).not.toBe(null);
  }, "Negated toBe expectations of null should throw.");

  /**
   * It should expect references not to be null.
   */
  it("should expect references not to be null", () => {
    expect<Vec3 | null>(vec1).not.toBe(null, "A valid reference type should not be null.");
  });

  /**
   * This test is the contrapositive to the previous test.
   */
  throws("should throw if reference type is not null", () => {
    expect<Vec3 | null>(vec1).toBe(null);
  }, "A reference type expection to throw if it's not null.");

  /**
   * NaN comparisons should always throw for actual values.
   */
  throws("should always throw if actual value is NaN", () => {
    expect<f64>(NaN).toBe(0);
  }, "An actual value can never be NaN, and never equals anything.");

  /**
   * NaN comparisons should always throw for expected values.
   */
  throws("should always throw if expected value is NaN", () => {
    expect<f64>(0).toBe(NaN);
  }, "An expected value can never be NaN, and never equals anything.");

  /**
   * NaN values should alway throw.
   */
  throws("should always throw if both values are NaN", () => {
    expect<f64>(NaN).toBe(NaN);
  }, "NaN is not ever equal to NaN.");

  /**
   * Function pointers should be comparable
   */
  it("should compare function pointers", () => {
		expect<Listener>(
			eventDispatcher.events[0]
    ).toBe(listener);
    log(listener);
  });

  it("should handle negative case for comparing function pointers", () =>{
    expect<Listener>(
			eventDispatcher.events[1]
    ).not.toBe(listener);
  });

  /** Contrapositive of above */
  throws("should always throw if function pointers are not the same", () => {
    expect<Listener>(
			eventDispatcher.events[0]
    ).toBe(anotherListener);
  });

  /** Contrapositive of negative above */
  throws("should always throw if function pointers are the same", () => {
    expect<Listener>(
      eventDispatcher.events[0]
    ).not.toBe(listener);
  });
});

