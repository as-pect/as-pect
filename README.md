# jtenner/as-pect

This package is a monorepo that contains the cli and the core for the `@as-pect` packages.

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

The [documentation is located at gitbook](https://as-pect.gitbook.io/as-pect/). If there are any issues with the docs, please feel free to file an issue!

## Architecture vocabulary

This repository uses the project terms in [`CONTEXT.md`](./CONTEXT.md) when describing internals. The CLI coordinates a Test session, `@as-pect/core` owns Test suite facts and the Reporting lifecycle, `@as-pect/snapshots` owns the Snapshot lifecycle, and `@as-pect/transform` owns the Class reflection transform and Class-member plan.

## Code coverage

AssemblyScript line and branch coverage is provided through [`as-covers`](https://www.npmjs.com/package/@as-covers/core). In projects created with `asp --init`, enable it by adding coverage globs to `as-pect.config.js`:

```js
export default {
  // ...the rest of your as-pect config
  coverage: ["assembly/**/*.ts"],
};
```

When coverage is enabled, `asp` uses the `coverage` target from `as-pect.asconfig.json`, which wires in `@as-covers/assembly` and `@as-covers/transform`, then prints the coverage report after the test run. See [`packages/cli/README.md`](./packages/cli/README.md#code-coverage) for the target configuration details.

## AssemblyScript compiler options

`as-pect.config.js` configures the Test session. Put AssemblyScript compiler options in `as-pect.asconfig.json` instead. For example, configure the `asc --lib` option as a `lib` array on the `noCoverage` target, and also on the `coverage` target when coverage is enabled. See [`packages/cli/README.md`](./packages/cli/README.md#assemblyscript-compiler-options) for an example.

## Reporter output formats

The JUnit XML reporter (`@as-pect/junit-reporter`) writes CI-friendly `.xml` files next to test entries. Install it and use it through the existing custom reporter option: `asp --reporter @as-pect/junit-reporter`. The report maps Suite report facts to common JUnit XML `testsuite`, `testcase`, `failure`, `error`, `skipped`, and `system-out` elements.

The CSV reporter (`@as-pect/csv-reporter`) is documented as the as-pect CSV v1 tabular export. It keeps the stable column order `Group`, `Name`, `Ran`, `Negated`, `Pass`, `Runtime`, `Message`, `Actual`, `Expected` for spreadsheet-style workflows, without claiming to be a cross-tool CSV test-result standard. See [`packages/csv-reporter/readme.md`](./packages/csv-reporter/readme.md#as-pect-csv-v1-contract) for the full column contract.

## Snapshot names

Snapshots are keyed by the full Test node namespace plus the explicit snapshot name passed by the test. The namespace includes every `describe`/`it` segment and duplicate-safe indexes, for example:

```text
outer[0]!~duplicate[1]!~renders value[0]
```

This namespace-derived format intentionally replaces the older test-name-only format so duplicate test names and multiple snapshots with the same explicit name remain tied to the exact Test node that created them. Existing snapshot files that use the older key shape must be updated for the next major release.

## Development and publishing

This repository uses npm workspaces for local package linking and Changesets for versioning/publishing.

```sh
npm install
npm test
npm run changeset
```

To publish manually, run `npm run version-packages` followed by `npm run release`. The GitHub release workflow also creates Changesets version PRs and publishes merged release PRs with `NPM_TOKEN`.

## Contributors

To contribute please see [CONTRIBUTING.md](./CONTRIBUTING.md).

Thanks to [@willemneal](https://github.com/willemneal) and
[@MaxGraey](https://github.com/maxgraey) for all their support in making `as-pect` the
best software it can be.

Other Contributors:

- [@trusktr](https://github.com/trusktr) - Documentation Changes
- [@MaxGraey](https://github.com/maxgraey) - Performance API suggestions
- [@torch2424](https://github.com/torch2424) - Documentation Changes
- [@dcodeIO](https://github.com/dcodeIO) - Made AssemblyScript itself!
- [@9oelM](https://github.com/9oelM) - Misc functionalities

## Special Thanks

Special thanks to the [AssemblyScript](https://github.com/AssemblyScript/assemblyscript)
team for creating AssemblyScript itself.
