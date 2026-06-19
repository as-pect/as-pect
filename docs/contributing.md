# Contributing to these docs

These docs are intended to be edited as Markdown in this repository and synced to GitBook.

The public docs describe the current `master` branch. When code behavior changes on `master`, update these docs in the same pull request so GitBook stays aligned with the repository state.

The docs serve three audiences, separated into top-level tracks:

- **Using as-pect**: AssemblyScript developers using `as-pect` in their projects. This track is tutorial-first: each page should answer "what do I do next?" and link to reference pages for exhaustive details. Getting Started should use `asp --init` as the golden path, then include a minimal-first manual setup from scratch with links back to the full init templates.
- **Extending as-pect**: Reporter and integration authors extending `as-pect` output.
- **Maintaining as-pect**: Contributors and maintainers changing `as-pect` itself.

## Editing workflow

1. Edit files under `docs/`.
2. Update `SUMMARY.md` when adding, removing, or moving pages.
3. Put images and other static assets under `docs/assets/`.
4. Open a pull request so documentation changes can be reviewed with the related code changes.

## GitBook sync

Configure GitBook Git Sync with this repository and use `docs/` as the project directory. The GitBook content configuration lives in `docs/.gitbook.yaml`.

## Self-contained docs

The GitBook docs should be self-contained under `docs/`. Rendered docs pages should not require relative links to files outside `docs/`. When a page needs to reference canonical templates, source code, or maintainer-only implementation details, link to the file on GitHub or summarize the relevant public behavior in the docs.

## Package README relationship

Package READMEs should be short landing pages. They may include a package summary, install snippet, one or two package-specific examples, and links into GitBook. Detailed user, extension, and maintainer documentation belongs under `docs/` as the canonical docs source.

## Types reference

The `docs/types/` section groups public type surfaces by package. Update it manually for now whenever exported package types or AssemblyScript ambient declarations change. When changing any package, check that package's public exports and update the corresponding type reference page in the same pull request. Keep the types section focused on public package entry points plus supporting types that appear in public signatures, rather than every internal source helper.

## Documentation checklist

When changing code, update docs in the same pull request when any of these are true:

- **A public package export or AssemblyScript ambient declaration changed.** Check the package entry point and update the matching page under `docs/types/`.
- **CLI behavior changed.** Update `docs/using/cli.md` and `docs/reference/cli-reference.md`.
- **Configuration behavior changed.** Update `docs/using/configuration.md` and `docs/reference/config-reference.md`.
- **The init template changed.** Update `docs/using/getting-started.md` and any source links or manual setup examples that mirror the template.
- **Assertion behavior changed.** Update `docs/using/writing-tests.md` and `docs/reference/assertion-reference.md`.
- **Snapshot behavior changed.** Update `docs/using/snapshots.md` and `docs/maintaining/snapshot-lifecycle.md`.
- **Coverage behavior changed.** Update `docs/using/coverage.md` and `docs/using/configuration.md`.
- **Reporter behavior changed.** Update the relevant `docs/extending/` page and `docs/reference/reporter-reference.md`.
- **Package responsibilities or internals changed.** Update the relevant `docs/maintaining/` page and the [Glossary](reference/glossary.md) if terms changed.

Before opening a PR, check:

1. New pages are linked from `SUMMARY.md`.
2. Rendered pages include the Ko-fi support button near the bottom.
3. Links that point outside `docs/` use GitHub URLs instead of relative paths.
4. Tutorial pages include a clear next step.
5. Package READMEs remain short and link into the GitBook instead of duplicating detailed docs.

## Support button

Every rendered docs page should include the Ko-fi support button near the bottom of the page:

```md
---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
