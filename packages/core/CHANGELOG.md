# @as-pect/core

## 8.2.0

### Minor Changes

- dbaaae5: Add `toThrowWith()` for asserting thrown messages or stack traces contain an expected substring.

### Patch Changes

- 5abb0e1: Treat groups and tests skipped by `--group` or `--test` filters as skipped instead of failed, and suppress per-file reports and aggregate counts for files with no executed results.
- Updated dependencies [dbaaae5]
  - @as-pect/assembly@8.2.0
  - @as-pect/snapshots@8.2.0
