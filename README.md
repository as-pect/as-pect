# jtenner/as-pect

This package is a monorepo that contains the cli and the core for the `@as-pect` packages.

[![Test](https://github.com/jtenner/as-pect/actions/workflows/test.yml/badge.svg)](https://github.com/jtenner/as-pect/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/jtenner/as-pect/badge.svg?branch=master)](https://coveralls.io/github/jtenner/as-pect?branch=master)
[![Changesets](https://img.shields.io/badge/maintained%20with-changesets-176de3.svg)](https://github.com/changesets/changesets)

Write your module in AssemblyScript and get blazing fast bootstrapped tests
with WebAssembly speeds!

## Documentation

The [documentation is located at gitbook](https://as-pect.gitbook.io/as-pect/). If there are any issues with the docs, please feel free to file an issue!

## Development and publishing

This repository uses npm workspaces for local package linking and Changesets for versioning/publishing.

```sh
npm install
npm test
npm run changeset
```

To publish manually, run `npm run version-packages` followed by `npm run release`. The GitHub release workflow also creates Changesets version PRs and publishes merged release PRs with `NPM_TOKEN`.

## Contributors

To contribute please see [CONTRIBUTING.md](./CONTRIBUTING.md).

Thanks to [@willemneal](https://github.com/willemneal) and
[@MaxGraey](https://github.com/maxgraey) for all their support in making `as-pect` the
best software it can be.

Other Contributors:

- [@trusktr](https://github.com/trusktr) - Documentation Changes
- [@MaxGraey](https://github.com/maxgraey) - Performance API suggestions
- [@torch2424](https://github.com/torch2424) - Documentation Changes
- [@dcodeIO](https://github.com/dcodeIO) - Made AssemblyScript itself!
- [@9oelM](https://github.com/9oelM) - Misc functionalities

## Special Thanks

Special thanks to the [AssemblyScript](https://github.com/AssemblyScript/assemblyscript)
team for creating AssemblyScript itself.
