/**
 * This test suite verifies toBeNaN assertions. It is used only with float values, and
 * should throw an error otherwise.
 */
describe("toBeNaN", () => {
  /**
   * The idiomatic NaN test.
   */
  it("should assert a NaN value is NaN", () => {
    expect(NaN).toBeNaN("NaN is NaN");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws("should throw if NaN is not NaN", () => {
    expect(NaN).not.toBeNaN();
  }, "NaN must be NaN");

  /**
   * This test verifies that normal float values are not NaN values.
   */
  it("should expect normal float values not to be NaN", () => {
    expect(10.0).not.toBeNaN("10.0 is not NaN");
  });

  /**
   * This test verifies that normal values are not NaN values, and also throw.
   */
  throws("should throw if a normal float value is expected to be NaN", () => {
    expect(10.0).toBeNaN();
  }, "Normal float values are not NaN values.");
});
