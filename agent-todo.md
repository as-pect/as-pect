# Agent TODO — active maintenance slices

Verified: June 12, 2026

Only valid positive work that needs to be done should exist in this file. In practice: keep this file limited to actionable, still-active improvement or repair work; remove completed, obsolete, speculative, or purely historical notes. Each slice is intended to be small, atomic, and reviewable on its own.

## Ground rules for agents

- Keep each slice focused; do not bundle unrelated reporter, snapshot, lifecycle, or benchmark changes.
- Prefer tests before fixes when the current behavior is unclear.
- Avoid new dependencies unless the slice explicitly justifies them. Benchmarks should use Node built-ins first.
- Run focused package tests for the package touched, then run broader validation when the slice changes shared behavior.

---

# 17. Add core benchmarks for reporting and reflected-value stringify

## Goal

Create actual performance measurements for hot core paths before attempting optimizations.

## Blockers

- Slice 15 should be complete or at least provide stable `SuiteReport` fixture builders.

## Files

- New benchmark files under `packages/core/bench/`
- Root `package.json` or `packages/core/package.json`
- `packages/core/src/reporter/ReportingLifecycle.ts`
- `packages/core/src/util/stringifyReflectedValue.ts`

## Tasks

- [ ] Implement a small benchmark runner with `node:perf_hooks`; do not add a benchmark dependency.
- [ ] Add reporting benchmarks for large flat suites, nested suites, many todos, and many logs.
- [ ] Add stringify benchmarks for large arrays, nested classes, cyclic structures, maps/sets, and property-count limits.
- [ ] Print stable machine-readable results.
- [ ] Add an npm script that runs only core benchmarks.

## Acceptance criteria

- [ ] Core benchmark command runs locally without extra dependencies.
- [ ] Reporting and stringify costs are measured separately.
- [ ] Benchmark files do not alter package runtime behavior.

---

# 18. Add AssemblyScript reflection equality benchmarks

## Goal

Measure runtime cost for `Reflect.equals` before optimizing Set, Map, array, class, and cyclic equality paths.

## Blockers

- Slice 10 should be complete so Set reflection correctness is not confused with equality benchmarks.
- Slice 17 may provide a reusable benchmark script pattern, but this slice can proceed independently if needed.

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
