import { Vec3 } from "./setup/Vec3";

/**
 * This test suite verifies toBeNaN assertions. It is used only with float values, and
 * should throw an error otherwise.
 */
describe("toBeNaN", (): void => {
  /**
   * The idiomatic NaN test.
   */
  it("should assert a NaN value is NaN", (): void => {
    expect<f64>(NaN).toBeNaN("NaN is NaN");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if NaN is not NaN", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).not.toBeNaN();
    }).toThrow("NaN must be NaN");
  });

  /**
   * This test verifies that normal float values are not NaN values.
   */
  it("should expect normal float values not to be NaN", (): void => {
    expect<f64>(10.0).not.toBeNaN("10.0 is not NaN");
  });

  /**
   * This test verifies that normal values are not NaN values, and also throw.
   */
  it("should throw if a normal float value is expected to be NaN", (): void => {
    expectFn((): void => {
      expect<f64>(10.0).toBeNaN();
    }).toThrow("Normal float values are not NaN values.");
  });

  /**
   * This test verifies that using integer types throw when using toBeNaN().
   */
  it("should throw when using toBeNaN on an integer type", (): void => {
    expectFn((): void => {
      expect<i32>(10).toBeNaN();
    }).toThrow("Normal integer values always throw.");
  });

  /**
   * This test verifies that using integer types throw when using toBeNaN(), even if the
   * assertion is negated.
   */
  it("should throw when using toBeNaN on an integer type, even if the assertion is negated", (): void => {
    expectFn((): void => {
      expect<i32>(10).not.toBeNaN();
    }).toThrow("Normal integer values should always throw with toBeNaN.");
  });

  /**
   * This test verifies that using reference types with toBeNaN throws.
   */
  it("should throw if a reference type is used with toBeNaN", (): void => {
    expectFn((): void => {
      expect<Vec3>(null).toBeNaN();
    }).toThrow("Reference types should throw when used with toBeNaN.");
  });

  /**
   * This test verifies that using reference types with toBeNaN throws.
   */
  it("should throw if a reference type is used with toBeNaN, even if the assertion is negated", (): void => {
    expectFn((): void => {
      expect<Vec3>(null).not.toBeNaN();
    }).toThrow("Reference types should throw when used with toBeNaN, even if the assertion is negated.");
  });
});
