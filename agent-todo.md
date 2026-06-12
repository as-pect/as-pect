# Agent TODO — active maintenance slices

Verified: June 12, 2026

Only valid positive work that needs to be done should exist in this file. In practice: keep this file limited to actionable, still-active improvement or repair work; remove completed, obsolete, speculative, or purely historical notes. Each slice is intended to be small, atomic, and reviewable on its own.

## Ground rules for agents

- Keep each slice focused; do not bundle unrelated reporter, snapshot, lifecycle, or benchmark changes.
- Prefer tests before fixes when the current behavior is unclear.
- Avoid new dependencies unless the slice explicitly justifies them. Benchmarks should use Node built-ins first.
- Run focused package tests for the package touched, then run broader validation when the slice changes shared behavior.

---

# 13. Fix hook log/error target-node ownership

## Goal

Ensure facts produced by hooks attach to the intended test node or group instead of the last visited child.

## Blockers

- Slice 12 should be complete if it changes hook traversal order.

## Files

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/test/TestNode.ts` only if a small helper improves locality
- Focused lifecycle tests in `packages/core/__tests__/TestContext.lifecycle.spec.ts`

## Tasks

- [ ] Define the intended ownership rule for `beforeAll`, `beforeEach`, test body, `afterEach`, and `afterAll` logs/errors.
- [ ] Make `runFunctions()` or hook execution accept an explicit target node instead of relying on stale `this.targetNode` state.
- [ ] Restore the parent target after child visits where needed.
- [ ] Assert logs, warnings, errors, actual, expected, and messages attach to the intended node.

## Acceptance criteria

- [ ] Hook-produced facts no longer attach to stale child nodes.
- [ ] Existing reporter behavior changes only where the previous ownership was demonstrably wrong.
- [ ] Focused lifecycle and core tests pass.

---

# 14. Characterize and correct reporting lifecycle start-event ordering

## Goal

Make `onReportGroupStart` and `onReportTestStart` either true start events or explicitly documented compatibility events.

## Blockers

- Slice 13 should be complete if it changes target-node ownership during callbacks.

## Files

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/reporter/ReportingLifecycle.ts`
- `packages/core/__tests__/ReportingLifecycle.spec.ts`

## Tasks

- [ ] Add a reporter adapter test that records event order around group collection and test execution.
- [ ] Decide whether start events should fire before callback execution or retain the current compatibility order.
- [ ] If changing behavior, move reporting lifecycle `enter()` calls before the work they describe.
- [ ] If retaining behavior, document the compatibility semantics in code comments and tests.
- [ ] Ensure legacy `onEnter` / `onExit` reporters still receive compatible callbacks.

## Acceptance criteria

- [ ] Reporting lifecycle event order has focused tests.
- [ ] Start-event semantics are no longer ambiguous.
- [ ] Legacy reporter adapters remain compatible.

---

# 15. Move reporter tests toward SuiteReport fixtures

## Goal

Reduce fragile wasm-backed reporter snapshots by testing reporter behavior through stable `SuiteReport` facts.

## Blockers

- Slices 2, 3, and 4 should be complete so reporter package bugs do not get preserved in new fixtures.
- Slice 14 should be complete if reporter lifecycle semantics change.

## Files

- `packages/core/__tests__/SummaryReporter*.spec.ts`
- `packages/core/__tests__/VerboseReporter*.spec.ts`
- `packages/core/__tests__/setup/*ReporterWrapper.ts`
- `packages/core/src/reporter/ReportingLifecycle.ts`

## Tasks

- [ ] Create reusable `SuiteReport` fixture builders for pass, fail, todo, warning, error, and snapshot-change cases.
- [ ] Add focused semantic assertions for SummaryReporter output from `SuiteReport` facts.
- [ ] Add focused semantic assertions for VerboseReporter output from `SuiteReport` facts.
- [ ] Keep a minimal number of wasm-backed smoke tests for end-to-end compatibility.
- [ ] Remove or shrink broad snapshots that duplicate the new semantic coverage.

## Acceptance criteria

- [ ] Reporter tests are faster and less coupled to wasm fixture details.
- [ ] End-to-end reporter smoke coverage remains.
- [ ] Snapshot count is reduced or justified.

---

# 17. Add core benchmarks for reporting and reflected-value stringify

## Goal

Create actual performance measurements for hot core paths before attempting optimizations.

## Blockers

- Slice 15 should be complete or at least provide stable `SuiteReport` fixture builders.

## Files

- New benchmark files under `packages/core/bench/`
- Root `package.json` or `packages/core/package.json`
- `packages/core/src/reporter/ReportingLifecycle.ts`
- `packages/core/src/util/stringifyReflectedValue.ts`

## Tasks

- [ ] Implement a small benchmark runner with `node:perf_hooks`; do not add a benchmark dependency.
- [ ] Add reporting benchmarks for large flat suites, nested suites, many todos, and many logs.
- [ ] Add stringify benchmarks for large arrays, nested classes, cyclic structures, maps/sets, and property-count limits.
- [ ] Print stable machine-readable results.
- [ ] Add an npm script that runs only core benchmarks.

## Acceptance criteria

- [ ] Core benchmark command runs locally without extra dependencies.
- [ ] Reporting and stringify costs are measured separately.
- [ ] Benchmark files do not alter package runtime behavior.

---

# 18. Add AssemblyScript reflection equality benchmarks

## Goal

Measure runtime cost for `Reflect.equals` before optimizing Set, Map, array, class, and cyclic equality paths.

## Blockers

- Slice 10 should be complete so Set reflection correctness is not confused with equality benchmarks.
- Slice 17 may provide a reusable benchmark script pattern, but this slice can proceed independently if needed.

## Files

- New benchmark fixtures under `packages/assembly/` or `packages/core/bench/assembly-reflect/`
- `packages/assembly/assembly/internal/Reflect.ts`

## Tasks

- [ ] Add benchmark cases for `Set<i32>` sizes 10, 100, and 1000.
- [ ] Add benchmark cases for `Map<string, i32>` sizes 10, 100, and 1000.
- [ ] Add benchmark cases for nested arrays, transformed classes, and cyclic classes.
- [ ] Keep benchmark compilation separate from normal tests.
- [ ] Record baseline numbers before proposing algorithm changes.

## Acceptance criteria

- [ ] Reflection equality benchmark command runs locally.
- [ ] Results identify Set, Map, array, class, and cyclic costs separately.
- [ ] No equality behavior changes in this benchmark-only slice.

---

# 19. Prepare a small Wasm host extraction plan from characterized behavior

## Goal

Define the smallest safe first extraction for the `Wasm host` module without changing external `__aspect` import names.

## Blockers

- Slice 13 must be complete if target-node ownership changes.
- Slice 14 must be complete if reporting lifecycle event timing changes.

## Files

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/util/IAspectExports.ts`
- `packages/core/src/util/ReflectedValue.ts`
- `packages/core/src/util/rTrace.d.ts`
- `CONTEXT.md` only if new domain terms are needed

## Tasks

- [ ] List the facts suite traversal needs from the host: strings, reflected values, abort messages, trace logs, rtrace deltas, and callback invocation.
- [ ] List the facts the host needs from suite traversal: current target node, snapshot recorder, error recorder, and function-name lookup context.
- [ ] Decide whether `TestContext.createImports()` remains as a compatibility method delegating to the new module.
- [ ] Identify the first extraction slice that moves code without changing behavior.
- [ ] Write the plan as comments in the TODO item or as a short design note if implementation will happen later.

## Acceptance criteria

- [ ] The first Wasm host extraction slice is small enough to review independently.
- [ ] External `__aspect` names remain explicitly protected.
- [ ] No code extraction happens in this planning slice unless it is trivial and separately tested.

---

# 21. Add a reporter finalization seam or make file reporters write atomically

## Goal

Prevent JSON and CSV reporter output from being truncated when the CLI exits soon after suite completion.

## Blockers

- Slices 2 and 3 should be complete, because this slice builds on corrected JSON/CSV behavior.
- Slice 15 should be complete or explicitly deferred if reporter fixture builders are not needed.

## Files

- `packages/core/src/reporter/IReporter.ts`
- `packages/core/src/reporter/CombinationReporter.ts`
- `packages/json-reporter/index.ts`
- `packages/csv-reporter/index.ts`
- `packages/cli/src/TestSession.ts`
- `packages/cli/src/index.ts`

## Tasks

- [ ] Choose one small strategy: optional async reporter finalization, or synchronous/atomic `fs.promises.writeFile()` in file reporters.
- [ ] If adding finalization, define an optional reporter method such as `onFlush?(): Promise<void>` and make `CombinationReporter` await all adapters that implement it.
- [ ] If using atomic writes, build full JSON/CSV output in memory and write it with a single awaited filesystem operation.
- [ ] Ensure the CLI or `TestSession` awaits reporter file completion before returning a final result or exiting.
- [ ] Add tests that prove JSON/CSV files are complete immediately after a test session finishes.

## Acceptance criteria

- [ ] File reporter output is complete before CLI exit mapping can call `process.exit()`.
- [ ] Existing reporter adapters without finalization remain compatible.
- [ ] Focused JSON, CSV, and CLI tests pass.

---

# 29. Make transform generation idempotent and collision-safe

## Goal

Prevent duplicate generated methods or user-defined method collisions from making transformed classes fragile.

## Blockers

- Slice 16 should be complete so class-member plan behavior is covered before changing transform generation rules.

## Files

- `packages/transform/src/index.ts`
- `packages/transform/src/ClassReflectionTransform.ts`
- `packages/transform/src/createStrictEqualsMember.ts`
- `packages/transform/src/createAddReflectedValueKeyValuePairsMember.ts`
- `packages/transform/__tests__/`

## Tasks

- [ ] Add tests for classes that already define `__aspectStrictEquals` or `__aspectAddReflectedValueKeyValuePairs`.
- [ ] Add tests for running the transform twice over the same parsed source if practical.
- [ ] Add tests or a design note for hash-collision behavior in inherited ignore lists.
- [ ] Decide whether collisions should skip generation, replace existing generated members, or report a clear transform error.
- [ ] Implement the smallest behavior that keeps transformed output deterministic and safe.

## Acceptance criteria

- [ ] Transform output does not accumulate duplicate generated members.
- [ ] User-defined collisions produce a deterministic, tested behavior.
- [ ] Existing class reflection behavior remains compatible for normal classes.

---

# 30. Extract a testable CLI init plan

## Goal

Make `asp --init` predictable, testable without touching the real filesystem, and safer when partial initialization fails.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.
- Slice 24 should be complete if init template typing/comments change there.

## Files

- `packages/cli/src/init.ts`
- `packages/cli/src/index.ts`
- `packages/cli/__tests__/`
- `packages/cli/init/*`

## Tasks

- [ ] Extract a pure function that inspects an abstract filesystem state and returns an init plan of creates and skips.
- [ ] Add tests for empty project, project with `assembly/`, project with existing `__tests__/`, and project with existing config files.
- [ ] Keep terminal logging at the CLI edge or behind an injected writer.
- [ ] Apply the init plan through a small filesystem adapter.
- [ ] Preserve current user-visible file contents and default paths.

## Acceptance criteria

- [ ] Init behavior is covered without relying on the real working directory.
- [ ] Existing files are not overwritten.
- [ ] Partial initialization behavior is easier to reason about from the plan tests.
