import { Vec3 } from "./setup/Vec3";
import { listener, anotherListener, initializeDispatcher } from "./setup/Event";

var eventDispatcher = initializeDispatcher();

var vec1 = new Vec3(1, 2, 3);
var vec2 = new Vec3(4, 5, 6);
var vec3 = new Vec3(1, 2, 3);

const buffsize = 3 << alignof<f64>();

var buff1 = new ArrayBuffer(<i32>buffsize);
store<f64>(changetype<usize>(buff1), 1.0);
store<f64>(changetype<usize>(buff1), 2.0, 8);
store<f64>(changetype<usize>(buff1), 3.0, 16);

var buff2 = new ArrayBuffer(<i32>buffsize);
store<f64>(changetype<usize>(buff2), 1.0);
store<f64>(changetype<usize>(buff2), 2.0, 8);
store<f64>(changetype<usize>(buff2), 3.0, 16);

var buff3 = new ArrayBuffer(<i32>buffsize);
store<f64>(changetype<usize>(buff3), 4.0);
store<f64>(changetype<usize>(buff3), 5.0, 8);
store<f64>(changetype<usize>(buff3), 6.0, 16);

/**
 * This test suite is responsible for verifing that all the memcmp operations used by toStrictEqual
 * function properly.
 */
describe("toStrictEqual", () => {

  /**
   * toStrictEqual should delegate to the toBe function if the type being compared is a value type.
   */
  it("should correctly assert toStrictEqual assertions for value types", () => {
    expect(3).toStrictEqual(3);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because value assertions are equal", () => {
    expect(3).not.toStrictEqual(3);
  }, "not.toStrictEqual on value types that are equal should throw.");

  /**
   * toStrictEqual should verify if a value type is not equal.
   */
  it("should assert that value assertions are not equal", () => {
    expect(3).not.toStrictEqual(1);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because value assertions are not equal", () => {
    expect(3).toStrictEqual(1);
  }, "toStrictEqual on value types that are not equal should throw.");

  /**
   * toStrictEqual should validate if the references have exactly the same values.
   */
  it("should correctly assert toStrictEqual assertions for reftypes", () => {
    expect(vec1)
      .toStrictEqual(vec3, "toStrictEqual assertions on ref types do not compare same values correctly.");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because references are not equal", () => {
    expect(vec1).not.toStrictEqual(vec3);
  }, "toStrictEqual assertions on ref types do not equal each other.");

  /**
   * It should validate if the references do not have exactly the same values.
   */
  it("should correctly assert not.toStrictEqual assertions for reftypes", () => {
    expect(vec1).not.toStrictEqual(vec2);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because the references do not equal each other", () => {
    expect(vec1).toStrictEqual(vec2);
  }, "toStrictEqual assertions on ref types do not compare different values correctly.");

  /**
   * Null values should always strictly equal null values.
   */
  it("should correctly assert toStrictEqual for reftypes that are null", () => {
    expect<Vec3 | null>(null).toStrictEqual(null);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because null equals null", () => {
    expect<Vec3 | null>(null).not.toStrictEqual(null);
  }, "null equals null.");

  /**
   * toStrictEqual should assert that a reference is NOT strictly equal to a null reference.
   */
  it("should validate that references do not stritctly equal null", () => {
    expect<Vec3 | null>(vec1).not.toStrictEqual(null);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because a reference does not strictly equal a null reference", () => {
    expect<Vec3 | null>(vec1).toStrictEqual(null);
  }, "toStrictEqual should throw when actual is not null and expected is null.");


  /**
   * toStrictEqual should assert that a null reference is NOT strictly equal to a reference.
   */
  it("should validate that references do not stritctly equal null", () => {
    expect<Vec3 | null>(null).not.toStrictEqual(vec1);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("because a null is expected to strict equal a reference", () => {
    expect<Vec3 | null>(null).toStrictEqual(vec1);
  }, "toStrictEqual should throw when actual is null and expected is not null.");

  /**
   * ArrayBuffers are a special case, because their memory offset extends beyond
   * the offestof<Arraybuffer>() compile time constant.
   */
  it("should assert arraybuffers are equal", () => {
    expect(buff1).toStrictEqual(buff2);
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("when equal ArrayBuffers are expected not to strictly equal each other", () => {
    expect(buff1).not.toStrictEqual(buff2);
  }, "StrictEqual array buffers should throw when they are not expected to strictly equal each other.");

  /**
   * ArrayBuffers are a special case, because their memory offset extends beyond
   * the offestof<Arraybuffer>() compile time constant.
   */
  it("should assert arraybuffers are not equal", () => {
    expect(buff1).not.toStrictEqual(buff3, "buff1 and buff 3 are not strictly equal");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("when different ArrayBuffers are expected to strictly equal each other", () => {
    expect(buff1).toStrictEqual(buff3);
  }, "Non-strictEqual array buffers should throw when they are expected to strictly equal each other.");

  /**
   * Arrays that equal each other exactly should pass.
   */
  it("should assert two array values are strictly equal when they point to the same place", () => {
    let a = [1, 2, 3];
    expect(a).toStrictEqual(a, "a should match a");
  });

  /**
   * Array references that are exactly the same should throw when the expectation is negated.
   */
  throws("when actual and expected are the same reference but the expectation is negated", () => {
    let a = [1, 2, 3];
    expect(a).not.toStrictEqual(a);
  }, "a is equal to a, and the expectation should throw");

  /**
   * Array references that strictly equal each other should not throw.
   */
  it("should assert that array values strictly equal each other when they match", () => {
    let a = [1, 2, 3];
    expect(a).toStrictEqual([1, 2, 3], "[1, 2, 3] should match a");
  });

  /**
   * Array references that strictly equal each other should throw when the expectation is negated.
   */
  throws("when two array references equal each other but the expectation is negated", () => {
    let a = [1, 2, 3];
    expect(a).not.toStrictEqual([1, 2, 3], "[1, 2, 3] should match a");
  });

  /**
   * Array references that don't equal each other should not fail when negated.
   */
  it("should assert that arrays that don't strictly equal each other", () => {
    let a = [1, 2, 3];
    expect(a).not.toStrictEqual([4, 5, 6]);
  });

  /**
   * Array references that don't strictly equal each other should fail the expectation.
   */
  throws("when two array references don't strictly equal each other", () => {
    let a = [1, 2, 3];
    expect<i32[]>(a).toStrictEqual([4, 5, 6]);
  });

  /**
   * This is a complicated edge case that should be handled by the `toStrictEqual()` function.
   * When a value type is passed to `toStrictEqual()`, conditional compilation should bypass
   * any other branch and break into the equivalent of a `toBe()` expectation. If this is not the
   * case, branches that do runtime checks will be compiled and result in a compiler error.
   */
  it("compiles when <u8> is used as the expectation type for toStrictEqual", () => {
    expect(<u8>42).toBe(42, "This totally compiles.");
  });

  /**
   * This test validates that a reference Vec3[] (which has an @operator("==") overload) gets used
   * in a single array comparison.
   */
  it("should validate that two arrays of similar references are strictly equal", () => {
    let a = [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    let b = [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    expect(a).toStrictEqual(b, "The two arrays are expected to strictly equal each other");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("when two arrays of similar references are strictly equal and the assertion is negated", () => {
    let a = [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    let b = [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    expect(a).not.toStrictEqual(b);
  }, "The two arrays are expected to strictly equal each other");

  /**
   * This test validates that a reference Vec3[] (which has an @operator("==") overload) gets used
   * in a single array comparison.
   */
  it("should validate that two arrays of disimilar references are not strictly equal", () => {
    let a = [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    let b = [new Vec3(9, 8, 7), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    expect(a).not.toStrictEqual(b, "The two arrays are expected not to strictly equal each other",
    );
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws("when two arrays of disimilar references are not strictly equal", () => {
    let a = [new Vec3(1, 2, 3), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    let b = [new Vec3(9, 8, 7), new Vec3(4, 5, 6), new Vec3(7, 8, 9)];
    expect(a).toStrictEqual(b);
  }, "The two arrays are expected not to strictly equal each other");

  it("should assert that two typed arrays strictly equal each other", () => {
    let one = new Float32Array(3);
    let two = new Float32Array(3);
    unchecked(one[0] = 1.1);
    unchecked(one[1] = 2.2);
    unchecked(one[2] = 3.3);
    unchecked(two[0] = 1.1);
    unchecked(two[1] = 2.2);
    unchecked(two[2] = 3.3);
    expect(one).toStrictEqual(two);
  });

  itThrows("when two arrays strictly equal each other", () => {
    let one = new Float32Array(3);
    let two = new Float32Array(3);
    unchecked(one[0] = 1.1);
    unchecked(one[1] = 2.2);
    unchecked(one[2] = 3.3);
    unchecked(two[0] = 1.1);
    unchecked(two[1] = 2.2);
    unchecked(two[2] = 3.3);
    expect(one).not.toStrictEqual(two);
  });

  /**
   * Strictly compare two functions
   */
  it("should strictly compare two function pointers", () => {
    expect(eventDispatcher.events[0]).toStrictEqual(listener);
  });

  it("should handle the negated function check", () => {
    expect(eventDispatcher.events[0]).not.toStrictEqual(anotherListener);
  });

  /**
   * Throws if two functions are not equal
   */
  throws("throws if pointers aren't equal", () => {
    expect(eventDispatcher.events[0]).toStrictEqual(anotherListener);
  });

  /**
   * Throws if two functions are not equal
   */
  throws("throws if pointers aren't equal", () => {
    expect(eventDispatcher.events[0]).not.toStrictEqual(listener);
  });
});


class A {
  a: f64 = 1.0;
  b: B = new B();
  c: f64 = 3.0;
}
class B {
  a: f64 = 1.0;
  b: f64 = 2.0;
  c: f64 = 3.0;
}

describe("nested structures", () => {
  test("strict equality with nested structures should work as expected", () => {
    let a = new A();
    let b = new A();
    expect(a).toStrictEqual(b, "nested structures should match in value");
  });
});