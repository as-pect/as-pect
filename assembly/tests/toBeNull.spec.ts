import { Vec3 } from "./setup/Vec3";

var vec: Vec3 = new Vec3(1, 2, 3);

describe("toBeNull", (): void => {
  it("should assert null values are null", (): void => {
    expect<Vec3>(null).toBeNull("null values should be null");
  });

  it("should assert non-null values are not null ", (): void => {
    expect<Vec3>(vec).not.toBeNull("an actual value should not be null");
  });

  it("should assert numbers are not null", (): void => {
    expect<i32>(0).not.toBeNull("zero should not be null");
  });

  it("should throw if ref is not null", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(vec).toBeNull();
    }).toThrow("toBeNull does not throw when value is not null");
  });

  it("should throw if negated ref is null", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(null).not.toBeNull();
    }).toThrow("toBeNull throws when value is null");
  });
});
