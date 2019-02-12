describe("unreachable", (): void => {

  it("should expect functions to be unreachable", (): void => {
    expect<() => void>((): void => {
      unreachable();
    }).toThrow("a function with unreachable should throw");
  });

  it("should expect functions not to throw", (): void => {
    expect<() => void>((): void => {}).not.toThrow("an empty function should not throw");
  });

  it("should throw when a function that is expected to throw doesn't throw", (): void => {
    expect<() => void>((): void => {
      expect<() => void>((): void => {}).toThrow();
    }).toThrow("functions that don't throw should throw");
  });

  it("should not throw when a function that is expected to throw does throw", (): void => {
    expect<() => void>((): void => {
      expect<() => void>((): void => { unreachable(); }).toThrow();
    }).not.toThrow("functions that throw should throw");
  });
});
