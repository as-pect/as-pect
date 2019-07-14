# @as-pect/assembly

## Table Of Contents

1. [Philosophy](#philosophy)
1. [Usage](#usage)
1. [Comparisons](#comparisons)
   - [toBe](#tobe-comparison)
   - [toStrictEqual](#tostrictequal-comparison)
   - [toBlockEqual](#toblockequal-comparison)
   - [toBeTruthy and toBeFalsy](#tobetruthy-and-tobefalsy-comparison)
   - [toBeNaN](#tobenan-comparison)
   - [toBeFinite](#tobefinite-comparison)
   - [toThrow](#tothrow-comparison)
   - [toBeGreaterThan/toBeLessThan](#tobegreaterthan-and-tobelessthan-comparison)\
   - [toBeCloseTo](#tobecloseto-comparison)
   - [toHaveLength](#tohavelength-comparison)
   - [toContain](#tocontain-and-toinclude-comparison)
   - [toContainEqual](#tocontainequal-and-toincludeequal-comparison)
1. [Types And Tooling](#types-and-tooling)
1. [AssemblyScript Compiler Options](#assemblyscript-compiler-options)
1. [Closures](#closures)
1. [Expectations](#expectations)
1. [Logging](#logging)
1. [Contributers](#contributers)

## Philosophy

Testing is the first step of every project and you have a responsibility to
make sure that the software you write works as intended. The `as-pect` project
was created to help quickly scaffold and bootstrap AssemblyScript tests so
that you can be confident in yourself and the software you write.

One of the goals of this project is 100% portability to `jest` so that tests
can be run in two different environments.

## Usage

To use the `@as-pect/assembly` package, typically, it's best to use the
`@as-pect/cli` package to output a binary using `--outputBinary`. However
in the case of generating the binary manually, it's possible to use the
following AssemblyScript `asc` cli options:

<!-- markdownlint-disable MD040 -->

```
asc entry.ts ./node_modules/@as-pect/assembly/assembly/index.ts \
  --use ASC_RTRACE=1 \
  --explicitStart
```

This will compile the binary with all of the required `as-pect` setup functions.

## Comparisons

There are a set of comparison functions defined in the `types/as-pect.d.ts` types
definition. These comparison functions allow you to inspect object and memory
state.

### toBe Comparison

This comparison is used for comparing data using the `==` operator. In
AssemblyScript this operator is used for comparing strings, numbers, and exact
reference equality (or pointer comparison.)

For example, the following statements are valid `toBe` assertions:

```ts
let a = new Vec3(1, 2, 3);
expect<Vec3>(a).toBe(a);
expect<i32>(10).toBe(10);
expect<Vec3>(null).toBe(null);
```

This method is safe to use portably with `jest`.

### toStrictEqual Comparison

This method performs a single `memory.compare()` on two blocks of data. This is
useful for references and strings. For example, using a `toBe()` assertion on
two different references results in a failed assertion:

```ts
let a = new Vec3(1, 2, 3);
let b = new Vec3(1, 2, 3);
expect<Vec3>(a).toBe(b); // fails!
```

Instead, it's posible to compare two different references like this:

```ts
expect<Vec3>(a).toStrictEqual(b); // passes!
```

The following snippet an approximate the JavaScript equivalent for the
`toStrictEqual` comparison:

```ts
// loop over each property (properties are the same at compile time)
for (let prop in a) {
  if (a[prop] === b[prop]) {
    // exact equality check
    continue;
  } else {
    assert(negated);
  }
}
assert(!negated);
```

If the object has child references, like strings or pointers to other blocks
of memory, the comparison will fail because the pointers are different. This
happens because `as-pect` cannot perform object traversal. Instead, a custom
method should be used to traverse child references to compare equality.

The `toStrictEqual` comparison, however, does perform a `==` comparison before
opting into using a full memory comparison. If the `@operator("==")` is
overridden, then it's possible for two references to be compared using this
method:

```ts
class Vec3 {
  constructor(public a: f64 = 0.0, public b: f64 = 0.0, public c: f64 = 0.0) {}

  // override the operator
  @operator("==")
  protected __equals(ref: Vec3): bool {
    return this.a == ref.a && this.b == ref.b && this.c == ref.c;
  }
}
```

This method is _not_ safe to use portably with `jest` yet. Once `Reflection`
is supported by AssemblyScript, `as-pect` will support compatibility
between `jest`'s version of this function.

### toBlockEqual Comparison

This comparison is the same comparison used on `ArrayBuffer` and `String`s.
It compares the bytes of the heap allocations by obtaining the exact size
of the block and then performing a memcompare if the `actual` and `expected`
blocks match.

Only use this comparison when comparing `ArrayBuffer` references.

```ts
let buffer = new ArrayBuffer(100); // 100 bytes long heap allocation
let buffer2 = new ArrayBuffer(100); // another buffer

expect<ArrayBuffer>(buffer).toBlockEqual(buffer2);
```

### toBeTruthy and toBeFalsy Comparison

These comparisons are used to determine if a value is truthy or falsy in the
JavaScript sense. In JavaScript there are only six falsy values:

- `false`
- `0`
- `""`
- `null`
- `undefined`
- `NaN`

In AssemblyScript, there is no `undefined`, so `as-pect` will treat each of
those values as falsy. Truthy values are anything that is not falsy,

```ts
expect<bool>(true).toBeTruthy();
expect<Vec3>(new Vec3(1, 2, 3)).toBeTruthy();
expect<i32>(1).toBeTruthy();
expect<string>("Something!").toBeTruthy();
expect<bool>(false).toBeFalsy();
expect<Vec3>(null).toBeFalsy();
expect<i32>(0).toBeFalsy();
expect<f64>(NaN).toBeFalsy();
expect<string>("").toBeFalsy();
```

These methods are safe to use with `jest`.

### toBeNaN Comparison

This comparison is only used for float values to determine if the value is a
`NaN` value.

```ts
expect<f32>(NaN).toBeNaN(); // passes
expect<f64>(1.0).not.toBeNaN(); // passes

/** This results in a runtime error, despite not being NaN. */
expect<Vec3>(new Vec3()).not.toBeNaN();
```

This method is technically safe to use with `jest` with the assumption
that `as-pect` will fail if used with a reference type.

### toBeNull Comparison

This comparison looks specifically for a `null` value.

```ts
expect<Vec3>(null).toBeNull(); // valid assertion
```

In the case of numeric values, numbers cannot be `null` in AssemblyScript.
Thus, the following example will throw a runtime error.

```ts
expect<i32>(null).toBeNull();
```

This method is safe to use with `jest` assuming you explicitly return `null`
and avoid use of `undefined` which does not exist in AssemblyScript.

### toBeFinite Comparison

This comparison is used to detect if float values are finite. The following
values are not finite in JavaScript or AssemblyScript.

- `Infinity`
- `-Infinity`
- `NaN`

The following assertions are true.

```ts
expect<f64>(1.0).toBeFinite();
expect<f32>(Infinity).not.toBeFinite();
expect<f64>(NaN).not.toBeFinite();
```

As long as the number values are always `f32` or `f64` (or `number` in
JavaScript or AssemblyScript,) `toBeFinite` is a safe assertion to use
portably with jest.

### toThrow Comparison

This comparison is used to test and see if a function throws an error. In the
case of AssemblyScript and `as-pect`, the function will be called from within
a JavaScript `try` block, and if the function throws, the assertion is valid,
unless it is negated with the `not` property.

```ts
expect<() => void>(() => {
  throw new Error("Whoops!");
}).toThrow(); // valid assertion

// alternative shorter convenience syntax
expectFn(() => {
  throw new Error("Whoops!");
}).toThrow();
```

Closure is not supported in AssemblyScript yet. Also, any references that are
left dangling on the stack will hang around un`__release()`ed by
AssemblyScript.

This function is safe to use with `jest`.

### toBeGreaterThan and toBeLessThan Comparison

This set of comparisons validate that a value is greater than, less than, or
equal to another value. The following assertions are true.

```ts
expect<i32>(100).toBeGreaterThan(42);
expect<i32>(0).toBeLessThan(100);
expect<i32>(0).not.toBeGreaterThan(100);
expect<f64>(1.0).toBeGreaterThanOrEqual(1.0);
expect<f64>(1.0).not.toBeLessThanOrEqual(0);
```

These assertions also work with reference types when the
`@operator(">" | "<" | ">=" | "<=")` is used on a method in the class.

```ts
class Vec3 {
  constructor(public x: f64 = 0.0, public y: f64 = 0.0, public z: f64 = 0.0) {}

  @operator(">")
  protected __gt(other: Vec3): bool {
    return (
      this.x * this.x + this.y * this.y + this.z * this.z >
      other.x * other.x + other.y * other.y + other.z * other.z
    );
  }
}

// valid assertion because `@operator` was overloaded
expect<Vec3>(new Vec3(1, 2, 3)).toBeGreaterThan(new Vec3(0, 0, 0));
```

These methods are safe to use portably with `jest`, provided they aren't used
with reference types.

### toBeCloseTo Comparison

When doing floating point math, it's possible that values will not be exactly as
expected because of floating point error.

```ts
expect<f64>(0.1 + 0.2).toBe(0.3); // fails

> 0.1 + 0.2
0.30000000000000004
```

Instead, use `expect().toBeCloseTo()` to validate an expected floating point
value.

```ts
expect<f64>(0.1 + 0.2).toBeCloseTo(0.3); // passes!
```

Reference values and integer values will result in a runtime error, because
`toBeCloseTo` comparisons require a floating point number to work.

This method is safe to use portably with `jest`.

### toHaveLength Comparison

This comparison verifies the length of a given object. This includes Arrays,
TypedArrays, ArrayBuffers, and custom classes that have a `length` property.

```ts
class LengthExample {
  constructor(public length: i32 = 0) {}
}

const array = new Array<Vec3>(100);
const typedarray = new Uint8Array(42);
const buffer = new ArrayBuffer(29);
const custom = new LengthExample(50);

expect<Array<Vec3>>(array).toHaveLength(100);
expect<Uint8Array>(typedarray).toHaveLength(42);
expect<ArrayBuffer>(buffer).toHaveLength(29);
expect<LengthExample>(custom).toHaveLength(50);
```

This method is safe to use with `jest`, with the exception of using
`ArrayBuffer`.

### toContain and toInclude Comparison

This comparison is used to determine if an Array contains a value.

All the values returned by `T[index]` will be compared using the `==` operator,
so overloading the class `@operator("==")` can be used in conjunction with this
comparison. The `index` must be a number value, and there must be a `length`
property that matches the `index` type. All values from `0` to `length - 1`
will be checked.

```ts
const data = new Uint8Array(100);
data[5] = 255;

expect<Uint8Array>(data).toContain(255);
```

This method is portable with `jest` using the `toContain()` method.

### toContainEqual and toIncludeEqual Comparison

This comparison is used to determine if an Array contains a reference that
equals another reference.

All the values returned by `T[index]` will be compared using the `==` operator,
and if that comparison does not work, a memcompare will be used. Overloading the
class `@operator("==")` can be used in conjunction with this comparison. The
`index` must be a number value, and there must be a `length` property that
matches the `index` type. All values from `0` to `length - 1` will be checked.

```ts
const reference = new Vec3(1, 2, 3);
const data = new Array<Vec3>(0);
data.push(new Vec(0, 0, 0));
data.push(new Vec(1, 2, 3));
data.push(new Vec(4, 5, 6));

expect<Uint8Array>(data).toContainEqual(referece);
```

This method is portable with `jest` using the `toContainEqual()` method.

## Types And Tooling

The `as-pect` assembly comes with a way to generate the types for all the globals
used by the framework. This will greatly increase your productivity because it
comes with lots of documentation, and adds a lot of intellisense to your
development experience.

It is also possible to reference the types manually. Use the following
reference at the top of your `assembly/index.ts` file to include these types
in your project automatically. If you use this method for your types, feel
free to delete the auto-generated types file in your test folder.

```ts
/// <reference path="../node_modules/@as-pect/core/types/as-pect.d.ts" />
/// <reference path="../node_modules/@as-pect/core/types/as-pect.portable.d.ts" />
```

## AssemblyScript Compiler Options

In general the best way to use the `as-pect` testing suite to compile your
tests to Wasm is to use the `asp` cli option `--outputBinary`. This will compile
every test and output binary files for each test that matches the `include`
property in the `as-pect.config.js` file.

In order to compile the test binary correctlymanually, the
`@as-pect/assembly/assembly/index.ts` file must be included as an entry point.
Also, `--use ASC_RTRACE=1` is required in order to enable RTrace error reporting
and reference counting statistics. Finally, the `--explicitStart` flag must be
passed to the compiler to enable proper test name and group name collection since
`as-pect` will call the `wasm.__start()` method manually after the loader is
instantiated. The following example can be used to help manually compile `as-pect`
tests.

```
asc {testentry.ts} node_modules/@as-pect/assembly/assembly/index.ts \
  --use ASC_RTRACE=1 \
  --explicitStart \
  --binaryFile {testentry.wasm} \
  --textFile {testentry.wat}
```

## Closures

AssemblyScript currently does not support closures around local scopes, only
around the global scope. However, you can place all relevant tests and setup
function calls for a test suite into a corresponding `describe` block after
declaring a global variable.

<!-- markdownlint-disable MD013 -->

```ts
import { Vec3 } from "./setup/Vec3";

// setup a global vector reference
var vec: Vec3;

describe("vectors", () => {
  // this runs before each test function, and must be placed within the describe function
  beforeEach(() => {
    // create a new vector for each test
    vec = new Vec3(1, 2, 3);
  });

  // this runs after each test function, and must be placed within the describe function
  afterEach(() => {
    vec = null; // free the vector
  });

  // use `test()` or `it()` to run a test
  test("vec should not be null", () => {
    // write an expectation
    expect<Vec3>(vec).not.toBeNull();
  });
});
```

<!-- markdownlint-enable MD013 -->

Nested `describe` blocks are supported and the outer describe should be
evaluated first.

```ts
describe("vector", () => {
  // this test block runs first
  it("should run first", () => {});

  describe("addition", () => {
    // this test block runs second
    it("should add vectors together", () => {
      expect<Vec3>(vec1.add(vec2)).toStrictEqual(new Vec3(1, 2, 3));
    });
  });
});
```

## Expectations

Calling the `expect<T>(value: T)` function outside of the following functions
will result in unexpected behavior:

- `beforeEach()`
- `afterEach()`
- `beforeAll()`
- `afterAll()`
- `test()`
- `it()`
- `throws()`
- `itThrows()`

If this happens, the entire test suite will fail before it runs in the CLI, and
the error description will be reported to the console.

## Logging

A global `log<T>(value: T): void` function is provided by `as-pect` to help
collect useful information about the state of your program. Simply give it
the type you want to log, and it will append a `LogValue` item to the
corresponding `TestResult` or `TestGroup` item the `log()` function was
called within.

```ts
log<string>("This will log a string"); // Remember, strings are references
log<f64>(0.4); // this logs a float value
log<i32>(42); // this logs the meaning of life
log<Vec3>(new Vec3(1, 2, 3)); // this logs every byte in the reference
log<i32[]>([1, 2, 3]); // this will log an array
```

This log function does _not_ pipe the output to stdout. It simply attaches the
log value to the current group or test the `log()` function was called in. Then
the after the test runs the configured `Reporter` decides if it is piped to
stdout, which is what `DefaultTestReporter` does.

## Contributors

To contribute please see [CONTRIBUTING.md](./CONTRIBUTING.md).

Thanks to [@willemneal](github.com/willemneal) and
[@MaxGraey](github.com/maxgraey) for all their support in making `as-pect` the
best software it can be.

Other Contributors:

- [@trusktr](github.com/trusktr) - Documentation Changes
- [@MaxGraey](github.com/maxgraey) - Performance API suggestions
- [@torch2424](github.com/torch2424) - Documentation Changes
- [@dcodeio](github.com/torch2424) - Made AssemblyScript itself!

## Special Thanks

Special thanks to the [AssemblyScript](github.com/AssemblyScript/assemblyscript)
team for creating AssemblyScript itself.
