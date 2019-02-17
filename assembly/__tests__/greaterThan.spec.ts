describe("greater than", (): void => {
  it("should detect greater than values", (): void => {
    expect<i32>(1).toBeGreaterThan(0, "1 should be greater than 0");
  });

  it("should detect negated greater than values", (): void => {
    expect<i32>(1).not.toBeGreaterThan(2, "1 should not be greater than 0");
  });

  it("should throw when the value is not expected to be greater than the actual value", (): void => {
    expectFn((): void => {
      expect<i32>(1).not.toBeGreaterThan(0, "1 should be greater than 0");
    }).toThrow("negated greater than values should throw");
  });

  it("should throw when the value is expected to be greater than the actual value", (): void => {
    expectFn((): void => {
      expect<i32>(1).toBeGreaterThan(2, "1 should not be greater than 0");
    }).toThrow("negated greater than values should throw");
  });

  it("should throw if actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f32>(NaN).toBeGreaterThan(1);
    }).toThrow("NaN values cannot be compared and should throw");
  });

  it("should throw if expected value is NaN", (): void => {
    expectFn((): void => {
      expect<f32>(1).toBeGreaterThan(NaN);
    }).toThrow("NaN values cannot be compared and should throw");
  });
});
