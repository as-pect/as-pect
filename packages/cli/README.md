# jtenner/as-pect - @as-pect/cli

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

To view the documentation, it's located [here](https://tenner-joshua.gitbook.io/as-pect/) on the gitbook. If there are any issues with the docs, please feel free to file an issue!

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
