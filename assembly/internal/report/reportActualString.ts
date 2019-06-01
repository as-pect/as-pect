import { Actual, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActualString(value: string): void {
  let pointer: usize = changetype<usize>(value);
  __retain(pointer);
  Actual.type = ValueType.String;
  __release(Actual.reference);
  Actual.reference = pointer;
  Actual.stack = getLogStackTrace();
}
