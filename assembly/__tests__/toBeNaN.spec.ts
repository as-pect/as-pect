import { Vec3 } from "./setup/Vec3";

describe("toBeNaN", (): void => {
  it("should assert NaNs are NaNs", (): void => {
    expect<f64>(NaN).toBeNaN("NaN is NaN");
  });

  it("should assert values are not NaN", (): void => {
    expect<f64>(1).not.toBeNaN("1 is not NaN");
  });

  it("should throw when reference types are used in this assertion", (): void => {
    expectFn((): void => {
      expect<Vec3>(new Vec3(1, 2, 3)).toBeNaN();
    }).toThrow("reference types should throw on toBeNaN expectations");
  });

  it("should throw on negated assertions that fail", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).not.toBeNaN();
    }).toThrow("NaN is NaN");
  });

  it("should throw on assertions that fail", (): void => {
    expectFn((): void => {
      expect<f64>(1).toBeNaN();
    }).toThrow("1 is not NaN");
  });
});
