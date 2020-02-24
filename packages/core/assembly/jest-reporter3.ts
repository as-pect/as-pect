describe("a passing suite", () => {
  test("passes", () => {
    expect(42).toBe(42, "Pass");
  });

  beforeEach(() => { assert(false, "It's going to error!"); });
});
