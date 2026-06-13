# jtenner/as-pect

This package is a monorepo that contains the cli and the core for the `@as-pect` packages.

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

The [documentation is located at gitbook](https://as-pect.gitbook.io/as-pect/). If there are any issues with the docs, please feel free to file an issue!

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

`as-pect.config.js` configures the test runner. Put AssemblyScript compiler options in `as-pect.asconfig.json` instead. For example, configure the `asc --lib` option as a `lib` array on the `noCoverage` target, and also on the `coverage` target when coverage is enabled. See [`packages/cli/README.md`](./packages/cli/README.md#assemblyscript-compiler-options) for an example.

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
