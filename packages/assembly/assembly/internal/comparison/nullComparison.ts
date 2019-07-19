import { Actual } from "../report/Actual";
import { assert } from "./assert";
import { Expected } from "../report/Expected";


// @ts-ignore: Decorators *are* valid here!
@inline
export function nullComparison<T>(actual: T, negated: i32, message: string): void {
  if (!isReference<T>()) {
    ERROR("Expectation<T>#toBeNull must be called with a Reference type T.")
  }
  Actual.report<T>(actual);
  // @ts-ignore
  Expected.report<T>(null, negated);
  assert(negated ^ i32(actual == null), message);
}
