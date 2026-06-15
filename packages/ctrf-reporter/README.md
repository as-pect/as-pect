# @as-pect/ctrf-reporter

Writes [CTRF](https://ctrf.io/) JSON report files for as-pect Test sessions.

Use this reporter when another tool expects the Common Test Report Format. The legacy `@as-pect/json-reporter` package remains the as-pect-specific JSON v1 output.

```sh
asp --ctrf
# or
asp --reporter @as-pect/ctrf-reporter
```

For each test entry, the reporter writes a sibling `.ctrf.json` file under the configured project root. The output root contains `reportFormat: "CTRF"`, a `specVersion`, and a `results` object with `tool`, `summary`, and `tests` fields.

Status mapping:

- Passing test: `passed`
- Failing test: `failed`
- Declared todo: `pending`
- Not-run filtered test: `skipped`
- Suite-level error: failed CTRF test entry with `extra.asPect.type: "suiteError"`

as-pect-only facts such as negation, rtrace deltas, reflected actual/expected values, snapshot changes, and the source Suite report file name are nested under `extra.asPect`.
