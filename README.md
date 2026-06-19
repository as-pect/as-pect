# as-pect

`as-pect` is a test runner for AssemblyScript projects. It compiles AssemblyScript test entries to WebAssembly, runs them, reports results, and supports snapshots, coverage, WASI, and reporter output.

## Documentation

The canonical documentation lives in GitBook and is mirrored in this repository under [`docs/`](./docs/README.md):

- [Getting started](./docs/using/getting-started.md)
- [Writing tests](./docs/using/writing-tests.md)
- [Configuration](./docs/using/configuration.md)
- [CLI](./docs/using/cli.md)
- [Snapshots](./docs/using/snapshots.md)
- [Coverage](./docs/using/coverage.md)
- [Reporter overview](./docs/extending/reporter-overview.md)
- [Contributor workflow](./docs/maintaining/contributor-workflow.md)

Read the hosted docs at [as-pect.gitbook.io/as-pect](https://as-pect.gitbook.io/as-pect/).

## Quick start

```sh
npm install --save-dev @as-pect/cli assemblyscript
npx asp --init
npx asp --summary
```

`asp --init` creates the standard `as-pect.config.js`, `as-pect.asconfig.json`, and `assembly/__tests__/` starter files. See [Getting started](./docs/using/getting-started.md) for the full flow.

## Repository packages

This monorepo contains the CLI, AssemblyScript runtime, core Test suite/reporting model, snapshot package, transform package, shared reporter-output helper, and built-in file reporters.

For package boundaries, see [Package architecture](./docs/maintaining/package-architecture.md). For exact public types, see [Types overview](./docs/types/README.md).

## Development

```sh
npm install
npm test
npm run changeset
```

See [Contributor workflow](./docs/maintaining/contributor-workflow.md) and [Release process](./docs/maintaining/release-process.md) for maintainer details.

## Contributors

To contribute, see [CONTRIBUTING.md](./CONTRIBUTING.md).

Thanks to the AssemblyScript team and all `as-pect` contributors for making this project possible.
