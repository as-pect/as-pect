describe("added files", (): void => {
  it("should add added files when specified in the configuration using *.include.ts", (): void => {
    // @ts-ignore it's a tested global inside setup/Test.include.ts
    expect<i32>(meaningOfLife).toBe(42);
  });
});
