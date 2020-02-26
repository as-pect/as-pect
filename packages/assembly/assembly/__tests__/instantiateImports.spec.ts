// @ts-ignore: decorator
@external("api", "identity")
declare function identity(input: i32): i32;

describe("a module with overridden imports", () => {
  test("the thing", () => {
    expect(identity(42)).toBe(
      42,
      "The instantiated function import should return 42.",
    );
  });
});
