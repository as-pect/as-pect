# Legacy reporter compatibility

`as-pect` supports older reporter callbacks while encouraging new reporters to use report event callbacks.

## Modern callbacks

Prefer these callbacks for new reporters:

```ts
onReportGroupStart?(event: GroupReportEvent): void;
onReportGroupFinish?(event: GroupReportEvent): void;
onReportTestStart?(event: TestReportEvent): void;
onReportTestFinish?(event: TestReportEvent): void;
onReportFinish?(event: SuiteReportEvent): void;
```

They receive stable report facts, not mutable test tree internals.

## Legacy callbacks

The `IReporter` interface still includes:

```ts
onEnter(ctx: TestContext, node: TestNode): void;
onExit(ctx: TestContext, node: TestNode): void;
onFinish(ctx: TestContext): void;
```

These expose `TestContext` and `TestNode` directly. They are preserved for existing reporters and subclass extension points.

## Adapter behavior

`LegacyReporterAdapter` chooses the best available callback:

1. If a compatibility method exists, call it with both report facts and legacy facts.
2. Otherwise, if a modern report callback exists, call it.
3. Otherwise, fall back to the legacy callback.

Compatibility methods include:

```ts
onReportGroupStartWithLegacy?(event, legacy): void;
onReportGroupFinishWithLegacy?(event, legacy): void;
onReportTestStartWithLegacy?(event, legacy): void;
onReportTestFinishWithLegacy?(event, legacy): void;
onReportFinishWithLegacy?(event, legacy): void;
```

## When to use compatibility methods

Use `WithLegacy` methods only when a reporter needs to preserve an old override point while also supporting modern report facts. Built-in console reporters use this pattern so subclasses that override older methods keep working.

## Migration guidance

For an older reporter:

1. Add modern report callbacks.
2. Render from `SuiteReport`, `SuiteGroupReport`, and `SuiteTestReport` where possible.
3. Keep legacy callbacks as wrappers or no-ops.
4. Avoid reading mutable `TestNode` internals for new output formats.
5. Add tests that cover both legacy and modern callback paths if compatibility matters.

## Next steps

- Learn modern event shapes in [Reporter API](reporter-api.md).
- Review exact compatibility types in [Reporter reference](../reference/reporter-reference.md).
- See core reporter types in [`@as-pect/core`](../types/core.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
