import { assert } from "./assert";
import { Expectation } from "../Expectation";

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "clearExpected")
declare function clearExpected(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string, expectation: usize): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportExpectedString")
declare function reportExpectedString(value: string, negated: i32): void;

/**
 * This method is responsible for actually calling a provided function and asserting if it throws or
 * not.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function tryCallComparison<T>(expectation: Expectation<T>, actual: T, negated: i32, message: string): void {
  if (isFunction<T>()) {
    //todo: make this const when AS supports it
    let func: () => void = changetype<() => void>(actual);
    let throws: bool = !tryCall(func);
    reportActualString(throws ? "throws" : "not throws", changetype<usize>(expectation));
    reportExpectedString((negated ? "not throws" : "throws"), negated);
    assert(negated ^ i32(throws), message);
    clearExpected();
  } else {
    assert(i32(false), "toThrow must be called with an actual function.");
  }
}
