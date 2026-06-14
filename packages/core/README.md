# jtenner/as-pect - @as-pect/core

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

To view the documentation, it's located [here](https://tenner-joshua.gitbook.io/as-pect/) on the gitbook. If there are any issues with the docs, please feel free to file an issue!

## Reporter interface guidance

Custom reporters should prefer the report event callbacks exposed by `IReporter`:

- `onReportGroupStart(event)` and `onReportGroupFinish(event)` receive `{ group }` facts.
- `onReportTestStart(event)` and `onReportTestFinish(event)` receive `{ group, test }` facts.
- `onReportFinish(event)` receives `{ report }` facts for the completed suite.

These events carry stable Suite report facts that are ready to render. New reporters should read from `SuiteGroupReport`, `SuiteTestReport`, and `SuiteReport` instead of walking `TestContext` or mutable `TestNode` state.

The older `onEnter(ctx, node)`, `onExit(ctx, node)`, and `onFinish(ctx)` callbacks remain available for compatibility with existing reporters and subclasses. Treat them as legacy extension points for migration only. The Reporting lifecycle now keeps compatibility-only `TestContext` and `TestNode` facts behind the legacy reporter adapter so they do not leak into report event payloads.

If a reporter needs to create report facts directly, use `createGroupReport(node)`, `createTestReport(group, test)`, or `createSuiteReport(ctx)` from `@as-pect/core`.

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
