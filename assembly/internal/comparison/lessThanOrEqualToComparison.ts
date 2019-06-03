// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { Expectation } from "../Expectation";
import { assert } from "./assert";

/**
 * This method performs a lessThanOrEqualTo comparison between two values.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function lessThanOrEqualToComparison<T>(expectation: Expectation<T>, actual: T, expected: T, negated: i32, message: string): void {
  reportActual<T>(actual, expectation);
  reportExpected<T>(expected, negated);

  if (isReference<T>()) {
    // Perform reference type null checks
    assert(i32(expected != null), "Nullable comparison fails, expected value is null.");
    assert(i32(actual != null), "Nullable comparison fails, actual value is null.");
  }

  // Compare float types
  if (isFloat<T>(actual)) {
    assert(i32(!isNaN<T>(expected)), "Value comparison fails, expected value is NaN.");
    assert(i32(!isNaN<T>(actual)), "Value comparison fails, actual value is NaN.");
  }

  // do actual less than comparison
  assert(negated ^ i32(actual <= expected), message);
  clearExpected();
}
