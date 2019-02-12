
describe("types", (): void => {
  it("should create instanceof Expectation<T>", (): void => {
    var result: Expectation<i32> = expect<i32>(1);
    // @ts-ignore: instanceof checks must include type generics if they are in the definition
    assert(result instanceof Expectation<i32>, "The result is not instanceof Expectation.");
  });

  it("should create an expectation with a value", (): void => {
    var result = expect<i32>(1);
    assert(result.value == 1, "The expect function does not report values correctly.");
  });

  it("should negate the _not property", (): void => {
    var result = expect<i32>(1).not;
    assert(result._not, "The expect function was not negated.");
  });
});
