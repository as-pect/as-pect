// @ts-ignore: decorators *are* valid here
@external("__aspect", "logHostValue")
declare function logHostValue(value: i32): void;

let ignoreLogs: bool = false;

/**
 * This method is called by the test runner to circumvent item logging.
 *
 * @param {bool} value - Wether to ignore log values or not.
 */
export function __ignoreLogs(value: bool): void {
  ignoreLogs = value;
}

// @ts-ignore: decorators *are* valid here
@global
export function log<T>(value: T): void {
  if (ignoreLogs) return;
  logHostValue(Reflect.toHostValue(value));
}
