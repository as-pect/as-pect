import { Vec3 } from "./setup/Vec3";
import { debug } from "../internal/Test";
// @ts-ignore: we are going to use internal store to set arraybuffer contents

@inline
function STORE<T>(ptr: ArrayBuffer, index: usize, value: T, byteOffset: usize = 0): void {
   store<T>(changetype<usize>(ptr) + (index << alignof<T>()) + byteOffset, value);
}

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

/**
 * This test suite is responsible for verifing that all the memcmp operations used by toStrictEqual
 * function properly.
 */
describe("toStrictEqual", (): void => {

  /**
   * toStrictEqual should delegate to the toBe function if the type being compared is a value type.
   */
  it("should correctly assert toStrictEqual assertions for value types", (): void => {
    expect<i32>(3).toStrictEqual(3);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw when value assertions are equal", (): void => {
    expect<i32>(3).not.toStrictEqual(3);
  }, "not.toStrictEqual on value types that are equal should throw.");

  /**
   * toStrictEqual should verify if a value type is not equal.
   */
  it("should assert that value assertions are not equal", (): void => {
    expect<i32>(3).not.toStrictEqual(1);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw when value assertions are not equal", (): void => {
    expect<i32>(3).toStrictEqual(1);
  }, "toStrictEqual on value types that are not equal should throw.");

  /**
   * toStrictEqual should validate if the references have exactly the same values.
   */
  it("should correctly assert toStrictEqual assertions for reftypes", (): void => {
    expect<Vec3>(vec1)
      .toStrictEqual(vec3, "toStrictEqual assertions on ref types do not compare same values correctly.");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should correctly throw on toStrictEqual assertions for reftypes", (): void => {
    expect<Vec3>(vec1).not.toStrictEqual(vec3);
  }, "toStrictEqual assertions on ref types do not compare same values correctly.");

  /**
   * It should validate if the references do not have exactly the same values.
   */
  it("should correctly assert not.toStrictEqual assertions for reftypes", (): void => {
    expect<Vec3>(vec1).not.toStrictEqual(vec2);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should correctly throw on toStrictEqual assertions for reftypes", (): void => {
    expect<Vec3>(vec1).toStrictEqual(vec2);
  }, "toStrictEqual assertions on ref types do not compare different values correctly.");

  /**
   * Null values should always strictly equal null values.
   */
  it("should correctly assert toStrictEqual for reftypes that are null", (): void => {
    expect<Vec3>(null).toStrictEqual(null);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw when nulls are not expected to strict equal null values", (): void => {
    expect<Vec3>(null).not.toStrictEqual(null);
  });

  /**
   * toStrictEqual should assert that a reference is NOT strictly equal to a null reference.
   */
  it("should validate that references do not stritctly equal null", (): void => {
    expect<Vec3>(vec1).not.toStrictEqual(null);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw if a reference is expected to strictly equal null", (): void => {
    expect<Vec3>(vec1).toStrictEqual(null);
  }, "toStrictEqual should throw when actual is not null and expected is null.");


  /**
   * toStrictEqual should assert that a null reference is NOT strictly equal to a reference.
   */
  it("should validate that references do not stritctly equal null", (): void => {
    expect<Vec3>(null).not.toStrictEqual(vec1);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw if a reference is expected to strictly equal null", (): void => {
    expect<Vec3>(null).toStrictEqual(vec1);
  }, "toStrictEqual should throw when actual is null and expected is not null.");

  /**
   * ArrayBuffers are a special case, because their memory offset extends beyond
   * the offestof<Arraybuffer>() compile time constant.
   */
  it("should assert arraybuffers are equal", (): void => {
    expect<ArrayBuffer>(buff1).toStrictEqual(buff2);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw when equal ArrayBuffers are expected not to strictly equal each other", (): void => {
    expect<ArrayBuffer>(buff1).not.toStrictEqual(buff2);
  }, "StrictEqual array buffers should throw when they are not expected to strictly equal each other.");

  /**
   * ArrayBuffers are a special case, because their memory offset extends beyond
   * the offestof<Arraybuffer>() compile time constant.
   */
  it("should assert arraybuffers are not equal", (): void => {
    expect<ArrayBuffer>(buff1).not.toStrictEqual(buff3, "buff1 and buff 3 are not strictly equal");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("should throw when different ArrayBuffers are expected to strictly equal each other", (): void => {
    expect<ArrayBuffer>(buff1).toStrictEqual(buff3);
  }, "Non-strictEqual array buffers should throw when they are expected to strictly equal each other.");

  /**
   * Arrays that equal each other exactly should pass.
   */
  it("should assert two array values are strictly equal when they point to the same place", () => {
    let a: i32[] = [1, 2, 3];
    expect<i32[]>(a).toStrictEqual(a, "a should match a");
  });

  /**
   * Array references that are exactly the same should throw when the expectation is negated.
   */
  throws("when actual and expected are the same reference but the expectation is negated", () => {
    let a: i32[] = [1, 2, 3];
    expect<i32[]>(a).not.toStrictEqual(a);
  }, "a is equal to a, and the expectation should throw");

  /**
   * Array references that strictly equal each other should not throw.
   */
  it("should assert that array values strictly equal each other when they match", () => {
    let a: i32[] = [1, 2, 3];
    expect<i32[]>(a).toStrictEqual([1, 2, 3], "[1, 2, 3] should match a");
  });

  /**
   * Array references that strictly equal each other should throw when the expectation is negated.
   */
  throws("when two array references equal each other but the expectation is negated", () => {
    let a: i32[] = [1, 2, 3];
    expect<i32[]>(a).not.toStrictEqual([1, 2, 3], "[1, 2, 3] should match a");
  });

  /**
   * Array references that don't equal each other should not fail when negated.
   */
  it("should assert that arrays that don't strictly equal each other", () => {
    let a: i32[] = [1, 2, 3];
    expect<i32[]>(a).not.toStrictEqual([4, 5, 6]);
  });

  /**
   * Array references that don't strictly equal each other should fail the expectation.
   */
  throws("when two array references don't strictly equal each other", () => {
    let a: i32[] = [1, 2, 3];
    expect<i32[]>(a).toStrictEqual([4, 5, 6]);
  });

  /**
   * This is a complicated edge case that should be handled by the `toStrictEqual()` function.
   * When a value type is passed to `toStrictEqual()`, conditional compilation should bypass
   * any other branch and break into the equivalent of a `toBe()` expectation. If this is not the
   * case, branches that do runtime checks will be compiled and result in a compiler error.
   */
  it("compiles when <u8> is used as the expectation type for toStrictEqual", () => {
    expect<u8>(42).toBe(42, "This totally compiles.");
  });

  /**
   * This test validates that a reference Vec3[] (which has an @operator("==") overload) gets used
   * in a single array comparison.
   */
  it("should validate that two arrays of similar references are strictly equal", () => {
    expect<Vec3[]>(
      [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
    ).toStrictEqual(
      [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
      "The two arrays are expected to strictly equal each other",
    );
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("when two arrays of similar references are strictly equal and the assertion is negated", () => {
    expect<Vec3[]>(
      [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
    ).not.toStrictEqual(
      [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
    );
  }, "The two arrays are expected to strictly equal each other");

  /**
   * This test validates that a reference Vec3[] (which has an @operator("==") overload) gets used
   * in a single array comparison.
   */
  it("should validate that two arrays of disimilar references are not strictly equal", () => {
    expect<Vec3[]>(
      [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
    ).not.toStrictEqual(
      [new Vec3(9, 8, 7), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
      "The two arrays are expected not to strictly equal each other",
    );
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("when two arrays of disimilar references are not strictly equal", () => {
    expect<Vec3[]>(
      [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
    ).toStrictEqual(
      [new Vec3(9, 8, 7), new Vec3(4, 5, 6), new Vec3(7, 8, 9)],
    );
  }, "The two arrays are expected not to strictly equal each other");
});
