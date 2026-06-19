# Reporter reference

Reporter contracts are exported from `@as-pect/core`. Custom reporter modules loaded with `asp --reporter` must default-export an `IReporter` object; the CLI does not instantiate default-exported classes.

## `IReporter`

```ts
interface IReporter extends ReportAdapter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onFinish(ctx: TestContext): void;
  onFlush?(): Promise<void> | void;
}
```

## `ReportAdapter`

```ts
interface ReportAdapter {
  onReportGroupStart?(event: GroupReportEvent): void;
  onReportGroupFinish?(event: GroupReportEvent): void;
  onReportTestStart?(event: TestReportEvent): void;
  onReportTestFinish?(event: TestReportEvent): void;
  onReportFinish?(event: SuiteReportEvent): void;
}
```

## Event shapes

```ts
interface GroupReportEvent {
  group: SuiteGroupReport;
}

interface TestReportEvent {
  group: SuiteGroupReport;
  test: SuiteTestReport;
}

interface SuiteReportEvent {
  report: SuiteReport;
}
```

## Suite result facts

```ts
type SuiteResultReport = SuiteTestReport | SuiteTodoReport;
```

`SuiteTestReport` includes:

- `groupName`,
- `name`,
- `ran`,
- `negated`,
- `pass`,
- `runtime`,
- `message`,
- `stackTrace`,
- `rtraceDelta`,
- `logs`,
- `actual` / `expected` strings,
- `actualValue` / `expectedValue` reflected values.

`SuiteTodoReport` includes:

- `type: "todo"`,
- `groupName`,
- `description`.

## Suite report facts

`SuiteReport` includes:

- `fileName`,
- `pass`,
- test and group counts,
- `rootRuntime`,
- `hasResults`,
- `todoCount`,
- `warnings`,
- `errors`,
- `snapshotChanges`,
- `snapshotStats`,
- `groups`,
- `results`.

Prefer `SuiteReport` for file-backed reporters.

## Built-in reporter outputs

| Reporter | Selector | Output |
| --- | --- | --- |
| Summary | `--summary` | Console summary. |
| Verbose | `--verbose` | Detailed console output. |
| JSON | `--json` | Legacy JSON v1 `.json` files. |
| CSV | `--csv` | CSV v1 `.csv` files. |
| JUnit | `--junit` | JUnit XML `.xml` files. |
| CTRF | `--ctrf` | CTRF `.ctrf.json` files. |

## Compatibility facts

Compatibility callbacks can receive legacy facts:

```ts
interface LegacyGroupReportFacts {
  context: TestContext;
  node: TestNode;
}

interface LegacyTestReportFacts {
  context: TestContext;
  groupNode: TestNode;
  node: TestNode;
}

interface LegacySuiteReportFacts {
  context: TestContext;
}
```

Use these only when preserving legacy behavior requires direct access to `TestContext` or `TestNode`.

## Related pages

- [Reporter overview](../extending/reporter-overview.md)
- [Reporter API](../extending/reporter-api.md)
- [Custom reporters](../extending/custom-reporters.md)
- [`@as-pect/core` types](../types/core.md)

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
