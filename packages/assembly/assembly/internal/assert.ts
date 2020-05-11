/**
 * This method validates that an assertion is true, and throws an error if otherwise.
 *
 * @param {i32} condition - The bool value (converted to an int) that is a representation of the
 * assertion.
 * @param {i32} negated - An indicator if the assertion was negated.
 * @param {string} message - The message that is thrown in the Error.
 */
// @ts-ignore: Decorators *are* valid here
@external("__aspect", "assert")
export declare function assert(condition: i32, negated: i32, message: string | null): void;
