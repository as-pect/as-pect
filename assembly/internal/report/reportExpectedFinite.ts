import { reportExpectedString } from "./reportExpectedString";

// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpectedFinite(negated: i32): void {
  reportExpectedString("finite", negated);
}
