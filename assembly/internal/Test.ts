// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportTest")
declare function reportTest(testName: string, callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportBeforeEach")
declare function reportBeforeEach(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportBeforeAll")
declare function reportBeforeAll(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportAfterEach")
declare function reportAfterEach(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportAfterAll")
declare function reportAfterAll(callback: () => void): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportTodo")
declare function reportTodo(description: string): void;

// @ts-ignore: Decorators *are* valid here!
@global
export function todo(description: string): void {
  reportTodo(description);
}

// @ts-ignore: decorators *are* valid here
@global
export function it(description: string, runner: () => void): void {
  test(description, runner);
}

// @ts-ignore: decorators *are* valid here
@global
export function test(description: string, runner: () => void): void {
  reportTest(description, runner);
}

// @ts-ignore: decorators *are* valid here
@global
export function beforeEach(callback: () => void): void {
  reportBeforeEach(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function beforeAll(callback: () => void): void {
  reportBeforeAll(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function afterEach(callback: () => void): void {
  reportAfterEach(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function afterAll(callback: () => void): void {
  reportAfterAll(callback);
}
