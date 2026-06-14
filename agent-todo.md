# Agent TODO — active maintenance slices

Verified: June 14, 2026

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

## Epic E7 — Replace ESLint and Prettier with Biome

**Goal:** Remove the direct ESLint and Prettier toolchains from this repository while preserving useful formatting and static checks through Biome, TypeScript, focused tests, or small local validation scripts.

**Primary files:**

- `package.json`
- `package-lock.json`
- `eslint.config.mjs`
- `.prettierrc.cjs`
- `.prettierignore`
- Biome configuration file, if needed
- npm scripts that call `eslint` or `prettier`
- AssemblyScript source under `packages/**/assembly/**/*.ts`

**Done when:** `eslint`, `@eslint/js`, `globals`, `typescript-eslint`, `@typescript-eslint/eslint-plugin`, `@typescript-eslint/parser`, and `prettier` are no longer direct dependencies; Biome is added as a top-level devDependency; no active script calls ESLint or Prettier; and replacement validation is documented.

**Validation:** run the Biome format/check command, package typechecks, and focused tests for any touched package.

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

## Epic E13 — Repair core and assembly correctness bugs from June 2026 bug scan

**Goal:** Fix confirmed correctness issues found in `@as-pect/core` and `@as-pect/assembly` without bundling unrelated architecture or dependency work.

**Primary files:**

- `packages/core/src/test/TestContext.ts`
- `packages/core/src/test/TestNode.ts`
- `packages/core/src/reporter/SuiteReportFactory.ts`
- `packages/core/src/reporter/VerboseReporter.ts`
- `packages/core/src/reporter/SummaryReporter.ts`
- `packages/core/src/util/stringifyReflectedValue.ts`
- `packages/assembly/assembly/internal/Expectation.ts`
- core and assembly tests around lifecycle, reporter facts, stringification, snapshots, and expectations

**Validation baseline from discovery:** `npm run test:ci --workspace @as-pect/assembly`, `npm run test:ci --workspace @as-pect/core`, `npm run tsc:all --workspace @as-pect/assembly`, and `npm run tsc --workspace @as-pect/core` passed before fixes.

### Slice E13-S1 — Do not run hooks for filtered-out tests

- **Epic:** E13
- **Problem:** Filtered-out tests still run parent `beforeEach` and `afterEach` hooks. `TestContext.visit(child)` applies `testRegex` inside the child visit, but the parent traversal already calls hooks before and after that visit.
- **Files:** `packages/core/src/test/TestContext.ts`, `packages/core/__tests__/TestGroupFilter.spec.ts`, possible filter fixture under `packages/core/assembly/`
- **Fix:** Decide whether a child test matches the active test filter before running per-test hooks. A skipped child should be marked/pass-preserved consistently with current filtering behavior, but no before/after hooks should execute for it.
- **Tests to add/update:** A filtered-out test whose `beforeEach` or `afterEach` would fail/mutate state must not run those hooks; matching tests should still run hooks in the existing parent-to-child and child-to-parent order.
- **Done when:** focused test filtering no longer runs hooks for excluded tests and existing group/test filter behavior remains stable, including stateful regex reset behavior.
- **Validation:** `npm run test:ci --workspace @as-pect/core`.

### Slice E13-S2 — Report todo-only groups and root-level todos correctly

- **Epic:** E13
- **Problem:** Todo-only groups and root-level todos are lost or underreported. `createGroupReport()` sets `hasChildren` from `group.children.length`, `collectResults()` skips groups without children, `VerboseReporter.writeGroupFinish()` returns before printing todos when `group.tests.length === 0`, and `SuiteReport.todoCount` is recalculated only from child groups even though `TestContext.todoCount` includes root todos.
- **Files:** `packages/core/src/reporter/SuiteReportFactory.ts`, `packages/core/src/reporter/VerboseReporter.ts`, `packages/core/src/reporter/SummaryReporter.ts`, `packages/core/src/test/TestContext.ts`, reporter semantic tests, suite report factory tests
- **Fix:** Treat todos as reportable results even when a group has no test children. Include root-level todos in suite facts or explicitly model them so `SuiteReport.todoCount`, `SuiteReport.results`, and reporter output agree with `TestContext.todoCount`. Ensure verbose output prints todos for todo-only groups.
- **Tests to add/update:** Suite report tests for a todo-only group and a root-level todo; verbose and summary reporter tests that prove todo-only output is visible and counts are correct.
- **Done when:** structured report facts and reporter output include todo-only groups and root-level todos without double-counting nested todos.
- **Validation:** `npm run test:ci --workspace @as-pect/core`.

### Slice E13-S3 — Use expectation negation in structured expected strings

- **Epic:** E13
- **Problem:** `SuiteTestReport.expected` uses `test.negated`, which means an `itThrows`/`throws` node, instead of `test.expected.negated`, which means an `expect(...).not` assertion. Failed normal negated assertions can therefore omit `Not` from the structured expected string.
- **Files:** `packages/core/src/reporter/SuiteReportFactory.ts`, `packages/core/__tests__/SuiteReportFactory.spec.ts`, reporter semantic tests if needed
- **Fix:** Build the `expected` string from `test.expected.negated` when an expected reflected value exists. Keep `test.negated` available separately for throw-style test nodes.
- **Tests to add/update:** A failed `expect(...).not` assertion should produce a `SuiteTestReport.expected` string prefixed with `Not`; a throw-style test node should not force unrelated expected values to be negated.
- **Done when:** modern report facts distinguish test-node negation from expectation negation.
- **Validation:** `npm run test:ci --workspace @as-pect/core`.

### Slice E13-S4 — Print the real passing group count in VerboseReporter

- **Epic:** E13
- **Problem:** `VerboseReporter` prints `report.groupCount` as both passing and total groups, so failing suites can display all groups as passing.
- **Files:** `packages/core/src/reporter/VerboseReporter.ts`, `packages/core/__tests__/VerboseReporter.semantic.spec.ts`
- **Fix:** Use `report.groupPassCount` for the passing group count and `report.groupCount` for the total group count. Preserve existing output shape except for the corrected number.
- **Tests to add/update:** A verbose summary for a suite with at least one failing group should render the true passing group count.
- **Done when:** verbose output no longer claims every group passed when `groupPassCount < groupCount`.
- **Validation:** `npm run test:ci --workspace @as-pect/core`.

### Slice E13-S5 — Report truncated expanded arrays with the correct remaining count

- **Epic:** E13
- **Problem:** Expanded array stringification caps `length` to `maxPropertyCount` and then calculates `length - maxPropertyCount`, producing misleading suffixes like `... +0 values` for oversized arrays.
- **Files:** `packages/core/src/util/stringifyReflectedValue.ts`, stringify/reflected value tests
- **Fix:** Keep the original value count separate from the displayed count, and calculate the suffix from `originalLength - displayCount`. Only emit the truncation suffix when the original count exceeds `maxPropertyCount`.
- **Tests to add/update:** A reflected array with more values than `maxPropertyCount` should report the real number of omitted values; an array exactly at the limit should not report `+0 values`.
- **Done when:** expanded array truncation output is accurate.
- **Validation:** `npm run test:ci --workspace @as-pect/core`.

### Slice E13-S6 — Preserve as-pect abort messages when wrapping existing abort imports

- **Epic:** E13
- **Problem:** `TestContext.createImports()` calls a user/import-provided `env.abort` before `this.abort(...args)`. If the previous abort throws, as-pect never captures the AssemblyScript abort reason into `TestContext.message`.
- **Files:** `packages/core/src/test/TestContext.ts`, `packages/core/__tests__/TestContext.host-callbacks.spec.ts` or pass/fail tests
- **Fix:** Capture the as-pect abort message before invoking the previous abort, or invoke as-pect capture in a `finally`, so throwing abort imports do not erase assertion diagnostics. Preserve the previous abort's throwing behavior.
- **Tests to add/update:** A custom `env.abort` that throws should still leave the failed test with the AssemblyScript abort message; non-throwing abort imports should still be called.
- **Done when:** abort diagnostics are reliable regardless of imported abort behavior.
- **Validation:** `npm run test:ci --workspace @as-pect/core`.

### Slice E13-S7 — Mark expected values as negated for `toStrictEqual().not`

- **Epic:** E13
- **Problem:** `Expectation.toStrictEqual()` calls `Expected.report(expected)` without passing `this._not`, so failed `expect(a).not.toStrictEqual(b)` assertions behave correctly but report the expected value as non-negated.
- **Files:** `packages/assembly/assembly/internal/Expectation.ts`, `packages/assembly/assembly/__tests__/toStrictEqual.spec.ts`, core pass/fail reporter tests if needed
- **Fix:** Pass `this._not` into `Expected.report(expected, this._not)` in `toStrictEqual()`.
- **Tests to add/update:** A failing negated strict-equality assertion should expose an expected reflected value with `negated === true` and render `Not` in reporter output where expected values are shown.
- **Done when:** `toStrictEqual` reports negation consistently with other expectation methods.
- **Validation:** `npm run test:ci --workspace @as-pect/assembly`; run core reporter/pass-fail tests if reporter output fixtures change.

### Slice E13-S8 — Align `toBeCloseTo` tolerance with decimal-place semantics

- **Epic:** E13
- **Problem:** `Expectation.toBeCloseTo()` currently checks `abs(expected - actual) < Math.pow(10, -decimalPlaces)`, which is looser than common Jest-style decimal-place semantics. At `decimalPlaces = 2`, differences under `0.01` pass even when they round to different hundredths.
- **Files:** `packages/assembly/assembly/internal/Expectation.ts`, `packages/assembly/assembly/__tests__/toBeCloseTo.spec.ts`, type docs if wording needs clarification
- **Fix:** Use half-unit decimal tolerance, e.g. `abs(expected - actual) < 0.5 * Math.pow(10, -decimalPlaces)`, unless maintainers intentionally choose and document the looser epsilon. Update documentation to match the chosen behavior.
- **Tests to add/update:** Add boundary cases around `decimalPlaces = 2`, including a difference that is below `0.01` but above/equal to half the hundredth unit and should fail under Jest-compatible semantics.
- **Done when:** `toBeCloseTo` behavior and documentation agree on decimal-place tolerance.
- **Validation:** `npm run test:ci --workspace @as-pect/assembly`.

### Slice E13-S9 — Correct the `toBeFinite` non-float compile-time error message

- **Epic:** E13
- **Problem:** `Expectation.toBeFinite()` reports `toBeNaN must be called with a Float value type T.` when invoked on a non-float type.
- **Files:** `packages/assembly/assembly/internal/Expectation.ts`, assembly expectation tests if compile-error coverage exists
- **Fix:** Change the diagnostic to name `toBeFinite`.
- **Tests to add/update:** If the project has compile-error assertion coverage, pin the corrected message; otherwise treat as a focused source-only diagnostic fix.
- **Done when:** invalid `toBeFinite` usage points users at the correct matcher.
- **Validation:** `npm run tsc:all --workspace @as-pect/assembly` and `npm run test:ci --workspace @as-pect/assembly`.

### Slice E13-S10 — Use stable TestNode namespaces for snapshot keys

- **Epic:** E13
- **Problem:** `TestTreeRecorder` creates duplicate-safe `TestNode.namespace` values for snapshot purposes, but `TestContext.reportExpectedSnapshot()` builds snapshot names from only `this.targetNode.name` and the snapshot name. `Snapshot.add()` avoids overwrites by appending indexes, but duplicate test names become order-dependent instead of tied to stable test namespaces.
- **Files:** `packages/core/src/test/TestContext.ts`, `packages/core/src/test/TestTreeRecorder.ts`, `packages/core/__tests__/TestContext.host-callbacks.spec.ts`, snapshot fixtures in core/assembly if keys intentionally change
- **Fix:** Build snapshot keys from `this.targetNode.namespace` plus the explicit snapshot name, while planning any compatibility migration for existing snapshot files. If compatibility requires retaining current external keys, document that decision and remove or repurpose the misleading “for snapshot purposes” namespace ownership.
- **Tests to add/update:** Duplicate test names with snapshots should produce deterministic namespace-derived keys that do not shift when siblings are reordered; existing non-duplicate snapshot behavior should remain understandable or have a documented migration.
- **Done when:** snapshot key generation either uses stable test namespaces or the code/docs clearly describe why it intentionally does not.
- **Validation:** `npm run test:ci --workspace @as-pect/core`, `npm run test:ci --workspace @as-pect/assembly`, and focused snapshot update review if fixture names change.

---

## Suggested first sequence

1. **E13-S1** — Do not run hooks for filtered-out tests.
2. **E13-S2** — Report todo-only groups and root-level todos correctly.
3. **E13-S3** — Use expectation negation in structured expected strings.

This sequence prioritizes confirmed core and assembly correctness bugs from the June 2026 scan before continuing architecture or dependency-removal work.
