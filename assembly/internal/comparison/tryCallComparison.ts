import { assert } from "./assert";
import { reportActual } from "../report/reportActual";
import { reportExpected } from "../report/reportExpected";

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

/**
 * This method is responsible for actually calling a provided function and asserting if it throws or
 * not.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function tryCallComparison<T>(actual: T, negated: i32, message: string): void {
  if (isFunction<T>()) {
    //todo: make this const when AS supports it
    let func: () => void = changetype<() => void>(actual);
    let throws: bool = !tryCall(func);
    reportActual<string>(throws ? "throws" : "not throws");
    reportExpected<string>((negated ? "not throws" : "throws"), negated);
    assert(negated ^ i32(throws), message);
  } else {
    assert(i32(false), "toThrow must be called with an actual function.");
  }
}
