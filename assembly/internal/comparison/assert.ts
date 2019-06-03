// @ts-ignore: Decorators *are* valid here
@inline
export function assert(condition: i32, message: string): void {
  if (!condition) throw new Error(message);
}
