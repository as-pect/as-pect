import { toIncludeComparison } from "./toIncludeComparison";
import { Actual } from "../report/Actual";
import { Expected } from "../report/Expected";
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
// @ts-ignore expected is valueof<T> or it will be a compiler error
export function toIncludeEqualComparison<T>(actual: T, expected: valueof<T>, negated: i32, message: string): void {
  /**
   * If `U` is not a reference, then we delegate to `toIncludeComparison()`.
   */
  // @ts-ignore expected is valueof<T> or it will be a compiler error
  if (!isReference<valueof<T>>(expected) || expected instanceof string) {
    toIncludeComparison<T>(actual, expected, negated, message);
    return;
  }

  /**
   * Always report "Included Reference" because it will be negated by the `Expectated.negated`
   * property later.
   */
  Expected.report<string>("Included Reference", negated);

  /**
   * This loop validates that a reference of type `U` exists with the same shape as the expected
   * value within the Array.
   */
  let included: bool = false;
  // @ts-ignore: if T does not have a length property, it will throw a compiler error.
  for (let i: indexof<T> = 0; i < <indexof<T>>actual.length; i++) {
    // @ts-ignore: if this expression does not work, it will throw a compiler error.
    let item: valueof<T> = actual[i];

    /**
     * This is a strict equality shortcut. If the values are equal, it's included.
     */
    if (item == expected) {
      included = true;
      break;
    } else if (item != null && expected != null) {
      if (expected instanceof ArrayBuffer) {
        let expectedSize = load<i32>(changetype<usize>(expected) - 4);
        let actualSize = load<i32>(changetype<usize>(item) - 4);
        if (expectedSize == actualSize) {
          let compare = memory.compare(
            changetype<usize>(item),
            changetype<usize>(expected),
            actualSize,
          );

          /** If the memory.compare() returned 0, then the value is included. */
          if (compare === 0) {
            included = true;
            break;
          }
        }
      } else {
        /** Perform a memory comparison. */
        let compare = memory.compare(
          changetype<usize>(item),
          changetype<usize>(expected),
          // @ts-ignore: Compare the two blocks using `offsetof<valueof<T>>()`
          offsetof<valueof<T>>(),
        );

        /** If the memory.compare() returned 0, then the value is included. */
        if (compare === 0) {
          included = true;
          break;
        }
      }
    }
  }

  Actual.report<string>(included ? "Included Reference" : "Not Included Reference");
  assert(i32(included) ^ negated, message);
}
