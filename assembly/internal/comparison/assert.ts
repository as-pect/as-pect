/**
 * This method validates that an assertion is true, and throws an error if otherwise.
 *
 * @param {i32} condition - The bool value (converted to an int) that is a representation of the
 * assertion.
 * @param {string} message - The message that is thrown in the Error.
 */
// @ts-ignore: Decorators *are* valid here
@inline
export function assert(condition: i32, message: string): void {
  if (!condition) throw new Error(message);
}
