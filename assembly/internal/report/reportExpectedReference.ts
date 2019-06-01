import { Expected, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedReference(value: usize, offset: i32, negated: i32): void {
  __retain(value);
  Expected.type = ValueType.Reference;
  __release(Expected.reference);
  Expected.reference = value;
  Expected.offset = offset;
  Expected.negated = negated;
  Expected.stack = getLogStackTrace();
}
