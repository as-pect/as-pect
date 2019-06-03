import { toIncludeComparison } from "./toIncludeComparison";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { assert } from "./assert";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string, expectation: usize): void;

// @ts-ignore Decorators *are* valid here
@inline
export function toIncludeEqualComparison<T extends Array<U>, U>(actual: T, expected: U, negated: i32, message: string): void {
  if (!isReference<U>(expected)) {
    toIncludeComparison<T, U>(actual, expected, negated, message);
    return;
  }

  reportActual<string>("included reference");
  reportExpected<U>(expected, negated);

  let included: bool = false;
  for (let i = 0; i < actual.length; i++) {
    let item: U = actual[i];
    if (item === expected) {
      included = true;
      break;
    } else if (item != null && expected != null) {
      let compare = memory.compare(
        changetype<usize>(item),
        changetype<usize>(expected),
        offsetof<U>(),
      );

      if (compare === 0) {
        included = true;
        break;
      }
    }
  }

  assert(i32(included) ^ negated, message);
}
