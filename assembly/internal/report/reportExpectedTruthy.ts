import { Expected, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedTruthy(negated: i32): void {
  Expected.type = ValueType.Truthy;
  Expected.stack = getLogStackTrace();
}
