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

- `TestSession` now lives in `packages/cli/src/TestSession.ts`.
- `packages/cli/src/index.ts` is a small CLI shell around config loading, terminal output, `TestSession`, and process exit mapping.
- `CONTEXT.md` already defines **Test session** vocabulary.
- Characterized CLI option issues fixed intentionally in this slice:
  - `--disclude <regex>` now maps to an entry filter regex.
  - `--include <globs>` now splits comma-separated include globs.
  - `--reporter <reporter>` now accepts a value and participates in reporter collection.
  - `--no-run` now maps to compile-only output.
  - `--no-logo` now disables logo output.

## Design questions

- [x] What is the minimal interface for running a test session?
  - First slice: `createTestSessionConfig(...)` plus `new TestSession(config).run()` returns a `TestSessionResult`; the CLI loads terminal config and maps the result to output/exit.
- [x] Which options are CLI-only and which belong to the test session?
  - CLI-only: `--version`, `--init`, `--config`, logo display, summary/coverage printing, and process exit mapping.
  - Test session: entry globs, include/disclude, test/group regex, memory, output binary, no-run, snapshot updates, reporter selection, coverage, and WASI.
- [x] Should process exit be completely outside the test session?
  - First slice: compile failures and reporter import failures no longer call `process.exit()` from session/report collection; `asp()` maps them to exit.
- [x] Should stdout/stderr writes be adapters?
  - First slice: the test session accepts stdout/stderr streams for compiler, reporter, and session log writes. Summary/coverage header printing stays in the CLI shell.
- [x] How should compiler `readFile`, `writeFile`, and `listFiles` caching be tested?
  - Added injectable test-session dependencies for compiler, glob, and filesystem; focused no-run test asserts repeated compiler `readFile`/`listFiles` requests hit the local caches once.
- [ ] How should coverage and WASI adapters be represented?
  - First slice preserved existing behavior in `TestSession`; deeper adapter shape is still open.

## Implementation checklist

### 2.1 Characterize CLI behavior

- [x] Add tests around CLI option mapping if no tests exist.
  - Added focused `TestSession` configuration tests under `packages/cli/__tests__/` and enabled the CLI Jest script.
- [x] Confirm current behavior for `--version`.
  - Added CLI option parsing coverage; version remains a CLI-only early exit flag.
- [x] Confirm current behavior for `--init`.
  - Added CLI option parsing coverage; init remains a CLI-only early exit flag.
- [x] Confirm current behavior for `--no-run`.
  - Characterized the broken commander mapping and fixed it intentionally: `--no-run` now maps to compile-only mode and writes binaries.
- [x] Confirm current behavior for `--output-binary`.
  - Added CLI/session configuration coverage for output binary mapping.
- [x] Confirm current behavior for `--update-snapshots`.
  - Added CLI/session configuration coverage for snapshot update mapping.
- [x] Characterize and then fix or preserve the current `--disclude` behavior intentionally.
  - Fixed intentionally: CLI `--disclude <regex>` now contributes an entry filter regex.
- [x] Characterize and then fix or preserve the current `--include` behavior intentionally.
  - Fixed intentionally: CLI `--include <globs>` now splits comma-separated include globs.
- [x] Characterize and then fix or preserve the current `--reporter` behavior intentionally.
  - Fixed intentionally: `--reporter <reporter>` now accepts a value and adds a custom reporter alongside config reporters.
- [x] Add tests for entry/include discovery if practical.
  - Added focused test-session execution coverage with injected glob/compiler dependencies; full real-compiler entry discovery remains covered by smoke/full tests.
- [x] Add tests for summary result formatting if practical.

### 2.2 Define session configuration and result

- [x] Create a typed session configuration from commander options plus `IAspectConfig`.
- [x] Separate terminal-only concerns from session concerns.
  - Version/init/config loading/logo/exit are CLI shell concerns; test execution options belong to `TestSessionConfig`. Reporter stdout/stderr remains an injected adapter.
- [x] Validate regex options in one place.
  - `createTestSessionConfig()` now creates test/group regexes and entry filter regexes once.
- [ ] Validate memory options in one place.
  - Still parsed at memory creation time to preserve existing behavior; invalid memory values need a separate validation slice.
- [x] Define a test session result with pass/fail, counts, snapshot stats, and printable summary facts.

### 2.3 Extract session execution

- [x] Move entry discovery into the test session implementation.
- [x] Move include discovery into the test session implementation.
- [x] Move compiler invocation into the test session implementation.
- [x] Move compiler file caching into the test session implementation or a local adapter.
- [x] Move wasm instantiate/run orchestration into the test session implementation.
- [x] Move per-entry result aggregation into the test session implementation.
- [x] Use the existing snapshot lifecycle and update plan from `@as-pect/snapshots`.
- [ ] Keep snapshot filesystem reads/writes at an explicit I/O seam.
  - Partial: snapshot reads/writes are localized in `TestSession`, but not yet behind an injectable filesystem seam.
- [x] Keep coverage behavior compatible.
- [x] Keep WASI behavior compatible.

### 2.4 Reduce the CLI shell

- [x] Keep command names: `asp` and `aspect`.
- [x] Keep config defaults compatible.
- [x] Keep output binary behavior compatible.
- [x] Keep no-run behavior compatible.
  - Fixed intentionally to match the documented option: compile entries, write `.wasm`/`.wat`, skip wasm instantiation/test execution/snapshot handling.
- [x] Keep snapshot update behavior compatible.
- [x] Keep stdout/stderr writing at the edge where practical.
- [x] Keep `process.exit()` only in the CLI shell.
- [x] Make `asp()` small enough to review as terminal glue.

## Tests

- [x] `npm run tsc:all`
  - Result: passed after extracting `TestSession` and after the CLI option/no-run slice.
- [x] `npm test`
  - Result: passed after enabling/running the CLI Jest tests and after the CLI option/no-run slice.
- [x] Focused tests for `TestSession` without `process.exit()`.
  - Added `packages/cli/__tests__/TestSession.spec.ts` for session config, compile-only execution, compiler file-cache behavior, and summary formatting.
- [x] Manual smoke test of the CLI against an existing AssemblyScript test fixture.
  - Command: `cd packages/assembly && node ../cli/bin/asp.js --no-logo assembly/__tests__/empty.spec.ts`
  - Result: passed; `--no-logo` no longer prints the logo. The positional entry is still combined with config entries, matching the pre-existing entry aggregation behavior.

## Acceptance criteria

- [x] `asp()` is a small CLI shell.
- [x] Test session behavior is testable without starting a separate process.
- [x] Process exit is outside the deep test session module.
- [x] Compiler/file/snapshot orchestration has locality.
- [x] User-visible CLI behavior is preserved, except for explicitly characterized bug fixes.
  - Explicit fixes: `--no-logo`, `--no-run`, `--disclude`, `--include`, and `--reporter <reporter>` now map according to their documented CLI help.

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
