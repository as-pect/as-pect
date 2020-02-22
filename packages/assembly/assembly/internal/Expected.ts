// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportInvalidExpectCall")
declare function reportInvalidExpectCall(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedReflectedValue")
declare function reportExpectedReflectedValue(id: i32, negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedTruthy")
declare function reportExpectedTruthy(negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFalsy")
declare function reportExpectedFalsy(negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFinite")
declare function reportExpectedFinite(negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedSnapshot")
declare function reportExpectedSnapshot(
  name: string,
  value: i32,
  negated: i32
): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

@global
export class Expected {
  /**
   * This value indicates if the test suite is currently running.
   */
  static ready: bool = false;

  /**
   * This method reports an expected value, and wether the expectation was negated.
   *
   * @param {T} expected - The expected value and it's type.
   * @param {i32} negated - A value indicating if the expectation is negated (1 is true) (default: 0)
   */
  static report<T>(expected: T, negated: i32 = 0): void {
    if (!Expected.ready) {
      reportInvalidExpectCall();
      return;
    }
    let value = Reflect.toReflectedValue(expected);
    Reflect.attachStackTrace(value);
    reportExpectedReflectedValue(value, negated);
  }

  /**
   * Report an expected truthy value to the host, and if the expectation is negated.
   *
   * @param {i32} negated - A value, 1 or 0 indicating if the expectation is negated.
   */
  static reportTruthy(negated: i32 = 0): void {
    reportExpectedTruthy(negated);
  }

  /**
   * Report an expected falsy value to the host, and if the expectation is negated.
   *
   * @param {i32} negated - A value, 1 or 0 indicating if the expectation is negated.
   */
  static reportFalsy(negated: i32 = 0): void {
    reportExpectedFalsy(negated);
  }

  /**
   * Report an expected finite value to the host, and if the expectation is negated.
   *
   * @param {i32} negated - A value, 1 or 0 indicating if the expectation is negated.
   */
  static reportFinite(negated: i32 = 0): void {
    reportExpectedFinite(negated);
  }

  /**
   * Report an expected snapshot. Can only be called during a test.
   *
   * @param {string} name - The name of the snapshot.
   * @param {T} value - The snapshot value to be reflected.
   * @param {i32} negated - The value indicating if the expectation is negated.
   */
  static reportSnapshot<T>(name: string, value: T, negated: i32): void {
    reportExpectedSnapshot(
      name,
      Reflect.toReflectedValue(value, new Map<usize, i32>(), false),
      negated
    );
  }

  /**
   * Clear the expected value.
   */
  static clear(): void {
    clearExpected();
  }
}
