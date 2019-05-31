import { reportActual } from "../report/reportActual";
import { clearExpected } from "../report/clearExpected";
import { reportExpectedTruthy } from "../report/reportExpectedTruthy";

export function truthyComparison<T>(actual: T, negated: i32, message: string): void {
  reportActual<T>(actual);
  reportExpectedTruthy(negated);

  if (isReference<T>()) {
    // if the reference is null
    if (actual == null) {
      // it should throw if it's not negated
      assert(negated, message);
    } else if (actual instanceof String) {
      let value = changetype<string>(changetype<usize>(actual));
      // it should throw if it's an empty string
      assert(negated ^ i32(value.length != 0), message);
    } else {
      // it should throw it's negated
      assert(!negated, message);
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore T is a float type
      // todo: make this const when const expressions are supported by AS
      let isFalsy: bool = isNaN<T>(actual) || actual == <T>0;
      assert(negated ^ i32(!isFalsy), message);
    } else {
      // todo: make this const when const expressions are supported by AS
      // @ts-ignore: T is integer type and the cast is safe
      let isFalsy: bool = actual == <T>0;
      assert(negated ^ i32(!isFalsy), message);
    }
  }

  clearExpected();
}
