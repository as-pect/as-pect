// @ts-ignore
@external("linked", "getValue")
declare function getValue(): i32;

describe("linked functions", (): void => {
  it("should be linked", (): void => {
    let result = getValue();
    expect<i32>(result).toBe(42);
    log<i32>(result);
  });
});
