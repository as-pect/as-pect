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
  throws("should throw if NaN is not NaN", (): void => {
    expect<f64>(NaN).not.toBeNaN();
  }, "NaN must be NaN");

  /**
   * This test verifies that normal float values are not NaN values.
   */
  it("should expect normal float values not to be NaN", (): void => {
    expect<f64>(10.0).not.toBeNaN("10.0 is not NaN");
  });

  /**
   * This test verifies that normal values are not NaN values, and also throw.
   */
  throws("should throw if a normal float value is expected to be NaN", (): void => {
    expect<f64>(10.0).toBeNaN();
  }, "Normal float values are not NaN values.");
});
