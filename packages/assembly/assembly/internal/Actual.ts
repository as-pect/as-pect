// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualReflectedValue")
declare function reportActualReflectedValue(id: i32): void;

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
   * @param {T} actual - The actual value and it's type.
   */
  static report<T>(actual: T): void {
    let value = Reflect.toReflectedValue(actual);
    Reflect.attachStackTrace(value);
    reportActualReflectedValue(value);
  }

  /**
   * Clear the actual reported value.
   */
  static clear(): void {
    clearActual();
  }
}
