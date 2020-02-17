import { Actual } from "../Actual";
import { assert } from "../assert";
import { Expected } from "../Expected";
import { ValueType } from "../report/ValueType";

/**
 * This method performs a truthy comparison.
 *
 * @param T - The expectation type.
 * @param {T} actual - The actual value.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
export function truthyComparison<T>(actual: T, negated: i32, message: string): void {

}
