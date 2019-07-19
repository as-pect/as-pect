import { Actual } from "../report/Actual";
import { Expected } from "../report/Expected";
import { assert } from "./assert";

/**
 * This method performs a reference comparison using `memory.compare()`. The size of the memory
 * comparison is calculated using `offsetof<T>()`.
 *
 * @param T - The expectation type.
 * @param {T} actual - The actual value.
 * @param {T} expected - The expected value.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore: Decorators *are* valid here
@inline
export function referenceComparison<T>(actual: T, expected: T, negated: i32, message: string): void {
  // report the actual and expected values
  Actual.report<T>(actual);
  Expected.report<T>(expected, negated);

  // fast path, the value is itself, operator overload comparison passes, or both values are null
  if (expected == actual) {
    assert(i32(!negated), message);
    return;
  }

  // fast path, both values aren't null together, so if any of them are null, they do not equal
  if (expected == null || actual == null) {
    assert(negated, message);
    return;
  }

  let compareResult = memory.compare(
    changetype<usize>(expected),
    changetype<usize>(actual),
    offsetof<T>(),
  );
  assert(negated ^ i32(compareResult == 0), message);
}
