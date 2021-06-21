// @ts-ignore: decorators *are* valid here
@external("__aspect", "logReflectedValue")
declare function logReflectedValue(value: i32): void;

let ignoreLogs: bool = false;

export function __ignoreLogs(value: bool): void {
  ignoreLogs = value;
}

// @ts-ignore: decorators *are* valid here
@global
export function log<T>(value: T): void {
  if (ignoreLogs) return;
  // The T parameter must be passed directly
  let reflectedId = Reflect.toReflectedValue<T>(value);
  Reflect.attachStackTrace(reflectedId);
  logReflectedValue(reflectedId);
}
