import { reportActualString } from "../report/reportActualString";
import { reportExpectedString } from "../report/reportExpectedString";
import { clearExpected } from "../report/clearExpected";

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
    reportActualString(throws ? "throws" : "not throws");
    reportExpectedString((negated ? "not throws" : "throws"), negated);
    assert(negated ^ i32(throws), message);
    clearExpected();
  } else {
    assert(false, "toThrow must be called with an actual function.");
  }
}
