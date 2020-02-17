import { Actual } from "../../Actual";
import { Expected } from "../Expected";
import { assert } from "../assert";

/**
 * This method is used to do an exact equality comparison. This will directly compare two values
 * exactly.
 *
 * @param T - The type of the expectation.
 * @param {T} actual - The actual value.
 * @param {T} expected - The expected value.
 * @param {i32} negated - The value indicating that assertion is negated.
 * @param {string} message - The message describing the assertion.
 */
export function exactComparison<T>(actual: T, expected: T, negated: i32, message: string): void {
  Actual.report<T>(actual);
  Expected.report<T>(expected, negated);
  assert(negated ^ i32(expected == actual), message);
}
