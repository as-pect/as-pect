describe("less than or equal to", (): void => {
  it("should detect less than values", (): void => {
    expect<i32>(1).toBeLessThanOrEqualTo(2, "1 should be less than 2");
  });

  it("should detect equal values", (): void => {
    expect<i32>(1).toBeLessThanOrEqualTo(1, "1 should be less than or equal to 1");
  });

  it("should detect negated greater than values", (): void => {
    expect<i32>(1).not.toBeLessThanOrEqualTo(0, "1 should not be less than 0");
  });

  it("should throw when the value is not expected to be less than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).not.toBeLessThanOrEqualTo(2);
    }).toThrow("negated less than values should throw");
  });

  it("should throw when the value is expected to be less than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBeLessThanOrEqualTo(0);
    }).toThrow("negated less than values should throw");
  });

  it("should not throw when the value is expected to be equal than the actual value", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBeLessThanOrEqualTo(1);
    }).not.toThrow("equal values should not throw");
  });

  it("should throw if actual value is NaN", (): void => {
    expectFn((): void => {
      expect<f32>(NaN).toBeLessThanOrEqualTo(1);
    }).toThrow("NaN values cannot be compared and should throw");
  });

  it("should throw if expected value is NaN", (): void => {
    expectFn((): void => {
      expect<f32>(1).toBeLessThanOrEqualTo(NaN);
    }).toThrow("NaN values cannot be compared and should throw");
  });
});
