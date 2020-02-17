// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualHostValue")
declare function reportActualHostValue(id: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearActual")
declare function clearActual(): void;

/**
 * This class is static and contains private global values that contain metadata about the Actual
 * value.
 *
 * @example
 * ```ts
 * Actual.report<string>("This is an expected string.");
 * Actual.report<i32[]>([1, 2, 3]);
 * Actual.report<u8>(42);
 * ```
 */
@global
export class Actual {
  /**
   * This method reports an actual value.
   *
   * @param {T} expected - The expected value and it's type.
   */
  static report<T>(expected: T): void {
    reportActualHostValue(Reflect.toHostValue(expected));
  }

  /**
   * Clear the actual reported value.
   */
  static clear(): void {
    clearActual();
  }
}
