# Assertion reference

This page summarizes the AssemblyScript test API from `@as-pect/assembly`.

## Test declarations

```ts
describe(description: string, callback: () => void): void;
it(description: string, callback: () => void): void;
test(description: string, callback: () => void): void;
xit(description: string, callback: () => void): void;
xtest(description: string, callback: () => void): void;
throws(description: string, callback: () => void, message?: string): void;
itThrows(description: string, callback: () => void, message?: string): void;
todo(description: string): void;
```

## Hooks

```ts
beforeEach(callback: () => void): void;
beforeAll(callback: () => void): void;
afterEach(callback: () => void): void;
afterAll(callback: () => void): void;
```

## Expectations

```ts
expect<T>(actual: T | null): Expectation<T>;
expectFn(cb: () => void): Expectation<() => void>;
```

## `Expectation<T>` methods

| Method | Signature |
| --- | --- |
| Strict equality | `toBe(expected: T | null, message?: string): void` |
| Strict/reference equality | `toStrictEqual(expected: T | null, message?: string): void` |
| Block equality | `toBlockEqual(expected: T | null, message?: string): void` |
| Function throws | `toThrow(message?: string): void` |
| Function throws with text | `toThrowWith(expectedMessage: string, message?: string): void` |
| Truthy | `toBeTruthy(message?: string): void` |
| Null | `toBeNull(message?: string): void` |
| Falsy | `toBeFalsy(message?: string): void` |
| Greater than | `toBeGreaterThan(expected: T | null, message?: string): void` |
| Less than | `toBeLessThan(expected: T | null, message?: string): void` |
| Greater than or equal | `toBeGreaterThanOrEqual(expected: T | null, message?: string): void` |
| Less than or equal | `toBeLessThanOrEqual(expected: T | null, message?: string): void` |
| Close floating-point value | `toBeCloseTo(expected: T, decimalPlaces?: number, message?: string): void` |
| NaN | `toBeNaN(message?: string): void` |
| Finite | `toBeFinite(message?: string): void` |
| Length | `toHaveLength(expected: i32, message?: string): void` |
| Includes | `toInclude<U extends valueof<T> | indexof<T>>(expected: U, message?: string): void` |
| Contains alias | `toContain(expected: valueof<T>, message?: string): void` |
| Includes equal | `toIncludeEqual<U extends indexof<T> | valueof<T>>(expected: U, message?: string): void` |
| Contains equal alias | `toContainEqual<U extends indexof<T> | valueof<T>>(expected: U, message?: string): void` |
| Snapshot | `toMatchSnapshot(name?: string | null): void` |

## Negation

```ts
expect<i32>(42).not.toBe(0);
```

`not` returns the same expectation with negation applied.

## Logging and debugging

```ts
log<T>(value: T | null): void;
debug(): void;
```

Use `log` for values you want visible in reporter output.

## Related pages

- [Writing tests](../using/writing-tests.md)
- [Snapshots](../using/snapshots.md)
- [`@as-pect/assembly` types](../types/assembly.md)

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
