import { logNull } from "./logNull";
import { logInteger } from "./logInteger";
import { logString } from "./logString";
import { logReference } from "./logReference";
import { logFloat } from "./logFloat";

// @ts-ignore: decorators *are* valid here
@global
@inline
export function log<T>(value: T): void {
  if (isReference<T>()) {
    if (value == null) {
      logNull();
    } else if (value instanceof String) {
      // @ts-ignore: this cast is valid because it's already a string
      logString(<string>value);
    } else if (value instanceof ArrayBuffer) {
      let buff = changetype<ArrayBuffer>(changetype<usize>(value));
      logReference(changetype<usize>(buff), buff.byteLength);
    } else {
      logReference(changetype<usize>(value), offsetof<T>());
    }
  } else {
    if (isFloat<T>()) {
      // @ts-ignore: this cast is valid because it's already a float
      logFloat(<f64>value);
    } else {
      // @ts-ignore: this cast is valid because it's already an integer
      logInteger(<i32>value);
    }
  }
}
