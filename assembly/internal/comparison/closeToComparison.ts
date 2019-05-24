// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";

// @ts-ignore: Decorators *are* valid here!
@inline
export function closeToComparison<T>(actual: T, expected: T, negated: i32, decimalPlaces: i32, message: string): void {
  // T must not be a reference
  if (isReference<T>()) {
    assert(false, "toBeCloseTo cannot be called on value types.");
  } else {
    reportActual<T>(actual);
    reportExpected<T>(expected, negated);

    // must be a float value
    assert(isFloat<T>(actual), "toBeCloseTo assertion must be called on a float value.");

    // actual must be finite
    assert(isFinite<T>(actual), "toBeCloseTo assertion fails because a actual value is not finite");

    // expected must be finite
    assert(isFinite<T>(expected), "toBeCloseTo assertion fails because expected value is not finite.");

    /**
     * isCloseTo assertion is calculated by using the formula `|expected - actual| < epsilon`.
     * Epsilon is calculated by using `1 / numberOfDigits` or just `Math.pow(0.1, decimalPlaces)`.
     */

    // @ts-ignore tooling errors because T does not extend a numeric value type. This compiles just fine.
    var isClose: bool = abs<T>(expected - actual) < Math.pow(0.1, decimalPlaces);

    assert(negated ^ i32(isClose), message);
    clearExpected()
  }
}
