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
  throws(
    "when garunteed unreachable",
    () => {
      counter = 1;
      unreachable();
    },
    "This test should throw",
  );

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
    }).toThrow(
      "functions that do not throw should cause toThrow assertions to throw.",
    );
  });

  /**
   * This test validates that a toThrowWith assertion checks a thrown error message.
   */
  it("toThrowWith should pass when the callback throws a matching message", () => {
    expect(() => {
      counter = 1;
      throw new Error("expected failure message");
    }).toThrowWith("failure message");
  });

  /**
   * This test validates that a toThrowWith assertion checks an abort/assertion message.
   */
  it("toThrowWith should pass when an assertion throws a matching message", () => {
    expect(() => {
      counter = 1;
      assert(false, "expected assertion message");
    }).toThrowWith("assertion message");
  });

  /**
   * This test validates that a toThrowWith assertion fails when no error is thrown.
   */
  it("toThrowWith should throw if the callback does not throw", () => {
    expect(() => {
      expect(() => {
        counter = 1;
      }).toThrowWith("failure message");
    }).toThrow(
      "functions that do not throw should cause toThrowWith assertions to throw.",
    );
  });

  /**
   * This test validates that a toThrowWith assertion fails when the thrown message does not match.
   */
  it("toThrowWith should throw if the callback throws a different message", () => {
    expect(() => {
      expect(() => {
        counter = 1;
        throw new Error("actual failure message");
      }).toThrowWith("expected failure message");
    }).toThrow(
      "functions that throw a different message should cause toThrowWith assertions to throw.",
    );
  });

  /**
   * This test validates that a negated toThrowWith assertion passes when no error is thrown.
   */
  it("not.toThrowWith should pass when the callback does not throw", () => {
    expect(() => {
      counter = 1;
    }).not.toThrowWith("failure message");
  });

  /**
   * This test validates that a negated toThrowWith assertion passes when another message is thrown.
   */
  it("not.toThrowWith should pass when the callback throws a different message", () => {
    expect(() => {
      counter = 1;
      throw new Error("actual failure message");
    }).not.toThrowWith("expected failure message");
  });

  /**
   * This test validates that a negated toThrowWith assertion fails when the thrown message matches.
   */
  it("not.toThrowWith should throw if the callback throws a matching message", () => {
    expect(() => {
      expect(() => {
        counter = 1;
        throw new Error("expected failure message");
      }).not.toThrowWith("failure message");
    }).toThrow(
      "functions that throw a matching message should cause negated toThrowWith assertions to throw.",
    );
  });

  /**
   * This after each setup function validates that the tested callback was run, and the test results
   * are reliable.
   */
  afterEach(() => {
    expect(counter).toBe(1);
  });
});
