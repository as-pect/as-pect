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

### Slice E5-S4 — Route CLI snapshot writes through Snapshot lifecycle facts

- **Epic:** E5
- **Scope:** As part of E1 extraction, ensure CLI snapshot writes use `SnapshotLifecycle.updatePlan` and stats rather than duplicating diff rules.
- **Files:** `packages/cli/src/TestSession.ts`, possible E1 snapshot module
- **Tests to add/update:** CLI compare/update snapshot tests
- **Done when:** CLI snapshot handling delegates all pass/fail/update decisions to Snapshot lifecycle.
- **Validation:** focused CLI and snapshots package tests.

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

### Slice E7-S1 — Introduce Biome validation beside existing tools

- **Epic:** E7
- **Scope:** Add the Biome dev dependency and configuration that captures the repository's current generated-file ignores and formatting/static-check expectations without removing ESLint or Prettier yet.
- **Files:** `package.json`, `package-lock.json`, Biome configuration file, `.prettierignore`, `eslint.config.mjs`
- **Tests to add/update:** none
- **Done when:** Biome can run as an explicit validation command and does not report generated artifacts or intentionally ignored AssemblyScript runtime files.
- **Validation:** Biome check command plus `npm run tsc:all` if configuration touches TypeScript source inclusion.

### Slice E7-S2 — Move active check scripts to Biome

- **Epic:** E7
- **Scope:** Replace active root formatting/lint scripts with Biome-backed commands while preserving clear commands for formatting and static checking.
- **Files:** `package.json`, package docs or validation docs if they mention `npm run check`, Biome configuration file
- **Tests to add/update:** none
- **Done when:** `npm run check` and the documented formatting command no longer call ESLint or Prettier.
- **Validation:** `npm run check`, package typechecks, and focused package tests for any changed source formatting.

### Slice E7-S3 — Remove ESLint and Prettier toolchain files and dependencies

- **Epic:** E7
- **Scope:** Delete obsolete ESLint/Prettier config files and remove the direct ESLint, TypeScript-ESLint, globals, and Prettier dependencies after replacement commands are active.
- **Files:** `package.json`, `package-lock.json`, `eslint.config.mjs`, `.prettierrc.cjs`, `.prettierignore`, validation docs
- **Tests to add/update:** none
- **Done when:** no active script or checked-in config requires ESLint or Prettier packages, and replacement validation is documented.
- **Validation:** `npm run check`, `npm run tsc:all`, and focused tests for packages whose formatting changed.

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

### Slice E9-S1 — Replace package clean scripts with a local clean helper

- **Epic:** E9
- **Scope:** Add or reuse a small Node cleanup helper based on built-in `fs.rm`, then update package clean scripts that currently invoke `rimraf`.
- **Files:** root `package.json`, package `package.json` files, optional `scripts/` helper
- **Tests to add/update:** helper tests if the cleanup helper has non-trivial path handling
- **Done when:** package clean/build scripts no longer shell out to the `rimraf` binary.
- **Validation:** run the touched package build/typecheck commands that include cleanup.

### Slice E9-S2 — Remove the rimraf dependency after clean scripts migrate

- **Epic:** E9
- **Scope:** Remove the direct `rimraf` dependency from the root workspace once no package script references it.
- **Files:** `package.json`, `package-lock.json`
- **Tests to add/update:** none
- **Done when:** `npm ls rimraf` only shows transitive dependencies, if any, and no checked-in script invokes `rimraf`.
- **Validation:** `npm run tsc:all` and focused package build/typecheck commands touched by E9-S1.

---

## Epic E10 — Remove npm-run-all2

**Goal:** Remove `npm-run-all2` by replacing `run-s` and `run-p` script orchestration with npm-native sequencing, shell-free Node helpers, or package-specific scripts.

**Primary files:**

- root `package.json`
- package scripts under `packages/*/package.json`
- optional local script runner under `scripts/`

**Done when:** `npm-run-all2` is no longer a direct dependency, no script invokes `run-s` or `run-p`, and existing build/test workflows still have clear commands.

**Validation:** `npm test`, `npm run tsc:all`, and focused package commands touched by the migration.

### Slice E10-S1 — Replace root run-s orchestration

- **Epic:** E10
- **Scope:** Rewrite root scripts that use `run-s` into npm-native sequencing or a small local Node runner while preserving the order of typecheck, test, and release workflows.
- **Files:** root `package.json`, optional `scripts/` helper, validation docs if command names change
- **Tests to add/update:** helper tests if a local runner has branching or failure aggregation logic
- **Done when:** root scripts no longer invoke `run-s` and still expose clear `test`, `test:ci`, `tsc:all`, `check`, and `release` commands.
- **Validation:** `npm run tsc:all`, `npm test`, and dry-run or documented validation for release sequencing.

### Slice E10-S2 — Replace package-level run-s/run-p orchestration

- **Epic:** E10
- **Scope:** Rewrite package scripts that use `run-s` or `run-p`, especially core AssemblyScript fixture compilation and package clean/typecheck flows.
- **Files:** package `package.json` files, optional `scripts/` helper
- **Tests to add/update:** helper tests if a local runner owns parallel execution or failure aggregation
- **Done when:** package scripts no longer invoke `run-s` or `run-p`.
- **Validation:** focused package `tsc:all`, core fixture compilation, and relevant package tests.

### Slice E10-S3 — Remove npm-run-all2 after scripts migrate

- **Epic:** E10
- **Scope:** Remove `npm-run-all2` from direct dependencies once root and package scripts no longer reference `run-s` or `run-p`.
- **Files:** `package.json`, `package-lock.json`
- **Tests to add/update:** none
- **Done when:** no checked-in script invokes `run-s` or `run-p`, and `npm-run-all2` is no longer a direct dependency.
- **Validation:** `npm run tsc:all` and `npm test`.

---

## Epic E11 — Remove Chevrotain

**Goal:** Remove `chevrotain` from the snapshots package by replacing the snapshot parser with a small local parser tailored to as-pect snapshot syntax.

**Primary files:**

- `packages/snapshots/src/Snapshot.ts`
- `packages/snapshots/__tests__/snapshot.spec.ts`
- snapshot fixtures under `packages/snapshots/__tests__/__snapshots__/`

**Done when:** `chevrotain` is no longer a direct dependency, snapshot parsing/stringifying behavior remains compatible, and parse errors remain useful for callers.

**Validation:** focused snapshots package tests, core snapshot/reporting tests, and CLI snapshot tests.

### Slice E11-S1 — Characterize snapshot parser compatibility

- **Epic:** E11
- **Scope:** Add focused snapshots package tests for the accepted snapshot syntax, stringify round-trips, duplicate keys, escaped content, and current parse error facts before replacing the parser.
- **Files:** `packages/snapshots/__tests__/snapshot.spec.ts`, snapshot fixtures
- **Tests to add/update:** snapshots parser characterization tests
- **Done when:** parser compatibility and parse error expectations are explicit enough to guide a local parser replacement.
- **Validation:** `npm test --workspace @as-pect/snapshots`.

### Slice E11-S2 — Replace Chevrotain parser with a local parser

- **Epic:** E11
- **Scope:** Implement a small parser tailored to as-pect snapshot files and remove the generated Chevrotain grammar path.
- **Files:** `packages/snapshots/src/Snapshot.ts`, parser modules under `packages/snapshots/src/`, snapshot fixtures
- **Tests to add/update:** update parser tests only for intentional compatibility-preserving error message changes
- **Done when:** snapshots parse/stringify behavior remains compatible without importing Chevrotain at runtime.
- **Validation:** snapshots, core snapshot/reporting, and CLI snapshot tests.

### Slice E11-S3 — Remove Chevrotain dependency after parser replacement

- **Epic:** E11
- **Scope:** Remove the direct Chevrotain dependency and any obsolete parser generation artifacts once the local parser is active.
- **Files:** `packages/snapshots/package.json`, `package-lock.json`, obsolete parser files
- **Tests to add/update:** none
- **Done when:** no checked-in source imports Chevrotain and package metadata no longer declares it directly.
- **Validation:** snapshots package tests plus core and CLI snapshot tests.

---

## Epic E12 — Remove Commander

**Goal:** Remove `commander` from the CLI by replacing option parsing with a small local parser that supports the documented `asp`/`aspect` command surface.

**Primary files:**

- `packages/cli/src/index.ts`
- `packages/cli/__tests__/CliOptions.spec.ts`
- CLI README/help documentation if present

**Done when:** `commander` is no longer a direct dependency, CLI parsing behavior is covered by tests, and help/version/error output remains acceptable for users.

**Validation:** focused CLI option tests and smoke tests for common `asp` invocations.

### Slice E12-S1 — Characterize CLI option parsing behavior

- **Epic:** E12
- **Scope:** Add focused tests for documented `asp`/`aspect` options, config path handling, help/version output, invalid option errors, and common positional arguments before replacing Commander.
- **Files:** `packages/cli/src/index.ts`, `packages/cli/__tests__/CliOptions.spec.ts`, CLI README/help documentation if present
- **Tests to add/update:** CLI option characterization tests
- **Done when:** the supported command surface is explicit enough to guide a local parser replacement.
- **Validation:** focused CLI option tests.

### Slice E12-S2 — Replace Commander with a local option parser

- **Epic:** E12
- **Scope:** Implement a small parser for the documented CLI surface and route existing command setup through it without changing supported user-facing options intentionally.
- **Files:** `packages/cli/src/index.ts`, optional local parser module, CLI tests and docs
- **Tests to add/update:** update CLI option tests for any intentionally clarified error text
- **Done when:** CLI parsing behavior remains covered and source no longer imports Commander.
- **Validation:** focused CLI option tests and smoke tests for common `asp` invocations.

### Slice E12-S3 — Remove Commander dependency after parser replacement

- **Epic:** E12
- **Scope:** Remove the direct Commander dependency once the local parser is active.
- **Files:** `packages/cli/package.json`, `package-lock.json`
- **Tests to add/update:** none
- **Done when:** package metadata no longer declares Commander directly and no checked-in source imports it.
- **Validation:** focused CLI option tests and CLI smoke tests.

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

---

## Suggested first sequence

1. **E5-S4** — Route CLI snapshot writes through Snapshot lifecycle facts.
2. **E7-S1** — Introduce Biome validation beside existing tools.
3. **E7-S2** — Move active check scripts to Biome.
4. **E7-S3** — Remove ESLint and Prettier toolchain files and dependencies.

This sequence keeps the Snapshot lifecycle integration first while making the Biome migration reviewable in smaller steps.
