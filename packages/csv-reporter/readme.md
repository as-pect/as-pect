# jtenner/as-pect - @as-pect/csv-reporter

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

To view the documentation, it's located [here](https://tenner-joshua.gitbook.io/as-pect/) on the gitbook. If there are any issues with the docs, please feel free to file an issue!

## Reporter API

This package writes CSV rows from the Suite report facts delivered to `onReportFinish({ report })`. Custom file reporters should prefer the report event callbacks from `@as-pect/core` and treat `onFinish(ctx)` as a legacy compatibility callback.

## as-pect CSV v1 contract

`@as-pect/csv-reporter` emits an as-pect-specific tabular export for spreadsheet and lightweight data-processing workflows. It is not a cross-tool test-result standard.

The CSV file is written next to the test entry with the entry extension replaced by `.csv`. For example, `assembly/__tests__/entry.spec.ts` writes `assembly/__tests__/entry.spec.csv`. Empty reports where `SuiteReport.hasResults === false` do not create a file.

The v1 column order is stable and compatibility-tested:

| Column | Test result values | Todo result values |
| --- | --- | --- |
| `Group` | Suite result `groupName` | Todo `groupName` |
| `Name` | Test name | Todo description |
| `Ran` | `RAN` or `NOT RUN` | `TODO` |
| `Negated` | `TRUE` or `FALSE` | Empty |
| `Pass` | `PASS` or `FAIL` | Empty |
| `Runtime` | Runtime in milliseconds | Empty |
| `Message` | Result message | Empty |
| `Actual` | Actual value text, or empty when null | Empty |
| `Expected` | Expected value text, or empty when null | Empty |

Example output:

```csv
Group,Name,Ran,Negated,Pass,Runtime,Message,Actual,Expected
math,adds values,RAN,FALSE,PASS,3,ok,3,3
math,handles division,TODO,,,,,,
```

Values are emitted through `csv-stringify`, so commas, quotes, and newlines are escaped as CSV fields instead of changing the column contract. Future column additions or vocabulary changes should use a new CSV contract version or an explicit migration note.

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
