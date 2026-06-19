# Reporter overview

Reporters turn completed Test suite facts into console output, files, or integration-specific payloads.

## When to use a reporter

Use a reporter when you want to:

- change console output,
- write test results to files,
- feed CI systems,
- integrate with dashboards,
- consume stable Suite report facts from `@as-pect/core`.

## Built-in choices

`asp` can select built-in reporters with CLI flags:

| Flag | Reporter |
| --- | --- |
| `--summary` | Compact console output. |
| `--verbose` | Per-group and per-test console output. |
| `--json` | Legacy as-pect JSON v1 files. |
| `--csv` | CSV v1 files. |
| `--junit` | JUnit XML files. |
| `--ctrf` | CTRF JSON files. |

The default reporter is summary output when no reporter is selected.

## Custom reporters

A custom reporter implements `IReporter` from `@as-pect/core` and is loaded with:

```sh
npx asp --reporter ./my-reporter.js
```

or from config:

```js
export default {
  reporter: "./my-reporter.js",
  // ...rest of config
};
```

Package reporters can be loaded by package name when the package default-exports an `IReporter` object:

```sh
npx asp --reporter @scope/as-pect-reporter
```

Use built-in shortcut flags for the built-in file reporters, such as `--junit` or `--ctrf`.

## Prefer report events

Modern reporters should prefer the report event callbacks:

- `onReportGroupStart(event)`
- `onReportGroupFinish(event)`
- `onReportTestStart(event)`
- `onReportTestFinish(event)`
- `onReportFinish(event)`

These callbacks receive stable report facts such as `SuiteReport`, `SuiteGroupReport`, and `SuiteTestReport`.

Legacy callbacks still exist:

- `onEnter(ctx, node)`
- `onExit(ctx, node)`
- `onFinish(ctx)`

Treat those as compatibility callbacks when possible.

## File-backed reporters

Use `@as-pect/reporter-output` when a reporter writes files next to test entries. It provides:

- output path construction,
- skip behavior for empty reports,
- stream creation,
- async flush tracking.

## Next steps

- Implement a reporter in [Custom reporters](custom-reporters.md).
- Learn event shapes in [Reporter API](reporter-api.md).
- Compare built-in outputs in [Built-in reporters](built-in-reporters.md).
- Review exact types in [Reporter reference](../reference/reporter-reference.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
