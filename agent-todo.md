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

## Epic E7 — Remove ESLint

**Goal:** Remove the direct ESLint toolchain from this repository while preserving the project's useful static checks through TypeScript, focused tests, or small local validation scripts.

**Primary files:**

- `package.json`
- `package-lock.json`
- `eslint.config.mjs`
- npm scripts that call `eslint`
- AssemblyScript source under `packages/**/assembly/**/*.ts`

**Done when:** `eslint`, `@eslint/js`, `globals`, `typescript-eslint`, `@typescript-eslint/eslint-plugin`, and `@typescript-eslint/parser` are no longer direct dependencies, no active script calls ESLint, and replacement validation is documented.

**Validation:** run the replacement validation command, package typechecks, and focused tests for any touched package.

---

## Epic E8 — Remove Chalk

**Goal:** Remove `chalk` from runtime packages without losing readable CLI and reporter output.

**Primary files:**

- `packages/cli/src/index.ts`
- `packages/cli/src/init.ts`
- `packages/core/src/reporter/VerboseReporter.ts`
- `packages/core/src/reporter/SummaryReporter.ts`
- `packages/core/src/util/stringifyReflectedValue.ts`
- reporter snapshot/semantic tests

**Done when:** `chalk` is no longer a direct dependency of `@as-pect/cli` or `@as-pect/core`, output coloring is either handled by a small local ANSI helper or intentionally simplified, and reporter tests describe the expected output.

**Validation:** focused CLI tests, core reporter tests, and reporter package tests if output contracts change.

---

## Epic E9 — Remove Rimraf

**Goal:** Replace `rimraf` cleanup scripts with Node built-ins or small local cleanup scripts.

**Primary files:**

- root `package.json`
- package scripts under `packages/*/package.json`
- optional local cleanup helper under `scripts/`

**Done when:** `rimraf` is no longer a direct dependency, no package script invokes `rimraf`, and clean/build scripts work cross-platform enough for supported Node versions.

**Validation:** run package build/typecheck commands that previously cleaned generated output.

---

## Epic E10 — Remove npm-run-all2

**Goal:** Remove `npm-run-all2` by replacing `run-s` and `run-p` script orchestration with npm-native sequencing, shell-free Node helpers, or package-specific scripts.

**Primary files:**

- root `package.json`
- package scripts under `packages/*/package.json`
- optional local script runner under `scripts/`

**Done when:** `npm-run-all2` is no longer a direct dependency, no script invokes `run-s` or `run-p`, and existing build/test workflows still have clear commands.

**Validation:** `npm test`, `npm run tsc:all`, and focused package commands touched by the migration.

---

## Epic E11 — Remove Chevrotain

**Goal:** Remove `chevrotain` from the snapshots package by replacing the snapshot parser with a small local parser tailored to as-pect snapshot syntax.

**Primary files:**

- `packages/snapshots/src/Snapshot.ts`
- `packages/snapshots/__tests__/snapshot.spec.ts`
- snapshot fixtures under `packages/snapshots/__tests__/__snapshots__/`

**Done when:** `chevrotain` is no longer a direct dependency, snapshot parsing/stringifying behavior remains compatible, and parse errors remain useful for callers.

**Validation:** focused snapshots package tests, core snapshot/reporting tests, and CLI snapshot tests.

---

## Epic E12 — Remove Commander

**Goal:** Remove `commander` from the CLI by replacing option parsing with a small local parser that supports the documented `asp`/`aspect` command surface.

**Primary files:**

- `packages/cli/src/index.ts`
- `packages/cli/__tests__/CliOptions.spec.ts`
- CLI README/help documentation if present

**Done when:** `commander` is no longer a direct dependency, CLI parsing behavior is covered by tests, and help/version/error output remains acceptable for users.

**Validation:** focused CLI option tests and smoke tests for common `asp` invocations.

---

## Suggested first sequence

1. **E2-S3** — Remove compatibility facts from internal event construction.
2. **E2-S4** — Convert built-in reporters to pure report facts where possible.
3. **E3-S1** — Inventory and characterize Wasm host callbacks.

This sequence prepares the Reporting lifecycle seam without breaking custom reporters, then moves to Wasm host recording locality.
