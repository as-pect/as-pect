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

### Slice 2C — Decide reporter file-output project path ownership

**Status:** Active
**Recommendation strength:** Strong
**Primary files:**

- `packages/cli/src/TestSession.ts`
- `packages/cli/src/TestSessionEntry.ts`
- `packages/reporter-output/src/index.ts`
- `packages/csv-reporter/index.ts`
- `packages/json-reporter/index.ts`
- `packages/junit-reporter/index.ts`

**Problem:** File-backed reporters write artifacts next to report file names, but the project path ownership between CLI options, Suite report facts, and `@as-pect/reporter-output` is still implicit.

**Desired behavior:**

- Decide whether file-backed reporters receive resolved output locations from reporter options, Suite report facts, or the shared reporter-output helper.
- Keep CSV/JSON/JUnit output compatibility unless a separate compatibility migration explicitly says otherwise.
- Add focused tests around reporter artifact paths once the ownership boundary is chosen.

**Validation:**

- Reporter package tests for touched reporters.
- `npm test --workspace @as-pect/cli` if Test session wiring changes.
- Root `npm run tsc:all` and `npm test` if shared reporter-output behavior changes.

---


## Epic: Reporter output formats and file-output locality

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
