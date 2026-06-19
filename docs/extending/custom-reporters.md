# Custom reporters

A custom reporter is a JavaScript module that default-exports an `IReporter` object. The CLI uses the default export directly; it does not instantiate a default-exported class.

## Create a reporter file

```ts
// my-reporter.ts
import type { IReporter, IWritable, SuiteReportEvent, TestContext, TestNode } from "@as-pect/core";

class MyReporter implements IReporter {
  stdout: IWritable | null = null;
  stderr: IWritable | null = null;

  onEnter(_ctx: TestContext, _node: TestNode): void {}
  onExit(_ctx: TestContext, _node: TestNode): void {}
  onFinish(_ctx: TestContext): void {}

  onReportFinish(event: SuiteReportEvent): void {
    const report = event.report;
    this.stdout?.write(`${report.fileName}: ${report.pass ? "pass" : "fail"}\n`);
  }
}

export default new MyReporter();
```

Compile it to JavaScript if your project uses TypeScript, then run:

```sh
npx asp --reporter ./my-reporter.js
```

## Configure a reporter in `as-pect.config.js`

```js
export default {
  reporter: "./my-reporter.js",
  // ...rest of config
};
```

The CLI also accepts `--reporter <reporter>`. If both config and CLI reporters are present, both are used.

## Local path vs package name

Use an explicit relative or absolute path for local files:

```sh
npx asp --reporter ./reporters/my-reporter.js
```

Use a package name for installed reporters:

```sh
npx asp --reporter @scope/as-pect-reporter
```

Local paths are resolved from the Test session project path.

## File output reporter

For file output, use `@as-pect/reporter-output`:

```ts
import { ReporterFileOutput } from "@as-pect/reporter-output";
import type { IReporter, IWritable, SuiteReportEvent, TestContext, TestNode } from "@as-pect/core";

class TextReporter implements IReporter {
  stdout: IWritable | null = null;
  stderr: IWritable | null = null;
  private files = new ReporterFileOutput();

  onEnter(_ctx: TestContext, _node: TestNode): void {}
  onExit(_ctx: TestContext, _node: TestNode): void {}
  onFinish(_ctx: TestContext): void {}

  onReportFinish(event: SuiteReportEvent): void {
    const file = this.files.start(event.report, ".txt");
    if (!file) return;
    file.stream.end(`pass=${event.report.pass}\n`);
  }

  onFlush(): Promise<void> {
    return this.files.flush();
  }
}

export default new TextReporter();
```

## Testing a reporter

At minimum, test that your reporter:

- handles passing tests,
- handles failing tests,
- handles todos and filtered/not-run tests if relevant,
- skips empty reports if it writes files,
- flushes async streams before completion,
- does not depend on mutable `TestContext` internals unless intentionally legacy-compatible.

## Packaging tips

- Default-export a reporter instance or object. `asp` does not instantiate a default-exported class.
- Declare `@as-pect/core` as a dependency or peer dependency according to your package strategy.
- Document which CLI flags or config fields users should set.
- Keep output contracts versioned if external tools consume them.

## Next steps

- Learn event shapes in [Reporter API](reporter-api.md).
- Learn file helpers in [Output files](output-files.md).
- Check exact types in [`@as-pect/core`](../types/core.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
