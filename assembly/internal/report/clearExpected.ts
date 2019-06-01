import { Actual, ValueType, Expected } from "../value";

// @ts-ignore: Decorators *are* valid here!
@inline
export function clearExpected(): void {
  Actual.type = ValueType.None;
  Expected.type = ValueType.None;
}
