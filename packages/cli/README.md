# @as-pect/cli

Package containing the command line interface for running tests.

## Table of contents

1. [Usage](#usage)
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

## Usage

To install `as-pect`, install the latest version from npm.

```
$ npm install @as-pect/cli @as-pect/core @as-pect/assembly
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

Most of the values configured in the configuration are overridable via the command
line, with the exception of the Web Assembly imports provided to the module.

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

    asp --workers 3                      Enable the experimental worker worklets (default: 0  [disabled])
      asp -w

  REPORTER OPTIONS
    --summary                            Use the summary reporter. Use the summary reporter. (This is the default if no reporter is specified.)
    --verbose                            Use the reporter.
    --csv                                Use the csv reporter (output results to csv files.)
    --json                               Use the json reporter (output results to json files.)
    --reporter                           Define a custom reporter (path or module)

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
/// <reference path="../node_modules/@as-pect/assembly/types/as-pect.d.ts" />
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
