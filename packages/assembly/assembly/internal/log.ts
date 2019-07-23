import { Box } from "./report/Box";
import { ArrayBufferView } from "arraybuffer";

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logString")
declare function logString(value: string): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logReference")
declare function logReference(value: usize, offset: i32): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logValue")
declare function logFloat(value: f64, signed: bool): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logValue")
declare function logInteger(value: i32, signed: bool): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logNull")
declare function logNull(): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logArray")
declare function logArray(value: usize): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logLong")
declare function logLong(value: usize, signed: bool): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logBool")
declare function logBool(value: i32): void;

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
  if (isReference<T>()) {
    if (isNullable<T>()) {
      if (value === null) {
        logNull();
        return;
      }
    }
    if (value instanceof ArrayBufferView) {
      logArray(changetype<usize>(value));
    } else if (value instanceof String) {
      // @ts-ignore: this cast is valid because it's already a string
      logString(<string>value);
    } else if (value instanceof ArrayBuffer) {
      let buff = changetype<ArrayBuffer>(changetype<usize>(value));
      logReference(changetype<usize>(buff), buff.byteLength);
    } else {
      logReference(changetype<usize>(value), offsetof<T>());
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore: this cast is valid because it's already a float
      logFloat(<f64>value, true);
    } else if (value instanceof bool) {
      logBool(i32(value));
    } else if (value instanceof i64 || value instanceof u64) {
      let box = new Box<T>(value);
      logLong(changetype<usize>(box), value instanceof i64);
    } else {
      logInteger(
        // @ts-ignore: this cast is valid because it's already an integer
        <i32>value,
        value instanceof i32 // determine if the value is unsigned
        || value instanceof i16
        || value instanceof i8,
      );
    }
  }
}
