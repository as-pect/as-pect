import { toIncludeComparison } from "./toIncludeComparison";
import { Actual } from "../Actual";
import { Expected } from "../Expected";
import { assert } from "../assert";

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
// @ts-ignore expected is valueof<T> or it will be a compiler error
export function toIncludeEqualComparison<T, U>(
  actual: T,
  expected: U,
  negated: i32,
  message: string,
): void {
  // @ts-ignore
  if (!isDefined(unchecked(actual[0]))) {
    ERROR(
      "Cannot call toIncludeEquals on actual value of type T where T does not have an index signature.",
    );
  }

  /**
   * Assert that the actual value is not null.
   */
  Actual.report(actual);
  if (isNullable<T>()) {
    Expected.report("null", 1);
    assert(i32(actual !== null), 0, null);
  }

  /**
   * Always report that the comparison is looking for an included value. It will be negated by the
   * Expected.negated property later.
   */
  Expected.report("Included", negated);

  /**
   * This loop inspects each item and validates if the expected value is included in the array.
   */
  let includes = false;

  // test for Sets
  if (actual instanceof Set) {
    if (actual.has(expected)) {
      includes = true;
    } else {
      // if it isn't already in the set, we need to look over each value and inspect it for strict equality
      // @ts-ignore: type safe .values() method call
      let values = actual.values();
      let length = values.length;
      for (let i = 0; i < length; i++) {
        let key = unchecked(values[i]);
        if (Reflect.equals(key, expected) === Reflect.SUCCESSFUL_MATCH) {
          includes = true;
          break;
        }
      }
    }
  } else {
    // @ts-ignore: typesafe length check
    if (!isDefined(actual.length))
      ERROR("Can only call toIncludeEquals on array-like objects or Sets.");

    // @ts-ignore: typesafe access to length
    let length = <indexof<T>>actual.length;

    // @ts-ignore: typesafe check for access
    if (isDefined(unchecked(actual[0]))) {
      // @ts-ignore: if T does not have a length property, it will throw a compiler error.
      for (let i = <indexof<T>>0; i < length; i++) {
        if (
          // @ts-ignore: if this expression does not work, it will throw a compiler error.
          Reflect.equals(unchecked(actual[i]), expected) ===
          Reflect.SUCCESSFUL_MATCH
        ) {
          includes = true;
          break;
        }
      }
    } else {
      // @ts-ignore: if T does not have a length property, it will throw a compiler error.
      for (let i = <indexof<T>>0; i < length; i++) {
        // @ts-ignore: if this expression does not work, it will throw a compiler error.
        if (Reflect.equals(actual[i], expected) === Reflect.SUCCESSFUL_MATCH) {
          includes = true;
          break;
        }
      }
    }
  }

  /**
   * If the item is included, report "Included", otherwise report "Not Included".
   */
  Actual.report(includes ? "Included" : "Not Included");
  assert(i32(includes), negated, message);
}
