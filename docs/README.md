# as-pect

`as-pect` is a test runner for AssemblyScript projects. It compiles AssemblyScript test entries to WebAssembly, runs them, reports results, and handles snapshots, coverage, and reporter output.

These docs describe the current `master` branch.

## Choose your path

### I want to test an AssemblyScript project

Start here if you are adding `as-pect` to an application or library.

1. [Getting started](using/getting-started.md)
2. [Writing tests](using/writing-tests.md)
3. [Configuration](using/configuration.md)
4. [CLI](using/cli.md)
5. [Snapshots](using/snapshots.md)
6. [Coverage](using/coverage.md)
7. [CI](using/ci.md)
8. [Troubleshooting](using/troubleshooting.md)

### I want to extend as-pect

Start here if you are writing a reporter, output integration, or tool that consumes `as-pect` results.

1. [Reporter overview](extending/reporter-overview.md)
2. [Reporter API](extending/reporter-api.md)
3. [Built-in reporters](extending/built-in-reporters.md)
4. [Custom reporters](extending/custom-reporters.md)
5. [Output files](extending/output-files.md)
6. [Legacy reporter compatibility](extending/legacy-reporter-compatibility.md)

### I want to contribute to as-pect

Start here if you are changing the `as-pect` repository itself.

1. [Repository overview](maintaining/repository-overview.md)
2. [Package architecture](maintaining/package-architecture.md)
3. [Test session lifecycle](maintaining/test-session-lifecycle.md)
4. [Reporting lifecycle](maintaining/reporting-lifecycle.md)
5. [Snapshot lifecycle](maintaining/snapshot-lifecycle.md)
6. [Release process](maintaining/release-process.md)
7. [Contributor workflow](maintaining/contributor-workflow.md)

## References

Use the reference pages when you need exact allowed values, exported types, or stable contracts.

- [CLI reference](reference/cli-reference.md)
- [Config reference](reference/config-reference.md)
- [Assertion reference](reference/assertion-reference.md)
- [Reporter reference](reference/reporter-reference.md)
- [Types overview](types/README.md)
- [Glossary](reference/glossary.md)

## Documentation principles

These docs are organized into three tracks:

- **Using as-pect** is tutorial-first and should help a user reach a passing test quickly.
- **Extending as-pect** explains the public seams for reporters and integrations.
- **Maintaining as-pect** explains repository internals for contributors.

Package READMEs are short landing pages. This GitBook is the canonical place for detailed user, extension, and maintainer documentation.

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
