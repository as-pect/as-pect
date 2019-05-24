// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";

/**
 * This method is used to do an exact equality comparison. This will directly compare two values
 * exactly.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function exactComparison<T>(actual: T, expected: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  reportExpected<T>(expected, negated);
  assert(negated ^ i32(expected == actual), message);
  clearExpected();
}
