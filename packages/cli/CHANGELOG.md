# @as-pect/cli

## 9.0.1

### Patch Changes

- 0d73587: Update coverage support for as-covers 0.5.0 and route initialized coverage builds through an as-pect wrapper transform that instruments project sources while leaving dependency sources alone.
  - @as-pect/assembly@9.0.1
  - @as-pect/core@9.0.1
  - @as-pect/transform@9.0.1

## 9.0.0

### Major Changes

- Release as-pect 9.0.0.

### Patch Changes

- fdd7f20: Add a dedicated CTRF JSON reporter package and `asp --ctrf` shortcut while documenting that `asp --json` remains the as-pect legacy JSON v1 contract.
- ad0b58f: Add a built-in `--junit` CLI shortcut that selects the JUnit XML reporter.
- 477d020: Centralize Test session coverage setup and log configured coverage files once.
- e3deaff: Parse `--test`/`-t` and `--group`/`-g` as regex value options, and avoid write-mode snapshot filesystem work when there are no eligible snapshot updates.
- 34ffd7f: Add a CLI shell seam for stdout, stderr, logo output, and exit decisions.
- 5abb0e1: Treat groups and tests skipped by `--group` or `--test` filters as skipped instead of failed, and suppress per-file reports and aggregate counts for files with no executed results.
- 4420210: Remove direct `chalk` and `chalk-template` runtime dependencies by replacing CLI and default reporter coloring with small local ANSI helpers.
- dd71792: Anchor built-in file-backed reporter output to the Test session project path, and allow programmatic reporter users to pass an explicit output root.
- c87fae5: Resolve Test session compiler inputs and artifacts from the configured project path so programmatic runs honor `cwd` without changing the ambient process directory.
- 0596f0a: Resolve custom reporters from the explicit Test session project path when provided.
- Updated dependencies [dbaaae5]
- Updated dependencies [5abb0e1]
- Updated dependencies [4420210]
  - @as-pect/assembly@9.0.0
  - @as-pect/core@9.0.0
  - @as-pect/transform@9.0.0
