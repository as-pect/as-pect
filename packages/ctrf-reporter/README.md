# @as-pect/ctrf-reporter

CTRF JSON file reporter for `as-pect` Test sessions.

## Use from the CLI

```sh
npx asp --ctrf
```

The reporter writes one `.ctrf.json` file per test entry, next to that entry, and skips empty Suite reports. Use it when a consumer expects the Common Test Report Format.

## Programmatic use

```ts
import CTRFReporter from "@as-pect/ctrf-reporter";

const reporter = new CTRFReporter();
```

Pass an output root to the constructor when relative `SuiteReport.fileName` values should resolve somewhere other than `process.cwd()`.

## Documentation

Detailed CTRF mapping and file-output behavior live in GitBook:

- [Built-in reporters](../../docs/extending/built-in-reporters.md#ctrf-json-reporter)
- [Output files](../../docs/extending/output-files.md)
- [Reporter package types](../../docs/types/reporters.md)

Hosted docs: [as-pect.gitbook.io/as-pect](https://as-pect.gitbook.io/as-pect/).
