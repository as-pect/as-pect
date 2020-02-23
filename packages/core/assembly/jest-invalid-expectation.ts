class SomeRef {
  x: f64 = 0;
  y: f64 = 0;
  z: f64 = 0;
}

describe("an erroring test suite with invalid expect calls outside of a test", () => {
  expect<SomeRef | null>(null).toBeNull(
    "This expectation is not in the right place.",
  );
  expect<SomeRef>(new SomeRef()).toBeTruthy(
    "This expectation is not in the right place.",
  );
  expect<i32>(42).toBe(42);
  expect<string>("Some invalid expection string").toBeTruthy(
    "This expectation is not in the right place.",
  );

  it("should not run", () => {
    expect<i32>(19 + 23).toBe(42);
  });
});

describe("a describe callback with an error should report an error in the context errors", () => {
  assert(false, "This is an error message.");

  it("should not run", () => {
    expect<i32>(19 + 23).toBe(42);
  });
});
