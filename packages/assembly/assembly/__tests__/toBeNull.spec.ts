import { Vec3 } from "./setup/Vec3";

var vec1: Vec3 | null = new Vec3(1, 2, 3);

/**
 * This test suite verifies toBeNull assertions. It is used only with reference type values,
 * and should throw an error otherwise.
 */
describe("toBeNull", () => {
  /**
   * The quintessential toBeNull test.
   */
  it("should expect null to be null", () => {
    expect<Vec3 | null>(null).toBeNull("null should always be null.");
  });

  /**
   * This test is the contrapositive of the previous test.
   */
  throws(
    "when null is expected not to be null",
    () => {
      expect<Vec3 | null>(null).not.toBeNull();
    },
    "Null cannot be expected to be null.",
  );

  /**
   * This test verifies that reference types are not null.
   */
  it("should expect references to not be null", () => {
    expect(vec1).not.toBeNull("Reference values should not be null");
  });

  throws(
    "when a reference value is be not null",
    () => {
      expect(vec1).toBeNull();
    },
    "Reference values that aren't null shouldn't be expected to be null.",
  );

  test("non-nullable reference types can still be null", () => {
    expect(changetype<Vec3>(0)).toBeNull("0 is always null");
  });

  throws(
    "when a non-nullable reference is expected to be null",
    () => {
      expect(new Vec3(1, 2, 3)).toBeNull();
    },
    "non-nullable references can be null, but should throw when they aren't",
  );

  test("non-nullable reference types can still be null", () => {
    expect(new Vec3(1, 2, 3)).not.toBeNull("new Vec3 is never null");
  });

  throws(
    "when a non-nullable reference is expected not to be null",
    () => {
      expect(changetype<Vec3>(0)).not.toBeNull();
    },
    "non-nullable references can be null and should throw when they are when the expectation is negated",
  );

  test("null usize 0 should be null", () => {
    expect(<usize>0).toBeNull("0 is null when it's a usize");
  });

  throws("when usize 0 should not be null", () => {
    expect(<usize>0).not.toBeNull("0 is null when it's a usize");
  });
});
