import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";
import { clearExpected } from "../report/clearExpected";

// @ts-ignore decorators *are* valid here
@inline
export function toIncludeComparison<T extends Array<U>, U>(actual: T, expected: U, negated: i32, message: string): void {
  reportActual<string>("included");
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
  clearExpected();
}
