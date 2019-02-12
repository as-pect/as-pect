
describe("ASpect", (): void => {
  

  it("should detect greater than or equal to values", (): void => {
    expect<i32>(1).toBeGreaterThanOrEqualTo(1);
    expect<i32>(1).toBeGreaterThanOrEqualTo(0);
  });

  it("should detect greater than or equal to values", (): void => {
    expect<i32>(1).not.toBeGreaterThanOrEqualTo(2);
  });

  it("should detect less than values", (): void => {
    expect<i32>(0).toBeLessThan(1);
  });

  it("should detect negated less than values", (): void => {
    expect<i32>(2).not.toBeLessThan(1);
  });

  it("should detect less than or equal to values", (): void => {
    expect<i32>(1).toBeLessThanOrEqualTo(1);
    expect<i32>(1).toBeLessThanOrEqualTo(2);
  });

  it("should detect negated less than or equal values", (): void => {
    expect<i32>(1).not.toBeLessThanOrEqualTo(0);
  });

  it("should detect reftype nulls", (): void => {
    expect<Vec3>(null).toBeNull();
  });

  it("should not detect value type nulls", (): void => {
    expect<i32>(0).not.toBeNull();
  });

  it("should expect a reftype not to be null", (): void => {
    expect<Vec3>(new Vec3(1, 2, 3)).not.toBeNull();
  });

  it("should report a failure message (this is expected to fail)", (): void => {
    expect<bool>(false).toBeTruthy("This is an expected error message!");
  });
});
