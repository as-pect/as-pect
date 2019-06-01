import { Expected, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedString(value: string, negated: i32): void {
  let pointer: usize = changetype<usize>(value);
  __retain(pointer);
  Expected.type = ValueType.String;
  __release(Expected.reference);
  Expected.reference = pointer;
  Expected.negated = negated;
  Expected.stack = getLogStackTrace();
}
