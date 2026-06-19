# Release process

`as-pect` uses npm workspaces and Changesets for package versioning and publishing.

## Before releasing

Run the normal validation flow:

```sh
npm install
npm test
npm run tsc:all
npm run check
```

Make sure docs are updated for user-visible behavior, public exports, CLI changes, reporter contracts, and config changes.

## Changesets

When a change affects published packages, add a changeset:

```sh
npm run changeset
```

A good changeset explains:

- which package changed,
- whether the change is patch/minor/major,
- what users need to know.

## Versioning packages

To apply pending changesets locally:

```sh
npm run version-packages
```

This updates package versions and changelogs.

## Publishing packages

To publish manually:

```sh
npm run release
```

The release script runs TypeScript builds before publishing through Changesets.

## GitHub release workflow

The repository's release workflow creates Changesets version PRs and publishes merged release PRs with `NPM_TOKEN`.

## Docs expectations

Docs describe current `master`, not only the latest published npm release. That means feature PRs should update docs at the same time as code.

Release-related docs checks:

- package README remains a short landing page,
- GitBook docs under `docs/` contain detailed behavior,
- `docs/types/` is updated when public exports change,
- migration notes exist for breaking behavior,
- examples match current init templates and CLI behavior.

## Next steps

- Learn local development in [Contributor workflow](contributor-workflow.md).
- Learn package boundaries in [Package architecture](package-architecture.md).
- Review documentation rules in [Contributing to these docs](../contributing.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
