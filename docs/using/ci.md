# CI

A CI job should install dependencies, run `asp`, and optionally collect machine-readable reporter output.

## Minimal GitHub Actions example

```yaml
name: Test

on:
  pull_request:
  push:
    branches: [master]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
          cache: npm
      - run: npm ci
      - run: npm test
```

Use the Node version required by your project. This repository currently expects modern Node and npm versions, so prefer using the same versions in local development and CI.

## Recommended npm scripts

```json
{
  "scripts": {
    "test": "asp --summary",
    "test:verbose": "asp --verbose",
    "test:update-snapshots": "asp --update-snapshots"
  }
}
```

Use summary output in CI unless you need per-test output for diagnosis.

## JUnit XML reports

Use JUnit XML when your CI system can display test results.

```sh
npx asp --summary --junit
```

Each test entry writes a sibling `.xml` file. For example:

```text
assembly/__tests__/entry.spec.ts -> assembly/__tests__/entry.spec.xml
```

GitHub Actions can upload these as artifacts:

```yaml
- run: npx asp --summary --junit
- uses: actions/upload-artifact@v4
  if: always()
  with:
    name: junit-reports
    path: "assembly/__tests__/**/*.xml"
```

## CTRF JSON reports

Use CTRF when another tool expects the Common Test Report Format.

```sh
npx asp --summary --ctrf
```

Each test entry writes a sibling `.ctrf.json` file.

## Legacy JSON and CSV reports

For custom scripts or spreadsheets:

```sh
npx asp --summary --json
npx asp --summary --csv
```

`--json` writes the as-pect legacy JSON v1 array format. `--csv` writes the as-pect CSV v1 tabular format.

## Failing fast and diagnostics

When CI fails:

1. Re-run locally with `--verbose`.
2. If snapshots failed, review snapshot diff output and run `--update-snapshots` only when the new output is correct.
3. If compilation failed, run with `--show-stats` or `--output-binary` when compiler output artifacts are useful.
4. If test filtering is involved, check `--test`, `--group`, and entry globs.

## Next steps

- Choose reporter output in [Built-in reporters](../extending/built-in-reporters.md).
- Review CLI options in [CLI reference](../reference/cli-reference.md).
- Diagnose common failures in [Troubleshooting](troubleshooting.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
