import { Vec3 } from "./setup/Vec3";

var vec1 = new Vec3(1, 2, 3);

/**
 * This test suite is designed to test the toBeFalsy assertion.
 */
describe("toBeFalsy", (): void => {
  /**
   * This performs javascript-like assertions, so 0 should be falsy.
   */
  it("should expect 0 to be falsy", (): void => {
    expect<i32>(0).toBeFalsy();
  });

  /**
   * This is the contrapositive of the previous test.
   */
  it("should error if 0 is fasly", (): void => {
    expectFn((): void => {
      expect<i32>(0).not.toBeFalsy();
    }).toThrow("0 is falsy");
  });

  /**
   * False should be falsy by definition.
   */
  it("should expect false to be falsy", (): void => {
    expect<bool>(false).toBeFalsy("False is falsy by definition");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  it("should throw if 0 is fasly", (): void => {
    expectFn((): void => {
      expect<bool>(false).not.toBeFalsy();
    }).toThrow("false is falsy");
  });

  /**
   * Any value that is numerically not 0 should be truthy, and thus, not falsy.
   */
  it("should expect non-zero numbers not to be falsy", (): void => {
    expect<i32>(1).not.toBeFalsy("1 is not falsy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  it("should throw if 1 is not fasly", (): void => {
    expectFn((): void => {
      expect<i32>(1).toBeFalsy();
    }).toThrow("1 is not falsy");
  });

  /**
   * True should not be falsy by definition.
   */
  it("should expect true not to be falsy", (): void => {
    expect<bool>(true).not.toBeFalsy("True is not falsy by definition");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  it("should throw if true is fasly", (): void => {
    expectFn((): void => {
      expect<bool>(true).toBeFalsy();
    }).toThrow("true is not falsy");
  });

  /**
   * NaN is always falsy.
   */
  it("should expect NaN to be falsy", (): void => {
    expect<f64>(NaN).toBeFalsy("NaN is always falsy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  it("should throw if NaN is not fasly", (): void => {
    expectFn((): void => {
      expect<f64>(NaN).not.toBeFalsy();
    }).toThrow("NaN is falsy");
  });

  /**
   * Null by definition is falsy.
   */
  it("should expect null to be falsy", (): void => {
    expect<Vec3>(null).toBeFalsy("Null is falsy");
  });

  /**
   * This is the contrapositive of the previous test.
   */
  it("should throw if null is not fasly", (): void => {
    expectFn((): void => {
      expect<Vec3>(null).not.toBeFalsy();
    }).toThrow("Null is falsy");
  });

  /**
   * This test verifies non-null references are not falsy.
   */
  it("should expect non-null references not to be falsy", (): void => {
    expect<Vec3>(vec1).not.toBeFalsy("Non-null references are not falsy.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  it("should throw if non-null references are falsy", (): void => {
    expectFn((): void => {
      expect<Vec3>(vec1).toBeFalsy();
    }).toThrow("Non-null references are not falsy.");
  });
});
