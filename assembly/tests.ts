
describe("ASpect", (): void => {

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
