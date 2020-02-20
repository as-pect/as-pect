/**
 * This test suite is responsible for verifying that functions are called, and that when they
 * hit unreachable instructions, they throw errors.
 */
var counter = 0;
describe("unreachable", () => {
  /**
   * This setup function verifies the test callback counter is set to 0.
   */
  beforeEach(() => {
    counter = 0;
  });

  /**
   * This is a unit test that a throws `unreachable()`. It should report success, because it's
   * expected to throw.
   */
  throws("when garunteed unreachable", () => {
    counter = 1;
    unreachable();
  }, "This test should throw");

  /**
   * This test verifies that an unreachable() instruction causes the toThrow assertion to
   * be valid.
   */
  it("should should throw", () => {
    expect(() => {
      counter = 1;
      unreachable();
    }).toThrow("unreachable instructions should throw.");
  });

  /**
   * This test validates that a negated toThrow assertion is valid.
   */
  it("should run normally", () => {
    expect(() => {
      counter = 1;
    }).not.toThrow("unreachable instructions should throw.");
  });

  /**
   * This test validates that a negated toThrow assertion throws when the callback
   * itself throws.
   */
  it("expect.not should throw if the callback throws", () => {
    expect(() => {
      expect(() => {
        counter = 1;
        unreachable();
      }).not.toThrow();
    }).toThrow("unreachable should cause negated toThrow assertions to throw.");
  });

  /**
   * This test validates that a toThrow assertion throws when the callback does not throw.
   */
  it("expect should throw if the callback does not throw", () => {
    expect(() => {
      expect(() => {
        counter = 1;
      }).toThrow();
    }).toThrow("functions that do not throw should cause toThrow assertions to throw.");
  });

  /**
   * This after each setup function validates that the tested callback was run, and the test results
   * are reliable.
   */
  afterEach(() => {
    expect(counter).toBe(1);
  });
});
