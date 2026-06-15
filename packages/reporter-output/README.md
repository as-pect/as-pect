# @as-pect/reporter-output

Shared file-output helpers for as-pect file-backed reporters.

`ReporterFileOutput` owns the common mechanics that CSV, JSON, and future file-backed reporters share:

- building the output path next to the test entry by replacing its extension;
- skipping file creation when `SuiteReport.hasResults === false`;
- creating the Node write stream; and
- exposing a single `flush()` promise that resolves after pending stream work finishes or rejects with stream errors.

Reporter packages still own their format-specific serialization. They start a file-backed report, write their format to the returned stream, and call `trackFlush()` for any additional serialization stream that must complete before `onFlush()` resolves.

Example path mapping:

```text
assembly/__tests__/entry.spec.ts -> assembly/__tests__/entry.spec.json
assembly/__tests__/entry.spec.ts -> assembly/__tests__/entry.spec.csv
```

This package intentionally uses Node built-ins only.
