# @as-pect/junit-reporter

JUnit XML reporter for as-pect.

Install it in your test project, then use it through the existing custom reporter option:

```sh
npm install --save-dev @as-pect/junit-reporter
asp --reporter @as-pect/junit-reporter
```

For each test entry, the reporter writes a `.xml` file next to the entry by replacing the entry extension. For example:

```text
assembly/__tests__/entry.spec.ts -> assembly/__tests__/entry.spec.xml
```

Empty reports where `SuiteReport.hasResults === false` do not create a file.

When used from the as-pect CLI, output paths are resolved from the Test session project path. Programmatic reporter users may pass an output root to `new JUnitReporter(outputRoot)` to resolve relative `SuiteReport.fileName` values from that root instead of `process.cwd()`.

## Mapping

The reporter uses Suite report facts from `@as-pect/core`:

| Suite report fact | JUnit XML output |
| --- | --- |
| `SuiteReport.fileName` | `<testsuite name="...">` |
| Passing test result | Self-closing `<testcase>` |
| Failing test result | `<testcase><failure message="...">...</failure></testcase>` |
| Suite-level error | Synthetic `<testcase classname="as-pect"><error>...</error></testcase>` |
| Todo result | `<testcase><skipped message="TODO"/></testcase>` |
| Not-run test result | `<testcase><skipped message="Not run"/></testcase>` |
| Snapshot changes | `<system-out>` text |
| Millisecond durations | JUnit `time` attributes in seconds |

The XML is generated with a small local escaper and Node built-ins; no XML runtime dependency is required.

## GitLab CI example

```yaml
test:
  script:
    - npx asp --reporter @as-pect/junit-reporter
  artifacts:
    reports:
      junit: "assembly/__tests__/*.spec.xml"
```
