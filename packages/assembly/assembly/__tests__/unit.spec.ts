/**
 * This test describes the types that are output from the expect function.
 */
describe("unit types", () => {
  /**
   * This test has a problem with using the `instanceof` keyword with an ambient type that has
   * a generic <T> value. It is, however, valid AssemblyScript. It verifies that the output
   *  of the `expect<T>()` function matches the expected output.
   *
   * This is a primary unit test of the `as-pect` testing suite.
   */
  it("should create instanceof Expectation<T>", () => {
    var result = expect(1);

    assert(result, "The result is not a reference");
    // @ts-ignore: instanceof checks must include type generics if they are in the definition
    assert(
      result instanceof Expectation,
      "The result is not instanceof Expectation."
    );
  });

  /**
   * This test validates that the actual value is set when using the `expect()` function.
   */
  it("should create an expectation with a value", () => {
    var result = expect(1);
    assert(
      result.actual == 1,
      "The expect function does not report values correctly."
    );
  });

  /**
   * This test actually tests the implementation, but it validates that an expectation is negated.
   * In order to access a private value on the reference, we must use `offsetof<T>("_not")`
   */
  it("should negate the _not property", () => {
    var result = expect(1).not;
    var notValue = load<bool>(
      changetype<usize>(result),
      offsetof<Expectation<i32>>("_not")
    );
    assert(notValue, "The expect function was not negated.");
  });
});
