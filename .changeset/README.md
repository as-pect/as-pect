# Changesets

This repository uses [Changesets](https://github.com/changesets/changesets) to version and publish the `@as-pect/*` packages.

## Common release flow

1. Run `npm run changeset` and describe the user-facing package changes.
2. Commit the generated markdown file in this directory with your code changes.
3. Merge to `master`.
4. The release workflow opens a version PR. Merge that PR to publish to npm.

Manual publish is also available with:

```sh
npm run version-packages
npm run release
```
