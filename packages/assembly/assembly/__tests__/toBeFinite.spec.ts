import { Vec3 } from "./setup/Vec3";

/**
 * This test suite verifies toBeFinite assertions. It is used only with float values, and
 * should throw an error otherwise.
 */
describe("toBeFinite", () => {
  /**
   * Normal float values should be finite.
   */
  it("should expect normal float values to be finite", () => {
    expect<f64>(10.0).toBeFinite("10.0 is finite");
  });

  /**
   * This is the contrapositive version of the previous test.
   */
  throws("should throw if a normal float value is not finite", () => {
    expect<f64>(10.0).not.toBeFinite();
  }, "Normal float values should be finite.");

  /**
   * Infinity is never finite.
   */
  it("should expect infinity not to be finite", () => {
    expect<f64>(Infinity).not.toBeFinite("Infinity is not finite by definition");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if an actual infinity is expected to be finite", () => {
    expect<f64>(Infinity).toBeFinite();
  }, "Infinity is never finite.");

  /**
   * NaN is never finite.
   */
  it("should expect NaN not to be finite", () => {
    expect<f64>(NaN).not.toBeFinite("Infinity is not finite by definition");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if an actual NaN is expected to be finite", () => {
    expect<f64>(NaN).toBeFinite();
  }, "NaN is never finite.");
});
