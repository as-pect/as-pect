describe("a passing suite", () => {
  log("Something else!");
  test("passes", () => {
    expect(42).toBe(42, "Pass");
    log("Something!");
  });

  throws(
    "it throws successfully!",
    () => {
      expect(42).not.toBe(42);
    },
    "42 is 42",
  );
});
