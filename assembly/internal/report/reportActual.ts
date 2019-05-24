// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualNull")
declare function reportActualNull(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualFloat(value: f64): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualValue")
declare function reportActualInteger(value: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualReference")
declare function reportActualReference(value: usize, offset: i32): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportActualString")
declare function reportActualString(value: string): void;

/**
 * This function performs reporting to javascript what the actual value of this expectation is.
 */
// @ts-ignore: Decorators *are* valid here!
@inline
export function reportActual<T>(actual: T): void {
  // if T is a reference type...
  if (isReference<T>()) {
    // check to see if it's null
    if (actual == null) {
      reportActualNull();
      // otherwise it might be a string
    } else if (actual instanceof String) {
      // @ts-ignore this is already a string, and we can pass up the string reference quickly
      reportActualString(<string>actual);
      // it also might be an array buffer
    } else if (actual instanceof ArrayBuffer) {
      let buff = changetype<ArrayBuffer>(actual);
      // reporting the reference is as simple as using the pointer and the byteLength property.
      reportActualReference(changetype<usize>(buff), buff.byteLength);
    } else {
      // otherwise report the reference in a default way
      reportActualReference(changetype<usize>(actual), offsetof<T>());
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore: this cast is valid because it's already a float and this upcast is not lossy
      reportActualFloat(<f64>actual);
    } else {
      // @ts-ignore: this cast is valid because it's already an integer, but this is a lossy conversion
      reportActualInteger(<i32>actual);
    }
  }
}
