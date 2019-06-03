import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { Expectation } from "../Expectation";
import { assert } from "./assert";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string, expectation: usize): void;

// @ts-ignore decorators *are* valid here
@inline
export function toIncludeComparison<T extends Array<U>, U>(expectation: Expectation<T>, actual: T, expected: U, negated: i32, message: string): void {

  reportActualString("included", changetype<usize>(expectation));
  reportExpected<U>(expected, negated);
  let includes: bool = false;

  for (let i = 0; i < actual.length; i++) {
    let val: U = actual[i];
    if (val === expected) {
      includes = true;
      break;
    }
  }

  assert(negated ^ i32(includes), message);
}