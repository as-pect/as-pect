import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { assert } from "./assert";

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
// @ts-ignore: Decorators *are* valid here!
@inline
export function exactComparison<T>(actual: T, expected: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  reportExpected<T>(expected, negated);
  assert(negated ^ i32(expected == actual), message);
}
