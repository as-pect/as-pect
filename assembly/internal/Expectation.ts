// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualNull")
declare function reportActualNull(): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedNull")
declare function reportExpectedNull(negated: bool): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualValue<T>(value: T): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedValue")
declare function reportExpectedValue<T>(value: T, negated: bool): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualReference")
declare function reportActualReference<T>(value: T, offset: i32): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedReference")
declare function reportExpectedReference<T>(value: T, offset: i32, negated: bool): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString<T>(value: T): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedString")
declare function reportExpectedString<T>(value: T, negated: bool): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedTruthy")
declare function reportExpectedTruthy(negated: bool): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFalsy")
declare function reportExpectedFalsy(negated: bool): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFinite")
declare function reportExpectedFinite(negated: bool): void;

/**
 * The AssemblyScript class that represents an expecation.
 */
// @ts-ignore: Decorators *are* valid here
@global
export class Expectation<T> {
  /** This bool is set to true if the expectation is negated. */
  _not: bool = false;

  /** This is the actual value. */
  actual: T | null;

  /**
   * Construct an assertion.
   *
   * @param {T | null} actual - The actual value.
   */
  constructor(actual: T | null) {
    this.actual = actual;
  }

  /**
   * This property negates the assertion by setting the internal _not property.
   */
  public get not(): Expectation<T> {
    this._not = true;
    return this;
  }

  /**
   * This method reports value and reference equality.
   *
   * @param {T | null} expected - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  @inline
  public toBe(expected: T | null, message: string = ""): void {
    // use default reporting methods
    this.reportActual();
    this.reportExpected(expected);

    // assert value or reference equality
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (expected == this.actual), message);

    // clear the expected messages in case an unreachable() occurs later.
    clearExpected();
  }

  /**
   * This method reports strict equality on bytes. It has a special path for ArrayBuffers.
   *
   * @param {T | null} expected - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  @inline
  public toStrictEqual(expected: T | null, message: string = ""): void {

    // special path for strict equality on ArrayBuffer
    if (expected instanceof ArrayBuffer) {
      this.toStrictEqualArrayBuffer(expected, message);
      return;
    }

    // report the actual and expected values
    this.reportActual();
    this.reportExpected(expected);

    // fast path, the value is itself
    if (expected == this.actual) {
      assert(!this._not, message);
      return;
    }

    // fast path, both values aren't null together, so if any of them are null, they do not equal
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    if (isReference<T>() && (expected == null || this.actual == null)) {
      assert(this._not, message);
      return;
    }

    // slow path, assert a memcompare
    if (isReference<T>()) {
      let compareResult = memory.compare(
        changetype<usize>(expected),
        changetype<usize>(this.actual),
        offsetof<T>(),
      );
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (compareResult == 0), message);
    } else {
      this.toBe(expected);
    }
    clearExpected();
  }

  /**
   * This in internal helper to compare two array buffers.
   *
   * @param {ArrayBuffer} expected - This is the expected array buffer value.
   * @param {string} message - The message that describes this expectation.
   */
  @inline
  private toStrictEqualArrayBuffer(expected: T | null, message: string = ""): void {
    // cast the values to ArrayBuffer | null
    let expectedBuff: ArrayBuffer | null = changetype<ArrayBuffer>(changetype<usize>(expected));
    let actualBuff: ArrayBuffer | null = changetype<ArrayBuffer>(changetype<usize>(this.actual));

    // report the expected rederence
    if (expectedBuff == null) {
      reportExpectedNull(this._not);
    } else {
      reportExpectedReference(expectedBuff.data, expectedBuff.byteLength, this._not);
    }

    // report the actual reference
    if (actualBuff == null) {
      reportActualNull();
    } else {
      reportActualReference(actualBuff.data, actualBuff.byteLength);
    }

    var expectedNull: bool = expectedBuff == null;
    var actualNull: bool = actualBuff == null;

    // @ts-ignore: Bitwise xor on a boolean works as expected
    if (expectedNull ^ actualNull) {
      assert(this._not, message);
    } else {
      let lengthEqual = actualBuff.byteLength == expectedBuff.byteLength;
      let bytesEqual = memory.compare(changetype<usize>(actualBuff), changetype<usize>(expectedBuff), actualBuff.byteLength) == 0;

      // @ts-ignore: Bitwise xor on a boolean works as expected
      assert(this._not ^ (lengthEqual && bytesEqual), message);
    }
    clearExpected();
  }

  /**
   * This method expects values to be truthy.
   *
   * @param {string} message - The message that describes the expectation.
   */
  @inline
  public toBeTruthy(message: string = ""): void {
    this.reportActual();
    reportExpectedTruthy(this._not);

    if (this.actual instanceof String) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.actual != null && this.actual.length > 0), message);
      return;
    }
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (!!this.actual), message);
    clearExpected();
  }

  @inline
  public toBeFalsy(message: string = ""): void {
    this.reportActual();
    reportExpectedFalsy(this._not);

    if (this.actual instanceof String) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.actual.length == 0), message);
      return;
    }

    if (isReference<T>()) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.actual == null), message);
      return;
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (!this.actual), message);
    clearExpected();
  }

  @inline
  public toThrow(message: string = ""): void {
    // @ts-ignore: this.value is a function, we have to assume it's not null
    var throws: bool = !tryCall(this.actual);
    reportActualString<string>(throws ? "throws" : "not throws");
    reportExpectedString("throws", this._not);
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ throws, message);
    clearExpected();
  }

  @inline
  public toBeGreaterThan(expected: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(expected);

    // Compare the reference types
    if (isReference<T>()) {
      assert(expected != null, "Reference comparison fails, expected value is null.");
      assert(this.actual != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(expected), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.actual > expected), message);
    clearExpected();
  }

  @inline
  public toBeGreaterThanOrEqualTo(expected: T | null, message: string = ""): void {
    // report the values
    this.reportActual();
    this.reportExpected(expected);

    // Compare the reference types
    if (isReference<T>()) {
      assert(expected != null, "Reference comparison fails, expected value is null.");
      assert(this.actual != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(expected), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.actual >= expected), message);
    clearExpected();
  }

  @inline
  public toBeLessThan(expected: T | null, message: string = ""): void {
    // report the values
    this.reportActual();
    this.reportExpected(expected);

    // Compare the reference types
    if (isReference<T>()) {
      assert(expected != null, "Reference comparison fails, expected value is null.");
      assert(this.actual != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(expected), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.actual < expected), message);
    clearExpected();
  }

  @inline
  public toBeLessThanOrEqualTo(expected: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(expected);

    // Compare the reference types
    if (isReference<T>()) {
      assert(expected != null, "Reference comparison fails, expected value is null.");
      assert(this.actual != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(expected), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.actual <= expected), message);
    clearExpected();
  }

  @inline
  public toBeNull(message: string = ""): void {
    this.reportActual();
    reportExpectedNull(this._not);
    if (isReference<T>()) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.actual == null), message);
    } else {
      assert(this._not, message);
    }
    clearExpected();
  }

  @inline
  public toBeCloseTo(expected: T, decimalPlaces: i32 = 2, message: string = ""): void {
    // T must not be a reference
    if (isReference<T>()) {
      assert(false, "toBeCloseTo cannot be called on value types.");
    } else {
      this.reportActual();
      this.reportExpected(expected);

      // must be a float value
      assert(isFloat<T>(this.actual), "toBeCloseTo assertion must be called on a float value.");

      // @ts-ignore Number.isFinite is defined
      assert(isFinite<T>(this.actual), "toBeCloseTo assertion fails because a actual value is not finite");

      // @ts-ignore Number.isFinite is defined
      assert(isFinite<T>(expected), "toBeCloseTo assertion fails because expected value is not finite.");

      /**
       * isCloseTo assertion is calculated by using the formula `|expected - actual| < epsilon`.
       * Epsilon is calculated by using `1 / numberOfDigits` or just `Math.pow(0.1, decimalPlaces)`.
       */
      // @ts-ignore T is definitely a numeric value
      var isClose: bool = abs<T>(expected - this.actual) < Math.pow(0.1, decimalPlaces);

      // @ts-ignore bitwise xor works here
      assert(this._not ^ isClose, message);
      clearExpected();
    }

  }

  @inline
  public toBeNaN(message: string = ""): void {
    // toBeNaN must not be called on a reference type.
    if (isReference<T>()) {
      assert(false, "toBeNaN must be called using value types.");
    } else {
      this.reportActual();
      reportExpectedValue<f64>(NaN, this._not);

      // must be a float value
      assert(isFloat<T>(this.actual), "toBeNaN assertion must be called on a float value.");

      // @ts-ignore value types cannot be null
      let isnan: bool = isNaN<T>(this.actual);

      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ isnan, message);

      clearExpected();
    }

  }


  @inline
  public toBeFinite(message: string = ""): void {
    // toBeFinite should not be called on a reference type
    if (isReference<T>()) {
      assert(false, "toBeFinite must be called using value types.");
    } else {
      this.reportActual();
      reportExpectedFinite(this._not);

      // must be a float value
      assert(isFloat<T>(this.actual), "toBeFinite must only assert float value types.");

      // @ts-ignore value types can never be null
      let finite: bool = isFinite<T>(this.actual);

      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ finite, message);

      clearExpected();
    }
  }

  private reportActual(): void {
    if (this.actual instanceof String) {
      if (this.actual == null) {
        reportActualNull();
      } else {
        reportActualString<T>(this.actual);
      }
    } else if (isReference<T>()) {
      if (this.actual == null) {
        reportActualNull();
      } else {
        reportActualReference<T>(this.actual, offsetof<T>());
      }
    } else {
      // @ts-ignore: value can't be null
      reportActualValue<T>(this.actual);
    }
  }

  private reportExpected(expected: T | null): void {
    if (this.actual instanceof String) {
      if (this.actual == null) {
        reportExpectedNull(this._not);
      } else {
        reportExpectedString(expected, this._not);
      }
    } else if (isReference<T>()) {
      if (expected == null) {
        reportExpectedNull(this._not);
      } else {
        reportExpectedReference<T>(expected, offsetof<T>(), this._not);
      }
    } else {
      // @ts-ignore: value can't be null
      reportExpectedValue<T>(expected, this._not);
    }
  }
}

/**
 * Global exported function expected. Used to describe an expectation.
 *
 * @param {T | null} actual - The actual value of the expectation
 */
// @ts-ignore: decorators *are* valid here
@global
export function expect<T>(actual: T | null): Expectation<T> {
  return new Expectation<T>(actual);
}

/**
 * A shorthand for `expect<(): => void>(callback: () => void)`.
 *
 * @param {() => void} cb - The callback to be tested.
 */
// @ts-ignore: decorators *are* valid here
@global
export function expectFn(cb: () => void): Expectation<() => void> {
  return new Expectation<() => void>(cb);
}
