# Agent TODO — active architecture work

Verified: June 11, 2026

This file intentionally lists only work that still appears active after inspecting the repository. Completed reporting, snapshot-lifecycle, and class-reflection-transform work has been removed from the active TODO list.

## Current active priorities

1. Establish a fresh validation baseline with the project-supported runtime.
2. Extract a deep `TestSession` module from the CLI.
3. Extract a deep `WasmHost` module from `TestContext`.
4. Run final CLI and snapshot smoke tests.

## Runtime note

The root `package.json` requires Node `>=22.22.2` and npm `>=10`. Previous validation notes indicate the system `node` may be too old. Run validation with a compatible Node version before trusting failures.

---

# 1. Fresh validation baseline

## Goal

Know the current behavior before continuing architecture work.

## Tasks

- [x] Run typechecking with a supported Node version.
  - Command: `npm run tsc:all`
  - Runtime: Node `v26.3.0`, npm `11.16.0`, corepack `0.24.0`
  - Result: passed. Node emitted a `url.parse()` deprecation warning from tooling; AssemblyScript emitted existing `AS210` informational diagnostics for `jest-pass-fail.ts` and `jest-log.ts`.
- [x] Run the full test suite with a supported Node version.
  - Command: `npm test`
  - Runtime: Node `v26.3.0`, npm `11.16.0`, corepack `0.24.0`
  - Result: passed. The core package reported 17 passing Jest suites, 24 passing tests, and 743 passing snapshots; the snapshots package reported 1 passing Jest suite, 6 passing tests, and 3 passing snapshots; assembly tests passed with 358 / 358 tests, 79 / 79 groups, and 6 / 6 snapshots.
- [x] If the full suite is too slow or blocked by environment setup, run focused package tests first and document why.
  - Note: not needed; the full suite completed with the supported runtime.
- [x] Run `npm run check` if practical.
  - Result: passed. `prettier --write` tried to format `.pi/skills` markdown files; those incidental formatting changes were reverted because they are unrelated to package behavior.
- [x] Confirm generated review artifacts remain confined to `.pi/reports/` and do not affect package behavior.
  - Confirmed: `.pi/reports/architecture-review-20260611-144134.html` remains untracked and outside package code.

## Acceptance criteria

- [x] Baseline typecheck behavior is known.
- [x] Baseline test behavior is known.
- [x] Any environment-related failures are separated from code failures.

---

# 2. Extract the test session module

## Goal

Make the CLI a small shell that parses terminal options, delegates test execution to a deep `TestSession` module, prints the result, and maps it to process exit.

## Files to inspect

- `packages/cli/src/index.ts`
- `packages/cli/src/test.ts`
- `packages/cli/src/IAspectConfig.ts`
- `packages/cli/src/collectReporter.ts`
- `packages/core/src/test/TestContext.ts`
- `packages/snapshots/src/*.ts`
- `packages/cli/package.json`

## Current verified state

- No `TestSession` implementation was found.
- `packages/cli/src/index.ts` still contains the monolithic `asp()` flow.
- `CONTEXT.md` already defines **Test session** vocabulary.
- Likely CLI option issues to characterize before changing behavior:
  - `opts.disclue` is checked, but the option is named `disclude`.
  - `opts.include` is checked, but the code reads `opts.I.split(",")`.
  - `--reporter` is declared without a value placeholder and appears to be unused by `collectReporter()` except through config.

## Design questions

- [ ] What is the minimal interface for running a test session?
- [ ] Which options are CLI-only and which belong to the test session?
- [ ] Should process exit be completely outside the test session?
- [ ] Should stdout/stderr writes be adapters?
- [ ] How should compiler `readFile`, `writeFile`, and `listFiles` caching be tested?
- [ ] How should coverage and WASI adapters be represented?

## Implementation checklist

### 2.1 Characterize CLI behavior

- [ ] Add tests around CLI option mapping if no tests exist.
- [ ] Confirm current behavior for `--version`.
- [ ] Confirm current behavior for `--init`.
- [ ] Confirm current behavior for `--no-run`.
- [ ] Confirm current behavior for `--output-binary`.
- [ ] Confirm current behavior for `--update-snapshots`.
- [ ] Characterize and then fix or preserve the current `--disclude` behavior intentionally.
- [ ] Characterize and then fix or preserve the current `--include` behavior intentionally.
- [ ] Characterize and then fix or preserve the current `--reporter` behavior intentionally.
- [ ] Add tests for entry/include discovery if practical.
- [ ] Add tests for summary result formatting if practical.

### 2.2 Define session configuration and result

- [ ] Create a typed session configuration from commander options plus `IAspectConfig`.
- [ ] Separate terminal-only concerns from session concerns.
- [ ] Validate regex options in one place.
- [ ] Validate memory options in one place.
- [ ] Define a test session result with pass/fail, counts, snapshot stats, and printable summary facts.

### 2.3 Extract session execution

- [ ] Move entry discovery into the test session implementation.
- [ ] Move include discovery into the test session implementation.
- [ ] Move compiler invocation into the test session implementation.
- [ ] Move compiler file caching into the test session implementation or a local adapter.
- [ ] Move wasm instantiate/run orchestration into the test session implementation.
- [ ] Move per-entry result aggregation into the test session implementation.
- [ ] Use the existing snapshot lifecycle and update plan from `@as-pect/snapshots`.
- [ ] Keep snapshot filesystem reads/writes at an explicit I/O seam.
- [ ] Keep coverage behavior compatible.
- [ ] Keep WASI behavior compatible.

### 2.4 Reduce the CLI shell

- [ ] Keep command names: `asp` and `aspect`.
- [ ] Keep config defaults compatible.
- [ ] Keep output binary behavior compatible.
- [ ] Keep no-run behavior compatible.
- [ ] Keep snapshot update behavior compatible.
- [ ] Keep stdout/stderr writing at the edge where practical.
- [ ] Keep `process.exit()` only in the CLI shell.
- [ ] Make `asp()` small enough to review as terminal glue.

## Tests

- [ ] `npm run tsc:all`
- [ ] `npm test`
- [ ] Focused tests for `TestSession` without `process.exit()`.
- [ ] Manual smoke test of the CLI against an existing AssemblyScript test fixture.

## Acceptance criteria

- [ ] `asp()` is a small CLI shell.
- [ ] Test session behavior is testable without starting a separate process.
- [ ] Process exit is outside the deep test session module.
- [ ] Compiler/file/snapshot orchestration has locality.
- [ ] User-visible CLI behavior is preserved, except for explicitly characterized bug fixes.

---

# 3. Extract the wasm host module

## Goal

Create a deep `WasmHost` module that owns the JavaScript-side interface between AssemblyScript test code and runtime facts. `TestContext` should drive suite traversal and result aggregation without owning every linked function, pointer/string helper, reflection cache, and import hook directly.

## Files to inspect

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/util/IAspectExports.ts`
- `packages/core/src/util/ReflectedValue.ts`
- `packages/core/src/util/ReflectedValueType.ts`
- `packages/core/src/util/rTrace.d.ts`
- `packages/assembly/assembly/internal/Reflect.ts`
- `packages/assembly/assembly/internal/Actual.ts`
- `packages/assembly/assembly/internal/Expected.ts`
- `packages/assembly/assembly/internal/Test.ts`
- `packages/assembly/assembly/internal/log.ts`

## Current verified state

- No `WasmHost` implementation was found.
- `CONTEXT.md` already defines **Wasm host** vocabulary.
- `TestContext` still owns `createImports()`, `env.abort`, `env.trace`, rtrace integration, string caching, reflected value caching, and linked reflected-value functions.

## Design questions

- [ ] What facts does suite traversal need from the host?
- [ ] What facts does the host need from suite traversal?
- [ ] Should `targetNode` mutation stay in `TestContext` or move behind a recorder interface?
- [ ] Can reflection cache behavior be tested without a real wasm instance?
- [ ] How can the existing `__aspect` external function names stay compatible?
- [ ] Does rtrace belong inside the wasm host module or behind an internal adapter?

## Implementation checklist

### 3.1 Characterize host behavior

- [ ] Preserve `createImports()` output shape.
- [ ] Preserve external names under `__aspect`.
- [ ] Preserve `env.abort` chaining behavior.
- [ ] Preserve trace/log behavior.
- [ ] Preserve rtrace allocation/free behavior.
- [ ] Preserve reflected value creation and stringification behavior.

### 3.2 Define module location and seam

- [ ] Decide whether `WasmHost` lives under `packages/core/src/host/` or `packages/core/src/test/`.
- [ ] Define the smallest interface between `TestContext` and `WasmHost`.
- [ ] Decide whether `TestContext.createImports()` remains as a compatibility method delegating to `WasmHost`.

### 3.3 Extract host state

- [ ] Move reflected value cache into the wasm host implementation.
- [ ] Move string cache into the wasm host implementation.
- [ ] Move `getString()` and function-name translation into the wasm host implementation.
- [ ] Move linked reflected-value creation functions into the wasm host implementation.

### 3.4 Extract import creation and runtime capture

- [ ] Move `createImports()` implementation into `WasmHost`.
- [ ] Preserve existing `__aspect` import names.
- [ ] Move `abort()` capture into the host implementation.
- [ ] Move `trace()` capture into the host implementation.
- [ ] Move rtrace install/onalloc/onfree integration into the host implementation.
- [ ] Expose collected host facts through a small interface.
- [ ] Let `TestContext` provide callbacks or a recorder for test tree mutations.

### 3.5 Update `TestContext`

- [ ] Remove direct reflection-cache manipulation from `TestContext`.
- [ ] Remove direct import-object assembly from `TestContext`.
- [ ] Keep traversal, filtering, before/after hooks, and result aggregation in `TestContext` unless a separate refactor explicitly moves them.

## Tests

- [ ] `npm run tsc:all`
- [ ] `npm test`
- [ ] Focused wasm host tests with fake wasm exports where possible.
- [ ] Existing `TestContext` pass/fail/log/WASI tests.

## Acceptance criteria

- [ ] `TestContext` shrinks meaningfully.
- [ ] The `__aspect` external seam is named and localized.
- [ ] Pointer/string/reflection behavior can be tested through the wasm host interface.
- [ ] Existing AssemblyScript tests still run.
- [ ] External function names remain compatible.

---

# 4. Final smoke validation

## Goal

Confirm the active architecture work preserved user-visible behavior.

## Tasks

- [ ] Manual CLI smoke test with `asp --summary`.
- [ ] Manual CLI smoke test with `asp --verbose`.
- [ ] Snapshot update smoke test in a disposable fixture.
- [ ] Confirm CSV reporter still writes output at suite finalization when requested.
- [ ] Confirm JSON reporter still writes output at suite finalization when requested.
- [ ] Confirm no new dependency was added without strong justification.

## Acceptance criteria

- [ ] CLI behavior is preserved, except for explicitly documented bug fixes.
- [ ] Snapshot file format is preserved.
- [ ] Reporter output remains compatible.
- [ ] `@as-pect/assembly` external linked names remain compatible.
