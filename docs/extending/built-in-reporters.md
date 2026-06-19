# Built-in reporters

`as-pect` ships console reporters and optional file-backed reporters for common workflows.

## Summary reporter

```sh
npx asp --summary
```

Summary output is compact and is the default when no reporter is selected. It prints per-entry pass counts, todo counts, runtime, warnings, errors, snapshot changes, and the final Test session summary.

Use it for normal local runs and CI logs.

## Verbose reporter

```sh
npx asp --verbose
```

Verbose output prints group and test progress with assertion details, logs, failures, and snapshot changes.

Use it when debugging a failing test.

## Legacy JSON reporter

```sh
npx asp --json
```

Writes one sibling `.json` file per test entry. The file root is the as-pect legacy JSON v1 array format.

Example test result object:

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

Todo results use the same object shape for compatibility, with `name` prefixed by `TODO:`, `ran: false`, `pass: null`, `runtime: 0`, and `actual` / `expected` set to `null`.

Use CTRF instead when a tool expects a cross-tool test result format.

## CSV reporter

```sh
npx asp --csv
```

Writes one sibling `.csv` file per test entry using the as-pect CSV v1 contract.

Stable column order:

```text
Group, Name, Ran, Negated, Pass, Runtime, Message, Actual, Expected
```

Value contract:

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

Values are emitted through `csv-stringify`, so commas, quotes, and newlines are escaped as CSV fields.

Use CSV for spreadsheet-style workflows and lightweight data processing.

## JUnit XML reporter

```sh
npx asp --junit
```

Writes one sibling `.xml` file per test entry. Use it with CI systems that ingest JUnit-style reports.

JUnit mapping highlights:

- passing tests become `<testcase />`,
- failing tests become `<failure>`,
- todos and not-run tests become `<skipped>`,
- suite-level errors become synthetic `<error>` testcases,
- snapshot changes are written to `<system-out>`.

## CTRF JSON reporter

```sh
npx asp --ctrf
```

Writes one sibling `.ctrf.json` file per test entry using the Common Test Report Format. The output root includes `reportFormat: "CTRF"`, a `specVersion`, and a `results` object with `tool`, `summary`, `tests`, and `extra.asPect` fields.

Status mapping:

- pass: `passed`,
- fail: `failed`,
- todo: `pending`,
- not run: `skipped`.

as-pect-specific facts are nested under `extra.asPect`.

## Combining reporters

Flags can be combined:

```sh
npx asp --summary --junit --ctrf
```

The CLI wraps selected reporters in a `CombinationReporter`. If both console reporter flags are present, `--summary` is selected before `--verbose`.

## Next steps

- Write a custom reporter in [Custom reporters](custom-reporters.md).
- Learn file output behavior in [Output files](output-files.md).
- See exact fields in [Reporter reference](../reference/reporter-reference.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
