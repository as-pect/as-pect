# @as-pect/core

Typescript infastructure for running tests.

## Table of contents

1. [Usage](#usage)
1. [Reporters](#reporters)
   - [SummaryReporter](#summaryreporter)
   - [VerboseReporter](#verbosereporter)
   - [JSONReporter](#jsonreporter)
   - [CSVReporter](#csvreporter)
1. [Portability](#portability)
1. [RTrace and Memory Leaks](#rtrace-and-memory-leaks)
1. [Performance Testing](#performance-testing)
1. [Using as-pect as a Package](#using-as-pect-as-a-package)

## Usage

To install `@as-pect/core`, install the latest version from github along with
`@as-pect/assembly`.

```
$ npm install @as-pect/core @as-pect/assembly
```

To create a `TestContext` simply import it and instantiate it.

```ts
import { TestContext, EmptyReporter } from "@as-pect/core";
import { instantiateBuffer } from "assemblyscript/lib/loader";

const ctx = new TestContext({
  fileName: "test.spec.ts", // put the name of the AssemblyScript file here
  // groupRegex: /./, // if you want to filter what groups run, modify this regex
  // testRegex: /./, // if you want to filter what tests run, modify this regex
  // performanceConfiguration: {}, // modify the performance configuration here
  // nortrace: true, // disable rtrace monitoring
  // stdout: null, // change stdout (must have a `write(input: string)` method)
  // stderr: null, // change stderr (must have a `write(input: string)` method)
});

const imports = ctx.createImports({
  // put any imports here
});

// instantiate the module using instantiateStreaming or instantiateBuffer
const wasm = await instantiateStreaming(
  fetch("./path/to/test/binary.wasm"),
  imports,
);

// run the tests
ctx.run(wasm);

// inspect the testGroups for errors
const groups = ctx.testGroups;

// check if the tests passed
const pass = ctx.pass;
```

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
const { SummaryReporter, TestContext } = require("@as-pect/core");

// create a test context
const ctx = new TestContext({
  reporter: new SummaryReporter({
    // enableLogging: false, // disable logging
  }),
});
```

### VerboseReporter

This reporter outputs a lot of information, including:

- All Test Groups and Test Names for each test
- RTrace Info (reference allocations vs deallocations)
- Performance Statistics
- Logging Information

```ts
const { VerboseReporter, TestContext } = require("@as-pect/core");

// create a test context
const ctx = new TestContext({
  reporter: new VerboseReporter(),
});
```

### JSONReporter

The `JSONReporter` can be used to create `json` files that contain the test
output. The file output location is `{testname}.spec.json`. It can be used
directly from the configuration file.

```ts
const { JSONReporter, TestContext } = require("@as-pect/core");

// export your configuration
const ctx = new TestContext({
  reporter: new JSONReporter(), // internally uses the fs.createWriteStream() function
});
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
const { CSVReporter, TestContext } = require("@as-pect/core");

// export your configuration
const ctx = new TestContext({
  reporter: new CSVReporter(), // internally uses the fs.createWriteStream() function
});
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

<!-- markdownlint-disable MD013 -->

| Method                                                    | Compatibility              | Notes                                                                                                                                                                                                                                                                                                                                  |
| --------------------------------------------------------- | -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                                                           |                            |                                                                                                                                                                                                                                                                                                                                        |
| expect(value)                                             | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| expect.extend(matchers)                                   | 👎 Won't Support           | This method is used for extending matchers in JS. JS is a dynamic language, and AssemblyScript is not. It is possible to create custom assertions without this method, so it is marked as "won't support."                                                                                                                             |
| expect.anything()                                         | 🤞 Maybe Support           | This is a dynamic matcher, and dynamic matchers are currently not supported. It is possible to implement something like this. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                |
| expect.any(constructor)                                   | 👎 Won't Support           | This method is impossible to replicate in AssemblyScript because classes are not concrete values.                                                                                                                                                                                                                                      |
| expect.arrayContaining(array)                             | 🤞 Maybe Support           | This is a dynamic matcher, and dynamic matchers are currently not supported. It is possible to implement something like this. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                |
| expect.assertions(number)                                 | 🤞 Maybe Support           | This is entirely possible to implement. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                      |
| expect.hasAssertions()                                    | 🤞 Maybe Support           | This is entirely possible to implement. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                      |
| expect.not.arrayContaining(array)                         | 🤞 Maybe Support           | This is entirely possible to implement. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                      |
| expect.not.objectContaining(object)                       | 🛑 Maybe Support (waiting) | This is entirely possible to implement, but Reflection must be supported.                                                                                                                                                                                                                                                              |
| expect.not.stringContaining(string)                       | 🤞 Maybe Support           | This is entirely possible to implement. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                      |
| expect.not.stringMatching(string \| regexp)               | 🛑 Maybe Support (waiting) | This is entirely possible to implement, but this method may require a RegExp implemention to be implemented fully. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                           |
| expect.objectContaining(object)                           | 🛑 Maybe Support (waiting) | This is entirely possible to implement, but Reflection must be supported.                                                                                                                                                                                                                                                              |
| expect.stringContaining(string)                           | 🤞 Maybe Support           | This is entirely possible to implement. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                      |
| expect.stringMatching(string \| regexp)                   | 🛑 Maybe Support (waiting) | This is entirely possible to implement, but this method may require a RegExp implemention to be implemented fully. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                           |
| expect.addSnapshotSerializer(serializer)                  | 🤞 Maybe Support           | This may be possible to implement, but this method requires snapshots. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                       |
| .not                                                      | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| .resolves                                                 | 🛑 Maybe Support (waiting) | This may be possible to implement, but this method requires Promises. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                        |
| .rejects                                                  | 🛑 Maybe Support (waiting) | This may be possible to implement, but this method requires Promises. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                        |
| .toBe(value)                                              | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| .toHaveBeenCalled()                                       | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has been called. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request.      |
| .toHaveBeenCalledTimes(number)                            | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has been called. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request.      |
| .toHaveBeenCalledWith(arg1, arg2, ...)                    | 👎 Won't Support           | Rest parameters and argument inspection is not possible in AssemblyScript.                                                                                                                                                                                                                                                             |
| .toHaveBeenLastCalledWith(arg1, arg2, ...)                | 👎 Won't Support           | Rest parameters and argument inspection is not possible in AssemblyScript.                                                                                                                                                                                                                                                             |
| .toHaveBeenNthCalledWith(nthCall, arg1, arg2, ....)       | 👎 Won't Support           | Rest parameters and argument inspection is not possible in AssemblyScript.                                                                                                                                                                                                                                                             |
| .toHaveReturned()                                         | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has returned a value. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request. |
| .toHaveReturnedTimes(number)                              | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has returned a value. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request. |
| .toHaveReturnedWith(value)                                | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has returned a value. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request. |
| .toHaveLastReturnedWith(value)                            | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has returned a value. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request. |
| .toHaveNthReturnedWith(nthCall, value)                    | 🤞 Maybe Support           | Currently, there is no good way to use jest.fn() in `as-pect`. However, it is possible to apply a transform to the source and notify the host that a function has returned a value. We can support this feature under a `--function-calls` flag potentially. Please see [contributing](#contributing) on how to submit a pull request. |
| .toHaveLength(number)                                     | ✔ Supported                | Only incompatible with `ArrayBuffer` values                                                                                                                                                                                                                                                                                            |
| .toHaveProperty(keyPath, value?)                          | 👎 Won't Support           | Properties are known at compile time.                                                                                                                                                                                                                                                                                                  |
| .toBeCloseTo(number, numDigits?)                          | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| .toBeDefined()                                            | 🤞 Maybe Support           | This is currently possible to implement. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                     |
| .toBeFalsy()                                              | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| .toBeGreaterThan(number)                                  | ✔ Supported                | References comparisons using this comparison require overriding `valueOf()` which should a `f64` value, and using the `operator(">")` decorator.                                                                                                                                                                                       |
| .toBeGreaterThanOrEqual(number)                           | ✔ Supported                | References comparisons using this comparison require overriding `valueOf()` which should a `f64` value, and using the `operator(">=")` decorator.                                                                                                                                                                                      |
| .toBeLessThan(number)                                     | ✔ Supported                | References comparisons using this comparison require overriding `valueOf()` which should a `f64` value, and using the `operator("<")` decorator.                                                                                                                                                                                       |
| .toBeLessThanOrEqual(number)                              | ✔ Supported                | References comparisons using this comparison require overriding `valueOf()` which should a `f64` value, and using the `operator("<=")` decorator.                                                                                                                                                                                      |
| .toBeInstanceOf(Class)                                    | 👎 Won't Support           | Use `expect<bool>(actual instanceof Class).toBeTruthy()` instead.                                                                                                                                                                                                                                                                      |
| .toBeNull()                                               | ✔ Supported                | Only works for reference values. Number values will always fail this assertion in AssemblyScript.                                                                                                                                                                                                                                      |
| .toBeTruthy()                                             | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| .toBeUndefined()                                          | 👎 Won't Support           | The `undefined` value does not exist in AssemblyScript.                                                                                                                                                                                                                                                                                |
| .toBeNaN()                                                | ✔ Supported                | Must be used on float values.                                                                                                                                                                                                                                                                                                          |
| .toContain(item)                                          | ✔ Partially Supported      | Type cannot be string (yet.) This will be supported on a future date. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                        |
| .toContainEqual(item)                                     | ✔ Supported                |                                                                                                                                                                                                                                                                                                                                        |
| .toEqual(value)                                           | 🤞 Maybe Support           | This can be implemented when reflection is implemented. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                      |
| .toMatch(regexpOrString)                                  | 🤞 Maybe Support           | This method requires RegExp for full support. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                                |
| .toMatchObject(object)                                    | 🤞 Maybe Support           | This can be implemented when reflection is implemented. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                      |
| .toMatchSnapshot(propertyMatchers?, hint?)                | 🤞 Maybe Support           | This is hard to implement because JS can dynamically inspect arguments. It requires a filesystem and should serialize snapshots just like jest does. Perhaps partial support for `expect(actual).toMatchSnapshot(hint?)` would be a good compromise. Please see [contributing](#contributing) on how to submit a pull request.         |
| .toMatchInlineSnapshot(propertyMatchers?, inlineSnapshot) | 👎 Won't Support           | This will require a post-test-run transform and is not on the roadmap. This requires sourcemaps and an ast transformer like babel or prettier.                                                                                                                                                                                         |
| .toStrictEqual(value)                                     | ✔ Partially Supported      | This method requires Reflection for full support. Please see [contributing](#contributing) on how to submit a pull request.                                                                                                                                                                                                            |
| .toThrow(error?)                                          | ✔ Partially Supported      | This method is partially supported because errors cannot be inspected for their type.                                                                                                                                                                                                                                                  |
| .toThrowErrorMatchingSnapshot(hint?)                      | 👎 Won't Support           | This method is cannot be supported because errors cannot be inspected for their type.                                                                                                                                                                                                                                                  |
| .toThrowErrorMatchingInlineSnapshot(inlineSnapshot)       | 👎 Won't Support           | This method is cannot be supported because errors cannot be inspected for their type, it requires a post-test-run transform, and it also requires an ast transformer like babel or prettier.                                                                                                                                           |

<!-- markdownlint-enable MD013 -->

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

### RTrace.count()

The count method returns the current number of heap allocations.

Example:

```ts
const num: i32 = RTrace.count(); // The current number of allocations on the heap
```

### RTrace.start(label: i32)

The start method creates a starting point for a relative number of heap
allocations. It should be used in conjunction with the `RTrace.end(label)`
method which returns the relative number of heap allocations compared to the
starting number when the label was created.

Example:

```ts
const enum RTraceLabels {
  MEMORY_INTENSIVE_OPERATION = 0,
}

RTrace.start(RTraceLabels.MEMORY_INTENSIVE_OPERATION);
doSomething();
const end: i32 = RTrace.end(RTraceLabels.MEMORY_INTENSIVE_OPERATION);
expect<i32>(end).toBe(0);
```

### RTrace.end(label: i32)

The end method creates an ending point for a relative number of heap
allocations to be measured from. It should be used in conjunction with the
`RTrace.start(label)` method which returns the relative number of heap
allocations compared to the starting number when the label was created.

Example:

```ts
const enum RTraceLabels {
  MEMORY_INTENSIVE_OPERATION = 0,
}

RTrace.start(RTraceLabels.MEMORY_INTENSIVE_OPERATION);
doSomething();
const end: i32 = RTrace.end(RTraceLabels.MEMORY_INTENSIVE_OPERATION);
expect<i32>(end).toBe(0);
```

### RTrace.allocations()

The allocations function will report the exact number of allocations that have
occurred during the course of test file evaluation.

```ts
const allocations: i32 = RTrace.allocations();
```

### RTrace.frees()

The allocations function will report the exact number of frees that have
occurred during the course of test file evaluation.

```ts
const frees: i32 = RTrace.frees();
```

### RTrace.groupAllocations()

The allocations function will report the exact number of allocations that have
occurred during the course of the test group's evaluation.

```ts
describe("a group", () => {
  afterAll(() => {
    const groupAllocations: i32 = RTrace.groupAllocations();
  });
});
```

### RTrace.groupFrees()

The frees function will report the exact number of frees that have occurred
during the course of the test group's evaluation.

```ts
describe("a group", () => {
  afterAll(() => {
    const groupFrees: i32 = RTrace.groupFrees();
  });
});
```

### RTrace.testAllocations()

The allocations function will report the exact number of allocations that have
occurred during the course of the test's evaluation.

```ts
describe("a group", () => {
  afterEach(() => {
    const testAllocations: i32 = RTrace.testAllocations();
  });
});
```

### RTrace.testFrees()

The frees function will report the exact number of frees that have occurred
during the course of the test's evaluation.

```ts
describe("a group", () => {
  afterEach(() => {
    const testFrees: i32 = RTrace.testFrees();
  });
});
```

### RTrace.increments()

The increments function returns the total number of reference counted increments
that occurred over the course of the current test file.

Example:

```ts
const increments: i32 = RTrace.increments();
```

### RTrace.decrements()

The decrements function returns the total number of reference counted decrements
that occurred over the course of the current test file.

Example:

```ts
const decrements: i32 = RTrace.decrements();
```

### RTrace.groupIncrements()

The groupIncrements function returns the total number of reference counted
increments that occurred over the course of the current testing group.

```ts
describe("A testing group", () => {
  afterAll(() => {
    // log how many increments occured
    log<i32>(RTrace.groupIncrements());
  });
});
```

### RTrace.groupDecrements()

The groupDecrements function returns the total number of reference counted
decrements that occurred over the course of the current testing group.

```ts
describe("A testing group", () => {
  afterAll(() => {
    // log how many increments occured
    log<i32>(RTrace.groupDecrements());
  });
});
```

### RTrace.testIncrements()

The testIncrements function returns the total number of reference counted
increments that occurred over the course of the current testing group.

```ts
describe("A testing group", () => {
  afterEach(() => {
    // log how many increments occured
    log<i32>(RTrace.testIncrements());
  });
});
```

### RTrace.testDecrements()

The testDecrements function returns the total number of reference counted
decrements that occurred over the course of the current testing group.

```ts
describe("A testing group", () => {
  afterEach(() => {
    // log how many increments occured
    log<i32>(RTrace.testDecrements());
  });
});
```

### RTrace.collect()

This method triggers a garbage collection.

```ts
describe("something", () => {
  // put some tests here
});

afterEach(() => {
  // trigger a garbage collection after each test
  RTrace.collect();
});
```

### RTrace.typeIdOf(pointer: usize)

### RTrace.typeIdOfReference<T>(reference: T)

### RTrace.sizeOf(pointer: usize)

### RTrace.sizeOfReference<T>(reference: T)

### RTrace.refCountOf(ptr: usize)

## Performance Testing

To increase performance on testing, do not use the `log()` function and reduce
the amount of IO that `as-pect` must do to compile your tests. The biggest
bottleneck in Web Assembly testing, is compilation. This means that using
things like `@inline` many times will cause your module to compile more slowly,
and as a result the test file will run slower.

### Performance Enabling Via API

To enable performance using the global test functions, call the
`Performance.enabled()` function with a `true` value.

```ts
describe("my test suite", () => {
  Performance.enabled(true);
  test("some performance test", () => {
    // some performance sensitive code
  });
});
```

When using `Performance.enabled(true)` on a test, logs are not supported for
that specific test. Running 10000 samples of a function that collects logs
will result in a very large amount of memory usage and IO. Calls to `log<T>()`
will be ignored and any test with the `test.performance` property set to
`true` will have a `test.logs` array with a length of `0`.

Note that each of the performance functions must be called before the test is
declared in the same `describe` block to override the corresponding default
configuration values on a test by test basis.

To override the maximum number of samples collected, use the
`Performance.maxSamples` function.

```ts
Performance.maxSamples(10000); // 10000 is the maximum value
it("should collect only 10000 samples at most", () => {});
```

To override the maximum test run time (including test logic), use the
`Performance.maxRunTime` function.

```ts
Performance.maxRunTime(5000); // 5000 ms, or 5 seconds of test run time
it("should have a maxRunTime of 5 seconds", () => {});
```

To override how many decimal places are rounded to, use the
`Performance.roundDecimalPlaces` function.

```ts
Performance.roundDecimalPlaces(4); // 3 is the default
it("should round to 4 decimal places", () => {});
```

To force reporting of the median test runtime, use the
`Performance.reportMedian` function.

```ts
Performance.reportMedian(true); // false will disable reporting of the median
it("should report the median", () => {});
```

To force reporting of the average, or mean test runtime, use the
`Performance.reportAverage` function.

```ts
Performance.reportAverage(true); // false will disable reporting of the mean
it("should report the average", () => {});
```

To force reporting of the variance of the runtimes, use the
`Performance.reportVariance` function.

```ts
// false will disable reporting of the variance
Performance.reportVariance(true);
it("should report the variance deviation", () => {});
```

To force reporting of the standard deviation of the runtimes, use the
`Performance.reportStdDev` function. This method implies the use of a variance
calculation, and will be auto-included in the test result.

```ts
// false will disable reporting of the standard deviation
Performance.reportStdDev(true);
it("should report the standard deviation", () => {});
```

To force reporting of the maximum runTime value, use the
`Performance.reportMax` function.

```ts
Performance.reportMax(true); // false will disable reporting of the max
it("should report the max", () => {});
```

To force reporting of the minimum runTime value, use the
`Performance.reportMin` function.

```ts
Performance.reportMin(true); // false will disable reporting of the min
it("should report the min", () => {});
```

## Performance Enabling Via Configuration

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
