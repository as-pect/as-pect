/**
 * This function creates a test group in the test loader.
 *
 * @param {string} description  - This is the name of the test group.
 * @param {function} callback - A function that contains all of the closures for this test group.
 *
 * @example
 * describe("my test suite", (): void => {
 *   // put your tests here
 * });
 */
declare function describe(description: string, callback: () => void): void;

/**
 * This function creates a test inside the given test group. It must be placed inside a describe
 * block.
 *
 * @param {string} description - This is the name of the test, and should describe a behavior.
 * @param {string} callback - A function that contains a set of expectations for this test.
 *
 * @example
 * describe("the meaning of life", (): void => {
 *   it("should be 42", (): void => {
 *     // put your expectations here
 *     expect<i32>(29 + 13).toBe(42);
 *   });
 * });
 */
declare function it(description: string, callback: () => void): void;


/**
 * This function creates a test inside the given test group. It must be placed inside a describe
 * block.
 *
 * @param {string} description - This is the name of the test, and should describe a behavior.
 * @param {string} callback - A function that contains a set of expectations for this test.
 *
 * @example
 * describe("the meaning of life", (): void => {
 *   test("the value should be 42", (): void => {
 *     // put your expectations here
 *     expect<i32>(29 + 13).toBe(42);
 *   });
 * });
 */
declare function test(description: string, callback: () => void): void;

/**
 * This function creates a callback that is called before each individual test is run in this test
 * group.
 *
 * @param {function} callback - The function to be run before each test in the current test group.
 *
 * @example
 * // create a global
 * var cat: Cat = new Cat();
 *
 * describe("cats", (): void => {
 *   beforeEach((): void => {
 *     cat.meow(1); // meow once per test
 *   });
 * });
 */
declare function beforeEach(callback: () => void): void;

/**
 * This function creates a callback that is called before the whole test group is run, and only
 * once.
 *
 * @param {function} callback - The function to be run before each test in the current test group.
 *
 * @example
 * // create a global
 * var dog: Dog = null;
 * describe("dogs", (): void => {
 *   beforeAll((): void => {
 *     dog = new Dog(); // create a single dog once before the tests start
 *   });
 * });
 */
declare function beforeAll(callback: () => void): void;

/**
 * This function creates a callback that is called after each individual test is run in this test
 * group.
 *
 * @param {function} callback - The function to be run after each test in the current test group.
 *
 * @example
 * // create a global
 * var cat: Cat = new Cat();
 *
 * describe("cats", (): void => {
 *   afterEach((): void => {
 *     cat.sleep(12); // cats sleep a lot
 *   });
 * });
 */
declare function afterEach(callback: () => void): void;


/**
 * This function creates a callback that is called after the whole test group is run, and only
 * once.
 *
 * @param {function} callback - The function to be run after each test in the current test group.
 *
 * @example
 * // create a global
 * var dog: Dog = null;
 * describe("dogs", (): void => {
 *   afterAll((): void => {
 *     memory.free(changetype<usize>(dog)); // free some memory
 *   });
 * });
 */
declare function afterAll(callback: () => void): void;

/**
 * Describes a value and returns an expectation to test the value.
 *
 * @type {T} - The expected type
 * @param {T} value - The value being tested.
 *
 * @example
 * expect<i32>(42).not.toBe(-1, "42 should not be -1");
 * expect<i32>(19 + 23).toBe(42, "19 + 23 should equal 42");
 */
declare function expect<T>(value: T | null): Expectation<T>;

/**
 * Describes a function and returns an expectation to test the function.
 *
 * @param {() => void} callback - The callback being tested.
 *
 * @example
 * expectFn((): void => unreachable()).toThrow("unreachables do not throw");
 * expectFn((): void => {
 *   cat.meow();
 * }).not.toThrow("Uhoh, cats can't meow!");;
 */
declare function expectFn(cb: () => void): Expectation<() => void>;

declare class Expectation<T> {

  /**
   * This expectation performs a strict equality on value types and reference types.
   *
   * @param {T} value - The value to be compared.
   * @param {string} message - The optional message that describes the expectation.
   *
   * @example
   * expect<i32>(42).not.toBe(-1, "42 should not be -1");
   * expect<i32>(19 + 23).toBe(42, "19 + 23 should equal 42");
   */
  toBe(value: T | null, message?: string): void;

  /**
   * This expectation performs a strict equality on value types and performs a memcompare on
   * reference types. If the reference type T has reference types as properties, the comparison does
   * not perform property traversal. It will only compare the pointer values in the memory block.
   *
   * @param {T} value - The value to be compared.
   * @param {string} message - The optional message that describes the expectation.
   *
   * @example
   * expect<Vec3>(new Vec3(1, 2, 3)).toStrictEqual(new Vec(1, 2, 3), "Vectors of the same shape should be equal");
   */
  toStrictEqual(value: T | null, message?: string): void;

  /**
   * If the value is callable, it calls the function, and fails the expectation if it throws, or hits
   * an unreachable().
   *
   * @param message - The optional message that describes the expectation.
   *
   * @example
   * expectFn((): void => unreachable()).toThrow("unreachable() should throw.");
   * expectFn((): void => {
   *   cat.sleep(100); // cats can sleep quite a lot
   * }).not.toThrow("cats should sleep, not throw");
   */
  toThrow(message?: string): void;

  toBeTruthy(message?: string): void;
  toBeNull(message?: string): void;
  toBeFalsy(message?: string): void;
  toBeGreaterThan(value: T | null, message?: string): void;
  toBeLessThan(value: T | null, message?: string): void;
  toBeGreaterThanOrEqualTo(value: T | null, message?: string): void;
  toBeLessThanOrEqualTo(value: T | null, message?: string): void;
  not: Expectation<T>;
  value: T | null;
  _not: bool;
}
