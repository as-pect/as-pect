import { Actual } from "../report/Actual";
import { Expected } from "../report/Expected";
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
// @ts-ignore expected is valueof<T> or it will be a compiler error
export function toIncludeComparison<T>(actual: T, expected: valueof<T>, negated: i32, message: string): void {
  /**
   * Always report that the comparison is looking for an included value. It will be negated by the
   * Expected.negated property later.
   */
  Expected.report("Included", negated);

  /**
   * This loop inspects each item and validates if the expected value is included in the array.
   */
  let includes = false;
  // @ts-ignore: if T does not have a length property, it will throw a compiler error.
  for (let i: indexof<T> = 0; i < <indexof<T>>actual.length; i++) {
    // @ts-ignore: if this expression does not work, it will throw a compiler error.
    let val = actual[i];
    if (val === expected) {
      includes = true;
      break;
    }
  }

  /**
   * If the item is included, report "Included", otherwise report "Not Included".
   */
  Actual.report(includes ? "Included" : "Not Included");
  assert(negated ^ i32(includes), message);
}
