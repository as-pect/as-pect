# Agent TODO — active maintenance slices

Verified: June 15, 2026

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

## Standard reporter references

Use these references when implementing standardized reporter output formats:

- **JUnit XML** is the highest-value CI interchange target. GitLab unit test reports require JUnit XML artifacts, and JUnit Platform's legacy XML output is compatible with the de facto JUnit 4 / Ant-style report format.
  - GitLab unit test reports: <https://docs.gitlab.com/ci/testing/unit_test_reports/>
  - JUnit Platform reporting: <https://docs.junit.org/6.0.0/advanced-topics/junit-platform-reporting.html>
- **CTRF JSON** is the JSON target. CTRF describes itself as an open, versioned JSON test report format with required root fields `reportFormat`, `specVersion`, and `results`; test entries require `name`, `status`, and `duration`.
  - CTRF overview: <https://ctrf.io/docs/specification/overview>
  - CTRF JSON schema: <https://ctrf.io/docs/full-schema>
  - CTRF test object: <https://ctrf.io/docs/specification/test>
- **CSV has no cross-tool test-result schema worth treating as standard.** Keep CSV as an as-pect-specific tabular export with an explicitly documented and compatibility-tested column contract.

---

## Epic: CLI correctness and Test session seams

### Slice 2 — Deepen project path resolution for the Test session

**Status:** Active
**Recommendation strength:** Strong
**Primary files:**

- `packages/cli/src/index.ts`
- `packages/cli/src/TestSession.ts`
- `packages/cli/src/TestSessionEntry.ts`
- `packages/cli/src/TestSessionEntries.ts`
- `packages/cli/src/collectReporter.ts`
- `packages/csv-reporter/index.ts`
- `packages/json-reporter/index.ts`

**Problem:** `TestSessionConfig` carries `cwd`, but several modules still consult ambient `process.cwd()` or pass through relative paths directly. Examples include reporter module resolution in `collectReporter.ts`, file output paths in CSV/JSON reporters, raw `asconfigLocation` compiler args, and glob behavior that depends on the caller's ambient current directory. This makes programmatic Test session usage hard to reason about and spreads project path rules across shallow modules.

**Desired behavior:**

- The Test session has one project path module/seam that owns path resolution rules.
- Programmatic callers can run a Test session for `cwd` without changing the Node process cwd.
- Reporter loading and reporter file output use explicit project path facts rather than ambient cwd.
- Compiler config paths, entry globs, include globs, snapshot paths, and artifact paths are resolved consistently.

**Suggested implementation plan:**

1. Add a small project path module in `packages/cli/src/` that accepts `cwd` and exposes named operations instead of raw `path.resolve` calls in callers.
2. Use that module in `index.ts` when loading `as-pect.config.js` and creating `TestSessionConfig`.
3. Pass resolved project path facts through Test session dependencies instead of having `collectReporter` call `process.cwd()`.
4. Decide whether CSV/JSON reporter output paths should be given by reporter options, report facts, or a file-output helper module from the reporter-output epic. If the latter, stop before crossing into reporter file output work and create a follow-up note.
5. Add tests that deliberately set `cwd` to a fake project path without `process.chdir`.
6. Update `CONTEXT.md` if the project path module becomes a named project concept.

**Tests to add or update first:**

- Programmatic `TestSession` with `cwd: "/workspace/project"` resolves config, entries, includes, and snapshots relative to that path without changing `process.cwd()`.
- Custom reporter resolution can be tested with an injected module resolver or explicit cwd; avoid global `process.chdir` in new tests.
- Output artifact paths for `--output-binary` remain stable.

**Validation:**

- `npm test --workspace @as-pect/cli`
- `npm run tsc:cli --workspace @as-pect/cli`
- If reporter packages are touched: `npm test --workspace @as-pect/csv-reporter` and `npm test --workspace @as-pect/json-reporter`.
- Run root `npm test` before merging because this seam crosses package behavior.

**Compatibility notes:** Preserve existing CLI behavior for normal shell users. The improvement is that non-CLI callers no longer need to mutate global cwd.

---

### Slice 4 — Collapse coverage setup into one Test session module

**Status:** Active
**Recommendation strength:** Speculative but accepted for future work
**Primary files:**

- `packages/cli/src/TestSession.ts`
- `packages/cli/src/TestSessionEntry.ts`
- `packages/cli/README.md`
- `README.md`

**Problem:** Coverage behavior is split across Test session logging, dynamic import of `@as-covers/glue`, compiler target selection, import installation, loader registration, and final report printing. `TestSession.ts` also currently logs both `Using code coverage:` and `Using coverage:` for the same configured coverage files.

**Desired behavior:**

- One coverage setup module owns the decision: disabled vs enabled.
- Coverage logging happens once.
- Test session entry receives a small prepared coverage adapter or null object.
- Compiler target selection (`coverage` vs `noCoverage`) is centralized with the coverage decision.
- Tests can substitute coverage behavior without importing `@as-covers/glue`.

**Suggested implementation plan:**

1. Add a focused test around coverage logging to lock in the desired single log line.
2. Extract a coverage setup module that takes `aspectConfig.coverage` and a logger/import hook.
3. Return a small object that exposes only what `TestSessionEntry` needs: target name, install imports, register loader, and stringify report.
4. Keep dynamic import lazy so projects without coverage do not pay the import cost.
5. Update docs if user-visible coverage logs or configuration wording changes.
6. Update `CONTEXT.md` if the coverage setup module becomes a named Test session concept.

**Tests to add or update first:**

- No coverage config: no dynamic import, compiler target `noCoverage`, no coverage report.
- Coverage config: one log line, compiler target `coverage`, install/register hooks invoked around wasm instantiation.
- Coverage stringify result still appears after the Test session.

**Validation:**

- `npm test --workspace @as-pect/cli`
- `npm run tsc:cli --workspace @as-pect/cli`
- Run `npm test --workspace @as-pect/assembly` if the coverage target wiring or init templates change.

**Compatibility notes:** Preserve the documented `aspectConfig.coverage` option and the `coverage` / `noCoverage` asconfig target names.

---

### Slice 5 — Normalize CLI shell output and exit behavior

**Status:** Active
**Recommendation strength:** Speculative but accepted for future work
**Primary files:**

- `packages/cli/src/index.ts`
- `packages/cli/src/CliProgram.ts`
- `packages/cli/src/asciiArt.ts`
- `packages/cli/src/init.ts`
- `packages/cli/__tests__/CliOptions.spec.ts`

**Problem:** CLI output and exit behavior are split across injected writers in `CliProgram`, injected writer support in `init`, direct `process.stdout.write` in `index.ts`, direct `console.error`, direct `process.exit`, and `console.log` in `asciiArt.ts`. Tests currently patch globals to observe output and exit behavior.

**Desired behavior:**

- A CLI shell module owns stdout, stderr, logo output, and exit decisions behind one interface.
- Tests can exercise CLI behavior without monkeypatching global process streams or `process.exit`.
- Existing command-line output remains stable unless a test explicitly documents an intentional change.

**Suggested implementation plan:**

1. Introduce an injected CLI shell/output adapter used by `asp`, `CliProgram`, `init`, and `printAsciiArt`.
2. Make `asp(argv, shell?)` or an equivalent seam possible without changing the public CLI binary behavior.
3. Return or throw structured exit facts in tests rather than calling `process.exit` directly under test.
4. Preserve `createCliProgram().exitOverride()` compatibility until a migration path is clear.
5. Update tests that currently spy on `process.stdout.write` and `process.exit` to use the shell seam.

**Tests to add or update first:**

- `--version` writes version output and returns/exits code 0 through the shell seam.
- Config load failure writes to stderr and exits code 1 through the shell seam.
- Logo output uses the configured writer and respects `--no-logo`.

**Validation:**

- `npm test --workspace @as-pect/cli`
- `npm run tsc:cli --workspace @as-pect/cli`

**Compatibility notes:** Keep CLI binary behavior stable for shell users. This is a testability/locality slice, not an output redesign.

---

## Epic: Reporter output formats and file-output locality

### Slice 7 — Add a JUnit XML reporter

**Status:** Active
**Recommendation strength:** Strong
**Primary files:**

- New reporter package, likely `packages/junit-reporter/`
- Root `package.json` workspace list
- Root and package `package-lock.json` updates if a package is added
- `packages/cli/src/collectReporter.ts`
- `packages/cli/src/CliProgram.ts`
- `packages/cli/__tests__/CliOptions.spec.ts`
- `README.md`
- `packages/cli/README.md`

**Problem:** as-pect lacks the de facto CI interchange format for test results. Many CI systems and test-management tools ingest JUnit XML; GitLab unit test reports require JUnit XML artifacts.

**Desired behavior:**

- Users can request a JUnit XML report from the CLI, for example `--junit` or `--reporter @as-pect/junit-reporter`.
- The output is compatible with the common JUnit XML subset used by CI systems.
- The reporter uses `SuiteReport` facts, not `TestContext` or `TestNode` internals.
- The reporter is file-backed and flush-safe.

**Suggested mapping:**

- Test session entry / `SuiteReport.fileName` → `<testsuite name="...">`.
- Test result → `<testcase classname="groupName" name="testName" time="seconds">`.
- Failed assertion → `<failure message="...">` with stack, actual, and expected text in the element body.
- Runtime/setup error → `<error message="...">`.
- Todo or not-run test → `<skipped>`.
- Logs and snapshot changes → `<system-out>` or `<properties>`; choose the smallest CI-compatible mapping and test it.
- Durations: convert as-pect milliseconds to JUnit seconds for `time` attributes.

**Suggested implementation plan:**

1. Add the package with no new XML dependency unless escaping becomes too error-prone. A tiny local XML escaper is likely enough.
2. Build the reporter from `SuiteReportEvent` / `SuiteReport` only.
3. Add CLI selection if built-in reporter flags are desired. If not, document package reporter usage through `--reporter`.
4. Reuse reporter file output if Slice 6 is complete; otherwise keep file-output code minimal and prepare it for later consolidation.
5. Add documentation with a GitLab CI example using `artifacts:reports:junit`.
6. Update `CONTEXT.md` with a project term for JUnit XML reporter/report if the package introduces one.

**Tests to add first:**

- Passing suite writes valid XML with testsuite/testcase counts.
- Failing test writes `<failure>` and escapes XML special characters.
- Suite-level errors write `<error>`.
- Todo and not-run tests write `<skipped>`.
- `onFlush` waits for the report file.
- CLI selection wires stdout/stderr and creates the expected file.

**Validation:**

- `npm test --workspace @as-pect/junit-reporter` if a package is added.
- `npm run tsc:all --workspace @as-pect/junit-reporter` if a package is added.
- `npm test --workspace @as-pect/cli` if CLI flags or reporter collection change.
- Root `npm run tsc:all` and `npm test` before merging because a workspace is added.

**Compatibility notes:** Additive feature. Do not change existing summary, verbose, JSON, or CSV reporter output in this slice.

---

### Slice 8 — Add CTRF JSON output as the standardized JSON reporter

**Status:** Active
**Recommendation strength:** Strong
**Primary files:**

- `packages/json-reporter/index.ts` and tests, or a new package such as `packages/ctrf-reporter/`
- `packages/cli/src/collectReporter.ts`
- `packages/cli/src/CliProgram.ts`
- `packages/cli/__tests__/CliOptions.spec.ts`
- `README.md`
- `packages/cli/README.md`

**Problem:** The existing JSON reporter is as-pect-specific and not standardized. CTRF is an active, versioned JSON test report format designed for cross-tool reporting. as-pect should support CTRF rather than inventing another JSON structure.

**Decision needed before coding:** Choose compatibility shape.

- **Option A:** Add a new `@as-pect/ctrf-reporter` package and keep `@as-pect/json-reporter` as legacy JSON.
- **Option B:** Add CTRF mode to `@as-pect/json-reporter` while preserving current legacy output behind an explicit option.
- **Option C:** Make `--json` emit CTRF only in the next major release and document migration. Do not do this in a minor/patch slice.

Prefer **Option A** unless a maintainer explicitly chooses a compatibility migration.

**Desired behavior:**

- Users can request CTRF JSON output from the CLI, for example `--ctrf` or `--reporter @as-pect/ctrf-reporter`.
- Output root includes `reportFormat: "CTRF"`, `specVersion`, and `results`.
- `results.tool.name` is `as-pect`.
- `results.summary` is derived from `SuiteReport` facts.
- Every test result includes required CTRF `name`, `status`, and `duration` fields.
- as-pect-specific facts live under CTRF `extra` objects rather than unknown top-level fields.

**Suggested mapping:**

- `SuiteReport.fileName` → test `filePath` if supported by current CTRF schema, otherwise `extra.asPect.fileName`.
- `SuiteTestReport.groupName` → CTRF `suite` hierarchy if supported, otherwise `extra.asPect.groupName`.
- Passing test → `status: "passed"`.
- Failing test → `status: "failed"`, with `message`, `trace`, `extra.asPect.actual`, and `extra.asPect.expected`.
- Todo → `status: "pending"` or `"skipped"`; choose one, document it, and test it. Prefer `pending` for declared todo work.
- Not-run filtered test → `status: "skipped"` if such tests appear in report facts.
- Snapshot changes, rtrace delta, negated tests, and reflected actual/expected values → `extra.asPect`.

**Suggested implementation plan:**

1. Add schema-oriented tests using the CTRF required fields and as-pect extras.
2. Avoid a runtime schema validation dependency unless it pays for itself. A fixture-based contract test can cover required structure.
3. If adding a package, update workspaces and package scripts.
4. If adding a CLI flag, keep `--json` legacy unless the release is explicitly a major compatibility migration.
5. Document how CTRF differs from the legacy JSON reporter and point users to CTRF docs.
6. Update `CONTEXT.md` with a project term for CTRF report/reporter if introduced.

**Tests to add first:**

- Minimal passing suite produces parseable CTRF JSON with required root/results/summary/test fields.
- Failed assertion includes message, trace, actual, expected in CTRF-compatible fields.
- Todo result maps to the chosen CTRF status.
- as-pect-only fields are nested under `extra.asPect`.
- `onFlush` waits for the file-backed report.

**Validation:**

- `npm test --workspace @as-pect/json-reporter` if modifying the existing package.
- `npm test --workspace @as-pect/ctrf-reporter` if adding a package.
- `npm test --workspace @as-pect/cli` if CLI collection changes.
- Root `npm run tsc:all` and `npm test` before merging if a package or CLI flag is added.

**Compatibility notes:** Do not silently replace existing `--json` output in a patch/minor change. Treat CTRF as additive unless a major-version migration is deliberately planned.

---


### Slice 10 — Preserve or explicitly migrate the legacy JSON reporter contract

**Status:** Active
**Recommendation strength:** Worth exploring
**Primary files:**

- `packages/json-reporter/index.ts`
- `packages/json-reporter/__tests__/JSONReporter.spec.ts`
- `packages/json-reporter/README.md` if added
- `README.md`
- `packages/cli/README.md`

**Problem:** Once CTRF JSON exists, the current JSON reporter needs an explicit status. Leaving both `--json` and CTRF undocumented would make the reporter interface confusing.

**Desired behavior:**

- Existing JSON output is either documented as `as-pect legacy JSON v1` or intentionally migrated in a major version.
- Users can distinguish legacy JSON from CTRF JSON by CLI flag/package name and documentation.
- Tests protect whichever compatibility decision is made.

**Suggested implementation plan:**

1. Complete or at least design Slice 8 first, because this slice depends on the CTRF compatibility decision.
2. If preserving legacy JSON, document the current array-of-result-objects shape and keep `--json` mapped to it.
3. If migrating, create a major-version migration note and tests showing old and new flags/modes.
4. Add package-level examples for passing, failing, and todo results.
5. Do not add schema dependencies for the legacy format; tests are the contract.

**Tests to add first:**

- Legacy JSON output shape remains parseable and stable for pass/fail/todo cases.
- CTRF output, if in the same package, is selected only by the explicit CTRF mode/flag.
- Documentation examples match generated output.

**Validation:**

- `npm test --workspace @as-pect/json-reporter`
- `npm run tsc:all --workspace @as-pect/json-reporter`
- `npm test --workspace @as-pect/cli` if CLI flags change.

**Compatibility notes:** This is a compatibility decision slice. Do not combine it with the initial CTRF implementation unless the review stays small and focused.
