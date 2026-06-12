# Agent TODO — active maintenance slices

Verified: June 12, 2026

Only valid positive work that needs to be done should exist in this file. In practice: keep this file limited to actionable, still-active improvement or repair work; remove completed, obsolete, speculative, or purely historical notes. Each slice is intended to be small, atomic, and reviewable on its own.

## Ground rules for agents

- Keep each slice focused; do not bundle unrelated reporter, snapshot, lifecycle, or benchmark changes.
- Prefer tests before fixes when the current behavior is unclear.
- Avoid new dependencies unless the slice explicitly justifies them. Benchmarks should use Node built-ins first.
- Run focused package tests for the package touched, then run broader validation when the slice changes shared behavior.

---

# 18. Add AssemblyScript reflection equality benchmarks

## Goal

Measure runtime cost for `Reflect.equals` before optimizing Set, Map, array, class, and cyclic equality paths.

## Blockers

- Slice 10 should be complete so Set reflection correctness is not confused with equality benchmarks.

## Files

- New benchmark fixtures under `packages/assembly/` or `packages/core/bench/assembly-reflect/`
- `packages/assembly/assembly/internal/Reflect.ts`

## Tasks

- [ ] Add benchmark cases for `Set<i32>` sizes 10, 100, and 1000.
- [ ] Add benchmark cases for `Map<string, i32>` sizes 10, 100, and 1000.
- [ ] Add benchmark cases for nested arrays, transformed classes, and cyclic classes.
- [ ] Keep benchmark compilation separate from normal tests.
- [ ] Record baseline numbers before proposing algorithm changes.

## Acceptance criteria

- [ ] Reflection equality benchmark command runs locally.
- [ ] Results identify Set, Map, array, class, and cyclic costs separately.
- [ ] No equality behavior changes in this benchmark-only slice.

---
