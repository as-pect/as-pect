import { Vec3 } from "./setup/Vec3";

var vec1 = new Vec3(1, 2, 3);

/**
 * This test suite is designed to test the toBeFalsy assertion.
 */
describe("toBeFalsy", () => {
  /**
   * This performs javascript-like assertions, so 0 should be falsy.
   */
  it("should expect 0 to be falsy", () => {
    expect(0).toBeFalsy("0 is falsy by definition.");
  });

  /**
   * Additionally, we should assert that 0.0 is falsy, because 0.0 is
   * parsed as a float value in assemblyscript.
   */
  it("should expect 0 to be falsy", () => {
    expect(0.0).toBeFalsy("0.0 is falsy by definition.");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should error if 0 is fasly",
    () => {
      expect(0).not.toBeFalsy();
    },
    "0 is falsy",
  );

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should error if 0 is fasly",
    () => {
      expect(0.0).not.toBeFalsy();
    },
    "0 is falsy",
  );

  /**
   * False should be falsy by definition.
   */
  it("should expect false to be falsy", () => {
    expect(false).toBeFalsy("False is falsy by definition");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if 0 is fasly",
    () => {
      expect(false).not.toBeFalsy();
    },
    "false is falsy",
  );

  /**
   * Any value that is numerically not 0 should be truthy, and thus, not falsy.
   */
  it("should expect non-zero numbers not to be falsy", () => {
    expect(1).not.toBeFalsy("1 is not falsy");
  });

  /**
   * Any value that is numerically not 0 should be truthy, and thus, not falsy.
   */
  it("should expect non-zero numbers not to be falsy", () => {
    expect(1.0).not.toBeFalsy("1.0 is not falsy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if 1 is not fasly",
    () => {
      expect(1).toBeFalsy();
    },
    "1 is not falsy",
  );

  /**
   * This is the contrapositive of the previous test with float values.
   */
  throws(
    "should throw if 1 is not fasly",
    () => {
      expect(1.0).toBeFalsy();
    },
    "1.0 is not falsy",
  );

  /**
   * True should not be falsy by definition.
   */
  it("should expect true not to be falsy", () => {
    expect(true).not.toBeFalsy("True is not falsy by definition");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if true is fasly",
    () => {
      expect(true).toBeFalsy();
    },
    "true is not falsy",
  );

  /**
   * NaN is always falsy.
   */
  it("should expect NaN to be falsy", () => {
    expect(NaN).toBeFalsy("NaN is always falsy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if NaN is not fasly",
    () => {
      expect(NaN).not.toBeFalsy();
    },
    "NaN is falsy",
  );

  /**
   * Null by definition is falsy.
   */
  it("should expect null to be falsy", () => {
    expect<Vec3 | null>(null).toBeFalsy("Null is falsy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  throws(
    "should throw if null is not fasly",
    () => {
      expect<Vec3 | null>(null).not.toBeFalsy();
    },
    "Null is falsy",
  );

  /**
   * This test verifies non-null references are not falsy.
   */
  it("should expect non-null references not to be falsy", () => {
    expect<Vec3 | null>(vec1).not.toBeFalsy(
      "Non-null references are not falsy.",
    );
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws(
    "should throw if non-null references are falsy",
    () => {
      expect<Vec3 | null>(vec1).toBeFalsy();
    },
    "Non-null references are not falsy.",
  );

  /** Empty strings should be falsy. */
  it("should be a falsy string", () => {
    expect("").toBeFalsy();
  });
});
