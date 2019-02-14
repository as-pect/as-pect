
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

  constructor(value: T | null) {
    this.value = value;
  }

  public get not(): Expectation<T> {
    this._not = true;
    return this;
  }

  @inline
  public toBe(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (value == this.value), message);
    clearExpected();
  }

  @inline
  public toStrictEqual(value: T | null, message: string = ""): void {
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

  @inline
  public toBeTruthy(message: string = ""): void {
    this.reportActual();
    reportExpectedTruthy(this._not);
    reportExpectedString<string>("truthy", this._not);

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
    if (isReference<T>() && (value == null || this.value == null)) assert(false, message);
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value > value), message);
    clearExpected();
  }

  @inline
  public toBeGreaterThanOrEqualTo(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);
    if (isReference<T>() && (value == null || this.value == null)) assert(false, message);
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value >= value), message);
    clearExpected();
  }

  @inline
  public toBeLessThan(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);
    if (isReference<T>() && (value == null || this.value == null)) assert(false, message);
    // @ts-ignore: bool is a number type that returns 1, and thus `^` compiles properly
    assert(this._not ^ (this.value < value), message);
    clearExpected();
  }

  @inline
  public toBeLessThanOrEqualTo(value: T | null, message: string = ""): void {
    this.reportActual();
    this.reportExpected(value);
    if (isReference<T>() && (value == null || this.value == null)) assert(false, message);
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
