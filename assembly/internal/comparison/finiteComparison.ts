// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedFinite")
declare function reportExpectedFinite(negated: i32): void;

import { reportActual } from "../report/reportActual";
import { Expectation } from "../Expectation";
import { assert } from "./assert";

// @ts-ignore: Decorators *are* valid here!
@inline
export function finiteComparison<T>(expectation: Expectation<T>, actual: T, negated: i32, message: string): void {
  // toBeFinite should not be called on a reference type
  if (isReference<T>()) {
    assert(i32(false), "toBeFinite must not be called on reference types.");
  } else {
    reportActual<T>(actual, expectation);
    reportExpectedFinite(negated);

    if (isFloat<T>()) {
      let finite: bool = isFinite<T>(actual);
      assert(negated ^ i32(finite), message);
    } else {
      // must be a float value
      assert(i32(false), "toBeFinite must only be called with float value types.");
    }

    clearExpected();
  }
}
