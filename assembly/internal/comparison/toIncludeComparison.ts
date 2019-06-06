import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { assert } from "./assert";

/**
 * This method performs an "include" comparison. The expectation is that the expected value is
 * included in the actual array.
 *
 * @param T - The expectation type.
 * @param {T extends Array<U>} actual - The actual value.
 * @param {U} expected - The expected value.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore decorators *are* valid here
@inline
export function toIncludeComparison<T extends Array<U>, U>(actual: T, expected: U, negated: i32, message: string): void {
  /**
   * Always report that comparison is looking for an included value. It will be negated by the
   * Expected.negated property later.
   */
  reportExpected<string>("Included", negated);

  /**
   * This loop inspects each item and validates if the expected value is included in the array.
   */
  let includes: bool = false;
  for (let i = 0; i < actual.length; i++) {
    let val: U = actual[i];
    if (val === expected) {
      includes = true;
      break;
    }
  }

  /**
   * If the item is included, report "Included", otherwise report "Not Included".
   */
  reportActual<string>(includes ? "Included": "Not Included");
  assert(negated ^ i32(includes), message);
}