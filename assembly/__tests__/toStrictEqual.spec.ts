import { Vec3 } from "./setup/Vec3";

var vec1: Vec3 = new Vec3(1, 2, 3);
var vec2: Vec3 = new Vec3(4, 5, 6);
var vec3: Vec3 = new Vec3(1, 2, 3);

describe("toStrictEqual", (): void => {

  it("should correctly assert toStrictEqual assertions for value types", (): void => {
    expect<i32>(3).toStrictEqual(3);
  });

  it("should correctly throw for toStrictEqual assertions for value types", (): void => {
    expect<() => void>((): void => {
      expect<i32>(3).toStrictEqual(1);
    }).toThrow("toStrictEqual on value types does not throw.");
  });

  it("should correctly assert toStrictEqual assertions for reftypes", (): void => {
    expect<Vec3>(vec1)
      .toStrictEqual(vec3, "toStrictEqual assertions on ref types do not compare same values correctly.");
  });

  it("should correctly throw on toStrictEqual assertions for reftypes", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(vec1).toStrictEqual(vec2);
    }).toThrow("toStrictEqual assertions on ref types do not compare different values correctly.");
  });

  it("should correctly assert toStrictEqual for reftypes that are null", (): void => {
    expect<Vec3>(null).toStrictEqual(null);
  });

  it("should correctly throw on toStrictEqual assertions for reftypes for nulls", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(vec1).toStrictEqual(null);
    }).toThrow("toStrictEqual assertions on ref types do not compare different values correctly.");
  })

  it("should correctly assert negated toStrictEqual assertions for value types", (): void => {
    expect<i32>(3).not.toStrictEqual(4);
  });

  it("should correctly throw on negated toStrictEqual assertions for value types", (): void => {
    expect<() => void>((): void => {
      expect<i32>(0).not.toStrictEqual(0);
    }).toThrow("toStrictEqual assertions on ref types do not compare different values correctly.");
  });

  it("should correctly assert negated toStrictEqual assertions for null comparisons", (): void => {
    expect<Vec3>(null).not.toStrictEqual(new Vec3(1, 2, 3));
  });

  it("should correctly throw on negated toStrictEqual assertions for reftypes", (): void => {
    expect<() => void>((): void => {
      expect<Vec3>(vec1).not.toStrictEqual(vec3);
    }).toThrow("toStrictEqual assertions on ref types do not compare different values correctly.");
  });

  it("should correctly assert negated toStrictEqual assertions for unequal reftypes", (): void => {
    expect<Vec3>(vec1).not.toStrictEqual(vec2);
  });
});
