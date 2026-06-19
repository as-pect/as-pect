# Writing tests

`as-pect` test files are AssemblyScript files that describe groups, tests, expectations, hooks, todos, logs, and snapshots.

By default, `asp --init` configures test entries with this glob:

```text
assembly/__tests__/**/*.spec.ts
```

## Basic test shape

Use `describe` to group behavior and `it` or `test` to define an executable test.

```ts
describe("math", () => {
  it("adds numbers", () => {
    expect<i32>(19 + 23).toBe(42);
  });

  test("multiplies numbers", () => {
    expect<i32>(6 * 7).toBe(42);
  });
});
```

Prefer behavior-oriented names. A failure report should read like a sentence:

```text
math adds numbers
```

## Expectations

Create an expectation with `expect<T>(actual)`.

```ts
expect<i32>(42).toBe(42);
expect<string>("as" + "-pect").toBe("as-pect");
```

Most expectation methods accept an optional message:

```ts
expect<i32>(19 + 23).toBe(42, "19 + 23 should equal 42");
```

Use `.not` to negate an expectation:

```ts
expect<i32>(42).not.toBe(0);
expect<bool>(false).not.toBeTruthy();
```

Common expectation methods:

| Method | Use |
| --- | --- |
| `toBe(expected)` | Strict value/reference equality. |
| `toStrictEqual(expected)` | Value equality for values and memory comparison for references. |
| `toBlockEqual(expected)` | Strict memory block equality. |
| `toBeTruthy()` / `toBeFalsy()` | Truthiness/falsiness checks. |
| `toBeNull()` | Null checks for reference types. |
| `toBeGreaterThan(expected)` | Greater-than comparison. |
| `toBeLessThan(expected)` | Less-than comparison. |
| `toBeGreaterThanOrEqual(expected)` | Greater-than-or-equal comparison. |
| `toBeLessThanOrEqual(expected)` | Less-than-or-equal comparison. |
| `toBeCloseTo(expected, decimalPlaces?)` | Floating-point tolerance checks. |
| `toBeNaN()` | NaN checks. |
| `toBeFinite()` | Finite number checks. |
| `toHaveLength(expected)` | Array/string-like length checks. |
| `toInclude(expected)` / `toContain(expected)` | Included value/reference checks. |
| `toIncludeEqual(expected)` / `toContainEqual(expected)` | Included item checks using equality comparison. |
| `toMatchSnapshot(name?)` | Snapshot the actual value. |

For the exact signatures, see [Assertion reference](../reference/assertion-reference.md).

## Function expectations

Use `expectFn` when the subject is a function.

```ts
expectFn((): void => {
  unreachable();
}).toThrow("unreachable should throw");
```

Use `toThrowWith` to assert that the thrown message or stack trace includes expected text:

```ts
expectFn((): void => {
  throw new Error("cats cannot bark");
}).toThrowWith("cannot bark");
```

## Expected failures

Use `throws` or `itThrows` for a test that should fail or throw.

```ts
describe("parser", () => {
  throws("rejects invalid input", () => {
    throw new Error("invalid input");
  });
});
```

## Hooks

Hooks run around tests in the current group.

```ts
let value = 0;

describe("counter", () => {
  beforeAll(() => {
    value = 1;
  });

  beforeEach(() => {
    value += 1;
  });

  afterEach(() => {
    value -= 1;
  });

  afterAll(() => {
    value = 0;
  });

  it("uses setup", () => {
    expect<i32>(value).toBeGreaterThan(0);
  });
});
```

## Todos and skipped tests

Use `todo` for planned behavior that should appear in reports without running.

```ts
describe("division", () => {
  todo("handles divide by zero");
});
```

Use `xit` or `xtest` for a test declaration that should not run.

```ts
xit("temporarily disabled behavior", () => {
  expect<i32>(1).toBe(2);
});
```

## Logs

Use `log<T>(value)` to attach values to the current test or group output.

```ts
it("logs details", () => {
  log<string>("starting assertion");
  log<i32>(42);
  expect<i32>(42).toBe(42);
});
```

Logs are useful while debugging, but remove noisy logs from stable tests unless the output is intentionally diagnostic.

## Snapshots

Use snapshots when the expected value is large or inconvenient to inline.

```ts
it("renders output", () => {
  expect<string>("hello\nworld").toMatchSnapshot("rendered text");
});
```

See [Snapshots](snapshots.md) for update behavior and snapshot file layout.

## Includes

The default config includes files matching:

```text
assembly/__tests__/**/*.include.ts
```

Use include files for shared test setup that should be compiled with every test entry.

## Next steps

- Configure test discovery and compiler settings in [Configuration](configuration.md).
- Learn CLI filters in [CLI](cli.md).
- Add snapshots in [Snapshots](snapshots.md).
- Check exact assertion signatures in [Assertion reference](../reference/assertion-reference.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
