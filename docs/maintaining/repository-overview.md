# Repository overview

`as-pect` is an npm-workspaces monorepo for AssemblyScript testing packages.

## Top-level layout

```text
packages/
  assembly/
  cli/
  core/
  csv-reporter/
  ctrf-reporter/
  json-reporter/
  junit-reporter/
  reporter-output/
  snapshots/
  transform/
scripts/
docs/
```

## Workspace packages

| Package | Responsibility |
| --- | --- |
| `@as-pect/cli` | The `asp` command, Test session orchestration, config loading, compiler invocation, snapshots, coverage, WASI, reporters, and init template. |
| `@as-pect/core` | Test suite runtime host, Test tree, Reporting lifecycle, Suite report facts, built-in console reporters, reporter contracts. |
| `@as-pect/assembly` | AssemblyScript-side test API and runtime imports used by test files. |
| `@as-pect/transform` | AssemblyScript transform that generates class reflection helpers for strict equality and reflected output. |
| `@as-pect/snapshots` | Snapshot parsing, diffing, lifecycle stats, and update planning. |
| `@as-pect/reporter-output` | Shared file output helper for reporters. |
| `@as-pect/json-reporter` | Legacy as-pect JSON v1 file reporter. |
| `@as-pect/csv-reporter` | as-pect CSV v1 file reporter. |
| `@as-pect/junit-reporter` | JUnit XML file reporter. |
| `@as-pect/ctrf-reporter` | CTRF JSON file reporter. |

## Common commands

Install dependencies:

```sh
npm install
```

Run all checks/tests:

```sh
npm test
```

Run TypeScript builds:

```sh
npm run tsc:all
```

Format and lint:

```sh
npm run format
npm run lint
npm run check
```

Create a changeset:

```sh
npm run changeset
```

## Docs source

GitBook docs live under `docs/`. They describe current `master` and should be updated in the same PR as code changes.

When public exports change, update `docs/types/`.

## Next steps

- Learn package boundaries in [Package architecture](package-architecture.md).
- Learn the session flow in [Test session lifecycle](test-session-lifecycle.md).
- Learn the contributor process in [Contributor workflow](contributor-workflow.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
