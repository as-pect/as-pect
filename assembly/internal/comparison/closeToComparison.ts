import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { assert } from "./assert";

/**
 * This method compares two float values and asserts they are close to each other.
 *
 * @param T - The type of the expectation, must be a float value
 * @param {T} actual - The actual value.
 * @param {T} expected - The expected value.
 * @param {i32} decimalPlaces - The amount of decimal places used for this comparison.
 * @param {i32} negated - The value indicating that assertion is negated.
 * @param {string} message - The message describing the assertion.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function closeToComparison<T>(actual: T, expected: T, decimalPlaces: i32, negated: i32, message: string): void {
  // T must not be a reference
  if (isReference<T>()) {
    assert(i32(false), "toBeCloseTo cannot be called on value types.");
  } else {
    reportActual<T>(actual);
    reportExpected<T>(expected, negated);

    /**
     * This assertion can technically be called with an `i32` or `i64` value. We must assert that
     * T is a float at runtime.
     */
    assert(i32(isFloat<T>(actual)), "toBeCloseTo assertion must be called on a float value.");

    /**
     * Both the actual and the expected values must be finite.
     */
    assert(i32(isFinite<T>(actual)), "toBeCloseTo assertion fails because a actual value is not finite");
    assert(i32(isFinite<T>(expected)), "toBeCloseTo assertion fails because expected value is not finite.");

    /**
     * isCloseTo assertion is calculated by using the formula `|expected - actual| < epsilon`.
     * Epsilon is calculated by using `1 / numberOfDigits` or just `Math.pow(0.1, decimalPlaces)`.
     */
    // @ts-ignore tooling errors because T does not extend a numeric value type. This compiles just fine.
    var isClose: bool = abs<T>(expected - actual) < Math.pow(0.1, decimalPlaces);
    assert(negated ^ i32(isClose), message);
  }
}
