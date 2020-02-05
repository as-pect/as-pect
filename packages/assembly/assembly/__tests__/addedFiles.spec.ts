/**
 * This test suite describes a single expectation. This expectation is an assumption that files
 * with the *.include.ts extension will be included. There is a file in the setup folder that
 * includes a single global constant, and that value should be accessible from this test suite.
 */
describe("added files", () => {

  /**
   * This test simply expects a global value to be defined from setup/Test.include.ts.
   */
  it("should read globals from included files", () => {
    // @ts-ignore: Please see setup/Test.include.ts
    expect(meaningOfLife).toBe(42);
  });
});
