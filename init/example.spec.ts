describe("example", (): void => {
  it("should be truthy", (): void => {
    expect<bool>(true).toBeTruthy("true is not truthy");
  });
});
