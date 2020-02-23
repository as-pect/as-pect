describe("a passing suite", () => {
  test("passes", () => {
    expect(42).toBe(42, "Pass");
  });

  throws("it throws successfully!", () => {
    expect(42).not.toBe(42);
  }, "42 is 42");
});
