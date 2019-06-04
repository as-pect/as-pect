import { assert } from "./assert";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";

// @ts-ignore: Decorators *are* valid here
@inline
export function arrayComparison<T>(actual: T, expected: T, negated: i32, message: string): void {
  let matches: i32 = 1;
  reportActual<T>(actual);
  reportExpected<T>(expected, negated);

  // @ts-ignore: Can't garuntee T extends array, so supress the error
  if (isManaged(unchecked(actual[0]))) {
    assert(i32(false), "Array comparison on array of references not supported, assertion fail.");
  } else {
    if (actual === expected) {
      assert(i32(!negated), message);
      return;
    }

    if (actual == null || expected == null) {
      assert(negated, message);
      return;
    }

    // @ts-ignore: Actual value if instance of Array, so length is a valid property
    if (actual.length != expected.length) {
      assert(negated, message);
      return;
    }

    // @ts-ignore: Actual value if instance of Array, so length is a valid property
    let length: i32 = actual.length;
    for (let i = 0; i < length; i++) {
      // @ts-ignore: Actual value if instance of Array, so array access is valid
      if (unchecked(actual[i]) != unchecked(expected[i])) {
        matches = 0;
        break;
      }
    }

    assert(matches ^ negated, message);
  }
}