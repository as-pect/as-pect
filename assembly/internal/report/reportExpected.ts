import { reportExpectedString } from "./reportExpectedString";
import { reportExpectedReference } from "./reportExpectedReference";
import { reportExpectedInteger } from "./reportExpectedInteger";
import { reportExpectedFloat } from "./reportExpectedFloat";
import { reportExpectedNull } from "./reportExpectedNull";

/**
 * This function performs reporting to javascript what the expected value of this expectation is.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function reportExpected<T>(expected: T, negated: i32): void {
  // if T is a reference type...
  if (isReference<T>()) {
    // check to see if it's null
    if (expected == null) {
      reportExpectedNull(negated);
      // otherwise it might be a string
    } else if (expected instanceof String) {
      // @ts-ignore this is already a string, and we can pass up the string reference quickly
      reportExpectedString(<string>expected, negated);
      // it also might be an array buffer
    } else if (expected instanceof ArrayBuffer) {
      //todo: change this to const when AS supports it
      let buff = changetype<ArrayBuffer>(expected);
      // reporting the reference is as simple as using the pointer and the byteLength property.
      reportExpectedReference(changetype<usize>(buff), buff.byteLength, negated);
    } else {
      // otherwise report the reference in a default way
      reportExpectedReference(changetype<usize>(expected), offsetof<T>(), negated);
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore: this cast is valid because it's already a float and this upcast is not lossy
      reportExpectedFloat(<f64>expected, negated);
    } else {
      // @ts-ignore: this cast is valid because it's already an integer, but this is a lossy conversion
      reportExpectedInteger(<i32>expected, negated);
    }
  }
}
