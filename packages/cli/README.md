# @as-pect/cli

Command-line runner for `as-pect` AssemblyScript Test sessions.

## Install

```sh
npm install --save-dev @as-pect/cli assemblyscript
```

## Common commands

```sh
npx asp --init
npx asp --summary
npx asp --verbose
npx asp --update-snapshots
```

The package also installs `aspect` as an alias for `asp`.

## What this package owns

`@as-pect/cli` loads `as-pect.config.js`, plans Test session entries, invokes AssemblyScript with `as-pect.asconfig.json`, manages snapshots and coverage setup, wires reporters, and exits with a failing status when compilation or executed suites fail.

## Documentation

Detailed behavior belongs in the GitBook docs:

- [Getting started](../../docs/using/getting-started.md)
- [CLI guide](../../docs/using/cli.md)
- [CLI reference](../../docs/reference/cli-reference.md)
- [Configuration](../../docs/using/configuration.md)
- [Coverage](../../docs/using/coverage.md)
- [Built-in reporters](../../docs/extending/built-in-reporters.md)
- [`@as-pect/cli` types](../../docs/types/cli.md)

Hosted docs: [as-pect.gitbook.io/as-pect](https://as-pect.gitbook.io/as-pect/).
