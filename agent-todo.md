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

### Slice E13-S1 — Characterize one core reporting correctness bug

- **Epic:** E13
- **Scope:** Reproduce one confirmed bug-scan issue in `SuiteReportFactory`, `VerboseReporter`, or `SummaryReporter` with a focused semantic test before changing behavior. If the issue cannot be reproduced from the current code, refine or remove this slice instead of making speculative fixes.
- **Files:** `packages/core/src/reporter/SuiteReportFactory.ts`, `packages/core/src/reporter/VerboseReporter.ts`, `packages/core/src/reporter/SummaryReporter.ts`, core reporter tests
- **Tests to add/update:** one focused regression test for the reproduced reporter behavior.
- **Done when:** the bug is captured by a failing test or the slice is documented as obsolete with evidence.
- **Validation:** focused core reporter test plus `npm run tsc --workspace @as-pect/core`.

### Slice E13-S2 — Fix the characterized core reporting correctness bug

- **Epic:** E13
- **Scope:** Implement the smallest fix for the bug characterized by E13-S1 without changing unrelated reporter output contracts.
- **Files:** `packages/core/src/reporter/SuiteReportFactory.ts`, `packages/core/src/reporter/VerboseReporter.ts`, `packages/core/src/reporter/SummaryReporter.ts`, core reporter tests
- **Tests to add/update:** keep the E13-S1 regression test passing; add only behavior-focused coverage needed for the fix boundary.
- **Done when:** the characterized reporter correctness regression is fixed and reporter behavior remains compatible elsewhere.
- **Validation:** focused core reporter test, `npm run test:ci --workspace @as-pect/core`, and `npm run tsc --workspace @as-pect/core`.

### Slice E13-S3 — Characterize and fix one reflected-value correctness bug

- **Epic:** E13
- **Scope:** Reproduce one confirmed bug-scan issue in `stringifyReflectedValue` or reflected-value handling, then make the smallest compatible fix.
- **Files:** `packages/core/src/util/stringifyReflectedValue.ts`, core reflected-value tests, relevant AssemblyScript fixture if needed
- **Tests to add/update:** one focused regression test that describes the reflected-value behavior through a public or semantic seam.
- **Done when:** the reflected-value bug is fixed or the slice is removed/refined because the issue no longer reproduces.
- **Validation:** focused reflected-value/core test plus `npm run tsc --workspace @as-pect/core`.

---

## Suggested first sequence

1. **E13-S1** — Characterize one core reporting correctness bug.
2. **E13-S2** — Fix the characterized core reporting correctness bug.
3. **E13-S3** — Characterize and fix one reflected-value correctness bug.

This sequence keeps correctness repairs focused and reviewable.
