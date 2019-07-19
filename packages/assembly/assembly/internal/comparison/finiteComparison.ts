

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
  // toBeFinite should not be called on a reference type
  if (isReference<T>()) {
    Actual.report<string>("Reference Type");
    Expected.report<string>("Float Type", 0);
    assert(i32(false), "toBeFinite must not be called on reference types.");
  } else {
    Actual.report<T>(actual);
    Expected.type = ValueType.Finite;
    Expected.negated = negated;
    Expected.stackTrace = -1;

    if (isFloat<T>()) {
      let finite: bool = isFinite<T>(actual);
      assert(negated ^ i32(finite), message);
    } else {
      // must be a float value
      assert(i32(false), "toBeFinite must only be called with float value types.");
    }
  }
}
