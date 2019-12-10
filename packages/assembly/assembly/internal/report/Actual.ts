import { ValueType } from "./ValueType";
import { Box } from "./Box";
import { ArrayBufferView } from "arraybuffer";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualNull")
declare function reportActualNull(stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualFloat(value: f64, signed: bool, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualInteger(value: i32, signed: bool, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualReference")
declare function reportActualReferenceExternal(value: usize, offset: i32, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualArray")
declare function reportActualArray(value: usize, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualLong")
declare function reportActualLong(value: usize, signed: bool, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getStackTrace")
declare function getStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualBool")
declare function reportActualBool(value: usize, stackTrace: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualFunction")
declare function reportActualFunction(value: i32, stackTrace: i32): void;

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
   * This is the Actual value type.
   */
  static type: ValueType = ValueType.Unset;
  /**
   * This indicated if an actual integer or long is signed.
   */
  static signed: bool = false;
  /**
   * This is an actual float value.
   */
  static float: f64 = 0;
  /**
   * This is an actual integer value.
   */
  static integer: i32 = 0;
  /**
   * This is an actual reference value, stored as a pointer.
   */
  static reference: usize;
  /**
   * If the actual type is a reference, the size of the block will be stored here.
   */
  static offset: i32 = 0;

  /**
   * The id of the external stack trace to avoid transferring strings into web assembly.
   */
  static stackTrace: i32 = -1;

  /**
   * The indicator that the current stored pointer is managed.
   */
  static isManaged: bool = false;

  /**
   * Clear the actual value.
   */
  static clear(): void {
    Actual.type = ValueType.Unset;

    /**
     * If there is a reference still being retained, release it and set it to null.
     */
    if (Actual.reference > 0) {
      if (Actual.isManaged) __release(Actual.reference);
      Actual.reference = null;
      Actual.isManaged = false;
    }

    Actual.stackTrace = -1;
  }

  /**
   * This function performs reporting to javascript what the actual value of this expectation is.
   *
   * @param {T} actual - The actual value to be reported.
   */
  static report<T>(actual: T): void {
    // get the stack trace
    Actual.stackTrace = getStackTrace();

    // if T is a reference type...
    if (isReference<T>()) {

      if (isNullable<T>()) {
        if (actual === null) {
          Actual.type = ValueType.Null;
          return;
        }
      }

      let ptr = changetype<usize>(actual);

      if (isFunction<T>(actual)) {
        Actual.type = ValueType.Function;
        Actual.reference = ptr;
        return;
      }

      // if the reference is managed, retain it for later reporting
      if (isManaged<T>()) __retain(ptr);

      // if the current stored reference is managed, release it
      if (Actual.isManaged) __release(Actual.reference);

      Actual.reference = ptr;
      Actual.isManaged = isManaged<T>();

      // it might be an array
      if (actual instanceof ArrayBufferView) {
        Actual.type = ValueType.Array;
        // or a string
      } else if (actual instanceof String) {
        Actual.type = ValueType.String;
        // it also might be an array buffer
      } else if (actual instanceof ArrayBuffer) {
        Actual.type = ValueType.Reference;
        let buff = changetype<ArrayBuffer>(ptr);
        Actual.offset = buff.byteLength;
        // reporting the reference is as simple as using the pointer and the byteLength property.
      } else {
        // otherwise report the reference in a default way
        Actual.type = ValueType.Reference;
        Actual.offset = offsetof<T>();
      }
    } else {
      if (isFloat<T>()) {
        Actual.type = ValueType.Float;
        // @ts-ignore: this cast is valid because it's already a float and this upcast is not lossy
        Actual.float = <f64>actual;
      } else if (actual instanceof i64 || actual instanceof u64) {
        /**
         * If the value is greater than an i32, we need to convert it to a `u64` or `i64`.
         */
        Actual.type = ValueType.Long;
        Actual.signed = actual instanceof i64;
        let ref = new Box<T>(actual);
        let ptr = changetype<usize>(ref);
        __retain(ptr);
        __release(Actual.reference);
        Actual.reference = ptr;
        Actual.isManaged = true;
      } else if (actual instanceof bool) {
        Actual.type = ValueType.Bool;
        Actual.integer = i32(actual);
      } else {
        Actual.type = ValueType.Integer;
        Actual.signed = actual instanceof i32
          || actual instanceof i16
          || actual instanceof i8;
        // @ts-ignore: this cast is valid because it's already an `i32`
        Actual.integer = <i32>actual;
      }
    }
  }
}

/**
 * This method reports to the host what the current Actual value is.
 */
export function __sendActual(): void {
  switch (Actual.type) {
    case ValueType.Unset:
      return;
    case ValueType.Array:
      reportActualArray(changetype<usize>(Actual.reference), Actual.stackTrace);
      break;
    case ValueType.Float:
      // Do not convert to unsigned because floats are signed
      reportActualFloat(Actual.float, true, Actual.stackTrace);
      break;
    case ValueType.Integer:
      reportActualInteger(Actual.integer, Actual.signed, Actual.stackTrace);
      break;
    case ValueType.Null:
      reportActualNull(Actual.stackTrace);
      break;
    case ValueType.Reference:
      reportActualReferenceExternal(Actual.reference, Actual.offset, Actual.stackTrace);
      break;
    case ValueType.String:
      reportActualString(changetype<string>(Actual.reference), Actual.stackTrace);
      break;
    case ValueType.Long:
      reportActualLong(Actual.reference, Actual.signed, Actual.stackTrace);
      break;
    case ValueType.Bool:
      reportActualBool(Actual.integer, Actual.stackTrace);
      break;
    case ValueType.Function:
      reportActualFunction(Actual.integer, Actual.stackTrace);
      break;
  }
}

// @ts-ignore: Decorators *are* valid here
@inline
export function reportActualReference<T>(ptr: usize, offset: i32): void {
  Actual.type = ValueType.Reference;
  if (isManaged<T>()) __retain(ptr);
  if (Actual.isManaged) __release(Actual.reference);
  Actual.reference = ptr;
  Actual.offset = offset;
  Actual.isManaged = isManaged<T>();
}
