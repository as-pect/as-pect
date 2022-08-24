/* eslint-disable @typescript-eslint/no-empty-function */

// @ts-ignore
@external("__aspect", "logReflectedValue")
declare function logReflectedValue(id: i32): void;

// @ts-ignore: duplicate
class Vec3 {
  public constructor(public x: f32 = 0, public y: f32 = 0, public z: f32 = 0) {}
}

describe("examples", () => {
  test("example 1", () => {
    expect(1).toBe(1, "Here is an example message");
  });

  // duplicated test for namespace generation test coverage
  test("example 1", () => {
    expect(1).toBe(1, "Here is an example message");
  });

  test("log value", () => {
    log("testing in a test");
  });

  test("push an error to the error array", () => {
    // causes a reflection error because -1 can't be a valid id
    logReflectedValue(-1);
  });

  test("something fails", () => {
    expect(-1).toBe(42, "Here is an example failure message.");
  });

  throws("when two things should equal each other", () => {
    let a = new Float64Array(3);
    a[0] = 0;
    a[1] = 1;
    a[2] = 2;

    expect(a).toStrictEqual(new Float64Array(3));
  });

  throws("this should throw but it does not", () => {}, "it should throw");

  test("something negated fails", () => {
    log("another string");
    expect(42).not.toBe(42, "42 is 42");
  });

  test("something using toBe fails with a reference that is similar", () => {
    expect(new Vec3(1, 2, 3)).toBe(new Vec3(1, 2, 3), "not the same pointer");
  });

  todo("example todo");

  log("testing in a group");
});
