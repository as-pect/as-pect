# as-pect

Write your module in TypeScript and get blazing fast testing with web assembly speeds!

# Usage

To install `as-pect`, install the latest version from github. Once `AssemblyScript` becomes more stable,
`as-pect` will be published to npm.

```
$ npm install jtenner/as-pect
```

To initialize a test suite, run `npx asp --init`. It will create the following folders and files.

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

To run `as-pect`, use the command line: `npx asp`, or create an npm script.

```json
{
  "scripts": {
    "test": "asp"
  }
}
```

Run `asp` from the command line using npx without any parameters to use `./as-pect.config.js` as your
test configuration. Otherwise, you can specify a configuration like this:

```
$ npx asp --config as-pect.config.js
```

All of the values configured in the configuration are overridable via the command line.

# CLI

This is the CLI help displayed when using the `asp` help flag.

```
  SYNTAX
    asp --init                          Create a test config, an assembly/__tests__ folder and exit.
    asp -i
    asp --config as-pect.config.js      Use a specified configuration
    asp -c as-pect.config.js
    asp --version                       View the version.
    asp -v
    asp --help                          Show this help screen.
    asp -h
    asp --types                         Copy the types file to assembly/__tests__/as-pect.d.ts
    asp -t

  TEST OPTIONS
    --performance                        Enable performance statistics. (Default: false)
    --max-samples=[number]               Set the maximum number of samples to run for each test. (Default: 10000 samples)
    --max-test-run-time=[number]         Set the maximum test run time in milliseconds. (Default: 2000ms)
    --report-median(=false)?             Enable/Disable reporting of the median time. (Default: true)
    --report-average(=false)?            Enable/Disable reporting of the average time. (Default: true)
    --report-standard-deviation(=false)? Enable/Disable reporting of the standard deviation. (Default: false)
    --report-max(=false)?                Enable/Disable reporting of the largest run time. (Default: false)
    --report-min(=false)?                Enable/Disable reporting of the smallest run time. (Default: false)
```

# Configuration

Currently `as-pect` will compile each file that matches each `Glob` in the `include` property of
your configuration. The default include is `"assembly/__tests__/**/*.spec.ts"`. It must compile each
file, and run each binary seperately inside it's own `TestContext`. This is a limitation of
AssemblyScript, not of `as-pect`.

A single TypeScript file is added to the compilation to add all the global test functions like
`describe`, `it`, `test`, and `expect`. All of these functions are placed conveniently into a
`as-pect.d.ts` file in the `__tests__` folder when the test suite is initialized.

## Configuration Files

A typical configuration looks like this:

```ts
module.exports = {
  /**
   * A set of globs passed to the glob package that qualify typescript files for testing.
   */
  include: ["assembly/__tests__/**/*.spec.ts"],
  /**
   * A set of globs passed to the glob package that quality files to be added to each test.
   */
  add: ["assembly/__tests__/**/*.include.ts"],
  /**
   * All the compiler flags needed for this test suite. Make sure that a binary file is output.
   */
  flags: {
    "--validate": [],
    "--debug": [],
    "--measure": [],
    /** This is required. Do not change this. The filename is ignored, but required by the compiler. */
    "--binaryFile": ["output.wasm"],
    /** To enable wat file output, use the following flag. The filename is ignored, but required by the compiler. */
    // "--textFile": ["output.wat"],
  },
  /**
   * A set of regexp that will disclude source files from testing.
   */
  disclude: [/node_modules/i],
  /**
   * Add your required AssemblyScript imports here.
   */
  imports: {},
  /**
   * All performance statistics reporting can be configured here.
   */
  performance: {
    /** Enable performance statistics gathering. */
    enabled: false,
    /** Set the maximum number of samples to run for each test. */
    maxSamples: 10000,
    /** Set the maximum test run time in milliseconds. */
    maxTestRunTime: 2000,
    /** Set the number of decimal places to round to. */
    roundDecimalPlaces: 3,
    /** Report the median time in the default reporter. */
    reportMedian: true,
    /** Report the average time in milliseconds. */
    reportAverage: true,
    /** Report the standard deviation. */
    reportStandardDeviation: false,
    /** Report the maximum run time in milliseconds. */
    reportMax: false,
    /** Report the minimum run time in milliseconds. */
    reportMin: false,
    /** Report the variance. */
    reportVariance: false,
  },
  // reporter: new CustomReporter(),
};
```

If your module requires a set of imported functions, it's okay to mock them here in the `imports`
property of the configuration. If any module fails during compilation, the utility will exit with
code 1 so it can be used for travis builds.

## Reporters

Reporters are the way tests get reported. When running the CLI, the `DefaultReporter` is used and
all the values will be logged to the console. The test suite itself does not log out test results.
If you want to use a custom reporter, you can create your own by extending the abstract reporter
class.

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

Each test suite run will use the provided reporter and call `onStart(suite: TestSuite)` to notify a
consumer that a test has started. This happens once per test file. Since a file can have multiple
`describe` function calls, these are logically placed into `TestGroup`s. Each `TestGroup` has it's
own description and contains a list of `TestResult`s that were run.

Each function is self explainatory, and you don't need to call `super()` when extending the Reporter
class, since `Reporter` does not have one.

If no reporter is provided to the configuration, one will be provided that uses `console.log()` and
`chalk` to provide colored output.

If performance is enabled, then the `times` array will be populated with the runtime values measured
in milliseconds.

# Notes

## Using as-pect as a Package

This is a typescript example that should work even when run in the browser.

```ts
import { TestContext, IPerformanceConfiguration, EmptyReporter } from "as-pect";

const perf: IPerformanceConfiguration = {
  // put performance configuration values here
};
const reporter = new EmptyReporter();
const runner = new TestContext(reporter, file, performanceConfiguration);
const imports = runner.createImports({
  // put your assemblyscript imports here
});

// instantiate your module here via instantiateStreaming, instantiateBuffer, or instantiateModule
const wasm = instantiateBuffer(buffer, imports);

runner.run(wasm); // run the tests synchronously

for (const group of runner.testGroups) { // for each group
  for (const test of runner.tests) { // for each reporter
    console.log(test.name, test.pass ? "pass" : "fail");
  }
}
```

The imports must be created before the module is instantiated, because each top level statement that
runs modifies the `TestContext` state machine. Once the module is instantiated, then the tests can
be run. The only thing that it needs is the wasm `ASUtil` object provided by the
`assemblyscript/lib/loader` package.

In order to pre-compile tests manually, it's important to include all necesary entry points provided
by `as-pect` manually. The following files are auto-included by the `cli` and are required for in
browser testing as entry points.

```
./node_modules/as-pect/assembly/index.ts
```

When the allocator becomes configurable, there will be more optional files to include, but the
`assembly/index.ts` file contains all the required global functions to setup tests.

## Do Not Import An Allocator

The `as-pect` cli will automatically include the `arena` allocator for you (for now!), so it's not necessary
for you to include this at the top of each test.

```ts
// Do not do this, since it's done for you automatically
import "allocator/arena";
```

This will be replaced with a `--allocator` flag that specifies the test memory allocator. The default
will be backwards compatible and be specified as the `arena` allocator.

## Closures

AssemblyScript currently does not support closure, however, you must place all relevant tests and
setup function calls for a test suite into the corresponding describe block.

```ts
// setup a global vector reference
var vec: Vec3;

describe("vectors", (): void => {
  // this runs before each test function, and must be placed within the describe function
  beforeEach((): void => {
    // create a new vector for each test
    vec = new Vec3(1, 2, 3);
  });

  // this runs after each test function, and must be placed within the describe function
  afterEach((): void => {
    memory.free(changetype<usize>(vec)); // free the vector
    vec = null;
  });

  // use `test()` or `it()` to run a test
  test("vec should not be null", (): void => {
    // write an expectation
    expect<Vec3>(vec).not.toBeNull();
  });
});
```

Nested describes are supported and the outer describe should be evaluated first.

```ts
describe("vector", (): void => {
  // this test block runs first
  it("should run first", (): void => {});

  describe("addition", (): void => {
    // this test block runs second
    it("should add vectors together", (): void => {
       expect<Vec3>(vec1.add(vec2)).toStrictEqual(new Vec3(1, 2, 3));
    });
  });
});
```

## Logging

To use the global `log<T>(value: T): void` function provided by `as-pect`, simply give it the type
you want to log, and it will append a `[Log]` item to the `test.logs` value, or the `group.logs`
value depending on when the `log` function was called.

```ts
log<string>("This will log a string"); // Remember, strings are references
log<f64>(0.4); // this logs a float value
log<i32>(42); // this logs the meaning of life
log<Vec3>(new Vec3(1, 2, 3)); // this logs every byte in the reference
```

## Performance Testing

It's possible to switch a test to performance mode. The `DefaultReporter` will, instead of logging
each `log()`ed value, it will report the performance statistics calculated at the end of sample
collection.

### Performance Enabling Via API

To enable performance using the global test functions, call the `performanceEnabled()` function with a `true` value.

```ts
describe("my test suite", (): void => {
  performanceEnabled(true);
  maxSamples(2000); // limit the sample size upper bound
  maxRunTime(4000); // only run for 4 seconds
  test("some performance test", (): void => {
    // some performance sensitive code
  });
});
```

Note that each of the following performance functions must be called before the test is declared in the same `describe`
block to override the default configuration values on a test by test basis.

To override the maximum number of samples collected, use the `maxSample` function.

```ts
maxSamples(10000); // 10000 is the maximum value
it("should collect only 10000 samples at most", (): void => {});
```

To override the maximum test run time (including test logic), use the `maxRunTime` function.

```ts
maxRunTime(5000); // 5000 ms, or 5 seconds of test run time
it("should have a maxRunTime of 5 seconds", (): void => {});
```

To override how many decimal places are rounded to, use the `roundDecimalPlaces` function.

```ts
roundDecimalPlaces(4); // 3 is the default
it("should round to 4 decimal places", (): void => {});
```

To force reporting of the median test runtime, use the `reportMedian` function.

```ts
reportMedian(true); // false will disable reporting of the median
it("should report the median", (): void => {});
```

To force reporting of the average, or mean test runtime, use the `reportAverage` function.

```ts
reportAverage(true); // false will disable reporting of the mean
it("should report the average", (): void => {});
```

To force reporting of the variance in the runTime sample, use the `reportVariance` function.

```ts
reportVariance(true); // false will disable reporting of the variance
it("should report the variance deviation", (): void => {});
```

To force reporting of the standard deviation of the runTime sample, use the `reportStdDev` function.
This method implies the use of the variance calculation, and will auto-include it in the test result.

```ts
reportStdDev(true); // false will disable reporting of the standard deviation
it("should report the standard deviation", (): void => {});
```

To force reporting of the maximum runTime value, use the `reportMax` function.

```ts
reportMax(true); // false will disable reporting of the max
it("should report the max", (): void => {});
```

To force reporting of the minimum runTime value, use the `reportMin` function.

```ts
reportMin(true); // false will disable reporting of the min
it("should report the min", (): void => {});
```

### Performance Enabling Via Configuration

Providing these values inside an `as-pect.config.js` configuration will set these as global defaults.

Note that when using the `cli`, the cli flag inputs will override these default values in the `asp`
command line tool.

```js
// in as-pect.config.js
module.exports = {
  performance: {
    /** Enable performance statistics gathering for each test. */
    enabled: false,
    /** Set the maximum number of samples to run for each test. */
    maxSamples: 10000,
    /** Set the maximum test run time in milliseconds. */
    maxTestRunTime: 2000,
    /** Report the median time in the default reporter. */
    reportMedian: true,
    /** Report the average time in milliseconds. */
    reportAverage: true,
    /** Report the standard deviation. */
    reportStandardDeviation: false,
    /** Report the maximum run time in milliseconds. */
    reportMax: false,
    /** Report the minimum run time in milliseconds. */
    reportMin: false,
  },
}
```

## Special Thanks

Special thanks to the `AssemblyScript` team for creating one of the best computer languages that
compile to web assembly.
