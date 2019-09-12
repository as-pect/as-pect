# jtenner/as-pect

This packages is a monorepo that contains the cli and the core for the `@as-pect`
packages.

[![Greenkeeper badge](https://badges.greenkeeper.io/jtenner/as-pect.svg)](https://greenkeeper.io/)
[![Build Status](https://travis-ci.org/jtenner/as-pect.svg?branch=master)](https://travis-ci.org/jtenner/as-pect)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Table of contents

1. [Philosophy](#philosophy)
1. [Usage](#usage)
1. [Comparisons](#comparisons)
   - [toBe](#tobe)
   - [toStrictEqual](#tostrictequal)
   - [toBlockEqual](#toblockequal)
   - [toBeTruthy and toBeFalsy](#tobetruthy-and-tobefalsy)
   - [toBeNaN](#tobenan)
   - [toBeFinite](#tobefinite)
   - [toThrow](#tothrow)
   - [toBeGreaterThan/toBeLessThan](#tobegreaterthan-and-tobelessthan)\
   - [toBeCloseTo](#tobecloseto)
   - [toHaveLength](#tohavelength)
   - [toContain](#tocontain-and-toinclude)
   - [toContainEqual](#tocontainequal-and-toincludeequal)
1. [Configuration File](#configuration-file)
1. [Types And Tooling](#types-and-tooling)
1. [CI Usage](#ci-usage)
1. [AssemblyScript Compiler Options](#assemblyscript-compiler-options)
1. [Reporters](#reporters)
   - [SummaryReporter](#summaryreporter)
   - [VerboseReporter](#verbosereporter)
   - [JSONReporter](#jsonreporter)
   - [CSVReporter](#csvreporter)
1. [Portability](#portability)
1. [RTrace and Memory Leaks](#rtrace-and-memory-leaks)
1. [Performance Testing](#performance-testing)
1. [Custom Imports Using CLI](#custom-imports-using-cli)
1. [Using as-pect as a Package](#using-as-pect-as-a-package)
1. [Contributors](#contributors)

## Philosophy

Testing is the first step of every project and you have a responsibility to
make sure that the software you write works as intended. The `as-pect` project
was created to help quickly scaffold and bootstrap AssemblyScript tests so
that you can be confident in yourself and the software you write.

One of the goals of this project is 100% portability to `jest` so that tests
can be run in two different environments.

## Usage

To install `as-pect`, install the latest version(s) from npm.

```
$ npm install @as-pect/cli @as-pect/core @as-pect/assembly assemblyscript/assemblyscript
```

To initialize a test suite, run `npx asp --init`. It will create the following
folders and files.

```
$ npx asp --init

# It will create the following folders if they don't exist
C ./assembly/
C ./assembly/__tests__/

# The as-pect types file will be created here if it doesn't exist
C ./assembly/__tests__/as-pect.d.ts

# An example test file will be created here if the __tests__ folder does not exist
C ./assembly/__tests__/example.spec.ts

# The default configuration file will be created here if it doesn't exist
C ./as-pect.config.js
```

If you want `asp`'s boilerplate located somewhere other than in `assembly/`,
you can move it yourself, and update `as-pect.config.js` to point to the new
location accordingly.

To run `as-pect`, use the command line: `npx asp`, or create an npm script.

```json
{
  "scripts": {
    "test": "asp"
  }
}
```

The command line defaults to using `./aspect.config.js`, otherwise you can
specify all the configuration options using the command line interface.

To change the location of the as-pect configuration, use the `--config` option.

```
$ npx asp --config as-pect.config.js
```

## Comparisons

There are a set of comparison functions defined in the `types/as-pect.d.ts` types
definition. These comparison functions allow you to inspect object and memory
state.

### toBe

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

### toStrictEqual

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
  protected __equals(ref: Vec3 | null): bool {
    // === is a strict pointer comparison in AssemblyScript
    if (this === ref) return true;
    if (ref === null) return false;
    return this.a == ref.a && this.b == ref.b && this.c == ref.c;
  }
}
```

This method is _not_ safe to use portably with `jest` yet. Once `Reflection`
is supported by AssemblyScript, `as-pect` will support compatibility
between `jest`'s version of this function.

### toBlockEqual

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

### toBeTruthy and toBeFalsy

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

### toBeNaN

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

### toBeNull

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

### toBeFinite

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

### toThrow

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

### toBeGreaterThan and toBeLessThan

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

### toBeCloseTo

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

### toHaveLength

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

### toContain and toInclude

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

### toContainEqual and toIncludeEqual

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

<!-- markdownlint-enable MD013 MD031 -->

## Configuration File

Currently `as-pect` will compile each file that matches the
[`glob`](https://en.wikipedia.org/wiki/Glob_%28programming%29)s in the
`include` property of your configuration. The default include is
`"assembly/__tests__/**/*.spec.ts"`. It must compile each file, and run each
binary separately inside it's own `TestContext`. This is a limitation of
AssemblyScript, not of `as-pect`.

A typical configuration is provided when you use `asp --init` and is located
[here](blob/master/init/as-pect.config.js).

## Types And Tooling

The `as-pect` cli comes with a way to generate the types for all the globals
used by the framework. Simply use the `--init` or `--types` flag. When a new
version of `as-pect` is released, simply run the `npx asp --types` command to
get the latest version of these function definitions. This will greatly
increase your productivity because it comes with lots of documentation, and
adds a lot of intellisense to your development experience.

It is also possible to reference the types manually. Use the following
reference at the top of your `assembly/index.ts` file to include these types
in your project automatically. If you use this method for your types, feel
free to delete the auto-generated types file in your test folder.

```ts
/// <reference path="../node_modules/@as-pect/core/types/as-pect.d.ts" />
/// <reference path="../node_modules/@as-pect/core/types/as-pect.portable.d.ts" />
```

## CI Usage

If any module fails during compilation, the utility will exit immediately with
code 1 so it can be used for quicker ci builds.

Adding this line to your `.travis.yml` will allow you to specify a custom
script to your CI build.

```yaml
script:
  - npm run test:ci
```

Then in your package.json file, you can instruct the `"test:ci"` script to
run the `asp` command line tool to use the `SummaryTestReporter` like this:

```json
{
  "scripts": {
    "test:ci": "asp --summary"
  }
}
```

## AssemblyScript Compiler Options

### `--compiler` CLI Argument

By default `as-pect` will use node's resolver to look for an AssemblyScript
module. If you want to specify a different version of the compiler, use
`--compiler ../relative/path/to/compiler/folder`. Note that it expects the following
to be the same `__folder__/dist/asc.js`, `__folder__/cli/util/options.js`, and
`__folder__/lib/loader.js`.

### Compiler Flags

Regardless of the installed version, all the compiler flags will be passed to
the `asc` command line tool.

```ts
const compiler = require(path.join(path.cwd(), options.compiler, "cli/asc"));
```

Inside the callback, any files that are generated, except for the `.wasm` file
will be output using the `{testFolder}/{testName}.{ext}` format. This includes
source maps, `.wat` files, `.js` files, and types files generated by the compiler.

## Reporters

Reporters are the way tests get reported. When running the CLI, the
`SummaryReporter` is used and all the values will be logged to the console. The
test suite itself does not log out test results. If you want to use a custom
reporter, you can create your own by extending the abstract `Reporter` class.

```ts
export abstract class Reporter {
  public abstract onStart(suite: TestSuite): void;
  public abstract onGroupStart(group: TestGroup): void;
  public abstract onGroupFinish(group: TestGroup): void;
  public abstract onTestStart(group: TestGroup, result: TestResult): void;
  public abstract onTestFinish(group: TestGroup, result: TestResult): void;
  public abstract onFinish(suite: TestSuite): void;
  public abstract onTodo(group: TestGroup, todo: string): void;
}
```

Each test suite run will use the provided reporter and call
`onStart(suite: TestSuite)` to notify a consumer that a test has started. This
happens once per test file. Since a file can have multiple `describe` function
calls, these are logically placed into `TestGroup`s. Each `TestGroup` has it's
own description and contains a list of `TestResult`s that were run.

If no reporter is provided to the configuration, one will be provided that uses
`stdout` and `chalk` to provide colored output.

If performance is enabled, then the `times` array will be populated with the
runtime values measured in milliseconds.

### SummaryReporter

This reporter only outputs failed tests and is the default `TestReporter` used
by the `as-pect` cli. It can be used directly from the configuration file.

```ts
const { SummaryReporter } = require("@as-pect/core");

// export your configuration
module.exports = {
  reporter: new SummaryReporter({
    // enableLogging: false, // disable logging
  }),
};
```

It can also be used from the cli using the `--summary` flag.

```
npx asp --summary
npx asp --summary=enableLogging=false
```

Note: When using parameters for the builtin reporters, the `=` is required to
parse the querystring parameters correctly.

### VerboseReporter

This reporter outputs a lot of information, including:

- All Test Groups and Test Names for each test
- RTrace Info (reference allocations vs deallocations)
- Performance Statistics
- Logging Information

It can be used directly from the configuration file.

```ts
const { VerboseReporter } = require("@as-pect/core");

module.exports = {
  reporter: new VerboseReporter(),
};
```

It can also be used from the cli using the `--verbose` flag.

```
npx asp --verbose
```

### JSONReporter

The `JSONReporter` can be used to create `json` files that contain the test
output. The file output location is `{testname}.spec.json`. It can be used
directly from the configuration file.

```ts
// as-pect.config.js
const { JSONReporter } = require("@as-pect/core");

// export your configuration
module.exports = {
  reporter: new JSONReporter(),
};
```

It can also be used from the cli using the `--json` flag.

```
npx asp --json
```

The object ouput definition is shaped like this:

```ts
// Test Results are compiled into an array
[
  // For each test, there is an object with the following shape
  {
    // The Test Group
    group: group.name,
    // The Test Name
    name: result.name,
    // If it ran
    ran: result.ran,
    // If it passed
    pass: result.pass,
    // The total test runtim
    runtime: result.runTime,
    // The error message
    message: result.message,
    // Actual value message if an expectation failed
    actual: result.actual ? result.actual.message : null,
    // Expected value message if an expectation failed
    expected: result.expected ? result.expected.message : null,
    // The average run time (performance)
    average: result.average,
    // The median run time (performance)
    median: result.median,
    // The maximum run time (performance)
    max: result.max,
    // The minimum run time (performance)
    min: result.min,
    // The standard deviation of the run times (performance)
    stdDev: result.stdDev,
    // The variance of the run times (performance)
    variance: result.variance,
  },
];
```

### CSVReporter

The `CSVReporter` can be used to create `csv` files that contain the test
output. The file output location is `{testname}.spec.csv`. It can be used
directly from the configuration file.

```ts
const { CSVReporter } = require("@as-pect/core");

// export your configuration
module.exports = {
  reporter: new CSVReporter(),
};
```

It can also be used from the cli using the `--csv` flag.

```
npx asp --csv
```

This is a list of all the columns in the exported csv file.

```ts
const csvColumns = [
  "Group", // The Test Group
  "Name", // The Test Name
  "Ran", // If it ran
  "Pass", // If it passed
  "Runtime", // The total test runtim
  "Message", // The error message
  "Actual", // Actual value message if an expectation failed
  "Expected", // Expected value message if an expectation failed
  "Average", // The average run time (performance)
  "Median", // The median run time (performance)
  "Max", // The maximum run time (performance)
  "Min", // The minimum run time (performance)
  "StdDev", // The standard deviation of the run times (performance)
  "Variance", // The variance of the run times (performance)
];
```

## Portability

It is possible to write `as-pect` tests that run in `jest` as well. The
compatible functions are documented in the
`@as-pect/core/types/as-pect.portable.d.ts` file and can be added to your
project by using the `--portable` flag. Instead of using the types provided by
`@types/jest`, use the portable ones provided by `as-pect`. This is the
recommended way to setup testing when trying to write portable tests.

```
npm install --save-dev jest @as-pect/cli typescript assemblyscript/assemblyscript
npx ts-jest config:init
npx asp --portable
```

Then change the jest configuration to match these properties as you see fit:

```js
module.exports = {
  preset: "ts-jest",
  testEnvironment: "node",
  testMatch: ["assembly/__tests__/**/*.spec.ts"],
};
```

This is the compatibility table.

## RTrace and Memory Leaks

If an expectation fails and hits an `unreachable()` instruction, any unreleased
references in the function call stack will be held indefinitely as a memory
leak. Test Suites don't stop running if they fail the test callback. However,
tests will stop if they fail inside the `beforeEach()`, `beforeAll()`,
`afterEach()`, and `afterAll()` callbacks.

Typically, a `throws()` test will leave at _least_ a single `Expectation` on the
heap. This is to be expected, because the `unreachable()` instruction unwinds
the stack, and prevents the ability for each function to `__release` a reference
pointer properly. Your test suite output may look like this:

```
[Describe]: toHaveLength TypedArray type: Uint32Array

 [Success]: ✔ should assert expected length
  [Throws]: ✔ when expected length should not equal the same value RTrace: +3
 [Success]: ✔ should verify the length is not another value
  [Throws]: ✔ when the length is another expected value RTrace: +3
```

The `RTrace: +3` corresponds to an `Expectation`, a `Uint32Array`, and a single
backing `ArrayBuffer` that was left on the heap because of the fact that the
expectation failed. This was expected because these two tests were annotated
with the `throws(desc, callback)` function. If you see a function that is
expected to `pass` and `RTrace` returns a very large value, it might be an
indicator of a very serious memory leak, and the `DefaultTestReporter` can be
your best friend when it comes to finding these sorts of problems.

Among other solutions, the following methods are exposed to you as a way to
inspect how many allocations and frees occurred during the course of function
execution. Every one of these functions exist in the `RTrace` namespace and will
call into JavaScript to query the state of the heap relative to the overall test
file, the test group, and each individual test depending on the function.

This can be disabled with the `--nortrace` cli option.

## Performance Testing

To increase performance on testing, do not use the `log()` function and reduce
the amount of IO that `as-pect` must do to compile your tests. The biggest
bottleneck in Web Assembly testing, is compilation. This means that using
things like `@inline` many times will cause your module to compile more slowly,
and as a result the testing file will run slower.

Providing these values inside an `as-pect.config.js` configuration will set
these as _the_ global defaults.

Note that when using the `cli`, the cli flag inputs will override the
`as-pect.config.js` configured values.

```js
// in as-pect.config.js
module.exports = {
  performance: {
    /** Enable performance statistics gathering for *every* test. */
    enabled: false,
    /** Set the maximum number of samples to run for every test. */
    maxSamples: 10000,
    /** Set the maximum test run time in milliseconds for every test. */
    maxTestRunTime: 2000,
    /** Report the median time in the default reporter for every test. */
    reportMedian: true,
    /** Report the average time in milliseconds for every test. */
    reportAverage: true,
    /** Report the standard deviation for every test. */
    reportStandardDeviation: false,
    /** Report the maximum run time in milliseconds for every test. */
    reportMax: false,
    /** Report the minimum run time in milliseconds for every test. */
    reportMin: false,
  },
};
```

## Custom Imports Using CLI

If a set of custom imports are required for your test module, it's possible to
provide a set of imports for a given test file.

If your test is located at `assembly/__tests__/customImports.spec.ts`, then use
filename `assembly/__tests__/customImports.spec.imports.js` to export the test
module's imports. This file will be required by the cli before the module is
instantiated.

_**IMPORTANT**: THIS WILL IGNORE `as-pect.config.js`'S IMPORTS COMPLETELY_

Please see the provided example located in `assembly/__tests__/customImports.spec.ts`.

## Using as-pect as a Package

It's possible that running your tests requires a browser environment. Instead
of running `as-pect` from the command line, use the `--output-binary` flag
along with the `--norun` flag and this will cause `as-pect` to output the
`*.spec.wasm` file. This binary can be `fetch()`ed and instantiate like the
following example.

```ts
// browser-test.ts
import { instantiateBuffer } from "assemblyscript/lib/loader";
import {
  TestContext,
  IPerformanceConfiguration,
  IAspectExports,
  // EmptyReporter,
} from "as-pect";

const performanceConfiguration: IPerformanceConfiguration = {
  // put performance configuration values here
};

// Create a TestContext
const runner = new TestContext({
  // reporter: new EmptyReporter(), // Use this to override default test reporting
  performanceConfiguration,
  // testRegex: /.*/, // Use this to run only tests that match this regex
  // groupRegex: /.*/, // Use this to run only groups that match this regex
  fileName: "./test.spec.ts", // Always set the filename
});

// put your assemblyscript imports here
const imports = runner.createImports({});

// instantiate your test module here via the "assemblyscript/lib/loader" module
const wasm = instantiateStreaming<IAspectExports>(
  fetch("./test.spec.wasm"),
  imports,
);

runner.run(wasm); // run the tests synchronously

// loop over each group and test in that group
for (const group of runner.testGroups) {
  for (const test of group.tests) {
    console.log(test.name, test.pass ? "pass" : "fail");
  }
}
```

If you want to compile each test suite manually, it's possible to use the `asc`
compiler yourself by including the following file in your compilation.

```
./node_modules/as-pect/assembly/index.ts
```

By default, `as-pect` always shows the generated compiler flags.

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
