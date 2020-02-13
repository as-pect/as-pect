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
  b: B | null = null;
  c: f64 = 3.0;
}
class B {
  a: f64 = 1.0;
  b: f64 = 2.0;
  c: f64 = 3.0;
}

class C {
  a: f64 = 1.0;
  b: D | null = null;
  c: f64 = 2.0;
}

class D {
  a: f64 = 2.0;
  b: C | null = null;
  c: f64 = 3.0;
}

class G<T> {
  constructor(public field: T) {}
}

describe("nested structures", () => {
  test("strict equality with nested structures should work as expected", () => {
    let a = new A();
    let b = new B();
    a.b = b;
    let c = new A();
    let d = new B();
    c.b = d;

    expect(a).toStrictEqual(c, "nested structures should match in value");
  });

  throws("when strict equality with nested structures is expected", () => {
    let a = new A();
    let b = new B();
    a.b = b;
    let c = new A();
    c.b = null; // implied, but shown here to be explicit

    expect(a).toStrictEqual(c);
  }, "the nested structures should not match in value");

  throws("when strict equality is not expected", () => {
    let a = new A();
    let b = new B();
    a.b = b;
    let c = new A();
    let d = new B();
    c.b = d;

    expect(a).not.toStrictEqual(c);
  }, "nested structures should match in value");

  test("when strict equality with nested structures is not expected", () => {
    let a = new A();
    let b = new B();
    a.b = b;
    let c = new A();
    c.b = null; // implied, but shown here to be explicit

    expect(a).not.toStrictEqual(c);
  });

  test("circular references don't break", () => {
    let a = new C();
    let b = new D();
    a.b = b;
    b.b = a;

    let c = new C();
    let d = new D();
    c.b = d;
    d.b = c;

    expect(a).toStrictEqual(c, "circular references should match without infinite recursion.");
    expect(b).toStrictEqual(d, "circular references should match without infinite recursion.");
  });

  throws("when a circular reference occurs but the structure does not match", () => {
    let a = new C();
    let b = new D();
    a.b = b;
    b.b = a;

    let c = new C();
    let d = new D();
    c.b = d;
    d.b = null;

    expect(a).toStrictEqual(c);
  }, "circular references should match without infinite recursion.");

  throws("when circular references occur but strict equality is not expected", () => {
    let a = new C();
    let b = new D();
    a.b = b;
    b.b = a;

    let c = new C();
    let d = new D();
    c.b = d;
    d.b = c;

    expect(a).not.toStrictEqual(c);
  }, "circular references should match without infinite recursion.");

  test("circular references that do not match", () => {
    let a = new C();
    let b = new D();
    a.b = b;
    b.b = a;

    let c = new C();
    let d = new D();
    c.b = d;
    d.b = null;

    expect(a).not.toStrictEqual(c, "circular references should that do not match should not match.");
  });

  test("equality of generics", () => {
    let a = new A();
    let b = new B();
    a.b = b;
    let c = new A();
    let d = new B();
    c.b = d;
    let g = new G<A>(a);
    let h = new G<A>(c);
    expect(g).toStrictEqual(h, "generics should match if same class types");
  });

  test("sets should compare references", () => {
    let setA = new Set<Vec3>();
    let setB = new Set<Vec3>();

    let a = new Vec3(1, 2, 3);
    let b = new Vec3(1, 2, 3);
    let c = new Vec3(4, 5, 6);
    let d = new Vec3(4, 5, 6);

    setA.add(a);
    setA.add(c);
    setB.add(b);
    setB.add(d);

    expect(setA).toStrictEqual(setB, "sets with similar values should be strictly equal");
  });

  test("sets of numbers", () => {
    let a = new Set<i32>();
    a.add(1);
    a.add(2);
    a.add(3);
    a.add(4);

    let b = new Set<i32>();
    b.add(1);
    b.add(2);
    b.add(3);
    b.add(4);

    expect(a).toStrictEqual(b, "two sets of numbers should be equal");
  });


  throws("when sets of numbers don't equal each other", () => {
    let a = new Set<i32>();
    a.add(1);
    a.add(2);
    a.add(3);
    a.add(4);

    let b = new Set<i32>();
    b.add(1);
    b.add(2);
    b.add(3);
    b.add(5);

    expect(a).toStrictEqual(b);
  }, "two sets of numbers that don't equal should throw");

  test("sets of references", () => {
    let a = new Set<Vec3>();
    a.add(new Vec3(1, 2, 3));
    a.add(new Vec3(4, 5, 6));
    a.add(new Vec3(7, 8, 9));

    let b = new Set<Vec3>();
    b.add(new Vec3(1, 2, 3));
    b.add(new Vec3(4, 5, 6));
    b.add(new Vec3(7, 8, 9));

    expect(a).toStrictEqual(b, "two sets of vec3 should be equal");
  });

  throws("when sets of references don't equal each other", () => {
    let a = new Set<Vec3>();
    a.add(new Vec3(1, 2, 3));
    a.add(new Vec3(4, 5, 6));
    a.add(new Vec3(7, 8, 9));

    let b = new Set<Vec3>();
    b.add(new Vec3(1, 2, 3));
    b.add(new Vec3(5, 5, 6));
    b.add(new Vec3(7, 8, 9));

    expect(a).toStrictEqual(b);
  }, "two sets of vec3 that don't equal each other should throw");

  throws("sets of references equal each other", () => {
    let a = new Set<Vec3>();
    a.add(new Vec3(1, 2, 3));
    a.add(new Vec3(4, 5, 6));
    a.add(new Vec3(7, 8, 9));

    let b = new Set<Vec3>();
    b.add(new Vec3(1, 2, 3));
    b.add(new Vec3(4, 5, 6));
    b.add(new Vec3(7, 8, 9));

    expect(a).not.toStrictEqual(b);
  }, "two sets of vec3 should be equal");

  test("sets of references that don't equal each other", () => {
    let a = new Set<Vec3>();
    a.add(new Vec3(1, 2, 3));
    a.add(new Vec3(4, 5, 6));
    a.add(new Vec3(7, 8, 9));

    let b = new Set<Vec3>();
    b.add(new Vec3(1, 2, 3));
    b.add(new Vec3(5, 5, 6));
    b.add(new Vec3(7, 8, 9));

    expect(a).not.toStrictEqual(b);
  });

  test("maps with key value pairs of numbers should strictly equal each other", () => {
    let a = new Map<i32, i32>();
    a.set(1, 4);
    a.set(2, 5);
    a.set(3, 6);

    let b = new Map<i32, i32>();
    b.set(1, 4);
    b.set(2, 5);
    b.set(3, 6);

    expect(a).toStrictEqual(b, "maps should strictly equal each other");
  });

  throws("when maps with key value pairs of numbers don't strictly equal each other", () => {
    let a = new Map<i32, i32>();
    a.set(1, 4);
    a.set(2, 5);
    a.set(3, 6);

    let b = new Map<i32, i32>();
    b.set(1, 4);
    b.set(2, 8);
    b.set(3, 6);

    expect(a).toStrictEqual(b);
  }, "maps with key value pairs of numbers that don't strictly equal each other should throw");

  test("maps with object keys should strictly equal each other", () => {
    let a = new Map<Vec3, i32>();
    a.set(new Vec3(1, 2, 3), 1);
    a.set(new Vec3(4, 5, 6), 2);
    a.set(new Vec3(7, 8, 9), 3);

    let b = new Map<Vec3, i32>();
    b.set(new Vec3(1, 2, 3), 1);
    b.set(new Vec3(4, 5, 6), 2);
    b.set(new Vec3(7, 8, 9), 3);

    expect(a).toStrictEqual(b, "Maps with object keys should equal each other");
  });

  throws("when maps that equal each other are expected to not strictly equal", () => {
    let a = new Map<Vec3, i32>();
    a.set(new Vec3(1, 2, 3), 1);
    a.set(new Vec3(4, 5, 6), 2);
    a.set(new Vec3(7, 8, 9), 3);

    let b = new Map<Vec3, i32>();
    b.set(new Vec3(1, 2, 3), 1);
    b.set(new Vec3(4, 5, 6), 2);
    b.set(new Vec3(7, 8, 9), 3);

    expect(a).not.toStrictEqual(b);
  }, "Maps with object keys should equal each other");

  throws("when maps with object keys that don't strictly equal each other", () => {
    let a = new Map<Vec3, i32>();
    a.set(new Vec3(1, 2, 3), 1);
    a.set(new Vec3(4, 5, 6), 2);
    a.set(new Vec3(7, 8, 9), 3);

    let b = new Map<Vec3, i32>();
    b.set(new Vec3(1, 2, 3), 1);
    b.set(new Vec3(5, 5, 6), 2);
    b.set(new Vec3(7, 8, 9), 3);

    expect(a).toStrictEqual(b);
  }, "Maps with object keys should equal each other");

  test("maps with object keys that don't strictly equal each other", () => {
    let a = new Map<Vec3, i32>();
    a.set(new Vec3(1, 2, 3), 1);
    a.set(new Vec3(4, 5, 6), 2);
    a.set(new Vec3(7, 8, 9), 3);

    let b = new Map<Vec3, i32>();
    b.set(new Vec3(1, 2, 3), 1);
    b.set(new Vec3(5, 5, 6), 2);
    b.set(new Vec3(7, 8, 9), 3);

    expect(a).not.toStrictEqual(b, "Maps with object keys shouldn't equal each other");
  });

  test("maps with string keys and object values equal each other", () => {
    let a = new Map<string, Vec3>();
    a.set("one", new Vec3(1, 2, 3));
    a.set("two", new Vec3(4, 5, 6));
    a.set("three", new Vec3(7, 8, 9));

    let b = new Map<string, Vec3>();
    b.set("one", new Vec3(1, 2, 3));
    b.set("two", new Vec3(4, 5, 6));
    b.set("three", new Vec3(7, 8, 9));

    expect(a).toStrictEqual(b, "maps with similar key value pairs should equal");
  });

  throws("when maps with string keys don't match and object values equal each other", () => {
    let a = new Map<string, Vec3>();
    a.set("one", new Vec3(1, 2, 3));
    a.set("two", new Vec3(4, 5, 6));
    a.set("three", new Vec3(7, 8, 9));

    let b = new Map<string, Vec3>();
    b.set("one", new Vec3(1, 2, 3));
    b.set("two", new Vec3(4, 5, 6));
    b.set("four", new Vec3(7, 8, 9)); // should fail

    expect(a).toStrictEqual(b, "maps with similar key value pairs should equal");
  });

  throws("when maps with string keys don't match and object values equal each other", () => {
    let a = new Map<string, Vec3>();
    a.set("one", new Vec3(1, 2, 3));
    a.set("two", new Vec3(4, 5, 6));
    a.set("three", new Vec3(7, 8, 9));

    let b = new Map<string, Vec3>();
    b.set("one", new Vec3(1, 2, 3));
    b.set("two", new Vec3(4, 5, 6));
    b.set("three", new Vec3(7, 8, 1));

    expect(a).toStrictEqual(b, "maps with similar key value pairs should equal");
  });

  test("complicated object tree with sets and maps", () => {
    let a = new Set<Vec3>();
    a.add(new Vec3(1, 2, 3));
    a.add(new Vec3(4, 5, 6));

    let b = new Set<Vec3>();
    b.add(new Vec3(1, 2, 3));
    b.add(new Vec3(4, 5, 6));

    let c = new Map<Set<Vec3>, string>();
    c.set(a, "one");
    c.set(b, "two");

    let d = new Set<Vec3>();
    d.add(new Vec3(1, 2, 3));
    d.add(new Vec3(4, 5, 6));

    let e = new Set<Vec3>();
    e.add(new Vec3(1, 2, 3));
    e.add(new Vec3(4, 5, 6));

    let f = new Map<Set<Vec3>, string>();
    f.set(d, "one");
    f.set(e, "two");

    expect(c).toStrictEqual(f, "complex data structure should match");
  });

  afterEach(() => {
    RTrace.collect();
  });
});