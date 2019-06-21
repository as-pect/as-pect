# as-pect

[![Greenkeeper badge](https://badges.greenkeeper.io/jtenner/as-pect.svg)](https://greenkeeper.io/)
[![Build Status](https://travis-ci.org/jtenner/as-pect.svg?branch=master)](https://travis-ci.org/jtenner/as-pect)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Philosophy

Testing is the first step of every project. It's important to make sure that the
library or app you've chosen to become responsible for works in the manner you
wish to have it work. It only takes a few minutes to get setup even if the benefits
are transparent.

## Table of contents

1. [Usage](#usage)
1. [CLI](#cli)
1. [Configuration File](#configuration-file)
1. [Types And Tooling](#types-and-tooling)
1. [CI Usage](#ci-usage)
1. [AssemblyScript Compiler Options](#assemblyscript-compiler-options)
1. [Closures](#closures)
1. [Expectations](#expectations)
1. [Logging](#logging)
1. [Reporters](#reporters)
1. [RTrace and Memory Leaks](#rtrace-and-memory-leaks)
1. [Performance Testing](#performance-testing)
1. [Custom Imports Using CLI](#custom-imports-using-cli)
1. [Using as-pect as a Package](#using-as-pect-as-a-package)

## Usage

To install `as-pect`, install the latest version from github. Once
`AssemblyScript` becomes more stable, `as-pect` will be published to npm.

```
$ npm install jtenner/as-pect
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
$ npx asp --config=as-pect.config.js
```

Most of the values configured in the configuration are overridable via the command
line, with the exception of the Web Assembly imports provided to the module.

## CLI

To access the help screen, use the `--help` flag, which prints the following:

<!-- markdownlint-disable MD013 MD031 -->
<!--
  This is the command line help screen, and has lines longer than 80
  characters. This cannot be helped.
-->
```
SYNTAX
  asp --init                             Create a test config, an assembly/__tests__ folder and exit.
    asp -i
    asp --config=as-pect.config.js       Use a specified configuration
    asp -c as-pect.config.js
    asp --version                        View the version.
    asp -v
    asp --help                           Show this help screen.
    asp -h
    asp --types                          Copy the types file to assembly/__tests__/as-pect.d.ts
    asp -t
    asp --compiler                       Path to folder relative to project root which contains
                                         folder/dist/asc for the compiler and folder/lib/loader for loader. (Default: assemblyscript)

  TEST OPTIONS
    --file=[regex]                       Run the tests of each file that matches this regex. (Default: /./)
      --files=[regex]
      -f=[regex]

    --group=[regex]                      Run each describe block that matches this regex (Default: /(:?)/)
      --groups=[regex]
      -g=[regex]

    --test=[regex]                       Run each test that matches this regex (Default: /(:?)/)
      --tests=[regex]
      -t=[regex]

    --output-binary                      Create a (.wasm) file can contains all the tests to be run later.
      -o

    --norun                              Skip running tests and output the compiler files.
      -n

    --nortrace                           Skip rtrace reference counting calculations.
      -nr

    --reporter                           Define the reporter to be used. (Default: DefaultTestReporter)
      --reporter=SummaryTestReporter     Use the summary reporter.
      --reporter=DefaultTestReporter     Use the default test reporter.
      --reporter=JSONTestReporter        Use the JSON reporter (output results to json files.)
      --reporter=CSVTestReporter         Use the empty reporter (output results to csv files.)
      --reporter=EmptyReporter           Use the empty reporter. (This reporter reports nothing)
      --reporter=./path/to/reporter.js   Use the default exported object from this module as the reporter.

  PERFORMANCE OPTIONS
    --performance                        Enable performance statistics for {bold every} test. (Default: false)
    --max-samples=[number]               Set the maximum number of samples to run for each test. (Default: 10000 samples)
    --max-test-run-time=[number]         Set the maximum test run time in milliseconds. (Default: 2000ms)
    --round-decimal-places=[number]      Set the number of decimal places to round to. (Default: 3)
    --report-median(=false)?             Enable/Disable reporting of the median time. (Default: true)
    --report-average(=false)?            Enable/Disable reporting of the average time. (Default: true)
    --report-standard-deviation(=false)? Enable/Disable reporting of the standard deviation. (Default: false)
    --report-max(=false)?                Enable/Disable reporting of the largest run time. (Default: false)
    --report-min(=false)?                Enable/Disable reporting of the smallest run time. (Default: false)
    --report-variance(=false)?           Enable/Disable reporting of the variance. (Default: false)
```

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
/// <reference path="../node_modules/as-pect/assembly/__tests__/as-pect.d.ts" />
```

<!-- markdownlint-enable MD013 -->

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
    "test:ci": "asp --reporter=SummaryTestReporter"
  }
}
```

## AssemblyScript Compiler Options

### `--compiler` CLI Argument

By default `as-pect` will use node's resolver to look for an `assemblyscript`
module.  If you want to specify a different version of the compiler, use
`--compiler ../relative/path/to/compiler/folder`.  Note that it expects the following
to be the same `__folder__/dist/asc.js`, `__folder__/cli/util/options.js`, and
`__folder__/lib/loader.js`.

### Compiler Flags

Regardless of the installed version, all the compiler flags will be passed to
the `asc` command line tool.

```ts
import asc from "assemblyscript/cli/asc";
```

Inside the callback, any files that are generated, except for the `.wasm` file
will be output using the `{testFolder}/{testName}.{ext}` format. This includes
source maps, `.wat` files, `.js` files, and types files generated by the compiler.

## Closures

AssemblyScript currently does not support closures around local scopes, only
around global scope. However, you can place all relevant tests and setup
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

This log function does *not* pipe the output to stdout. It simply attaches the
log value to the current group or test the `log()` function was called in. Then
the after the test runs the configured `Reporter` decides if it is piped to
stdout, which is what `DefaultTestReporter` does.

## Reporters

Reporters are the way tests get reported. When running the CLI, the
`DefaultReporter` is used and all the values will be logged to the console. The
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

Each function is self-explanatory, and you don't need to call `super()` when
extending the Reporter class, since `Reporter` does not have one.

If no reporter is provided to the configuration, one will be provided that uses
`console.log()` and `chalk` to provide colored output.

If performance is enabled, then the `times` array will be populated with the
runtime values measured in milliseconds.

## RTrace and Memory Leaks

If an expectation fails and hits an `unreachable()` instruction, any unreleased
references in the function call stack will be held indefinitely as a memory
leak. Test Suites don't stop running if they fail the test callback. However,
tests will stop if they fail inside the `beforeEach()`, `beforeAll()`,
`afterEach()`, and `afterAll()` callbacks.

Typically, a `throws()` test will leave at *least* a single `Expectation` on the
heap. This is to be expected, because the `unreachable()` instruction unwinds
the stack, and prevents the ability for each function to `__release` a reference
pointer properly. Your test suite output may look like this:

```
[Describe]: toHaveLength TypedArray type: Uint32Array

 [Success]: ✔ should assert expected length
 [Success]: ✔ Throws: when expected length should not equal the same value RTrace: +3
 [Success]: ✔ should verify the length is not another value
 [Success]: ✔ Throws: when the length is another expected value RTrace: +3
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

## Performance Testing

To increase performance on testing, do not use the `log()` function and reduce
the amount of IO that `as-pect` must do to compile your tests. The biggest
bottleneck in Web Assembly testing, is compilation. This means that using
things like `@inline` many times will cause your module to compile more slowly,
and as a result the test file will run slower.

### Performance Enabling Via API

To enable performance using the global test functions, call the
`performanceEnabled()` function with a `true` value.

```ts
describe("my test suite", () => {
  performanceEnabled(true);
  test("some performance test", () => {
    // some performance sensitive code
  });
});
```

When using `performanceEnabled(true)` on a test, logs are not supported for
that specific test. Running 10000 samples of a function that collects logs
will result in a very large amount of memory usage and IO. Calls to `log<T>()`
will be ignored and any test with the `test.performance` property set to
`true` will have a `test.logs` array with a length of `0`.

Note that each of the performance functions must be called before the test is
declared in the same `describe` block to override the corresponding default
configuration values on a test by test basis.

To override the maximum number of samples collected, use the `maxSample` function.

```ts
maxSamples(10000); // 10000 is the maximum value
it("should collect only 10000 samples at most", () => {});
```

To override the maximum test run time (including test logic), use the
`maxRunTime` function.

```ts
maxRunTime(5000); // 5000 ms, or 5 seconds of test run time
it("should have a maxRunTime of 5 seconds", () => {});
```

To override how many decimal places are rounded to, use the `roundDecimalPlaces`
function.

```ts
roundDecimalPlaces(4); // 3 is the default
it("should round to 4 decimal places", () => {});
```

To force reporting of the median test runtime, use the `reportMedian` function.

```ts
reportMedian(true); // false will disable reporting of the median
it("should report the median", () => {});
```

To force reporting of the average, or mean test runtime, use the `reportAverage`
function.

```ts
reportAverage(true); // false will disable reporting of the mean
it("should report the average", () => {});
```

To force reporting of the variance of the runtimes, use the `reportVariance`
function.

```ts
reportVariance(true); // false will disable reporting of the variance
it("should report the variance deviation", () => {});
```

To force reporting of the standard deviation of the runtimes, use the
`reportStdDev` function. This method implies the use of a variance calculation,
and will be auto-included in the test result.

```ts
reportStdDev(true); // false will disable reporting of the standard deviation
it("should report the standard deviation", () => {});
```

To force reporting of the maximum runTime value, use the `reportMax` function.

```ts
reportMax(true); // false will disable reporting of the max
it("should report the max", () => {});
```

To force reporting of the minimum runTime value, use the `reportMin` function.

```ts
reportMin(true); // false will disable reporting of the min
it("should report the min", () => {});
```

## Performance Enabling Via Configuration

Providing these values inside an `as-pect.config.js` configuration will set
these as *the* global defaults.

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
}
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
  fileName: "./test.spec.wasm", // Always set the filename
});

// put your assemblyscript imports here
const imports = runner.createImports({});

// instantiate your test module here via the "assemblyscript/lib/loader" module
const wasm = instantiateStreaming<IAspectExports>(fetch("./test.spec.wasm"), imports);

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

## Special Thanks

Special thanks to the `AssemblyScript` team for creating one of the coolest
computer languages that compile to web assembly.
