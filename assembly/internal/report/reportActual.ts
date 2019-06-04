import { Expectation } from "../Expectation";
import { ValueType } from "./ValueType";
import { Box } from "./Box";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualNull")
declare function reportActualNull(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualFloat(value: f64): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualInteger(value: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualReference")
declare function reportActualReferenceExternal(value: usize, offset: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualArray")
declare function reportActualArray(value: usize): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualLong")
declare function reportActualLong(value: usize, signed: bool): void;

export class Actual {
  static type: ValueType = ValueType.Null;
  static float: f64 = 0;
  static integer: i32 = 0;
  static reference: usize;
  static offset: i32 = 0;
  static expectation: usize = 0;
}

export function __sendActual(): void {
  switch (Actual.type) {
    case ValueType.Array:
        reportActualArray(changetype<usize>(Actual.reference));
        break;
    case ValueType.Float:
        reportActualFloat(Actual.float);
        break;
    case ValueType.Integer:
        reportActualInteger(Actual.integer);
        break;
    case ValueType.Null:
        reportActualNull();
        break;
    case ValueType.Reference:
        reportActualReferenceExternal(Actual.reference, Actual.offset);
        break;
    case ValueType.String:
        reportActualString(changetype<string>(Actual.reference))
        break;
    case ValueType.UnsignedLong:
    case ValueType.SignedLong:
        reportActualLong(Actual.reference, Actual.type == ValueType.SignedLong);
        break;
  }
}


/**
 * This function performs reporting to javascript what the actual value of this expectation is.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActual<T>(actual: T): void {
  // if T is a reference type...
  if (isReference<T>()) {
    let ptr = changetype<usize>(actual);
    // check to see if it's null
    if (actual == null) {
      Actual.type = ValueType.Null;
    } else {
      // set the reference first
      __retain(ptr);
      __release(Actual.reference);
      Actual.reference = ptr;
      // it might be an array
      if (isArray<T>()) {
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
    }
  } else {
    if (isFloat<T>()) {
      Actual.type = ValueType.Float;
      // @ts-ignore: this cast is valid because it's already a float and this upcast is not lossy
      Actual.float = <f64>actual;
    } else if (actual instanceof i64 || actual instanceof u64) {
      Actual.type = actual instanceof i64
        ? ValueType.SignedLong
        : ValueType.UnsignedLong;
      let ref = new Box<T>(actual);
      let ptr = changetype<usize>(ref);
      __retain(ptr);
      __release(Actual.reference);
      Actual.reference = ptr;
    } else {
      Actual.type = ValueType.Integer
      // @ts-ignore: this cast is valid because it's already an integer, but this is a lossy conversion
      Actual.integer = <i32>actual;
    }
  }
}


// @ts-ignore: Decorators *are* valid here
@inline
export function reportActualReference(ptr: usize, offset: i32): void {
  Actual.type = ValueType.Reference;
  __retain(ptr);
  __release(Actual.reference);
  Actual.reference = ptr;
  Actual.offset = offset;
}
