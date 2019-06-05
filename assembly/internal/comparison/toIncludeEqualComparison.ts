import { toIncludeComparison } from "./toIncludeComparison";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { assert } from "./assert";

/**
 * This method perfoms a memory compare on all relevant items in an array, asserting that a
 * reference that has the same shape as the expected value exists within the array.
 *
 * @param T - The expectation type.
 * @param {T extends Array<U>} actual - The actual array reference.
 * @param {U} expected - The expected included value.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore Decorators *are* valid here
@inline
export function toIncludeEqualComparison<T extends Array<U>, U>(actual: T, expected: U, negated: i32, message: string): void {
  /**
   * If `U` is not a reference, then we delegate to `toIncludeComparison()`.
   */
  if (!isReference<U>(expected)) {
    toIncludeComparison<T, U>(actual, expected, negated, message);
    return;
  }

  /**
   * Always report "Included Reference" because it will be negated by the `Expectated.negated`
   * property later.
   */
  reportExpected<string>("Included Reference", negated);

  /**
   * This loop validates that a reference of type `U` exists with the same shape as the expected
   * value within the Array.
   */
  let included: bool = false;
  for (let i = 0; i < actual.length; i++) {
    let item: U = actual[i];
    /**
     * This is a strict equality shortcut. If the values are equal, it's included.
     */
    if (item == expected) {
      included = true;
      break;
    } else if (item != null && expected != null) {
      let compare = memory.compare(
        changetype<usize>(item),
        changetype<usize>(expected),
        offsetof<U>(),
      );

      /**
       * If the memory.compare() returned 0, then the value is included.
       */
      if (compare === 0) {
        included = true;
        break;
      }
    }
  }

  reportActual<string>(included ? "Included Reference" : "Not Included Reference");
  assert(i32(included) ^ negated, message);
}
