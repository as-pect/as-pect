# jtenner/as-pect - @as-pect/cli

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

To view the documentation, it's located [here](https://tenner-joshua.gitbook.io/as-pect/) on the gitbook. If there are any issues with the docs, please feel free to file an issue!

## Test session vocabulary

The CLI drives each Test session from configuration to report output. `as-pect.config.js` defines the Test session entry plan, JavaScript-side Wasm host imports through `instantiate(...)`, reporters, WASI options, coverage globs, and output behavior. `as-pect.asconfig.json` remains the AssemblyScript compiler configuration used to produce compiler output for each planned entry.

Snapshot file paths and write modes are part of the Test session snapshot plan. Snapshot pass/fail and update decisions come from the Snapshot lifecycle in `@as-pect/snapshots` before the CLI writes files.

## CLI filters

Use `asp --test <regex>` or `asp -t <regex>` to run tests whose names match a regular expression. Use `asp --group <regex>` or `asp -g <regex>` to run groups whose names match a regular expression. These options consume the following argument as the filter pattern; remaining positional arguments are still treated as Test session entry globs.

## Reporter output formats

Use `asp --junit` to write JUnit XML files next to test entries for CI systems that ingest JUnit-style unit test reports. You can also install/select the package explicitly with `asp --reporter @as-pect/junit-reporter`. The reporter maps Suite report facts to common `testsuite`, `testcase`, `failure`, `error`, `skipped`, and `system-out` elements.

`@as-pect/csv-reporter` writes the as-pect CSV v1 tabular export for spreadsheet-style workflows. It preserves the column order `Group`, `Name`, `Ran`, `Negated`, `Pass`, `Runtime`, `Message`, `Actual`, `Expected` and does not claim CSV as a cross-tool test-result standard. See [`../csv-reporter/readme.md`](../csv-reporter/readme.md#as-pect-csv-v1-contract) for the full column and value contract.

## Code coverage

`as-pect` uses [`as-covers`](https://www.npmjs.com/package/@as-covers/core) for AssemblyScript line and branch coverage. The `asp --init` template already creates an `as-pect.asconfig.json` with two compiler targets:

- `noCoverage`, which runs only the `@as-pect/transform` transform.
- `coverage`, which adds the `@as-covers/assembly` support library and the `@as-covers/transform` transform before `@as-pect/transform`.

Enable coverage by uncommenting or adding the `coverage` glob list in `as-pect.config.js`:

```js
export default {
  // ...the rest of your as-pect config
  coverage: ["assembly/**/*.ts"],
};
```

When `coverage` is non-empty, `asp` compiles tests with the `coverage` target, installs the `as-covers` imports, registers each test module with `as-covers`, and prints a coverage report after the run.

If you maintain a custom `as-pect.asconfig.json`, make sure it includes the coverage target shape from the init template:

```json
{
  "targets": {
    "coverage": {
      "lib": ["./node_modules/@as-covers/assembly/index.ts"],
      "transform": ["@as-covers/transform", "@as-pect/transform"]
    },
    "noCoverage": {
      "transform": ["@as-pect/transform"]
    }
  }
}
```

## AssemblyScript compiler options

`as-pect.config.js` configures the Test session entry plan, Wasm host imports, reporters, WASI, coverage globs, and output behavior. It is not an `asc` compiler configuration file.

Put AssemblyScript compiler options, including the `asc --lib` option, in `as-pect.asconfig.json`. `asp` invokes the compiler with that file and selects either the `noCoverage` target or the `coverage` target, so target-specific options must be present on the target that will run.

For example, add custom library components to tests like this:

```json
{
  "targets": {
    "coverage": {
      "lib": ["./assembly/test-lib", "./node_modules/@as-covers/assembly/index.ts"],
      "transform": ["@as-covers/transform", "@as-pect/transform"]
    },
    "noCoverage": {
      "lib": ["./assembly/test-lib"],
      "transform": ["@as-pect/transform"]
    }
  },
  "options": {
    "exportMemory": true,
    "outFile": "output.wasm",
    "textFile": "output.wat",
    "bindings": "raw",
    "exportStart": "_start",
    "exportRuntime": true,
    "use": ["RTRACE=1"],
    "debug": true,
    "exportTable": true
  },
  "extends": "./asconfig.json",
  "entries": ["./node_modules/@as-pect/assembly/assembly/index.ts"]
}
```

Keep using `as-pect.config.js` for JavaScript-side WebAssembly imports through `instantiate(...)`. Use `as-pect.asconfig.json` for AssemblyScript-side compile-time inputs such as `lib`, `path`, `transform`, and `use`.

## Contributors

To contribute please see [CONTRIBUTING.md](./CONTRIBUTING.md).

Thanks to [@willemneal](https://github.com/willemneal) and
[@MaxGraey](https://github.com/maxgraey) for all their support in making `as-pect` the
best software it can be.

Other Contributors:

- [@trusktr](https://github.com/trusktr) - Documentation Changes
- [@MaxGraey](https://github.com/maxgraey) - Performance API suggestions
- [@torch2424](https://github.com/torch2424) - Documentation Changes
- [@dcodeio](https://github.com/torch2424) - Made AssemblyScript itself!
- [@9oelM](https://github.com/9oelM) - Misc functionalities

## Special Thanks

Special thanks to the [AssemblyScript](https://github.com/AssemblyScript/assemblyscript)
team for creating AssemblyScript itself.
