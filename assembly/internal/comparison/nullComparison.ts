import { reportActual } from "../report/reportActual";
import { assert } from "./assert";
import { Expected } from "../report/reportExpected";
import { ValueType } from "../report/ValueType";

// @ts-ignore: Decorators *are* valid here!
@inline
export function nullComparison<T>(actual: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  Expected.type = ValueType.Null;
  if (isReference<T>()) {
    assert(negated ^ i32(actual == null), message);
  } else {
    /**
     * Numbers are never null, so the following example is what this line tests for. If this
     * assertion is not negated for value types, it will throw.
     *
     * @example
     * expect<i32>(1).not.toBeNull();
     */
    assert(negated, message);
  }
}
