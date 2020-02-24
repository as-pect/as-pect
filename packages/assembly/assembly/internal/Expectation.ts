import { toIncludeComparison } from "./comparison/toIncludeComparison";
import { toIncludeEqualComparison } from "./comparison/toIncludeEqualComparison";
import { Actual } from "./Actual";
import { Expected } from "./Expected";
import { assert } from "./assert";

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

/**
 * The AssemblyScript class that represents an expecation.
 */
// @ts-ignore: Decorators *are* valid here
@global
export class Expectation<T> {
  /**
   * This i32 is set to 1 if the expectation is negated. Using the _not (xor) condition assertion
   * makes assertions very easy to write and understand.
   */
  _not: i32 = 0;

  /** This is the actual value. */
  actual: T;

  /**
   * Construct an assertion.
   *
   * @param {T} actual - The actual value.
   */
  constructor(actual: T) {
    this.actual = actual;
  }

  /**
   * This property negates the assertion by setting the internal _not property.
   */
  public get not(): Expectation<T> {
    this._not = 1;
    return this;
  }

  /**
   * This method reports value and reference equality.
   *
   * @param {T} expected - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  public toBe(expected: T, message: string = ""): void {
    let equals = i32(this.actual == expected);
    Actual.report(this.actual);
    Expected.report(expected, this._not);

    // The assertion is either the items equal, or the expectation is negated
    assert(equals ^ this._not, message);
    Actual.clear();
    Expected.clear();
  }

  /**
   * This method reports strict equality on bytes. It has a special path for ArrayBuffers.
   *
   * @param {T} expected - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  public toStrictEqual(expected: T, message: string = ""): void {
    let result = Reflect.FAILED_MATCH;
    result = Reflect.equals(this.actual, expected);

    let equals = i32(result == Reflect.SUCCESSFUL_MATCH);
    Actual.report(this.actual);
    Expected.report(expected);

    assert(equals ^ this._not, message);

    Actual.clear();
    Expected.clear();
  }

  /**
   * This method performs a strict equal comparison of two T values.
   *
   * @deprecated
   * @param {T} expected - This is the expected block reference.
   * @param {string} message - The message that describes this expectation.
   */
  public toBlockEqual(expected: T, message: string = ""): void {
    WARNING(
      "toBlockEqual has been deprecated and results in a toStrictEqual call.",
    );
    this.toStrictEqual(expected, message);
  }

  public toBeTruthy(message: string = ""): void {
    let actual = this.actual;
    Actual.report(actual);
    let negated = this._not;
    Expected.reportTruthy(negated);

    if (isReference(actual)) {
      if (isNullable<T>()) {
        // strings require an extra length check
        if (actual instanceof String) {
          let truthy = i32(changetype<usize>(actual) != 0 && actual.length > 0);
          assert(truthy ^ negated, message);
        } else {
          let truthy = i32(changetype<usize>(actual) != 0);
          assert(truthy ^ negated, message);
        }
      } else {
        // strings require an extra length check
        if (actual instanceof String) {
          let truthy = i32(actual.length > 0);
          assert(truthy ^ negated, message);
        } else {
          assert(i32(!negated), message);
        }
      }
    } else {
      if (isFloat<T>(actual)) {
        let truthy = i32(!isNaN(actual) && actual != 0.0);
        assert(truthy ^ negated, message);
      } else if (isInteger<T>(actual)) {
        let truthy = i32(actual != 0);
        assert(truthy ^ negated, message);
      }
    }

    Actual.clear();
    Expected.clear();
  }

  public toBeFalsy(message: string = ""): void {
    let actual = this.actual;
    Actual.report(actual);
    let negated = this._not;
    Expected.reportFalsy(negated);

    if (isReference(actual)) {
      if (isNullable<T>()) {
        // strings require an extra length check
        if (actual instanceof String) {
          let falsy = i32(changetype<usize>(actual) == 0 || actual.length == 0);
          assert(falsy ^ negated, message);
        } else {
          let falsy = i32(changetype<usize>(actual) == 0);
          assert(falsy ^ negated, message);
        }
      } else {
        // strings require an extra length check
        if (actual instanceof String) {
          let falsy = i32(actual.length == 0);
          assert(falsy ^ negated, message);
        } else {
          assert(negated, message);
        }
      }
    } else {
      if (isFloat<T>(actual)) {
        // @ts-ignore: actual is a float value
        let falsy = i32(isNaN(actual) || actual == 0.0);
        assert(falsy ^ negated, message);
      } else if (isInteger<T>(actual)) {
        let falsy = i32(actual == 0);
        assert(falsy ^ negated, message);
      }
    }

    Actual.clear();
    Expected.clear();
  }

  public toThrow(message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;

    if (!isFunction<T>())
      ERROR(
        "Expectation#toThrow assertion called on actual T where T is not a function reference",
      );
    if (idof<T>() != idof<() => void>())
      ERROR(
        "Expectation#toThrow assertion called on actual T where T is not a function reference with signature () => void",
      );

    let func = changetype<() => void>(actual);
    let throws = i32(!tryCall(func));
    Actual.report(throws ? "Throws" : "Not Throws");

    /**
     * The expectation should throw by default, and will be negated by `Expectation.negated` later.
     */
    Expected.report("Throws", negated);
    assert(negated ^ throws, message);
    Actual.clear();
    Expected.clear();
  }

  public toBeGreaterThan(expected: T, message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;
    Actual.report(actual);
    Expected.report(expected, negated);

    if (!isDefined(actual > expected))
      ERROR(
        "Invalid call to toBeGreaterThan. Generic type T must have an operator implemented for the greaterThan (>) operation.",
      );

    if (isNullable<T>()) {
      // Perform reference type null checks
      assert(
        i32(expected !== null),
        "Nullable comparison fails, expected value is null.",
      );
      assert(
        i32(actual !== null),
        "Nullable comparison fails, actual value is null.",
      );
    }

    // Compare float types
    if (isFloat<T>(actual)) {
      assert(
        i32(!isNaN<T>(expected)),
        "Value comparison fails, expected value is NaN.",
      );
      assert(
        i32(!isNaN<T>(actual)),
        "Value comparison fails, actual value is NaN.",
      );
    }

    // do actual greater than comparison
    assert(negated ^ i32(actual > expected), message);
    Actual.clear();
    Expected.clear();
  }

  public toBeGreaterThanOrEqual(expected: T, message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;

    Actual.report<T>(actual);
    Expected.report<T>(expected, negated);

    if (!isDefined(actual >= expected))
      ERROR(
        "Invalid call to toBeGreaterThanOrEqual. Generic type T must have an operator implemented for the greaterThanOrEqual (>=) operation.",
      );

    if (isNullable<T>()) {
      // Perform reference type null checks
      assert(
        i32(expected !== null),
        "Nullable comparison fails, expected value is null.",
      );
      assert(
        i32(actual !== null),
        "Nullable comparison fails, actual value is null.",
      );
    }

    // Compare float types
    if (isFloat<T>()) {
      assert(
        i32(!isNaN<T>(expected)),
        "Value comparison fails, expected value is NaN.",
      );
      assert(
        i32(!isNaN<T>(actual)),
        "Value comparison fails, actual value is NaN.",
      );
    }

    // do actual greater than comparison
    assert(negated ^ i32(actual >= expected), message);
    Actual.clear();
    Expected.clear();
  }

  public toBeLessThan(expected: T, message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;
    Actual.report(actual);
    Expected.report(expected, negated);

    if (!isDefined(actual < expected))
      ERROR(
        "Invalid call to toBeLessThan. Generic type T must have an operator implemented for the lessThan (<) operation.",
      );

    if (isNullable<T>()) {
      // Perform reference type null checks
      assert(
        i32(expected !== null),
        "Nullable comparison fails, expected value is null.",
      );
      assert(
        i32(actual !== null),
        "Nullable comparison fails, actual value is null.",
      );
    }

    // Compare float types
    if (isFloat<T>()) {
      assert(
        i32(!isNaN<T>(expected)),
        "Value comparison fails, expected value is NaN.",
      );
      assert(
        i32(!isNaN<T>(actual)),
        "Value comparison fails, actual value is NaN.",
      );
    }

    // do actual less than comparison
    assert(negated ^ i32(actual < expected), message);
    Actual.clear();
    Expected.clear();
  }

  public toBeLessThanOrEqual(expected: T, message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;
    Actual.report<T>(actual);
    Expected.report<T>(expected, negated);

    if (!isDefined(actual > expected))
      ERROR(
        "Invalid call to toBeLessThanOrEqual. Generic type T must have an operator implemented for the lessThanOrEqual (<=) operation.",
      );

    if (isNullable<T>()) {
      // Perform reference type null checks
      assert(
        i32(expected !== null),
        "Nullable comparison fails, expected value is null.",
      );
      assert(
        i32(actual !== null),
        "Nullable comparison fails, actual value is null.",
      );
    }

    // Compare float types
    if (isFloat<T>()) {
      assert(
        i32(!isNaN<T>(expected)),
        "Value comparison fails, expected value is NaN.",
      );
      assert(
        i32(!isNaN<T>(actual)),
        "Value comparison fails, actual value is NaN.",
      );
    }

    // do actual less than comparison
    assert(negated ^ i32(actual <= expected), message);
    Actual.clear();
    Expected.clear();
  }

  public toBeNull(message: string = ""): void {
    if (!isNullable<T>())
      ERROR("toBeNull assertion must be called with a nullable type T.");
    let negated = this._not;
    let actual = this.actual;
    Actual.report(actual);
    // @ts-ignore: T is nullable and a reference
    Expected.report<T>(null, negated);
    assert(negated ^ i32(changetype<usize>(actual) == 0), message);
    Actual.clear();
    Expected.clear();
  }

  public toBeCloseTo(
    expected: T,
    decimalPlaces: i32 = 2,
    message: string = "",
  ): void {
    let actual = this.actual;
    let negated = this._not;

    // must be called on a float T
    if (!isFloat<T>())
      ERROR(
        "Expectation<T>#toBeCloseTo must be called with a Float value type T.",
      );
    Actual.report(actual);
    Expected.report(expected, negated);

    // both actual and expected values must be finite
    assert(
      i32(isFinite(actual)),
      "toBeCloseTo assertion fails because a actual value is not finite",
    );
    assert(
      i32(isFinite(expected)),
      "toBeCloseTo assertion fails because expected value is not finite.",
    );

    /**
     * isCloseTo assertion is calculated by using the formula `|expected - actual| < epsilon`.
     * Epsilon is calculated by using `1 / numberOfDigits` or just `Math.pow(0.1, decimalPlaces)`.
     */
    // @ts-ignore tooling errors because T does not extend a numeric value type. This compiles just fine.
    let isClose = i32(abs<T>(expected - actual) < Math.pow(0.1, decimalPlaces));
    assert(negated ^ isClose, message);
    Actual.clear();
    Expected.clear();
  }

  public toBeNaN(message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;

    // must be called on a float T
    if (!isFloat<T>())
      ERROR("Expectation<T>#toBeNaN must be called with a Float value type T.");
    Actual.report(actual);

    // @ts-ignore: The compiler should pass bit count (64/32 bit float to the report function)
    Expected.report<T>(NaN, negated);

    let isNaNValue = i32(isNaN(actual));
    assert(isNaNValue ^ negated, message);
    Actual.clear();
    Expected.clear();
  }

  public toBeFinite(message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;

    // must be called on a float T
    if (!isFloat<T>())
      ERROR("Expectation<T>#toBeNaN must be called with a Float value type T.");
    Actual.report(actual);
    Expected.reportFinite(negated);

    let isFiniteValue = i32(isFinite(actual));
    assert(isFiniteValue ^ negated, message);
    Actual.clear();
    Expected.clear();
  }

  public toHaveLength(expected: i32, message: string = ""): void {
    let actual = this.actual;
    let negated = this._not;
    let length = <i32>0;

    if (actual instanceof ArrayBuffer) {
      length = actual.byteLength;
    } else {
      // @ts-ignore: This results in a compile time check for a length property with a better error message
      if (!isDefined(actual.length))
        ERROR(
          "Expectation<T>#toHaveLength cannot be called on type T where T.length is not defined.",
        );
      // @ts-ignore: This results in a compile time check for a length property with a better error message
      length = actual.length;
    }
    Actual.report(actual);

    Expected.report(length);

    let lengthsEqual = i32(length == expected);
    assert(lengthsEqual ^ negated, message);
    Actual.clear();
    Expected.clear();
  }

  public toInclude<U>(expected: U, message: string = ""): void {
    toIncludeComparison<T, U>(this.actual, expected, this._not, message);
    Actual.clear();
    Expected.clear();
  }

  // @ts-ignore: valueof<T> requires that T extends something with an @operator("[]")
  public toContain(expected: valueof<T>, message: string = ""): void {
    this.toInclude(expected, message);
  }

  public toIncludeEqual<U>(expected: U, message: string = ""): void {
    toIncludeEqualComparison<T, U>(this.actual, expected, this._not, message);
    Actual.clear();
    Expected.clear();
  }

  // @ts-ignore: valueof<T> will throw a compiler if it is not valid
  public toContainEqual<U>(expected: U, message: string = ""): void {
    // @ts-ignore Array<U> instanceof check
    this.toIncludeEqual<U>(expected, message);
  }
}

/**
 * Global exported function expected. Used to describe an expectation.
 *
 * @param {T} actual - The actual value of the expectation
 */
// @ts-ignore: decorators *are* valid here
@global
export function expect<T>(actual: T): Expectation<T> {
  return new Expectation<T>(actual);
}

/**
 * @deprecated
 * A shorthand for `expect<(): => void>(callback: () => void)`.
 *
 * @param {() => void} cb - The callback to be tested.
 */
// @ts-ignore: decorators *are* valid here
@global
export function expectFn(cb: () => void): Expectation<() => void> {
  WARNING("expectFn() has been deprecated. Use expect() instead.");
  return new Expectation(cb);
}
