import { assert } from "./assert";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

/**
 * This method is responsible for actually calling a provided function and asserting if it throws or
 * not.
 *
 * @param T - The expectation type.
 * @param {T} actual - The actual function pointer.
 * @param {i32} negated - The indicator that the assertion is negated.
 * @param {string} message - The message provided to the TestResult if the comparison fails.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function tryCallComparison<T>(actual: T, negated: i32, message: string): void {
  if (isFunction<T>()) {
    //todo: make this const when AS supports it
    let func: () => void = changetype<() => void>(actual);
    let throws: bool = !tryCall(func);
    reportActual<string>(throws ? "Throws" : "Not Throws");

    /**
     * The expectation should throw by default, and will be negated by `Expectation.negated` later.
     */
    reportExpected<string>("Throws", negated);
    assert(negated ^ i32(throws), message);
  } else {
    reportActual<T>(actual);
    reportExpected<string>("Function", 0);
    assert(i32(false), "toThrow must be called with an actual function.");
  }
}
