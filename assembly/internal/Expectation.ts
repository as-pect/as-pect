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
declare function reportExpectedNull(negated: i32): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualFloat(value: f64): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualInteger(value: i32): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedValue")
declare function reportExpectedFloat(value: f64, negated: i32): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedValue")
declare function reportExpectedInteger(value: i32, negated: i32): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualReference")
declare function reportActualReference(value: usize, offset: i32): void;

  // @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedReference")
declare function reportExpectedReference(value: usize, offset: i32, negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedString")
declare function reportExpectedString(value: string, negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedTruthy")
declare function reportExpectedTruthy(negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFalsy")
declare function reportExpectedFalsy(negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFinite")
declare function reportExpectedFinite(negated: i32): void;

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
  @inline
  public toBe(expected: T, message: string = ""): void {
    // use default reporting methods
    this.reportActual();
    this.reportExpected(expected);

    // assert value or reference equality
    assert(this._not ^ i32(expected == this.actual), message);

    this.cleanup();
  }

  /**
   * This method reports strict equality on bytes. It has a special path for ArrayBuffers.
   *
   * @param {T} expected - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  @inline
  public toStrictEqual(expected: T, message: string = ""): void {

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
      this.cleanup();
      return;
    }

    if (isNullable<T>()) {
      // fast path, both values aren't null together, so if any of them are null, they do not equal
      if (expected == null || this.actual == null) {
        assert(this._not, message);
        this.cleanup();
        return;
      }
    }

    // slow path, assert a memcompare
    if (isReference<T>()) {
      let compareResult = memory.compare(
        changetype<usize>(expected),
        changetype<usize>(this.actual),
        offsetof<T>(),
      );
      assert(this._not ^ i32(compareResult == 0), message);
      this.cleanup();
      return;
    } else { // delegate toBe
      this.toBe(expected);
    }
  }

  /**
   * This in internal helper to compare two array buffers.
   *
   * @param {ArrayBuffer} expected - This is the expected array buffer value.
   * @param {string} message - The message that describes this expectation.
   */
  @inline
  private toStrictEqualArrayBuffer(expected: T, message: string = ""): void {
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

    var expectedNull: i32 = i32(expectedBuff == null);
    var actualNull: i32 = i32(actualBuff == null);

    if (expectedNull ^ actualNull) {
      assert(this._not, message);
    } else {
      let lengthEqual = actualBuff.byteLength == expectedBuff.byteLength;
      let bytesEqual = memory.compare(changetype<usize>(actualBuff), changetype<usize>(expectedBuff), actualBuff.byteLength) == 0;


      assert(this._not ^ i32(lengthEqual && bytesEqual), message);
    }
    this.cleanup();
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

    if (isNullable<T>()) {
      if (this.actual instanceof String) {
        assert(this._not ^ i32(this.actual != null && this.actual.length > 0), message);
        return;
      }
    }

    // value/reference truthiness, because a null reference will be 0
    assert(this._not ^ i32(!!this.actual), message);
    this.cleanup();
  }

  @inline
  public toBeFalsy(message: string = ""): void {
    this.reportActual();
    reportExpectedFalsy(this._not);

    if (isNullable<T>()) {
      if (this.actual instanceof String) {
        assert(this._not ^ i32(this.actual.length == 0), message);
        return;
      }
    }

    if (isReference<T>()) {
      assert(this._not ^ i32(this.actual == null), message);
      return;
    }

    assert(this._not ^ i32(!this.actual), message);
    this.cleanup();
  }

  @inline
  public toThrow(message: string = ""): void {
    // todo: Follow up support on this
    // assert(isFunction<T>(), "toThrow expectation must be called on a function type.");

    // @ts-ignore: this.value is assumed to be a function, and this could cause many problems
    var throws: bool = !tryCall(this.actual);
    reportActualString(throws ? "throws" : "not throws");
    reportExpectedString("throws", this._not);

    assert(this._not ^ i32(throws), message);
    this.cleanup();
  }

  @inline
  public toBeGreaterThan(expected: T, message: string = ""): void {
    this.reportActual();
    this.reportExpected(expected);

    if (isNullable<T>()) {
      // Perform reference type null checks
      if (isReference<T>()) {
        assert(expected != null, "Reference comparison fails, expected value is null.");
        assert(this.actual != null, "Reference comparison fails, actual value is null.");
      }
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      assert(!isNaN<T>(expected!), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // do actual greater than comparison
    assert(this._not ^ i32(this.actual! > expected!), message);
    this.cleanup();
  }

  @inline
  public toBeGreaterThanOrEqualTo(expected: T, message: string = ""): void {
    // report the values
    this.reportActual();
    this.reportExpected(expected);

    if (isNullable<T>()) {
      // Perform reference type null checks
      if (isReference<T>()) {
        assert(expected != null, "Reference comparison fails, expected value is null.");
        assert(this.actual != null, "Reference comparison fails, actual value is null.");
      }
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      assert(!isNaN<T>(expected!), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // do actual greater than or equal to comparison
    assert(this._not ^ i32(this.actual! >= expected!), message);
    this.cleanup();
  }

  @inline
  public toBeLessThan(expected: T, message: string = ""): void {
    // report the values
    this.reportActual();
    this.reportExpected(expected);

    if (isNullable<T>()) {
      // Perform reference type null checks
      if (isReference<T>()) {
        assert(expected != null, "Reference comparison fails, expected value is null.");
        assert(this.actual != null, "Reference comparison fails, actual value is null.");
      }
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      assert(!isNaN<T>(expected!), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // do actual less than comparison
    assert(this._not ^ i32(this.actual! < expected!), message);
    this.cleanup();
  }

  @inline
  public toBeLessThanOrEqualTo(expected: T, message: string = ""): void {
    this.reportActual();
    this.reportExpected(expected);

    if (isNullable<T>()) {
      // Perform reference type null checks
      if (isReference<T>()) {
        assert(expected != null, "Reference comparison fails, expected value is null.");
        assert(this.actual != null, "Reference comparison fails, actual value is null.");
      }
    }

    // Compare float types
    if (isFloat<T>(this.actual)) {
      assert(!isNaN<T>(expected!), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.actual), "Value comparison fails, actual value is NaN.");
    }

    // do actual less than or equal to comparison
    assert(this._not ^ i32(this.actual! <= expected!), message);
    this.cleanup();
  }

  @inline
  public toBeNull(message: string = ""): void {
    this.reportActual();
    reportExpectedNull(this._not);
    if (isNullable<T>()) {
      assert(this._not ^ i32(this.actual == null), message);
    } else {
      /**
       * Numbers are never null, so the following example is what this line tests for. If this
       * assertion is not negated for value types, it will throw.
       *
       * @example
       * expect<i32>(1).not.toBeNull();
       */
      assert(this._not, message);
    }
    this.cleanup();
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

      // actual must be finite
      assert(isFinite<T>(this.actual!), "toBeCloseTo assertion fails because a actual value is not finite");

      // expected must be finite
      assert(isFinite<T>(expected!), "toBeCloseTo assertion fails because expected value is not finite.");

      /**
       * isCloseTo assertion is calculated by using the formula `|expected - actual| < epsilon`.
       * Epsilon is calculated by using `1 / numberOfDigits` or just `Math.pow(0.1, decimalPlaces)`.
       */

      // @ts-ignore tooling errors because T does not extend a numeric value type. This compiles just fine.
      var isClose: bool = abs<T>(expected - this.actual) < Math.pow(0.1, decimalPlaces);

      assert(this._not ^ i32(isClose), message);
      this.cleanup();
    }

  }

  @inline
  public toBeNaN(message: string = ""): void {
    // toBeNaN must not be called on a reference type.
    if (isReference<T>()) {
      assert(false, "toBeNaN must be called using value types.");
    } else {
      this.reportActual();
      reportExpectedFloat(NaN, this._not);

      // must be a float value
      assert(isFloat<T>(this.actual), "toBeNaN assertion must be called on a float value.");

      let isnan: bool = isNaN<T>(this.actual!);

      // Perform the actual isClose assertion
      assert(this._not ^ i32(isnan), message);

      this.cleanup();
    }
  }


  @inline
  public toBeFinite(message: string = ""): void {
    // toBeFinite should not be called on a reference type
    if (isReference<T>()) {
      assert(false, "toBeFinite must not be called on reference types.");
    } else {
      this.reportActual();
      reportExpectedFinite(this._not);

      // must be a float value
      assert(isFloat<T>(this.actual), "toBeFinite must only be called with float value types.");

      let finite: bool = isFinite<T>(this.actual!);

      // perfor the actual assertion
      assert(this._not ^ i32(finite), message);

      this.cleanup();
    }
  }

  private reportActual(): void {
    if (isNullable<T>()) {
      if (this.actual instanceof String) {
        if (this.actual == null) {
          reportActualNull();
        } else {
          // @ts-ignore this is already a string
          reportActualString(<string>this.actual);
        }
      } else if (isReference<T>()) {
        if (this.actual == null) {
          reportActualNull();
        } else {
          reportActualReference(changetype<usize>(this.actual), offsetof<T>());
        }
      }
    } else {
      if (isFloat<T>()) {
        // @ts-ignore: this cast is valid because it's already a float
        reportActualFloat(<f64>this.actual);
      } else {
        // @ts-ignore: this cast is valid because it's already an integer
        reportActualInteger(<i32>this.actual);
      }
    }
  }

  private reportExpected(expected: T): void {
    if (isNullable<T>()) {
      if (this.actual instanceof String) {
        if (this.actual == null) {
          reportExpectedNull(this._not);
        } else {
          // @ts-ignore: this cast is valid because it's already a string
          reportExpectedString(<string>expected, this._not);
        }
      } else if (isReference<T>()) {
        if (expected == null) {
          reportExpectedNull(this._not);
        } else {
          reportExpectedReference(changetype<usize>(expected), offsetof<T>(), this._not);
        }
      }
    } else {
      if (isFloat<T>()) {
        // @ts-ignore: this cast is valid because it's already a float
        reportExpectedFloat(<f64>expected, this._not);
      } else {
        // @ts-ignore: this cast is valid because it's already an integer
        reportExpectedInteger(<i32>expected, this._not);
      }
    }
  }

  /**
   * This private function removes all the actual and expected values from the host, then frees the
   * Expectation<T> reference to prevent memory leaks.
   */
  private cleanup(): void {
    clearExpected();
    if (!isManaged<Expectation<T>>()) {
      memory.free(changetype<usize>(this));
    }
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
 * A shorthand for `expect<(): => void>(callback: () => void)`.
 *
 * @param {() => void} cb - The callback to be tested.
 */
// @ts-ignore: decorators *are* valid here
@global
export function expectFn(cb: () => void): Expectation<() => void> {
  return new Expectation<() => void>(cb);
}
