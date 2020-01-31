import { assert } from "./assert";
import { Actual } from "../report/Actual";
import { Expected } from "../report/Expected";
import { nullComparison } from "./nullComparison";

/**
 * This method validates the length of a given `T`. Either the `byteLength` is used when `T` is an `ArrayBuffer` or `length` property
 * is used when `T` is a reference of any other kind.
 *
 * @param T - The expectation type.
 * @param {T} actual - The actual value.
 * @param {i32} expected - The expected length.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
export function lengthComparison<T>(actual: T, expected: i32, negated: i32, message: string): void {
  if (!isReference<T>()) {
    ERROR("Expectation<T>#toHaveLength must be called with a Reference type T.")
  }

  let length: i32 = 0;

  if (isNullable<T>()) {
    if (actual === null) {
      /**
       * If the reference is null, we can delegate the logic inline to a negated nullComparison.
       *
       * E.G. The reference must not be null.
       */
      assert(0, "Expectation<T>.toHaveLength assertion called on null actual value.");
    }
  }

  /**
   * We need to collect the length of the reference, knowing that the expected value should
   * match the length of the actual value.
   */
  if (actual instanceof ArrayBuffer) {
    length = changetype<ArrayBuffer>(actual).byteLength;
  } else {
    /**
     * If T does not have a length property, this will result in a compile time error.
     */
    // @ts-ignore
    length = actual.length;
  }
  Actual.report<i32>(length);
  Expected.report<i32>(expected, negated);
  assert(negated ^ i32(length == expected), message);
}
