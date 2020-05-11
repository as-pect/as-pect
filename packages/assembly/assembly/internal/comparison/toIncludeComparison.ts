import { Actual } from "../Actual";
import { Expected } from "../Expected";
import { assert } from "../assert";

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
export function toIncludeComparison<T, U>(
  actual: T,
  expected: U,
  negated: i32,
  message: string,
): void {
  // @ts-ignore: checking if a property is defined is compile safe
  if (!isDefined(actual[0])) {
    ERROR(
      "Cannot call toIncludeEquals on actual value of type T where T does not have an index signature.",
    );
  }

  /**
   * Assert that the actual value is not null.
   */
  Actual.report(actual);
  Expected.report("null", 1);
  assert(i32(actual !== null), 0, "");

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
    // @ts-ignore
    includes = actual.has(expected);
  } else {
    if (!isDefined(actual.length))
      ERROR("Can only call toInclude on array-like objects or Sets.");

    // @ts-ignore: typesafe length access
    let length = <indexof<T>>actual.length;
    // @ts-ignore: typesafe check
    if (isDefined(unchecked(actual[0]))) {
      // @ts-ignore: if T does not have a length property, it will throw a compiler error.
      for (let i = <indexof<T>>0; i < length; i++) {
        // @ts-ignore: if this expression does not work, it will throw a compiler error.
        if (unchecked(actual[i]) === expected) {
          includes = true;
          break;
        }
      }
    } else {
      // @ts-ignore: if T does not have a length property, it will throw a compiler error.
      for (let i = <indexof<T>>0; i < length; i++) {
        // @ts-ignore: if this expression does not work, it will throw a compiler error.
        if (actual[i] === expected) {
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
