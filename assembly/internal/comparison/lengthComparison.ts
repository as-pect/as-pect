// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedValue")
declare function reportExpectedInteger(value: i32, negated: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualInteger(value: i32, expectation: usize): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

import { Expectation } from "../Expectation";
import { assert } from "./assert";

// @ts-ignore: Decorators *are* valid here!
@inline
export function lengthComparison<T>(expectation: Expectation<T>, actual: T, expected: i32, negated: i32, message: string): void {
  let length: i32 = 0;
  if (isReference<T>()) {
    if (actual == null) {
      assert(i32(false), "toHaveLength assertion called on null actual value.");
    } else if (actual instanceof ArrayBuffer) {
      length = changetype<ArrayBuffer>(actual).byteLength;
    } else {
      // @ts-ignore self must have property length, which will result in a compile time error
      length = actual.length;
    }

    reportActualInteger(length, changetype<usize>(expectation));
    reportExpectedInteger(expected, negated);
    assert(negated ^ i32(length == expected), message);
    clearExpected();
  } else {
    assert(i32(false), "toHaveLength should be called on TypedArrays, ArrayBuffers, Arrays, and classes that have a length property.");
  }
}
