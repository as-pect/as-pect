import { Actual, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActualInteger(value: i32): void {
  Actual.type = ValueType.Float;
  Actual.value = <f64>value;
  Actual.stack = getLogStackTrace();
}
