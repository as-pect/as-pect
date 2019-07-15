import { reportActual } from "../report/reportActual";
import { assert } from "./assert";
import { Expected } from "../report/reportExpected";
import { ValueType } from "../report/ValueType";

/**
 * This method performs a falsyComparison. If T is a reference type, and actual is null or an empty
 * string, it passes the comparison. If T is a number type, it validates that the value is `NaN` or `0`.
 *
 * @param T - The type of the expectation.
 * @param {T} actual - The actual value.
 * @param {i32} negated - The value indicating that assertion is negated.
 * @param {string} message - The message describing the assertion.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function falsyComparison<T>(actual: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  Expected.type = ValueType.Falsy;
  Expected.negated = negated;
  Expected.stackTrace = -1;

  if (isReference<T>()) {
    // if the reference is null
    if (actual == null) {
      // it should throw if it's not negated
      assert(i32(!negated), message);
    } else if (actual instanceof String) {
      let value = changetype<string>(changetype<usize>(actual));
      // it should throw if it's an empty string
      assert(negated ^ i32(value.length == 0), message);
    } else {
      // it should throw it's not negated
      assert(negated, message);
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore T is a float type
      var isFalsy = isNaN<T>(actual) || actual == <T>0;
      assert(negated ^ i32(isFalsy), message);
    } else {
      assert(negated ^ i32(!actual), message);
    }
  }
}
