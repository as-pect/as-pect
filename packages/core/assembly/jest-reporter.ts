// @ts-ignore
@external("__aspect", "logReflectedValue")
declare function logReflectedValue(id: i32): void;

describe("examples", () => {
  test("example 1", () => {
    expect(1).toBe(1, "Here is an example message");
  });

  test("log value", () => {
    log("testing in a test");
  });

  // this will become deprecated, need to come up with a better way to push warnings to the reporter
  Performance.maxSamples(10001);
  test("push an error to the error array", () => {
    // causes a reflection error because -1 can't be a valid id
    logReflectedValue(-1);
  })

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

  todo("example todo");

  log("testing in a group");
});
