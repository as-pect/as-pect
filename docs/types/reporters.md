# Reporter package types

Package-root exports from current `master` for the file-backed reporter packages. These packages default-export reporter classes for direct JavaScript use and for the built-in CLI shortcut flags. When using `asp --reporter <module>`, the module default export must be an `IReporter` object, so instantiate these classes before exporting them from a custom wrapper module.

Concrete reporter classes implement the `IReporter` contract. Their emitted `onEnter` and `onExit` methods accept fewer parameters than the interface allows because they do not need the `TestNode` argument.

## `@as-pect/csv-reporter`

```ts
export default class CSVReporter implements import("@as-pect/core").IReporter {
  stdout: import("@as-pect/core").IWritable | null;
  stderr: import("@as-pect/core").IWritable | null;
  constructor(outputRoot?: string);
  onEnter(ctx: import("@as-pect/core").TestContext): void;
  onExit(ctx: import("@as-pect/core").TestContext): void;
  onReportFinish(event: import("@as-pect/core").SuiteReportEvent): void;
  onFinish(ctx: import("@as-pect/core").TestContext): void;
  onFlush(): Promise<void>;
}
```

## `@as-pect/json-reporter`

```ts
export default class JSONReporter implements import("@as-pect/core").IReporter {
  stdout: import("@as-pect/core").IWritable | null;
  stderr: import("@as-pect/core").IWritable | null;
  constructor(outputRoot?: string);
  onEnter(ctx: import("@as-pect/core").TestContext): void;
  onExit(ctx: import("@as-pect/core").TestContext): void;
  onReportFinish(event: import("@as-pect/core").SuiteReportEvent): void;
  onFinish(ctx: import("@as-pect/core").TestContext): void;
  onFlush(): Promise<void>;
}
```

## `@as-pect/junit-reporter`

```ts
export default class JUnitReporter implements import("@as-pect/core").IReporter {
  stdout: import("@as-pect/core").IWritable | null;
  stderr: import("@as-pect/core").IWritable | null;
  constructor(outputRoot?: string);
  onEnter(ctx: import("@as-pect/core").TestContext): void;
  onExit(ctx: import("@as-pect/core").TestContext): void;
  onReportFinish(event: import("@as-pect/core").SuiteReportEvent): void;
  onFinish(ctx: import("@as-pect/core").TestContext): void;
  onFlush(): Promise<void>;
}
```

## `@as-pect/ctrf-reporter`

```ts
export default class CTRFReporter implements import("@as-pect/core").IReporter {
  stdout: import("@as-pect/core").IWritable | null;
  stderr: import("@as-pect/core").IWritable | null;
  constructor(outputRoot?: string);
  onEnter(ctx: import("@as-pect/core").TestContext): void;
  onExit(ctx: import("@as-pect/core").TestContext): void;
  onReportFinish(event: import("@as-pect/core").SuiteReportEvent): void;
  onFinish(ctx: import("@as-pect/core").TestContext): void;
  onFlush(): Promise<void>;
}
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
