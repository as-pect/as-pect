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

## Active slices

No active maintenance slices are currently listed.
