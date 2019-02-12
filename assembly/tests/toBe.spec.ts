import { Vec3 } from "./setup/Vec3";
var vec1: Vec3 = new Vec3(1, 2, 3);
var vec2: Vec3 = new Vec3(4, 5, 6);

describe("toBe", (): void => {
  it("should correctly assert toBe assertions for value types", (): void => {
    expect<i32>(1).toBe(1);
  });

  it("should throw if toBe assertion fails for value types", (): void => {
    expect<() => void>((): void => {
      expect<i32>(1).toBe(2);
    }).toThrow();
  });

  it("should correctly assert toBe assertions for reftypes", (): void => {
    expect<Vec3>(vec1).toBe(vec1);
  });

  it("should correctly assert null equality", (): void => {
    expect<Vec3>(null).toBe(null);
  });

  it("should correctly assert negated toBe assertions for value types", (): void => {
    expect<i32>(1).not.toBe(2);
  });

  it("should correctly assert negative toBe assertions for reftypes", (): void => {
    var vec: Vec3 = new Vec3(1, 2, 3);
    expect<Vec3>(vec).not.toBe(new Vec3(1, 2, 3));
  });
});
