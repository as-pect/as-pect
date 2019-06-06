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
  let matches: i32 = 1;

  // @ts-ignore: Can't garuntee T extends array
  if (isManaged(unchecked(actual[0]))) {
    reportActual<string>("Array of References");
    reportExpected<string>("Array of Values", 0);
    assert(i32(false), "Array comparison on array of references not supported, assertion fail.");
  } else {
    reportActual<T>(actual);
    reportExpected<T>(expected, negated);

    if (actual === expected) {
      assert(i32(!negated), message);
      return;
    }

    if (actual == null || expected == null) {
      assert(negated, message);
      return;
    }

    // @ts-ignore: Actual value if instance of Array, so length is a valid property
    if (actual.length != expected.length) {
      assert(negated, message);
      return;
    }

    // @ts-ignore: Actual value if instance of Array, so length is a valid property
    let length: i32 = actual.length;
    for (let i = 0; i < length; i++) {
      // @ts-ignore: Actual value if instance of Array, so array access is valid
      if (unchecked(actual[i]) != unchecked(expected[i])) {
        matches = 0;
        break;
      }
    }

    assert(matches ^ negated, message);
  }
}
