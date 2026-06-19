# `@as-pect/assembly` types

AssemblyScript test files get the `as-pect` testing API through the `@as-pect/assembly` package declarations. Unlike the JavaScript packages in this section, these are ambient AssemblyScript declarations consumed by test files, not named JavaScript package-root exports.

The package-root compiled runtime surface is intentionally small: `memory`, `__call(...)`, and `__ignoreLogs(...)` are emitted from `build/release.d.ts`. Test authors normally consume the ambient declarations below through the init template instead of importing those runtime exports directly.

## Test declarations

```ts
declare function describe(description: string, callback: () => void): void;
declare function it(description: string, callback: () => void): void;
declare function test(description: string, callback: () => void): void;
declare function xit(description: string, callback: () => void): void;
declare function xtest(description: string, callback: () => void): void;
declare function throws(description: string, callback: () => void, message?: string): void;
declare function itThrows(description: string, callback: () => void, message?: string): void;
declare function todo(description: string): void;
```

## Hooks

```ts
declare function beforeEach(callback: () => void): void;
declare function beforeAll(callback: () => void): void;
declare function afterEach(callback: () => void): void;
declare function afterAll(callback: () => void): void;
```

## Expectations and logging

```ts
declare function expect<T>(actual: T | null): Expectation<T>;
declare function expectFn(cb: () => void): Expectation<() => void>;
declare function log<T>(value: T | null): void;
declare function debug(): void;
```

## `Expectation<T>`

```ts
declare class Expectation<T> {
  constructor(actual: T | null);

  toBe(expected: T | null, message?: string): void;
  toStrictEqual(expected: T | null, message?: string): void;
  toBlockEqual(expected: T | null, message?: string): void;
  toThrow(message?: string): void;
  toThrowWith(expectedMessage: string, message?: string): void;
  toBeTruthy(message?: string): void;
  toBeNull(message?: string): void;
  toBeFalsy(message?: string): void;
  toBeGreaterThan(expected: T | null, message?: string): void;
  toBeLessThan(expected: T | null, message?: string): void;
  toBeGreaterThanOrEqual(expected: T | null, message?: string): void;
  toBeLessThanOrEqual(expected: T | null, message?: string): void;
  toBeCloseTo(expected: T, decimalPlaces?: number, message?: string): void;
  toBeNaN(message?: string): void;
  toBeFinite(message?: string): void;
  toHaveLength(expected: i32, message?: string): void;
  toInclude<U extends valueof<T> | indexof<T>>(expected: U, message?: string): void;
  toContain(expected: valueof<T>, message?: string): void;
  toIncludeEqual<U extends indexof<T> | valueof<T>>(expected: U, message?: string): void;
  toContainEqual<U extends indexof<T> | valueof<T>>(expected: U, message?: string): void;
  toMatchSnapshot(name?: string | null): void;

  not: Expectation<T>;
  actual: T | null;
}
```

## Reporting helpers

```ts
declare class Actual {
  static report<T>(value: T): void;
  static clear(): void;
}

declare class Expected {
  static report<T>(value: T, negated?: i32): void;
  static reportTruthy(negated?: i32): void;
  static reportFalsy(negated?: i32): void;
  static reportFinite(negated?: i32): void;
  static reportSnapshot<T>(actual: T, name?: string | null): void;
  static clear(): void;
}
```

## Reflection helpers

```ts
declare class Reflect {
  static SUCCESSFUL_MATCH: i32;
  static FAILED_MATCH: i32;
  static DEFER_MATCH: i32;

  static toReflectedValue<T>(value: T, seen?: Map<usize, i32>): i32;
  static equals<T>(left: T, right: T, stack?: usize[], cache?: usize[]): i32;
  static attachStackTrace(id: i32): void;
}
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
