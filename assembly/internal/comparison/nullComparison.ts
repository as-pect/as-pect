// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedNull")
declare function reportExpectedNull(negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

import { reportActual } from "../report/reportActual";

// @ts-ignore: Decorators *are* valid here!
@inline
export function nullComparison<T>(actual: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  reportExpectedNull(negated);
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
  clearExpected();
}
