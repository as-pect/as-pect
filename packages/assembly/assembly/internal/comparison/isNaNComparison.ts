import { Actual } from "../report/Actual";
import { assert } from "./assert";
import { Expected } from "../report/Expected";
import { ValueType } from "../report/ValueType";

/**
 * This method compares the actual value to NaN which uses the `isNaN<T>(actual)` function to
 * validate the comparison.
 *
 * @param T - The expectation type.
 * @param {T} actual - The actual value.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function isNaNComparison<T>(actual: T, negated: i32, message: string): void {
  // toBeNaN must not be called on a reference type.
  if (isReference<T>()) {
    Actual.report<string>("Reference Type");
    Expected.report<string>("Float Type", 0);
    assert(i32(false), "toBeNaN must be called using value types.");
  } else {
    Actual.report<T>(actual);
    Expected.type = ValueType.Float;
    Expected.float = <f64>NaN;
    Expected.negated = negated;
    Expected.stackTrace = -1;

    // must be a float value
    assert(i32(isFloat<T>(actual)), "toBeNaN assertion must be called on a float value.");

    let isnan: bool = isNaN<T>(actual);

    // Perform the actual isClose assertion
    assert(negated ^ i32(isnan), message);
  }
}
