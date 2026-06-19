# @as-pect/csv-reporter

CSV file reporter for `as-pect` Test sessions.

## Use from the CLI

```sh
npx asp --csv
```

The reporter writes one `.csv` file per test entry, next to that entry, and skips empty Suite reports.

## Programmatic use

```ts
import CSVReporter from "@as-pect/csv-reporter";

const reporter = new CSVReporter();
```

Pass an output root to the constructor when relative `SuiteReport.fileName` values should resolve somewhere other than `process.cwd()`.

## Documentation

Detailed CSV contract and file-output behavior live in GitBook:

- [Built-in reporters](../../docs/extending/built-in-reporters.md#csv-reporter)
- [Output files](../../docs/extending/output-files.md)
- [Reporter package types](../../docs/types/reporters.md)

Hosted docs: [as-pect.gitbook.io/as-pect](https://as-pect.gitbook.io/as-pect/).
