# Contributor workflow

This page describes the expected flow for changing `as-pect` itself.

## Setup

Install dependencies from the repository root:

```sh
npm install
```

The repo uses npm workspaces. Run workspace scripts from the root when possible.

## Make focused changes

Keep changes atomic and reviewable. A good PR usually changes one behavior, one package boundary, or one docs topic at a time.

Follow the project philosophy:

- make testing AssemblyScript projects simple,
- reduce dependencies when practical,
- keep testing fast.

## Run checks

Useful root commands:

```sh
npm test
npm run tsc:all
npm run check
npm run lint
npm run format
```

Package-specific commands are available through npm workspaces, for example:

```sh
npm run test --workspace @as-pect/cli
npm run tsc:cli
```

## Update docs with code

Docs live under `docs/` and describe current `master`.

When changing code, check:

- public package exports -> update `docs/types/`,
- CLI behavior -> update CLI docs and reference,
- config behavior -> update config docs and reference,
- reporter behavior -> update Extending and Reporter reference,
- snapshot behavior -> update Snapshots and Snapshot lifecycle,
- package responsibilities -> update Maintaining docs and glossary.

See [Contributing to these docs](../contributing.md) for the full checklist.

## Add tests

Prefer tests that protect public behavior and package seams. For hard bugs, first reproduce the failure, then add a regression test.

Useful areas:

- CLI parsing and session planning in `@as-pect/cli`,
- Reporting lifecycle and Suite report facts in `@as-pect/core`,
- snapshot parsing/diff/update behavior in `@as-pect/snapshots`,
- reporter output contracts in reporter packages,
- transform behavior in `@as-pect/transform`.

## Changesets

If the change affects published packages, add a changeset:

```sh
npm run changeset
```

Skip changesets for docs-only changes unless the project release process requires one.

## Pull request checklist

Before opening or merging:

1. Tests pass.
2. TypeScript builds pass.
3. Formatting/checks pass.
4. Docs are updated.
5. Type reference pages reflect public export changes.
6. Package README changes do not duplicate detailed GitBook docs.
7. User-visible changes have a changeset.

## Next steps

- Understand packages in [Package architecture](package-architecture.md).
- Follow runtime flow in [Test session lifecycle](test-session-lifecycle.md).
- Learn release steps in [Release process](release-process.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
