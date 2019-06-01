import { Actual, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActualReference(value: usize, offset: i32): void {
  __retain(value);
  Actual.type = ValueType.Reference;
  __release(Actual.reference);
  Actual.reference = value;
  Actual.offset = offset;
  Actual.stack = getLogStackTrace();
}
