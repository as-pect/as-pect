import { assert } from "./assert";
import { Actual } from "../report/Actual";
import { Expected } from "../report/Expected";
import { ArrayBufferView } from "arraybuffer";

/**
 * This method performs an arrayComparison, which is defined as validating the contents of each
 * array match exactly. Currently only Arrays of value types are supported.
 *
 * @param {T} T - The array type.
 * @param {T} actual - The actual array.
 * @param {T} expected - The expected array
 * @param {i32} negated - The indicator that the array assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore: Decorators *are* valid here
@inline
export function arrayComparison<T extends ArrayBufferView>(actual: T, expected: T, negated: i32, message: string): void {
  // @ts-ignore T extends ArrayBufferView
  if (isManaged<valueof<T>>()) {
    Actual.report<string>("Array of References");
    Expected.report<string>("Array of References", 0);
  } else {
    Actual.report<T>(actual);
    Expected.report<T>(expected, negated);
  }

  /**
   * Array pointer equality should short circuit the comparison.
   */
  if (actual === expected) {
    assert(i32(!negated), message);
    return;
  }

  if (isNullable<T>()) {
    /**
     * Mutually exclusive nulls should short circut the comparison.
     */
    if (actual === null || expected === null) {
      assert(negated, message);
      return;
    }
  }

  /**
   * Length assertion values should short circuit the comparison.
   */
  if (actual.dataLength != expected.dataLength) {
    assert(negated, message);
    return;
  }

  let matches = 1;
  /**
   * Finally, check the values to make sure they match. Assume that the arrays match, and if the
   * child items aren't `==` to each other, then we can assume the arrays do not strictly equal
   * each other. When items don't equal each other, we can short circuit the loop and perform the
   * actual assertion.
   *
   * We don't use memory.compare() here because the `==` operator might be overridden where
   * T extends Array<U> where U is managed, and we would have to perform this check as well even
   * if the `memory.compare()` failed.
   */
  let length = actual.length;
  for (let i = 0; i < length; i++) {
    let a = unchecked(actual[i]);
    let b = unchecked(expected[i]);
    if (isFloat<T>()) {
      if (isNaN(a) && isNaN(b)) continue;
    }
    // @ts-ignore: Actual value if instance of Array, so array access is valid
    if (a == b) continue;
    matches = 0;
    break;
  }

  assert(matches ^ negated, message);
}
