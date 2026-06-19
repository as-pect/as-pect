# @as-pect/junit-reporter

JUnit XML file reporter for `as-pect` Test sessions.

## Use from the CLI

```sh
npx asp --junit
```

The reporter writes one `.xml` file per test entry, next to that entry, and skips empty Suite reports.

## Programmatic use

```ts
import JUnitReporter from "@as-pect/junit-reporter";

const reporter = new JUnitReporter();
```

Pass an output root to the constructor when relative `SuiteReport.fileName` values should resolve somewhere other than `process.cwd()`.

## Documentation

Detailed JUnit mapping and file-output behavior live in GitBook:

- [Built-in reporters](../../docs/extending/built-in-reporters.md#junit-xml-reporter)
- [Output files](../../docs/extending/output-files.md)
- [Reporter package types](../../docs/types/reporters.md)

Hosted docs: [as-pect.gitbook.io/as-pect](https://as-pect.gitbook.io/as-pect/).
