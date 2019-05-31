import { reportActual } from "../report/reportActual";
import { reportExpectedFalsy } from "../report/reportExpectedFalsy";
import { clearExpected } from "../report/clearExpected";

// @ts-ignore: Decorators *are* valid here!
@inline
export function falsyComparison<T>(actual: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  reportExpectedFalsy(negated);

  if (isReference<T>()) {
    // if the reference is null
    if (actual == null) {
      // it should throw if it's not negated
      assert(!negated, message);
    } else if (actual instanceof String) {
      let value = changetype<string>(changetype<usize>(actual));
      // it should throw if it's an empty string
      assert(negated ^ i32(value.length == 0), message);
    } else {
      // it should throw it's not negated
      assert(negated, message);
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore T is a float type
      var isFalsy = isNaN<T>(actual) || actual == <T>0;
      assert(negated ^ i32(isFalsy), message);
    } else {
      assert(negated ^ i32(!actual), message);
    }
  }

  clearExpected();
}
