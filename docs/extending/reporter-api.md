# Reporter API

Reporter APIs live in `@as-pect/core`. A reporter receives Test suite facts and writes them to stdout, stderr, files, or another integration.

## Minimal reporter

```ts
import type { IReporter, IWritable, SuiteReportEvent, TestContext, TestNode } from "@as-pect/core";

class MyReporter implements IReporter {
  stdout: IWritable | null = null;
  stderr: IWritable | null = null;

  onEnter(_ctx: TestContext, _node: TestNode): void {}
  onExit(_ctx: TestContext, _node: TestNode): void {}
  onFinish(_ctx: TestContext): void {}

  onReportFinish(event: SuiteReportEvent): void {
    this.stdout?.write(`pass: ${event.report.pass}\n`);
  }
}

export default new MyReporter();
```

The CLI expects the module default export to be an `IReporter` object. It does not instantiate a default-exported class. The legacy methods are still required by `IReporter`, but modern reporters can leave them as no-ops and use report event callbacks.

## Writers

Reporters receive writers from the CLI:

```ts
export interface IWritable {
  write(str: string): void;
}
```

Always check that `stdout` or `stderr` exists before writing if your reporter can be used programmatically.

## Report events

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

Start events only contain facts known at the start of the group or test. Finish events contain completed facts such as pass/fail, runtime, logs, and assertion values.

## Suite report facts

`SuiteReport` is the main stable report object. It includes:

- file name,
- pass/fail result,
- group and test counts,
- root runtime,
- warnings and errors,
- snapshot stats and changes,
- group facts,
- flattened result facts.

Use `report.results` when rendering a flat file format. Use `report.groups` when rendering grouped output.

## Flush support

If a reporter writes async streams, implement `onFlush`:

```ts
onFlush(): Promise<void> {
  return this.fileOutput.flush();
}
```

The CLI calls `onFlush` after running the suite so file output can finish before the process exits.

## Compatibility callbacks

`onEnter`, `onExit`, and `onFinish` receive mutable legacy facts: `TestContext` and `TestNode`. They remain for older reporters, subclass extension points, and compatibility adapters.

Prefer report event facts for new code because they are easier to keep stable.

## Next steps

- Build a package in [Custom reporters](custom-reporters.md).
- Use file helpers in [Output files](output-files.md).
- Review exact exported types in [Reporter reference](../reference/reporter-reference.md) and [`@as-pect/core` types](../types/core.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
