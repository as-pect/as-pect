# Validation baseline

Verified: June 12, 2026

This file records the repository-wide validation baseline for maintenance slices that need to distinguish pre-existing behavior from newly introduced failures.

## Environment

- Node.js: `v26.3.0`
- npm: `11.16.0`
- Package manager declared by the repo: `npm@11.16.0`

## Working tree check

Before implementation work for this baseline slice, `git status --short` showed only the deliberate `agent-todo.md` in-progress marker as a tracked change. A pre-existing untracked `.pi/reports/architecture-review-20260611-144134.html` file was present and was not modified or included in this baseline.

## Typechecking

Command:

```sh
npm run tsc:all
```

Result: passed.

Package coverage from the root script:

- `@as-pect/assembly`: `tsc:all` is currently `exit 0`.
- `@as-pect/snapshots`: TypeScript compilation passed.
- `@as-pect/transform`: TypeScript compilation passed.
- `@as-pect/core`: cleaned `lib`, TypeScript compilation passed, and all AssemblyScript pretest wasm fixtures compiled.
- `@as-pect/csv-reporter`: TypeScript compilation passed.
- `@as-pect/json-reporter`: TypeScript compilation passed.
- `@as-pect/cli`: cleaned `lib` and TypeScript compilation passed.

Non-failing diagnostics observed during `@as-pect/core` AssemblyScript fixture compilation:

- `INFO AS210: Expression is never 'null'.` in `packages/core/assembly/jest-pass-fail.ts` for three `reference!` property accesses on line 17.
- `INFO AS210: Expression is never 'null'.` in `packages/core/assembly/jest-log.ts` for three `reference!` property accesses on line 16.

## Full test suite

Command:

```sh
npm test
```

Result: passed.

Package-level results observed from the root workspace test run:

- `@as-pect/assembly`: pass; 358 / 358 tests, 79 / 79 groups, 6 / 6 snapshots.
- `@as-pect/snapshots`: pass; 1 / 1 Jest suite, 6 / 6 tests, 3 / 3 Jest snapshots.
- `@as-pect/core`: pass; 17 / 17 Jest suites, 24 / 24 tests, 743 / 743 Jest snapshots.
- `@as-pect/csv-reporter`: test script is currently `exit 0`; no assertions are run.
- `@as-pect/json-reporter`: test script is currently `exit 0`; no assertions are run.
- `@as-pect/cli`: pass; 2 / 2 Jest suites, 19 / 19 tests.
- `@as-pect/transform`: no `test` script is currently defined, so it is skipped by the root `--if-present` workspace test command.

Non-failing diagnostics and known noisy output observed during the full suite:

- Node emitted `ExperimentalWarning` messages for `--experimental-vm-modules` and `--experimental-wasi-unstable-preview1` / WASI in Jest-backed packages.
- `packages/core/__tests__/SummaryReporter.snapshot.spec.ts` logged `A change occurred` three times from `SummaryReporter.ts`; this matches active maintenance slice 4.
- `packages/core/__tests__/TestContext.log.spec.ts` logged `[]` once from the test itself.
