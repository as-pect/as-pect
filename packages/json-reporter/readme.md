# @as-pect/json-reporter

Legacy JSON file reporter for `as-pect` Test sessions.

## Use from the CLI

```sh
npx asp --json
```

The reporter writes one `.json` file per test entry, next to that entry, and skips empty Suite reports. Use `@as-pect/ctrf-reporter` / `asp --ctrf` when a consumer expects the Common Test Report Format.

## Programmatic use

```ts
import JSONReporter from "@as-pect/json-reporter";

const reporter = new JSONReporter();
```

Pass an output root to the constructor when relative `SuiteReport.fileName` values should resolve somewhere other than `process.cwd()`.

## Documentation

Detailed JSON contract and file-output behavior live in GitBook:

- [Built-in reporters](../../docs/extending/built-in-reporters.md#legacy-json-reporter)
- [Output files](../../docs/extending/output-files.md)
- [Reporter package types](../../docs/types/reporters.md)

Hosted docs: [as-pect.gitbook.io/as-pect](https://as-pect.gitbook.io/as-pect/).
