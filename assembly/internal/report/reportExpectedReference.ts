import { Expected, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedReference(value: usize, offset: i32, negated: i32): void {
  Expected.type = ValueType.Reference;
  Expected.reference = changetype<ArrayBuffer>(value);
  Expected.offset = offset;
  Expected.negated = negated;
  Expected.stack = getLogStackTrace();
}
