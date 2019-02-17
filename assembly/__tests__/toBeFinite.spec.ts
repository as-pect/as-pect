describe("toBeFinite", (): void => {
  it("should expect float values to be finite", (): void => {
    expect<f32>(10.0).toBeFinite("Float values are finite");
  });

  it("should expect Infinity to be infinite", (): void => {
    expect<f32>(Infinity).not.toBeFinite("Infinity is infinite.");
  });

  it("should expect -Infinity to be infinite", (): void => {
    expect<f32>(-Infinity).not.toBeFinite("Infinity is infinite.");
  });

  it("should throw when infinity is not finite", (): void => {
    expectFn((): void => {
      expect<f64>(Infinity).toBeFinite();
    }).toThrow("Infinity is not finite");
  });

  it("should throw when a float is finite", (): void => {
    expectFn((): void => {
      expect<f64>(1).not.toBeFinite();
    }).toThrow("1 is not infinite");
  });
});
