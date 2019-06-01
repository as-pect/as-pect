import { Expected, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedFloat(value: f64, negated: i32): void {
  Expected.type = ValueType.Float;
  Expected.value = value;
  Expected.negated = negated;
  Expected.stack = getLogStackTrace();
}
