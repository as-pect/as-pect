import { reportActualInteger } from "../report/reportActualInteger";
import { reportExpectedInteger } from "../report/reportExpectedInteger";
import { clearExpected } from "../report/clearExpected";

// @ts-ignore: Decorators *are* valid here!
@inline
export function lengthComparison<T>(actual: T, expected: i32, negated: i32, message: string): void {
  let length: i32 = 0;
  if (isReference<T>()) {
    if (actual == null) {
      assert(false, "toHaveLength assertion called on null actual value.");
    } else if (actual instanceof ArrayBuffer) {
      length = changetype<ArrayBuffer>(actual).byteLength;
    } else {
      // @ts-ignore self must have property length, which will result in a compile time error
      length = actual.length;
    }

    reportActualInteger(length);
    reportExpectedInteger(expected, negated);
    assert(negated ^ i32(length == expected), message);
    clearExpected();
  } else {
    assert(false, "toHaveLength should be called on TypedArrays, ArrayBuffers, Arrays, and classes that have a length property.");
  }
}
