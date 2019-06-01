import { Actual, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActualReference(value: usize, offset: i32): void {
  Actual.type = ValueType.Reference;
  Actual.reference = changetype<ArrayBuffer>(value);
  Actual.offset = offset;
  Actual.stack = getLogStackTrace();
}
