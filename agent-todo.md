# Agent TODO — active maintenance slices

Verified: June 12, 2026

Only valid positive work that needs to be done should exist in this file. In practice: keep this file limited to actionable, still-active improvement or repair work; remove completed, obsolete, speculative, or purely historical notes. Each slice is intended to be small, atomic, and reviewable on its own.

## Ground rules for agents

- Keep each slice focused; do not bundle unrelated reporter, snapshot, lifecycle, or benchmark changes.
- Prefer tests before fixes when the current behavior is unclear.
- Avoid new dependencies unless the slice explicitly justifies them. Benchmarks should use Node built-ins first.
- Run focused package tests for the package touched, then run broader validation when the slice changes shared behavior.

---

# 8. Add a no-dependency snapshot benchmark harness

## Goal

Create actual benchmarks for snapshot parse, diff, lifecycle, and stringify paths before optimizing them.

## Blockers

- Slice 7 should be complete, so benchmark cases measure corrected parsing behavior.

## Files

- New benchmark files under `packages/snapshots/bench/`
- Root `package.json` or `packages/snapshots/package.json`

## Tasks

- [ ] Implement a small benchmark runner with `node:perf_hooks`; do not add a benchmark dependency.
- [ ] Add cases for 1k unchanged snapshots, 1k added snapshots, 1k changed snapshots, large multiline values, and repeated-backtick values.
- [ ] Print stable machine-readable results, preferably JSON lines.
- [ ] Add an npm script that runs only the snapshot benchmarks.
- [ ] Document that benchmark output is informational and not a pass/fail test gate unless thresholds are added later.

## Acceptance criteria

- [ ] Snapshot benchmark command runs locally without extra dependencies.
- [ ] Results identify parse, diff, lifecycle, and stringify timing separately.
- [ ] Benchmark files do not alter package runtime behavior.

---

# 9. Skip expensive line diffs for unchanged snapshots

## Goal

Improve snapshot diff performance for the common unchanged-snapshot case.

## Blockers

- Slice 8 should be complete so the change has before/after benchmark numbers.

## Files

- `packages/snapshots/src/SnapshotDiff.ts`
- `packages/snapshots/__tests__/snapshot.spec.ts`
- `packages/snapshots/bench/`

## Tasks

- [ ] Add or confirm tests that unchanged snapshots still produce `NoChange` results with compatible change-line behavior.
- [ ] In `SnapshotDiff.calculateDiff()`, check exact value equality before calling `diffLines()`.
- [ ] Decide and test whether unchanged results need an empty `changes` array or the previous `diffLines()` unchanged payload.
- [ ] Run snapshot benchmarks before and after the change and record the result in the PR or commit message.

## Acceptance criteria

- [ ] Unchanged snapshots avoid unnecessary `diffLines()` work.
- [ ] Reporter snapshot-change output remains compatible.
- [ ] Snapshot tests and benchmark command pass/run.

---

# 11. Characterize test lifecycle hook order and ownership

## Goal

Capture current behavior for nested hooks, logs, errors, and target-node ownership before changing `TestContext` traversal.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.

## Files

- `packages/core/src/test/TestContext.ts`
- `packages/core/__tests__/TestContext*.spec.ts`
- New or existing AssemblyScript fixtures under `packages/core/assembly/`

## Tasks

- [ ] Add a nested-group fixture that records `beforeAll`, `beforeEach`, test body, `afterEach`, and `afterAll` order.
- [ ] Add logs in hooks and test bodies so ownership can be asserted.
- [ ] Add a failing-hook fixture to assert where errors are attached.
- [ ] Assert current order and ownership explicitly, even if the expected behavior reveals a bug.
- [ ] Avoid broad snapshots for these tests; assert semantic event arrays and node facts.

## Acceptance criteria

- [ ] Hook order is documented by focused tests.
- [ ] Log/error ownership is documented by focused tests.
- [ ] No traversal behavior is changed in this characterization slice.

---

# 12. Fix `afterEach` execution order if characterization confirms it is wrong

## Goal

Make nested `afterEach` hooks execute inner-to-outer while preserving `beforeEach` outer-to-inner behavior.

## Blockers

- Slice 11 must be complete.
- If Slice 11 shows current parent-first `afterEach` behavior is intentional, stop and write an ADR instead of changing behavior.

## Files

- `packages/core/src/test/TestContext.ts`
- `packages/core/__tests__/TestContext*.spec.ts`
- Relevant AssemblyScript fixtures under `packages/core/assembly/`

## Tasks

- [ ] Update the `runAfterEach()` traversal to execute the current group before its parent, if the characterized expectation requires it.
- [ ] Ensure failed `afterEach` hooks mark the correct node failed.
- [ ] Ensure all applicable `afterEach` hooks still run or intentionally stop according to the documented behavior.
- [ ] Update focused lifecycle tests from Slice 11.

## Acceptance criteria

- [ ] `beforeEach` remains outer-to-inner.
- [ ] `afterEach` is inner-to-outer if that is the chosen contract.
- [ ] Focused lifecycle tests pass.

---

# 13. Fix hook log/error target-node ownership

## Goal

Ensure facts produced by hooks attach to the intended test node or group instead of the last visited child.

## Blockers

- Slice 11 must be complete.
- Slice 12 should be complete if it changes hook traversal order.

## Files

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/test/TestNode.ts` only if a small helper improves locality
- Focused lifecycle tests from Slice 11

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

- Slice 11 must be complete.
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

# 16. Add transform tests for the class-member plan

## Goal

Protect class reflection behavior with focused tests around the `Class-member plan` seam.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.

## Files

- `packages/transform/src/ClassReflectionTransform.ts`
- `packages/transform/src/createStrictEqualsMember.ts`
- `packages/transform/src/createAddReflectedValueKeyValuePairsMember.ts`
- New tests under `packages/transform/__tests__/`
- `packages/transform/package.json`

## Tasks

- [ ] Add tests for instance fields included in source order.
- [ ] Add tests for instance getters included in source order.
- [ ] Add tests that static members and normal methods are excluded.
- [ ] Add tests for inherited duplicate suppression behavior if practical through generated output or a compiled fixture.
- [ ] Enable a real transform package test script if one is missing.

## Acceptance criteria

- [ ] Class-member plan behavior is covered without relying only on end-to-end AssemblyScript tests.
- [ ] Transform package tests pass.
- [ ] No generated reflection behavior changes unless explicitly intended.

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

- Slice 11 must be complete so traversal/host interactions are characterized.
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

# 20. Validate and fix the `@as-pect/assembly` published package shape

## Goal

Ensure `@as-pect/assembly` exports files that are actually built and shipped, so the package works outside the monorepo.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.

## Files

- `packages/assembly/package.json`
- `packages/assembly/asconfig.json`
- `packages/assembly/tsconfig.json`
- `packages/assembly/assembly/index.ts`
- Any generated package output under `packages/assembly/build/` only if it is intentionally produced by the build

## Tasks

- [ ] Add a package-shape validation test or script that checks every `exports` and `types` target in `packages/assembly/package.json` exists after the documented build command.
- [ ] Decide whether `@as-pect/assembly` should publish generated `build/release.js` / `build/release.d.ts` files or export source/type files that already exist.
- [ ] If generated files are required, make `tsc:all` or another package build script produce them reliably.
- [ ] If existing files should be exported, update `package.json` exports/files to match the real shipped package shape.
- [ ] Run `npm pack --dry-run` for the workspace package if practical and record the shipped file list in the slice notes.

## Acceptance criteria

- [ ] The package's declared export and type files exist after the package build.
- [ ] The package's `files` list includes the declared export and type files.
- [ ] The fix is validated without relying on monorepo-only path resolution.

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

# 23. Clarify and test custom reporter import semantics

## Goal

Make `--reporter <reporter>` behavior match its help text, or narrow the help text so users know only file paths are supported.

## Blockers

- Slice 22 should be complete so local path imports are safe before expanding or documenting behavior.

## Files

- `packages/cli/src/index.ts`
- `packages/cli/src/collectReporter.ts`
- `packages/cli/__tests__/CliOptions.spec.ts`
- `packages/cli/__tests__/` for reporter collection tests

## Tasks

- [ ] Decide whether `--reporter` supports package specifiers, local file paths, or both.
- [ ] If supporting package specifiers, detect relative/absolute paths versus bare specifiers and import each correctly.
- [ ] If only supporting file paths, update CLI help text to remove “module” wording.
- [ ] Add tests for config reporter and CLI reporter precedence/combination.
- [ ] Preserve existing custom reporter behavior for local project files.

## Acceptance criteria

- [ ] CLI help and implementation agree.
- [ ] Reporter import behavior is covered by focused tests.
- [ ] Error messages identify which reporter failed to import.

---

# 24. Correct the `IAspectConfig.instantiate()` type contract

## Goal

Make the public config type describe the real instantiate interface so user configs can be typechecked accurately.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.
- Slice 22 should be complete if tests dynamically import typed config fixtures.

## Files

- `packages/cli/src/IAspectConfig.ts`
- `packages/cli/init/as-pect.config.js`
- `packages/assembly/as-pect.config.js`
- `packages/cli/__tests__/` for config typing/fixture tests

## Tasks

- [ ] Define a precise type for the `createImports` callback that returns a WebAssembly imports object, not a `Promise<ResultObject>`.
- [ ] Replace broad `any` callback parameters where a small local type can describe the interface without overfitting.
- [ ] Update init/template config comments if the contract becomes clearer.
- [ ] Add a fixture or compile-time test proving a normal user config typechecks against `IAspectConfig`.
- [ ] Preserve runtime config compatibility.

## Acceptance criteria

- [ ] `IAspectConfig.instantiate()` matches the actual call shape used by `TestSession`.
- [ ] Template configs remain valid examples.
- [ ] CLI typechecking passes without weakening the public type back to `any`.

---

# 25. Make entry and include discovery order deterministic

## Goal

Remove filesystem/glob ordering as a source of flaky test-session output and snapshot differences.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.

## Files

- `packages/cli/src/TestSession.ts`
- `packages/cli/__tests__/TestSession.spec.ts`

## Tasks

- [ ] Sort glob results before adding them to entry and include collections.
- [ ] Ensure entries from CLI args and config entries preserve the intended precedence while producing deterministic final order.
- [ ] Sort include files before passing them to the compiler.
- [ ] Add tests where the injected glob dependency returns files in random or reverse order.
- [ ] Assert compiler invocation order is stable.

## Acceptance criteria

- [ ] Test entry compilation order is deterministic.
- [ ] Include file order is deterministic.
- [ ] Existing entry aggregation behavior is preserved except for intentional sorting.

---

# 26. Guard regex filters against stateful `g` and `y` flags

## Goal

Prevent test, group, and entry filters from changing behavior across repeated `.test()` calls when users provide global or sticky regexes.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.

## Files

- `packages/cli/src/TestSession.ts`
- `packages/core/src/test/TestContext.ts`
- `packages/core/__tests__/TestGroupFilter.spec.ts`
- `packages/cli/__tests__/TestSession.spec.ts`

## Tasks

- [ ] Add failing tests using global or sticky regexes for entry disclude filters.
- [ ] Add failing tests using global or sticky regexes for test and group filters.
- [ ] Choose a small fix: reset `lastIndex = 0` before every `.test()`, or clone regexes without stateful flags when creating config.
- [ ] Apply the fix consistently for CLI entry filters and core test/group filters.
- [ ] Document the chosen behavior in comments only if it is not obvious from tests.

## Acceptance criteria

- [ ] Repeated filtering with `/.../g` or `/.../y` is deterministic.
- [ ] Existing non-stateful regex behavior remains unchanged.
- [ ] Focused CLI and core filter tests pass.

---

# 27. Define and correct snapshot total-count semantics

## Goal

Make snapshot summary stats intuitive and internally consistent for added, removed, changed, and unchanged snapshots.

## Blockers

- Slice 6 must be complete so changed/removed CLI stats are already correct.

## Files

- `packages/snapshots/src/SnapshotLifecycle.ts`
- `packages/snapshots/__tests__/snapshot.spec.ts`
- `packages/cli/src/TestSession.ts`
- `packages/cli/__tests__/TestSession.spec.ts`

## Tasks

- [ ] Decide whether `totalSnapshots` means expected snapshots, actual snapshots, or the union of expected and actual keys.
- [ ] Add tests for all-added, all-removed, all-unchanged, all-changed, and mixed snapshot sets.
- [ ] Update `SnapshotLifecycle.calculateStats()` to implement the chosen contract.
- [ ] Update CLI summary tests if the visible totals change.
- [ ] Document the stats contract in the `SnapshotLifecycleStats` interface comments.

## Acceptance criteria

- [ ] `passedSnapshots / totalSnapshots` cannot produce confusing results such as passed count greater than total.
- [ ] Snapshot stats tests cover added, removed, changed, and unchanged cases.
- [ ] CLI summary uses the same stats contract as the snapshot package.

---

# 28. Harden wasm name-section parsing

## Goal

Make function-name lookup robust for missing name sections, UTF-8 names, empty sections, and valid offsets that are `0`.

## Blockers

- Validation baseline should be current; latest baseline is recorded in `VALIDATION_BASELINE.md`.
- Slice 19 is not required, but this work should not conflict with a future Wasm host extraction.

## Files

- `packages/core/src/util/wasmTools.ts`
- New or existing core tests under `packages/core/__tests__/`

## Tasks

- [ ] Add tests for wasm binaries with no name section or an empty name section.
- [ ] Add tests for UTF-8 function names if practical with a small synthetic name-section buffer.
- [ ] Add tests proving a stored name pointer of `0` is treated as present if that case is valid for the parser.
- [ ] Replace manual byte-to-character decoding with `TextDecoder` where appropriate.
- [ ] Make `NameSection` fail gracefully when the name custom section is absent.

## Acceptance criteria

- [ ] Missing or malformed name sections do not crash normal test execution.
- [ ] Function names decode as UTF-8.
- [ ] `fromIndex()` distinguishes missing map entries from offset `0` entries.

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
