const newListener = <u32>1;
// prettier-ignore
@external("linked", "getValue")
declare function getValue(): i32;

/**
 * This test verifies that customImports are handled by the `asp` command. Please see the
 * `customImports.spec.imports.js` file to see the `linked.getValue()` function.
 */
describe("linked functions", () => {
  it("should be linked", () => {
    let result = getValue();
    expect(result).toBe(42);
    log(result);
  });
});
