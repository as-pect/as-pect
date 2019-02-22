import { Vec3 } from "./setup/Vec3";
// @ts-ignore: we are going to use internal store to set arraybuffer contents
import { STORE } from "internal/arraybuffer";

var vec1: Vec3 = new Vec3(1, 2, 3);
var vec2: Vec3 = new Vec3(4, 5, 6);
var vec3: Vec3 = new Vec3(1, 2, 3);

let buffsize: i32 = 3 << alignof<f64>();

var buff1: ArrayBuffer = new ArrayBuffer(buffsize);
var buff2: ArrayBuffer = new ArrayBuffer(buffsize);
var buff3: ArrayBuffer = new ArrayBuffer(buffsize);

STORE<f64>(buff1, 0, 1.0);
STORE<f64>(buff2, 0, 1.0);
STORE<f64>(buff3, 0, 4.0);

STORE<f64>(buff1, 1, 2.0);
STORE<f64>(buff2, 1, 2.0);
STORE<f64>(buff3, 1, 5.0);

STORE<f64>(buff1, 2, 3.0);
STORE<f64>(buff2, 2, 3.0);
STORE<f64>(buff3, 2, 6.0);

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

  it("should assert arraybuffers are equal", (): void => {
    expect<ArrayBuffer>(buff1).toStrictEqual(buff2);
  });

  it("should throw on negated assertions", (): void => {
    expectFn((): void => {
      expect<ArrayBuffer>(buff1).not.toStrictEqual(buff2);
    }).toThrow("buffers are equal. negation of assertion fails.")
  });

  it("should assert arraybuffers are not equal", (): void => {
    expect<ArrayBuffer>(buff1).not.toStrictEqual(buff3);
  });

  it("should throw on negated assertions of different buffers", (): void => {
    expectFn((): void => {
      expect<ArrayBuffer>(buff1).toStrictEqual(buff3);
    }).toThrow("buffers are not equal. negation of assertion fails.")
  });
});
