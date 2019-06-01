import { Actual, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActualFloat(value: f64): void {
  Actual.type = ValueType.Float;
  Actual.value = value;
  Actual.stack = getLogStackTrace();
}
