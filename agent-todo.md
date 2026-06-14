# Agent TODO — active maintenance slices

Verified: June 13, 2026

Only valid positive work that needs to be done should exist in this file. In practice: keep this file limited to actionable, still-active improvement or repair work; remove completed, obsolete, speculative, or purely historical notes. Each slice is intended to be small, atomic, and reviewable on its own.

## Ground rules for agents

- Keep each slice focused; do not bundle unrelated reporter, snapshot, lifecycle, or benchmark changes.
- Prefer tests before fixes when the current behavior is unclear.
- Avoid new dependencies unless the slice explicitly justifies them. Benchmarks should use Node built-ins first.
- Run focused package tests for the package touched, then run broader validation when the slice changes shared behavior.
- Link every slice to exactly one epic. If a slice appears to belong to multiple epics, split it.
- Preserve compatibility for existing users unless the slice explicitly says it is a compatibility migration slice.
- When a slice creates a new project concept, update `CONTEXT.md` in the same change.

## TODO hygiene checklist

When updating this file after a maintenance change:

- Remove completed slices instead of leaving historical status notes in the active list.
- Split broad slices when the next useful review boundary is smaller than the current description.
- Keep one epic link per slice, and move cross-epic follow-up into a separate slice.
- Add or update validation notes so the next agent can run the smallest command that proves the work.
- Re-check hidden work in epic prose; convert it into explicit slices or delete it if it is obsolete.

---

## Epic E1 — Deepen the Test session entry lifecycle

**Goal:** Concentrate the per-entry Test session lifecycle behind a smaller interface so entry discovery, compiler IO, coverage, wasm instantiation, snapshots, reporters, WASI, and stats have better locality.

**Primary files:**

- `packages/cli/src/TestSession.ts`
- `packages/cli/src/index.ts`
- `packages/cli/__tests__/TestSession.spec.ts`

**Target shape:** `runTestSession()` should coordinate high-level Test session flow. Per-entry behavior should live behind a Test session entry module with focused helpers/adapters and test coverage at that seam.

### Slice E1-S8 — Extract per-entry execution into a Test session entry module

- **Epic:** E1
- **Scope:** Create the deep module that compiles one planned entry, optionally writes binaries, instantiates wasm, runs `TestContext`, flushes reporters, and returns suite facts/write plans.
- **Files:** `packages/cli/src/TestSession.ts`, new `packages/cli/src/TestSessionEntry.ts`
- **Tests to add/update:**
  - compile-only `--no-run` writes binary outputs and skips wasm execution
  - `outputBinary` writes `.wasm` and `.wat`
  - reporter is collected per run entry when tests execute
  - `onFlush` is awaited after a suite run
- **Done when:** `runTestSession()` becomes a high-level loop over planned entries that delegates one entry at a time.
- **Validation:** focused CLI package tests, then full CLI test suite.

### Slice E1-S9 — Reduce repeated Suite report construction

- **Epic:** E1
- **Scope:** Avoid constructing `SuiteReport.from(ctx)` multiple times for the same completed suite in the CLI path.
- **Files:** `packages/cli/src/TestSession.ts`, maybe `packages/core/src/reporter/ReportingLifecycle.ts` only if needed
- **Tests to add/update:**
  - no behavior change in aggregate stats
  - reporters still receive finish events
  - empty suites are still ignored for aggregate stats
- **Done when:** each completed `TestContext` has one suite report fact used by the CLI path.
- **Validation:** focused CLI and core reporter tests.

### Slice E1-S10 — Document the Test session entry concept

- **Epic:** E1
- **Scope:** If the Test session entry module is introduced, add the term to `CONTEXT.md` and summarize its responsibility.
- **Files:** `CONTEXT.md`, any new module docs/comments
- **Tests to add/update:** none unless terminology appears in generated/help output
- **Done when:** future agents can name the Test session entry module without rediscovering its purpose.
- **Validation:** documentation review.

---

## Epic E2 — Seal the Reporting lifecycle seam

**Goal:** Make Suite report facts the main reporter interface and isolate legacy `TestContext` / `TestNode` callback compatibility behind adapters, improving locality for reporter behavior.

**Primary files:**

- `packages/core/src/reporter/ReportingLifecycle.ts`
- `packages/core/src/reporter/IReporter.ts`
- `packages/core/src/reporter/CombinationReporter.ts`
- `packages/core/src/reporter/SummaryReporter.ts`
- `packages/core/src/reporter/VerboseReporter.ts`
- `packages/json-reporter/index.ts`
- `packages/csv-reporter/index.ts`
- reporter tests under `packages/core/__tests__`, `packages/json-reporter/__tests__`, and `packages/csv-reporter/__tests__`

**Target shape:** New reporters should depend on Suite report and Report event facts. Legacy callbacks should still work, but through an explicit compatibility adapter rather than leaking through the main report event interface.

### Slice E2-S1 — Characterize reporter compatibility behavior

- **Epic:** E2
- **Scope:** Add tests that lock down how modern report callbacks and legacy callbacks interact today.
- **Files:** `packages/core/__tests__/ReportingLifecycle.spec.ts`, `packages/core/__tests__/CombinationReporter.spec.ts`
- **Tests to add:**
  - reporter with only legacy callbacks receives `onEnter`, `onExit`, `onFinish`
  - reporter with report callbacks receives report events and not duplicate legacy callbacks
  - `CombinationReporter` mixes modern and legacy reporters correctly
  - subclass overrides of `VerboseReporter` and `SummaryReporter` continue to work
- **Done when:** compatibility rules are explicit before changing the seam.
- **Validation:** focused core reporter tests.

### Slice E2-S2 — Introduce a named legacy reporter adapter

- **Epic:** E2
- **Scope:** Add a small adapter module that translates report events into legacy `onEnter`, `onExit`, and `onFinish` calls where needed.
- **Files:** new `packages/core/src/reporter/LegacyReporterAdapter.ts`, `IReporter.ts`, `ReportingLifecycle.ts`, `CombinationReporter.ts`
- **Tests to add/update:**
  - adapter translates group/test start and finish events
  - adapter translates suite finish events
  - adapter does not call legacy callbacks when a reporter provides modern callbacks for that event
- **Done when:** fallback logic is concentrated in one adapter module instead of repeated in `ReportingLifecycle` and `CombinationReporter`.
- **Validation:** focused core reporter tests.

### Slice E2-S3 — Remove compatibility facts from internal event construction

- **Epic:** E2
- **Scope:** Stop making `TestContext` and `TestNode` the default facts reporters must understand internally; keep compatibility available through the legacy adapter.
- **Files:** `ReportingLifecycle.ts`, `IReporter.ts`, `LegacyReporterAdapter.ts`, reporter tests
- **Tests to add/update:**
  - modern reporter tests only assert Suite report, group report, and test report facts
  - legacy adapter tests cover `TestContext`/`TestNode` access
- **Done when:** the main report event construction path is centered on reportable facts, with legacy facts isolated.
- **Validation:** focused core reporter tests, JSON reporter tests, CSV reporter tests.

### Slice E2-S4 — Convert built-in reporters to pure report facts where possible

- **Epic:** E2
- **Scope:** Update `SummaryReporter`, `VerboseReporter`, `JSONReporter`, and `CSVReporter` so their primary implementation renders Suite report / group report / test report facts.
- **Files:** built-in reporter files and tests
- **Tests to add/update:**
  - reporter semantic tests still pass
  - JSON/CSV output remains byte-for-byte compatible where existing tests assert output
  - verbose and summary report rendering still handles snapshots, warnings, errors, logs, todos, rtrace facts
- **Done when:** built-in reporters do not need `TestContext` or `TestNode` except for explicit legacy override compatibility.
- **Validation:** focused core reporter tests, JSON reporter tests, CSV reporter tests.

### Slice E2-S5 — Split report fact creation from event publication

- **Epic:** E2
- **Scope:** Separate Suite report/group report/test report creation from the module that decides which reporter callback to invoke.
- **Files:** `ReportingLifecycle.ts`, optional new `packages/core/src/reporter/SuiteReportFactory.ts`
- **Tests to add/update:**
  - group/test report facts can be created directly in tests without a full Reporting lifecycle
  - snapshot change lines and stats still match existing behavior
- **Done when:** fact construction has its own test surface and publication logic is smaller.
- **Validation:** focused core reporter tests.

### Slice E2-S6 — Document reporter interface migration guidance

- **Epic:** E2
- **Scope:** Update reporter documentation to recommend report events and explain legacy callback compatibility.
- **Files:** `packages/core/README.md`, reporter package readmes if relevant, `CONTEXT.md` if terminology changes
- **Tests to add/update:** none
- **Done when:** custom reporter authors know which interface to implement and which callbacks are compatibility-only.
- **Validation:** documentation review.

---

## Epic E3 — Give the Wasm host a Test tree recording module

**Goal:** Separate host callback recording and Test tree mutation from TestContext execution flow, so the Wasm host has a smaller seam and Test tree state has better locality.

**Primary files:**

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/test/TestNode.ts`
- `packages/core/src/util/IAspectExports.ts`
- `packages/core/__tests__/TestContext.*.spec.ts`

**Target shape:** `TestContext` coordinates execution. A Test tree recording module owns host-import callbacks that add groups, tests, hooks, todos, logs, reflected actual/expected values, abort messages, and snapshots to the current Test node.

### Slice E3-S1 — Inventory and characterize Wasm host callbacks

- **Epic:** E3
- **Scope:** Add or tighten tests around every `__aspect` import exposed by `TestContext.createImports()`.
- **Files:** `packages/core/src/test/TestContext.ts`, `packages/core/__tests__/TestContext.*.spec.ts`
- **Tests to add/update:**
  - group/test declaration callback creates the right Test node facts
  - before/after hook callbacks attach to the current target node
  - todo/log callbacks attach to the current target node
  - actual/expected/message/stack facts attach to failed tests
  - snapshot callback records under the expected namespace
- **Done when:** host callback behavior is explicit before extraction.
- **Validation:** focused core TestContext tests.

### Slice E3-S2 — Introduce a Test tree recorder for declarations

- **Epic:** E3
- **Scope:** Move group/test declaration and namespace generation into a Test tree recording module.
- **Files:** `TestContext.ts`, new `packages/core/src/test/TestTreeRecorder.ts`, maybe `TestNode.ts`
- **Tests to add/update:**
  - duplicate test names get stable `[n]` namespaces
  - nested groups/tests attach to the active target node
  - parent/child links are preserved
- **Done when:** `TestContext` delegates declaration recording without directly constructing Test nodes.
- **Validation:** focused core TestContext tests.

### Slice E3-S3 — Move hook and todo recording into the recorder

- **Epic:** E3
- **Scope:** Move before/after hook pointer registration and todo collection behind the Test tree recorder.
- **Files:** `TestContext.ts`, `TestTreeRecorder.ts`, `TestNode.ts`
- **Tests to add/update:**
  - `beforeAll`, `beforeEach`, `afterEach`, `afterAll` are registered on the correct group
  - todos appear in the correct Suite report group facts
- **Done when:** hook/todo mutation is concentrated in the recorder.
- **Validation:** focused core lifecycle and reporting tests.

### Slice E3-S4 — Move log and reflected value recording into the recorder

- **Epic:** E3
- **Scope:** Move log collection and actual/expected reflected value assignment behind a recorder interface.
- **Files:** `TestContext.ts`, `TestTreeRecorder.ts`, reflected value tests if needed
- **Tests to add/update:**
  - logs attach to group or test according to active target node
  - actual/expected values attach to the failing test
  - reporter output remains unchanged for logs and assertion failures
- **Done when:** TestContext execution code does not directly mutate these Test node fields.
- **Validation:** focused core log/pass-fail/reporter tests.

### Slice E3-S5 — Move snapshot recording into the recorder

- **Epic:** E3
- **Scope:** Move runtime snapshot recording behind the Test tree recorder or a nested snapshot recording helper.
- **Files:** `TestContext.ts`, `TestTreeRecorder.ts`, snapshot-related core tests
- **Tests to add/update:**
  - snapshot keys use the current Test node namespace
  - duplicate snapshots for one namespace get stable `[n]` suffixes from `Snapshot.add()`
  - snapshot lifecycle still receives the same actual snapshots
- **Done when:** snapshot recording no longer depends on scattered TestContext mutable state.
- **Validation:** focused core snapshot tests and snapshots package tests if shared behavior moves.

### Slice E3-S6 — Add a target-node scope helper

- **Epic:** E3
- **Scope:** Make the active target node transition explicit with a small helper that safely restores the previous target node after callback execution.
- **Files:** `TestContext.ts`, `TestTreeRecorder.ts`
- **Tests to add/update:**
  - target node is restored after successful callbacks
  - target node is restored after thrown callbacks
  - nested groups do not leak active target state into sibling groups/tests
- **Done when:** current target node handling is local and exception-safe.
- **Validation:** focused core lifecycle tests.

### Slice E3-S7 — Reduce public mutable TestNode access where safe

- **Epic:** E3
- **Scope:** After recorder extraction, identify Test node fields that can be updated through methods or report facts rather than direct public mutation.
- **Files:** `TestNode.ts`, tests that directly mutate Test nodes
- **Tests to add/update:**
  - keep fixture builders simple for tests
  - preserve public compatibility unless a field is clearly internal and unused externally
- **Done when:** at least one high-churn mutation path is made local without broad breaking changes.
- **Validation:** focused core tests.

### Slice E3-S8 — Document the Test tree recording concept

- **Epic:** E3
- **Scope:** Add Test tree recording terminology to `CONTEXT.md` if the module lands.
- **Files:** `CONTEXT.md`
- **Tests to add/update:** none
- **Done when:** future agents can distinguish Wasm host, TestContext execution, and Test tree recording responsibilities.
- **Validation:** documentation review.

---

## Epic E4 — Deepen Class reflection generation around the Class-member plan

**Goal:** Make the Class-member plan the central seam for generated class reflection behavior, reducing duplicated AST construction rules and inheritance ignore logic.

**Primary files:**

- `packages/transform/src/ClassReflectionTransform.ts`
- `packages/transform/src/createStrictEqualsMember.ts`
- `packages/transform/src/createAddReflectedValueKeyValuePairsMember.ts`
- `packages/transform/src/createInterfaceReflectionMembers.ts`
- `packages/transform/src/index.ts`
- `packages/transform/__tests__/ClassReflectionTransform.test.js`

**Target shape:** A Class reflection generation module should own traversal decisions, collision checks, Class-member plan facts, generated strict equality methods, generated key/value methods, generated interface methods, and shared AST vocabulary.

### Slice E4-S1 — Characterize generated output for fields, getters, inheritance, and interfaces

- **Epic:** E4
- **Scope:** Add transform tests that pin the behavior of generated class and interface reflection members before refactoring.
- **Files:** `packages/transform/__tests__/ClassReflectionTransform.test.js`
- **Tests to add/update:**
  - instance fields are included
  - instance getters are included
  - static members are excluded
  - inherited duplicate names are ignored through hash lists
  - interfaces receive reflection member declarations
  - local `@operator("==")` generates the equality marker
- **Done when:** transform behavior is well-characterized independent of implementation shape.
- **Validation:** focused transform tests.

### Slice E4-S2 — Extract shared AST type/parameter helpers

- **Epic:** E4
- **Scope:** Remove duplicate `createSimpleNamedType`, array/static-array/map type helpers, and default parameter construction from generated member modules.
- **Files:** new `packages/transform/src/astHelpers.ts`, `createStrictEqualsMember.ts`, `createAddReflectedValueKeyValuePairsMember.ts`, `createInterfaceReflectionMembers.ts`
- **Tests to add/update:** existing transform tests should pass; add helper-level tests only if behavior is nontrivial
- **Done when:** generated member modules share one AST vocabulary module.
- **Validation:** focused transform tests.

### Slice E4-S3 — Extract shared inherited ignore-list generation

- **Epic:** E4
- **Scope:** Concentrate `StaticArray.concat(ignore, [...hashes] as StaticArray<i64>)` construction used by strict equality and reflected key/value generation.
- **Files:** `createStrictEqualsMember.ts`, `createAddReflectedValueKeyValuePairsMember.ts`, optional new helper module
- **Tests to add/update:** transform output tests for inheritance and duplicate suppression
- **Done when:** hash ignore-list AST construction exists in one implementation.
- **Validation:** focused transform tests.

### Slice E4-S4 — Move generated class reflection member orchestration behind one module

- **Epic:** E4
- **Scope:** Replace generation orchestration in `index.ts` with a function that accepts a class declaration and appends the right generated members.
- **Files:** `ClassReflectionTransform.ts`, `index.ts`, generated member modules
- **Tests to add/update:**
  - generated members are idempotent on repeated transform passes
  - user-authored collisions still throw useful errors
  - generated equality marker only appears for local equality operator overloads
- **Done when:** `traverseStatements()` does not know individual generated member rules.
- **Validation:** focused transform tests.

### Slice E4-S5 — Split class and interface collision checks

- **Epic:** E4
- **Scope:** `shouldGenerateClassReflectionMember()` currently accepts class and interface declarations in practice. Rename or split it so the interface matches the implementation.
- **Files:** `ClassReflectionTransform.ts`, `index.ts`, tests
- **Tests to add/update:**
  - class collision still rejects user-authored generated member names
  - interface collision still rejects user-authored generated member names
  - generated members from previous passes are skipped for both classes and interfaces
- **Done when:** naming reflects both class and interface reflection generation.
- **Validation:** focused transform tests.

### Slice E4-S6 — Make Class-member plan tests direct

- **Epic:** E4
- **Scope:** Add tests that exercise `createClassReflectionMemberPlan()` directly without snapshotting full transform output.
- **Files:** `ClassReflectionTransform.ts`, `ClassReflectionTransform.test.js`
- **Tests to add/update:**
  - member order follows source order
  - hashes match `djb2Hash(name)`
  - ranges are taken from fields/getters as intended
  - only instance fields/getters are included
- **Done when:** Class-member plan behavior has its own test surface.
- **Validation:** focused transform tests.

### Slice E4-S7 — Document Class reflection generation responsibilities

- **Epic:** E4
- **Scope:** Update package documentation or source comments to distinguish Class reflection transform, Class-member plan, and generated member construction.
- **Files:** `packages/transform/README.md`, `CONTEXT.md` if terminology changes
- **Tests to add/update:** none
- **Done when:** future agents can navigate transform responsibilities without reading every generated member module first.
- **Validation:** documentation review.

---

## Epic E5 — Keep snapshot lifecycle behavior deep and explicit

**Goal:** Preserve the existing Snapshot lifecycle depth while improving test coverage and CLI integration around update plans and reportable snapshot facts.

**Primary files:**

- `packages/snapshots/src/Snapshot.ts`
- `packages/snapshots/src/SnapshotDiff.ts`
- `packages/snapshots/src/SnapshotLifecycle.ts`
- `packages/snapshots/__tests__/snapshot.spec.ts`
- `packages/core/src/reporter/ReportingLifecycle.ts`
- `packages/cli/src/TestSession.ts`

**Target shape:** Snapshot parsing, diffing, pass/fail, stats, and update planning stay concentrated in the Snapshot lifecycle module; CLI and reporters consume stable facts.

### Slice E5-S1 — Add direct Snapshot lifecycle update-plan tests

- **Epic:** E5
- **Scope:** Cover `SnapshotLifecycle.updatePlan` directly for added, removed, changed, and unchanged snapshots.
- **Files:** `packages/snapshots/__tests__/snapshot.spec.ts`, `SnapshotLifecycle.ts`
- **Tests to add/update:**
  - added snapshots pass and produce updates
  - removed snapshots fail and produce no update
  - changed snapshots fail and produce no update
  - unchanged snapshots pass and produce no update
- **Done when:** update-plan rules are verified without running CLI tests.
- **Validation:** focused snapshots package tests.

### Slice E5-S2 — Add snapshot parser error coverage

- **Epic:** E5
- **Scope:** Ensure malformed snapshot files produce useful `SnapshotParseError` facts.
- **Files:** `packages/snapshots/__tests__/snapshot.spec.ts`, `Snapshot.ts`
- **Tests to add/update:**
  - lexer errors populate `lexerErrors`
  - parser errors populate `parserErrors`
  - missing value error remains useful
  - backtick escaping/unescaping remains stable
- **Done when:** parser error modes are locked down for CLI callers.
- **Validation:** focused snapshots package tests.

### Slice E5-S3 — Keep Suite report snapshot facts independent from diff internals

- **Epic:** E5
- **Scope:** Strengthen tests that reporters use `snapshotChanges` and `snapshotStats` instead of interpreting diff internals.
- **Files:** `packages/core/__tests__/ReportingLifecycle.spec.ts`, reporter semantic tests
- **Tests to add/update:**
  - added/removed/unchanged snapshot lines render with correct line types
  - stats are correct when `SnapshotLifecycle.stats` exists
  - compatibility-only `result` remains available for now
- **Done when:** reportable snapshot facts are safe to use as the reporter interface.
- **Validation:** focused core reporter tests.

### Slice E5-S4 — Route CLI snapshot writes through Snapshot lifecycle facts

- **Epic:** E5
- **Scope:** As part of E1 extraction, ensure CLI snapshot writes use `SnapshotLifecycle.updatePlan` and stats rather than duplicating diff rules.
- **Files:** `packages/cli/src/TestSession.ts`, possible E1 snapshot module
- **Tests to add/update:** CLI compare/update snapshot tests
- **Done when:** CLI snapshot handling delegates all pass/fail/update decisions to Snapshot lifecycle.
- **Validation:** focused CLI and snapshots package tests.

---

## Epic E6 — Improve architecture-facing documentation and validation loops

**Goal:** Keep future maintenance slices aligned with project language, compatibility expectations, and validation commands.

**Primary files:**

- `CONTEXT.md`
- package readmes
- `VALIDATION_BASELINE.md`
- tests across touched packages

### Slice E6-S2 — Add architecture vocabulary reminders to package readmes

- **Epic:** E6
- **Scope:** Where a package readme already describes a major project concept, align names with `CONTEXT.md` terms such as Test session, Test suite, Reporter, Reporting lifecycle, Snapshot lifecycle, Wasm host, Class reflection transform, and Class-member plan.
- **Files:** package readmes and `CONTEXT.md`
- **Tests to add/update:** none
- **Done when:** package documentation uses the same domain language as implementation discussions.
- **Validation:** documentation review.

---

## Suggested first sequence

1. **E1-S1** — Characterize multi-entry Test session behavior.
2. **E1-S2** — Extract Test session entry discovery.
3. **E1-S3** — Isolate compiler IO caching.
4. **E1-S5** — Extract snapshot file planning for Test sessions.
5. **E1-S8** — Extract per-entry execution into a Test session entry module.
6. **E2-S1** — Characterize reporter compatibility behavior.
7. **E2-S2** — Introduce a named legacy reporter adapter.

This sequence tackles the highest-leverage Test session locality first, then prepares the Reporting lifecycle seam without breaking custom reporters.
