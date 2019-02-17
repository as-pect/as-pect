describe("toBeCloseTo", (): void => {
  it("should be close to float values", (): void => {
    expect<f64>(1.0).toBeCloseTo(1.000001, 2, "1.000001 is close to 1.0");
  });

  it("should not be close to another float value", (): void => {
    expect<f64>(1.0).not.toBeCloseTo(39.0, 2, "39 and 1 are not close.");
  });

  it("should throw if the value is close, but the assertion is negatated", (): void => {
    expectFn((): void => {
      expect<f64>(1.0).not.toBeCloseTo(1.00000001);
    }).toThrow("close negated assertions on values should throw");
  });

  it("should throw if the value is not close, but the assertion is negated", (): void => {
    expectFn((): void => {
      expect<f64>(1.0).toBeCloseTo(20);
    }).toThrow("not close assertions on values should throw");
  });

  it("should throw if actual value is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(Infinity).toBeCloseTo(0);
    }).toThrow("value is not finite, it should throw");
  });

  it("should throw if actual value is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(-Infinity).toBeCloseTo(0);
    }).toThrow("value is not finite, it should throw");
  });

  it("should throw if actual value is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).toBeCloseTo(0);
    }).toThrow("value is not finite, it should throw");
  });

  it("should throw if expected value is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(0).toBeCloseTo(Infinity);
    }).toThrow("value is not finite, it should throw");
  });

  it("should throw if expected value is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(0).toBeCloseTo(-Infinity);
    }).toThrow("value is not finite, it should throw");
  });

  it("should throw if expected value is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(0).toBeCloseTo(NaN);
    }).toThrow("value is not finite, it should throw");
  });

  todo("test throw if generic type is not a float value");
  /**
   * The following test fails because instanceof checked do not work for number types.
   */
  // it("should throw if value type is not a float", (): void => {
  //   expectFn((): void => {
  //     expect<i32>(0).toBeCloseTo(0);
  //   }).toThrow("integer values should throw on toBeCloseTo assertions");
  // });
});
