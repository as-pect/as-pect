declare function describe(description: string, callback: () => void): void;
declare function it(description: string, callback: () => void): void;
declare function test(description: string, callback: () => void): void;
declare function beforeEach(callback: () => void): void;
declare function beforeAll(callback: () => void): void;
declare function afterEach(callback: () => void): void;
declare function afterAll(callback: () => void): void;
declare class Expectation<T> {
  toBe(value: T | null): void;
  toThrow(): void;
  not: Expectation<T>;
  value: T | null;
  _not: bool;
}
declare function expect<T>(value: T | null): Expectation<T>;
