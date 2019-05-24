
// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedValue")
declare function reportExpectedFloat(value: f64, negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

import { reportActual } from "../report/reportActual";

// @ts-ignore: Decorators *are* valid here!
@inline
export function isNaNComparison<T>(actual: T, negated: i32, message: string): void {
  // toBeNaN must not be called on a reference type.
  if (isReference<T>()) {
    assert(false, "toBeNaN must be called using value types.");
  } else {
    reportActual<T>(actual);
    reportExpectedFloat(NaN, negated);

    // must be a float value
    assert(isFloat<T>(actual), "toBeNaN assertion must be called on a float value.");

    let isnan: bool = isNaN<T>(actual);

    // Perform the actual isClose assertion
    assert(negated ^ i32(isnan), message);

    clearExpected();
  }
}