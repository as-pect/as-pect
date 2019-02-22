import { Vec3 } from "./setup/Vec3";

/**
 * This test suite verifies toBeFinite assertions. It is used only with float values, and
 * should throw an error otherwise.
 */
describe("toBeFinite", (): void => {

  /**
   * Normal float values should be finite.
   */
  it("should expect normal float values to be finite", (): void => {
    expect<f64>(10.0).toBeFinite("10.0 is finite");
  });

  /**
   * This is the contrapositive version of the previous test.
   */
  throws("should throw if a normal float value is not finite", (): void => {
    expect<f64>(10.0).not.toBeFinite();
  }, "Normal float values should be finite.");

  /**
   * This assertion should not be used with integer values.
   */
  throws("should throw for integer values", (): void => {
    expect<i32>(0).toBeFinite();
  }, "Integer types should cause this assertion to throw.");

  /**
   * This assertion should not be used with integer values even if the assertion is negated.
   */
  throws("should throw for integer values even if it's negated", (): void => {
    expect<i32>(0).not.toBeFinite();
  }, "Integer types should cause this assertion to throw.");

  /**
   * Infinity is never finite.
   */
  it("should expect infinity not to be finite", (): void => {
    expect<f64>(Infinity).not.toBeFinite("Infinity is not finite by definition");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if an actual infinity is expected to be finite", (): void => {
    expect<f64>(Infinity).toBeFinite();
  }, "Infinity is never finite.");

  /**
   * NaN is never finite.
   */
  it("should expect NaN not to be finite", (): void => {
    expect<f64>(NaN).not.toBeFinite("Infinity is not finite by definition");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if an actual NaN is expected to be finite", (): void => {
    expect<f64>(NaN).toBeFinite();
  }, "NaN is never finite.");

  /**
   * This test asserts reference types always throw when used with toBeFinite.
   */
  throws("should throw if a reference type is used with toBeFinite", (): void => {
    expect<Vec3>(null).toBeFinite();
  }, "toBeFinite should throw when used with reference types.");

  /**
   * This test asserts reference types always throw when used with toBeFinite, even if the
   * assertion is negated.
   */
  throws("should throw if a reference type is used with toBeFinite on a negated assertion", (): void => {
    expect<Vec3>(null).not.toBeFinite();
  }, "toBeFinite should throw when used with reference types.");
});
