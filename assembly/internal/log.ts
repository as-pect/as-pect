// @ts-ignore: decorators *are* valid here
@external("__aspect", "logString")
declare function logString<T>(value: T): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logReference")
declare function logReference<T>(value: T, offset: i32): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logValue")
declare function logValue<T>(value: T | null): void;

// @ts-ignore: decorators *are* valid here
@external("__aspect", "logNull")
declare function logNull(): void;

// @ts-ignore: decorators *are* valid here
@global
export function log<T>(value: T | null): void {
  if (value instanceof String) {
    if (value == null) {
      logNull();
    } else {
      logString<T>(value);
    }
  } else if (isReference<T>()) {
    if (value == null) {
      logNull();
    } else {
      logReference<T>(value, offsetof<T>());
    }
  } else {
    logValue<T>(value);
  }
}
