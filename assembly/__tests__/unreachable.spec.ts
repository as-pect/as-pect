/**
 * This test suite is responsible for verifying that functions are called, and that when they
 * hit unreachable instructions, they throw errors.
 */
var counter = 0;
describe("unreachable", (): void => {
  /**
   * This setup function verifies the test callback counter is set to 0.
   */
  beforeEach((): void => {
    counter = 0;
  });

  /**
   * This test verifies that an unreachable() instruction causes the toThrow assertion to
   * be valid.
   */
  it("should should throw", (): void => {
    expectFn((): void => {
      counter = 1;
      unreachable();
    }).toThrow("unreachable instructions should throw.");
  });

  /**
   * This test validates that a negated toThrow assertion is valid.
   */
  it("should run normally", (): void => {
    expectFn((): void => {
      counter = 1;
    }).not.toThrow("unreachable instructions should throw.");
  });

  /**
   * This test validates that a negated toThrow assertion throws when the callback
   * itself throws.
   */
  it("expectFn.not should throw if the callback throws", (): void => {
    expectFn((): void => {
      expectFn((): void => {
        counter = 1;
        unreachable();
      }).not.toThrow();
    }).toThrow("unreachable should cause negated toThrow assertions to throw.");
  });

  /**
   * This test validates that a toThrow assertion throws when the callback does not throw.
   */
  it("expectFn should throw if the callback does not throw", (): void => {
    expectFn((): void => {
      expectFn((): void => {
        counter = 1;
      }).toThrow();
    }).toThrow("functions that do not throw should cause toThrow assertions to throw.");
  });

  /**
   * This after each setup function validates that the callback was run, and the test results
   * are reliable.
   */
  afterEach((): void => {
    expect<i32>(counter).toBe(1);
  });
});
