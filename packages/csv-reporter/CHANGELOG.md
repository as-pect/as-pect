# @as-pect/csv-reporter

## 9.0.1

### Patch Changes

- @as-pect/core@9.0.1
- @as-pect/reporter-output@9.0.1

## 9.0.0

### Patch Changes

- 65058fe: Share file-backed reporter output behavior across CSV and JSON reporters while preserving existing output paths and formats.
- 703fde8: Document the as-pect CSV v1 column contract and add compatibility coverage for CSV escaping and empty actual/expected fields.
- 5abb0e1: Treat groups and tests skipped by `--group` or `--test` filters as skipped instead of failed, and suppress per-file reports and aggregate counts for files with no executed results.
- dd71792: Anchor built-in file-backed reporter output to the Test session project path, and allow programmatic reporter users to pass an explicit output root.
- Updated dependencies [dbaaae5]
- Updated dependencies [65058fe]
- Updated dependencies [5abb0e1]
- Updated dependencies [4420210]
  - @as-pect/core@9.0.0
  - @as-pect/reporter-output@9.0.0
