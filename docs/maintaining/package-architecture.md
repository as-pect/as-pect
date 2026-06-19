# Package architecture

The packages split the Test session into small seams so user-facing flows stay simple while internals remain testable.

## User-facing path

A typical CLI run crosses these packages:

```text
@as-pect/cli
  -> AssemblyScript compiler + @as-pect/transform
  -> @as-pect/assembly runtime in the compiled test binary
  -> @as-pect/core TestContext and Reporting lifecycle
  -> @as-pect/snapshots for snapshot comparison/update planning
  -> reporters for output
```

## `@as-pect/cli`

Owns command-line behavior and Test session orchestration:

- CLI parsing,
- init template,
- config loading,
- entry and include discovery,
- compiler IO adapter,
- compiler output extraction,
- snapshot file planning/writes,
- coverage setup,
- WASI setup,
- reporter collection,
- Test session stats.

The CLI should remain the coordinator, not the owner of test tree or reporter fact semantics.

## `@as-pect/core`

Owns JavaScript-side test execution facts:

- `TestContext`,
- `TestNode`,
- Wasm host imports,
- `ReflectedValue`,
- Reporting lifecycle,
- Suite report factory,
- reporter contracts,
- built-in console reporters.

Reporter-facing facts should flow through `SuiteReport` and report events instead of requiring reporters to walk mutable test nodes.

## `@as-pect/assembly`

Owns AssemblyScript-side test declarations and runtime helpers:

- `describe`, `it`, `test`, hooks, todos,
- `expect` and `Expectation<T>`,
- `log`,
- `Actual`, `Expected`, and `Reflect` helpers,
- host callbacks into JavaScript.

This package is compiled into each test binary through `as-pect.asconfig.json` entries.

## `@as-pect/transform`

Owns the Class reflection transform. It generates helper members consumed by AssemblyScript runtime `Reflect` helpers for equality and reflected key/value output.

Keep transform logic focused on AST generation and class-member planning.

## `@as-pect/snapshots`

Owns snapshot file parsing, normalization, diffing, lifecycle stats, and update planning. The CLI owns file paths and writes; snapshots owns snapshot meaning.

## Reporter packages

Reporter packages should consume Suite report facts and avoid reading Test tree internals directly. File-backed reporters should share `@as-pect/reporter-output`.

## Architecture rule of thumb

- CLI coordinates.
- Core owns suite facts and reporting semantics.
- Assembly owns the test author API.
- Transform owns generated class reflection helpers.
- Snapshots owns snapshot meaning.
- Reporters render facts.

## Next steps

- Follow a run in [Test session lifecycle](test-session-lifecycle.md).
- Follow output in [Reporting lifecycle](reporting-lifecycle.md).
- Follow snapshots in [Snapshot lifecycle](snapshot-lifecycle.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
