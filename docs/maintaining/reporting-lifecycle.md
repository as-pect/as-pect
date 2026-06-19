# Reporting lifecycle

The Reporting lifecycle turns mutable Test tree state into stable report facts and publishes those facts to reporters.

## Why it exists

Older reporters could read `TestContext` and `TestNode` directly. That made reporters depend on mutable internals.

The Reporting lifecycle creates a stable seam:

```text
TestContext/TestNode -> Suite report factory -> Report events -> Reporter adapters
```

New reporters should render report facts instead of walking test nodes.

## Report facts

The Suite report factory creates:

- `SuiteGroupReport`,
- `SuiteTestReport`,
- `SuiteTodoReport`,
- `SuiteReport`,
- snapshot report lines and stats.

`SuiteReport` contains the final facts for one test entry, including counts, warnings, errors, snapshot changes, groups, and flattened results.

## Event flow

When the Test context enters or exits a Test node, `ReportingLifecycle` publishes event facts.

Group events:

```ts
onReportGroupStart({ group });
onReportGroupFinish({ group });
```

Test events:

```ts
onReportTestStart({ group, test });
onReportTestFinish({ group, test });
```

Suite event:

```ts
onReportFinish({ report });
```

Start event facts only include information known at start time. Finish events include completed runtime, pass/fail, logs, assertion values, and errors.

## Legacy adapter

`LegacyReporterAdapter` preserves old reporter behavior. It routes each event to:

1. a `WithLegacy` compatibility callback if implemented,
2. a modern report callback if implemented,
3. the legacy `onEnter`, `onExit`, or `onFinish` callback otherwise.

This lets built-in and third-party reporters migrate gradually.

## File-backed reporters

File-backed reporters usually render `SuiteReport` during `onReportFinish`. They should implement `onFlush` if they create streams.

```ts
onReportFinish(event: SuiteReportEvent): void {
  this.writeReport(event.report);
}

onFlush(): Promise<void> {
  return this.fileOutput.flush();
}
```

## Maintainer guidance

When changing Reporting lifecycle behavior:

- keep report event shapes stable,
- keep compatibility-only `TestContext`/`TestNode` access out of public report event payloads,
- update reporter docs and type docs when exported types change,
- update built-in reporter tests for both modern and legacy paths when applicable.

## Next steps

- See reporter usage in [Reporter API](../extending/reporter-api.md).
- See compatibility behavior in [Legacy reporter compatibility](../extending/legacy-reporter-compatibility.md).
- See exact types in [Reporter reference](../reference/reporter-reference.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
