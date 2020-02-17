import { Actual } from "../Actual";
import { assert } from "../assert";
import { Expected } from "../Expected";

export function nullComparison<T>(actual: T, negated: i32, message: string): void {
  if (!isReference<T>()) ERROR("Expectation<T>#toBeNull must be called with a Reference type T.");
  if (!isNullable<T>()) ERROR("Expectation<T>#toBeNull assertion must be called with nullable type T.");
  Actual.report(actual);
  // @ts-ignore: T is nullable and a reference
  Expected.report<T>(null, negated);
  assert(negated ^ i32(actual === null), message);
}
