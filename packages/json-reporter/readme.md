# jtenner/as-pect - @as-pect/json-reporter

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

To view the documentation, it's located [here](https://tenner-joshua.gitbook.io/as-pect/) on the gitbook. If there are any issues with the docs, please feel free to file an issue!

## Reporter API

This package writes JSON from the Suite report facts delivered to `onReportFinish({ report })`. Custom file reporters should prefer the report event callbacks from `@as-pect/core` and treat `onFinish(ctx)` as a legacy compatibility callback.

## as-pect legacy JSON v1 contract

`@as-pect/json-reporter` is the as-pect legacy JSON reporter. It is selected by `asp --json` and intentionally remains separate from the standardized CTRF reporter in `@as-pect/ctrf-reporter`.

The reporter writes one sibling `.json` file per test entry. The file root is an array of result objects in execution order.

Passing and failing tests use this field shape:

```json
{
  "group": "math",
  "name": "adds values",
  "ran": true,
  "pass": true,
  "negated": false,
  "runtime": 3,
  "message": null,
  "actual": "3",
  "expected": "3"
}
```

Failed tests keep the same fields with `pass: false`, assertion text in `message`, and reflected assertion strings in `actual` and `expected` when present.

Todo results use the same object shape for compatibility:

```json
{
  "group": "math",
  "name": "TODO: handles division",
  "ran": false,
  "pass": null,
  "negated": false,
  "runtime": 0,
  "message": "",
  "actual": null,
  "expected": null
}
```

Use `asp --ctrf` or `asp --reporter @as-pect/ctrf-reporter` when a consumer expects CTRF root fields such as `reportFormat`, `specVersion`, and `results`.

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
