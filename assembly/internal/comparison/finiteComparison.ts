

import { reportActual } from "../report/reportActual";
import { assert } from "./assert";
import { Expected } from "../report/reportExpected";
import { ValueType } from "../report/ValueType";

// @ts-ignore: Decorators *are* valid here!
@inline
export function finiteComparison<T>(actual: T, negated: i32, message: string): void {
  // toBeFinite should not be called on a reference type
  if (isReference<T>()) {
    assert(i32(false), "toBeFinite must not be called on reference types.");
  } else {
    reportActual<T>(actual);
    Expected.type = ValueType.Finite;
    Expected.negated = negated;

    if (isFloat<T>()) {
      let finite: bool = isFinite<T>(actual);
      assert(negated ^ i32(finite), message);
    } else {
      // must be a float value
      assert(i32(false), "toBeFinite must only be called with float value types.");
    }
  }
}
