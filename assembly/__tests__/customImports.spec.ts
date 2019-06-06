// @ts-ignore
@external("linked", "getValue")
declare function getValue(): i32;

/**
 * This test verifies that customImports are handled by the `asp` command. Please see the
 * `customImports.spec.imports.js` file to see the `linked.getValue()` function.
 */
describe("linked functions", (): void => {
  it("should be linked", (): void => {
    let result = getValue();
    expect<i32>(result).toBe(42);
    log<i32>(result);
  });
});
