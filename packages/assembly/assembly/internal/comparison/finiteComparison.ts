

import { Actual } from "../report/Actual";
import { assert } from "./assert";
import { Expected } from "../report/Expected";
import { ValueType } from "../report/ValueType";

/**
 * This method performs a finite comparsion.
 *
 * @param T - The type of the expectation, must be a float value.
 * @param {T} actual - The actual value.
 * @param {i32} negated - The value indicating that assertion is negated.
 * @param {string} message - The message describing the assertion.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function finiteComparison<T>(actual: T, negated: i32, message: string): void {
  if (!isFloat<T>()) {
    ERROR("Expectation<T>#toBeFinite must be called with a Float value type T.");
  }

  Actual.report<T>(actual);
  Expected.type = ValueType.Finite;
  Expected.negated = negated;
  Expected.stackTrace = -1;

  if (isFloat<T>()) {
    assert(negated ^ i32(isFinite<T>(actual)), message);
  } else {
    // must be a float value
    assert(i32(false), "toBeFinite must only be called with float value types.");
  }
}
