import { reportActual } from "../report/reportActual";
import { assert } from "./assert";
import { Expected } from "../report/reportExpected";
import { ValueType } from "../report/ValueType";

/**
 * This method performs a truthy comparison.
 *
 * @param T - The expectation type.
 * @param {T} actual - The actual value.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore: Decorators *are* valid here
@inline
export function truthyComparison<T>(actual: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  Expected.type = ValueType.Truthy;
  Expected.negated = negated;
  Expected.stackTrace = -1;

  if (isReference<T>()) {
    // if the reference is null
    if (actual == null) {
      // it should throw if it's not negated
      assert(negated, message);
    } else if (actual instanceof String) {
      let value = changetype<string>(changetype<usize>(actual));
      // it should throw if it's an empty string
      assert(negated ^ i32(value.length != 0), message);
    } else {
      // it should throw it's negated
      assert(i32(!negated), message);
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore T is a float type
      let isFalsy: bool = isNaN<T>(actual) || actual == <T>0;
      assert(negated ^ i32(!isFalsy), message);
    } else {
      // @ts-ignore: T is integer type and the cast is safe
      let isFalsy: bool = actual == <T>0;
      assert(negated ^ i32(!isFalsy), message);
    }
  }
}
