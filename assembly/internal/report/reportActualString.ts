import { Actual, ValueType } from "../value";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "getLogStackTrace")
declare function getLogStackTrace(): i32;

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActualString(value: string): void {
  Actual.type = ValueType.String;
  Actual.reference = changetype<ArrayBuffer>(value);
  Actual.stack = getLogStackTrace();
}
