import { reportActual } from "../report/reportActual";
import { assert } from "./assert";
import { Expected } from "../report/reportExpected";
import { ValueType } from "../report/ValueType";

// @ts-ignore: Decorators *are* valid here!
@inline
export function isNaNComparison<T>(actual: T, negated: i32, message: string): void {
  // toBeNaN must not be called on a reference type.
  if (isReference<T>()) {
    assert(i32(false), "toBeNaN must be called using value types.");
  } else {
    reportActual<T>(actual);
    Expected.type = ValueType.Float;
    Expected.float = NaN;
    Expected.negated = negated;

    // must be a float value
    assert(i32(isFloat<T>(actual)), "toBeNaN assertion must be called on a float value.");

    let isnan: bool = isNaN<T>(actual);

    // Perform the actual isClose assertion
    assert(negated ^ i32(isnan), message);
  }
}
