# Agent TODO — active maintenance slices

Verified: June 12, 2026

Only valid positive work that needs to be done should exist in this file. In practice: keep this file limited to actionable, still-active improvement or repair work; remove completed, obsolete, speculative, or purely historical notes. Each slice is intended to be small, atomic, and reviewable on its own.

## Ground rules for agents

- Keep each slice focused; do not bundle unrelated reporter, snapshot, lifecycle, or benchmark changes.
- Prefer tests before fixes when the current behavior is unclear.
- Avoid new dependencies unless the slice explicitly justifies them. Benchmarks should use Node built-ins first.
- Run focused package tests for the package touched, then run broader validation when the slice changes shared behavior.

---

