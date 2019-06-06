/**
 * The only valid test we can perform in AssemblyScript to verify `RTrace` works is to assert that
 * the `count()` function returns a positive number.
 */
describe("RTrace", () => {
  it("should return a positive number", () => {
    expect<i32>(RTrace.count()).toBeGreaterThan(0, "RTrace counts should be greater than 0");
  });
});
