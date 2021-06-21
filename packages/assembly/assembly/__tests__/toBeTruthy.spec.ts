import { Vec3 } from "./setup/Vec3";

var vec1: Vec3 | null = new Vec3(1, 2, 3);

/**
 * This test suite is designed to test the toBeTruthy assertion.
 */
describe("toBeTruthy", () => {
  /**
   * This performs javascript-like assertions, so 1 should be truthy.
   */
  it("should expect 1 to be truthy", () => {
    expect(1).toBeTruthy();
  });

  /**
   * This performs javascript-like assertions, so a 1.0 float should be truthy.
   */
  it("should expect 1.0 to be truthy", () => {
    expect(1.0).toBeTruthy();
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should error if 1 is fasly",
    () => {
      expect(1).not.toBeTruthy();
    },
    "1 is truthy",
  );

  /**
   * This is the contrapositive of the previous float version test.
   */
  throws(
    "should error if 1.0 is fasly",
    () => {
      expect(1.0).not.toBeTruthy();
    },
    "1.0 is truthy",
  );

  /**
   * True should be truthy by definition.
   */
  it("should expect true to be truthy", () => {
    expect(true).toBeTruthy("True is truthy by definition");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if true is not truthy",
    () => {
      expect(true).not.toBeTruthy();
    },
    "true is truthy",
  );

  /**
   * Any value that is numerically 0 should be falsy, and thus, not truthy.
   */
  it("should expect numbers that equal zero not to be truthy", () => {
    expect(0).not.toBeTruthy("0 is not truthy");
  });

  /**
   * Any value that is numerically 0.0 should be falsy, and thus, not truthy.
   */
  it("should expect numbers that equal zero not to be truthy", () => {
    expect(0.0).not.toBeTruthy("0.0 is not truthy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if 0 is not truthy",
    () => {
      expect(0).toBeTruthy();
    },
    "0 is not truthy",
  );

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if 0.0 is not truthy",
    () => {
      expect(0.0).toBeTruthy();
    },
    "0.0 is not truthy",
  );

  /**
   * False should not be truthy by definition.
   */
  it("should expect false not to be truthy", () => {
    expect(false).not.toBeTruthy("False is not truthy by definition");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if false is not truthy",
    () => {
      expect(false).toBeTruthy();
    },
    "false is not truthy",
  );

  /**
   * NaN is always falsy.
   */
  it("should expect NaN not to be truthy", () => {
    expect(NaN).not.toBeTruthy("NaN is always not truthy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if NaN is not fasly",
    () => {
      expect(NaN).toBeTruthy("NaN is always not truthy");
    },
    "NaN is not truthy",
  );

  /**
   * Null by definition is falsy.
   */
  it("should expect null not to be truthy", () => {
    expect<Vec3 | null>(null).not.toBeTruthy("Null is not truthy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "because null is not truthy",
    () => {
      expect<Vec3 | null>(null).toBeTruthy();
    },
    "Null is not truthy",
  );

  /**
   * This test verifies non-null references are truthy.
   */
  it("should expect non-null references to be truthy", () => {
    expect(vec1).toBeTruthy("Non-null references are truthy.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws(
    "should throw if non-null references are expected not to be truthy",
    () => {
      expect(vec1).not.toBeTruthy();
    },
    "Non-null references are truthy.",
  );

  /** Strings should be truthy unless their length is 0. */
  it("should expect strings to be truthy", () => {
    expect("this string").toBeTruthy();
    expect("").not.toBeTruthy();
  });
});
