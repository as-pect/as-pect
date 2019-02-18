describe("greater than", (): void => {
  it("should detect greater than values", (): void => {
    expect<i32>(1).toBeGreaterThanOrEqualTo(0, "1 should be greater than 0");
  });

  it("should detect negated greater than values", (): void => {
    expect<i32>(1).not.toBeGreaterThanOrEqualTo(2, "1 should not be greater than 0");
  });

  it("should be greater than or equal to values when they are equal", (): void => {
    expect<i32>(1).toBeGreaterThanOrEqualTo(1, "1 should be greaterThatOrEqualTo 1");
  });

  it("should throw when the value is not expected to be greater than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).not.toBeGreaterThanOrEqualTo(0);
    }).toThrow("negated greater than values should throw");
  });

  it("should throw when the value is expected to be greater than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBeGreaterThanOrEqualTo(2);
    }).toThrow("negated greater than values should throw");
  });

  it("should not throw when the value is expected to be greater than the same value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBeGreaterThanOrEqualTo(1);
    }).not.toThrow("negated greater than values should throw");
  });

  it("should throw if actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f32>(NaN).toBeGreaterThanOrEqualTo(1);
    }).toThrow("NaN values cannot be compared and should throw");
  });

  it("should throw if expected value is NaN", (): void => {
    expectFn((): void => {
      expect<f32>(1).toBeGreaterThanOrEqualTo(NaN);
    }).toThrow("NaN values cannot be compared and should throw");
  });
});
