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
    "Null cannot be expected to be null."
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
    "Reference values that aren't null shouldn't be expected to be null."
  );
});
