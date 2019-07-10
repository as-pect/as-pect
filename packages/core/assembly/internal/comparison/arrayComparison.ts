import { assert } from "./assert";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";

/**
 * This method performs an arrayComparison, which is defined as validating the contents of each
 * array match exactly. Currently only Arrays of value types are supported.
 *
 * @param {T extends Array<U>} T - The array type.
 * @param {U} U - The implied value type.
 * @param {T extends Array<U>} actual - The actual array.
 * @param {T extends Array<U>} expected - The expected array
 * @param {i32} negated - The indicator that the array assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore: Decorators *are* valid here
@inline
export function arrayComparison<T>(actual: T, expected: T, negated: i32, message: string): void {
  // @ts-ignore: Can't garuntee T extends array
  if (isManaged(unchecked(actual[0]))) {
    reportActual<string>("Array of References");
    reportExpected<string>("Array of References", 0);
  } else {
    reportActual<T>(actual);
    reportExpected<T>(expected, negated);
  }

  /**
   * Array pointer equality should short circuit the comparison.
   */
  if (actual === expected) {
    assert(i32(!negated), message);
    return;
  }

  /**
   * Mutually exclusive nulls should short circut the comparison.
   */
  if (actual == null || expected == null) {
    assert(negated, message);
    return;
  }

  /**
   * Length assertion values should short circuit the comparison.
   */
  // @ts-ignore: Actual value if instance of Array, so length is a valid property
  if (actual.length != expected.length) {
    assert(negated, message);
    return;
  }

  let matches: i32 = 1;
  /**
   * Finally, check the values to make sure they match. Assume that the arrays match, and if the
   * child items aren't `==` to each other, then we can assume the arrays do not strictly equal
   * each other. When items don't equal each other, we can short circuit the loop and perform the
   * actual assertion.
   */
  // @ts-ignore: Actual value if instance of Array, so length is a valid property
  let length: i32 = actual.length;
  for (let i = 0; i < length; i++) {
    // @ts-ignore: Actual value if instance of Array, so array access is valid
    if (unchecked(actual[i]) == unchecked(expected[i])) {
      continue;
    }
    matches = 0;
    break;
  }

  assert(matches ^ negated, message);
}
