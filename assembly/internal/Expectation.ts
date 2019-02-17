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

// @ts-ignore: Decorators *are* valid here
@global
export class Expectation<T> {
  _not: bool = false;
  value: T | null;

  /**
   * Construct an assertion.
   *
   * @param {T | null} value - The actual value.
   */
  constructor(value: T | null) {
    this.value = value;
  }

  /**
   * This property negates the assertion.
   */
  public get not(): Expectation<T> {
    this._not = true;
    return this;
  }

  /**
   * This method reports value and reference equality.
   *
   * @param {T | null} value - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  @inline
  public toBe(value: T | null, message: string = ""): void {
    // use default reporting methods
    this.reportActual();
    this.reportExpected(value);

    // assert value or reference equality
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (value == this.value), message);

    // clear the expected messages in case an unreachable() occurs later.
    clearExpected();
  }

  /**
   * This method reports strict equality on bytes. It has a special path for ArrayBuffers.
   *
   * @param {T | null} value - The expected value.
   * @param {string} message - The message that describes this assertion.
   */
  @inline
  public toStrictEqual(value: T | null, message: string = ""): void {

    // special path for strict equality on ArrayBuffer
    if (value instanceof ArrayBuffer) {
      this.toStrictEqualArrayBuffer(value, message);
      return;
    }

    this.reportActual();
    this.reportExpected(value);

    // fast path, the value is itself
    if (value == this.value) {
      assert(!this._not, message);
      return;
    }

    // fast path, both values aren't null together, so if any of them are null, they do not equal
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    if (isReference<T>() && (value == null || this.value == null)) {
      assert(this._not, message);
      return;
    }

    // slow path, assert a memcompare
    if (isReference<T>()) {
      let compareResult = memory.compare(
        changetype<usize>(value),
        changetype<usize>(this.value),
        offsetof<T>(),
      );
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (compareResult == 0), message);
    } else {
      this.toBe(value);
    }
    clearExpected();
  }

  private toStrictEqualArrayBuffer(value: T | null, message: string = ""): void {
    // cast the values
    let expectedBuff: ArrayBuffer | null = changetype<ArrayBuffer>(changetype<usize>(value));
    let actualBuff: ArrayBuffer | null = changetype<ArrayBuffer>(changetype<usize>(this.value));

    // report the values
    if (expectedBuff == null) {
      reportExpectedNull(this._not);
    } else {
      reportExpectedReference(expectedBuff.data, expectedBuff.byteLength, this._not);
    }

    if (actualBuff == null) {
      reportActualNull();
    } else {
      reportActualReference(actualBuff.data, actualBuff.byteLength);
    }

    if (expectedBuff == null || actualBuff == null) {
      // @ts-ignore: Bitwise xor on a boolean works as expected
      assert(this._not ^ !(expectedBuff == null ^ actualBuff == null), message);
    } else {
      let lengthEqual = actualBuff.byteLength == expectedBuff.byteLength;
      let bytesEqual = memory.compare(changetype<usize>(actualBuff), changetype<usize>(expectedBuff), actualBuff.byteLength) == 0;

      // @ts-ignore: Bitwise xor on a boolean works as expected
      assert(this._not ^ (lengthEqual && bytesEqual), message);
    }
    clearExpected();
  }

  @inline
  public toBeTruthy(message: string = ""): void {
    this.reportActual();
    reportExpectedTruthy(this._not);

    if (this.value instanceof String) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.value != null && this.value.length > 0), message);
      return;
    }
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (!!this.value), message);
    clearExpected();
  }

  @inline
  public toBeFalsy(message: string = ""): void {
    this.reportActual();
    reportExpectedFalsy(this._not);

    if (this.value instanceof String) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.value.length == 0), message);
      return;
    }

    if (isReference<T>()) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.value == null), message);
      return;
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (!this.value), message);
    clearExpected();
  }

  @inline
  public toThrow(message: string = ""): void {
    // @ts-ignore: this.value is a function, we have to assume it's not null
    var throws: bool = !tryCall(this.value);
    reportActualString<string>(throws ? "throws" : "not throws");
    reportExpectedString("throws", this._not);
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ throws, message);
    clearExpected();
  }

  @inline
  public toBeGreaterThan(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);

    // Compare the reference types
    if (isReference<T>()) {
      assert(value != null, "Reference comparison fails, expected value is null.");
      assert(this.value != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.value)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(value), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.value), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value > value), message);
    clearExpected();
  }

  @inline
  public toBeGreaterThanOrEqualTo(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);

    // Compare the reference types
    if (isReference<T>()) {
      assert(value != null, "Reference comparison fails, expected value is null.");
      assert(this.value != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.value)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(value), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.value), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value >= value), message);
    clearExpected();
  }

  @inline
  public toBeLessThan(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);

    // Compare the reference types
    if (isReference<T>()) {
      assert(value != null, "Reference comparison fails, expected value is null.");
      assert(this.value != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.value)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(value), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.value), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value < value), message);
    clearExpected();
  }

  @inline
  public toBeLessThanOrEqualTo(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);

    // Compare the reference types
    if (isReference<T>()) {
      assert(value != null, "Reference comparison fails, expected value is null.");
      assert(this.value != null, "Reference comparison fails, actual value is null.");
    }

    // Compare float types
    if (isFloat<T>(this.value)) {
      // @ts-ignore: value types cannot be null
      assert(!isNaN<T>(value), "Value comparison fails, expected value is NaN.");
      assert(!isNaN<T>(this.value), "Value comparison fails, actual value is NaN.");
    }

    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value <= value), message);
    clearExpected();
  }

  @inline
  public toBeNull(message: string = ""): void {
    this.reportActual();
    reportExpectedNull(this._not);
    if (isReference<T>()) {
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ (this.value == null), message);
    } else {
      assert(this._not, message);
    }
    clearExpected();
  }

  @inline
  public toBeCloseTo(value: T, decimalPlaces: i32 = 2, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);

    if (isReference<T>()) assert(false, "toBeCloseTo is only meant for value types.");

    // must be a float value
    assert(isFloat<T>(this.value), "toBeCloseTo assertion must be called on a float value.");

    // @ts-ignore: Number.isFinite is defined.
    var isFinite: bool = Number.isFinite(this.value) && Number.isFinite(value);

    // @ts-ignore T is definitely a numeric value
    var isClose: bool = abs<T>(value - this.value) < Math.pow(0.1, decimalPlaces);

    // @ts-ignore bitwise xor works here
    assert(this._not ^ (isClose && isFinite), message);
    clearExpected();
  }

  @inline
  public toBeNaN(message: string = ""): void {
    this.reportActual();
    reportExpectedValue<f64>(NaN, this._not);

    // must not be a reference type
    assert(!isReference<T>(), "toBeNaN must be called on value types");

    // must be a float value
    assert(isFloat<T>(this.value), "toBeNaN assertion must be called on a float value.");

    if (this.value == null) { // if it's 0
      assert(!this._not, message);
    } else {
      var isnan: bool = isNaN<T>(this.value);
      // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
      assert(this._not ^ isnan, message);
    }
    clearExpected();
  }

  private reportActual(): void {
    if (this.value instanceof String) {
      if (this.value == null) {
        reportActualNull();
      } else {
        reportActualString<T>(this.value);
      }
    } else if (isReference<T>()) {
      if (this.value == null) {
        reportActualNull();
      } else {
        reportActualReference<T>(this.value, offsetof<T>());
      }
    } else {
      // @ts-ignore: value can't be null
      reportActualValue<T>(this.value);
    }
  }

  private reportExpected(value: T | null): void {
    if (this.value instanceof String) {
      if (this.value == null) {
        reportExpectedNull(this._not);
      } else {
        reportExpectedString(value, this._not);
      }
    } else if (isReference<T>()) {
      if (value == null) {
        reportExpectedNull(this._not);
      } else {
        reportExpectedReference<T>(value, offsetof<T>(), this._not);
      }
    } else {
      // @ts-ignore: value can't be null
      reportExpectedValue<T>(value, this._not);
    }
  }
}

// @ts-ignore: decorators *are* valid here
@global
export function expect<T>(value: T | null): Expectation<T> {
  return new Expectation<T>(value);
}

// @ts-ignore: decorators *are* valid here
@global
export function expectFn(cb: () => void): Expectation<() => void> {
  return new Expectation<() => void>(cb);
}
