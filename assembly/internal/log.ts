// @ts-ignore: decorators *are* valid here
@external("__aspect", "logString")
declare function logString(value: string): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logReference")
declare function logReference(value: usize, offset: i32): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logValue")
declare function logFloat(value: f64): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logValue")
declare function logInteger(value: i32): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logNull")
declare function logNull(): void;

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
