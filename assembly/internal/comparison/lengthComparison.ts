import { assert } from "./assert";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
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
// @ts-ignore: Decorators *are* valid here!
@inline
export function lengthComparison<T>(actual: T, expected: i32, negated: i32, message: string): void {
  let length: i32 = 0;
  if (isReference<T>()) {
    /**
     * We need to collect the length of the reference, knowing that the expected value should
     * match the length of the actual value.
     */
    if (actual == null) {
      /**
       * If the reference is null, we can delegate the logic inline to a negated nullComparison.
       */
      nullComparison<T>(actual, 1, "toHaveLength assertion called on null actual value.");
    } else if (actual instanceof ArrayBuffer) {
      length = changetype<ArrayBuffer>(actual).byteLength;
    } else {
      // @ts-ignore self must have property length, which will result in a compile time error
      length = actual.length;
    }
    reportActual<i32>(length);
    reportExpected<i32>(expected, negated);
    assert(negated ^ i32(length == expected), message);
  } else {
    reportActual<T>(actual);
    reportExpected<string>("Reference Type", 0);
    assert(i32(false), "toHaveLength should be called on TypedArrays, ArrayBuffers, Arrays, and classes that have a length property.");
  }
}
