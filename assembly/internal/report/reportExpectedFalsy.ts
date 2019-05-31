import { reportExpectedString } from "./reportExpectedString";

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedFalsy(negated: i32): void {
  reportExpectedString("falsy", negated);
}
