describe("less than", (): void => {
  it("should detect less than values", (): void => {
    expect<i32>(1).toBeLessThan(2, "1 should be less than 2");
  });

  it("should detect negated greater than values", (): void => {
    expect<i32>(1).not.toBeLessThan(0, "1 should not be less than 0");
  });

  it("should throw when the value is not expected to be less than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).not.toBeLessThan(2);
    }).toThrow("negated less than values should throw");
  });

  it("should throw when the value is expected to be less than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBeLessThan(0);
    }).toThrow("negated less than values should throw");
  });
});
