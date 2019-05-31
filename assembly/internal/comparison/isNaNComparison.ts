import { reportActual } from "../report/reportActual";
import { clearExpected } from "../report/clearExpected";
import { reportExpectedFloat } from "../report/reportExpectedFloat";

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
