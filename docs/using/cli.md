# CLI

The `asp` command runs `as-pect` Test sessions from the command line.

## Common commands

Initialize a project:

```sh
npx asp --init
```

Run tests with compact output:

```sh
npx asp --summary
```

Run tests with verbose output:

```sh
npx asp --verbose
```

Run and update snapshots:

```sh
npx asp --update-snapshots
```

Run specific entry globs:

```sh
npx asp "assembly/__tests__/math.spec.ts"
```

## Test and group filters

Use `--test` to run tests whose names match a regular expression:

```sh
npx asp --test "adds numbers"
```

Use `--group` to run groups whose names match a regular expression:

```sh
npx asp --group "math"
```

Both filters default to `(:?)`, which matches everything.

## Entry filtering

Use `--disclude` to remove discovered entry files whose paths match a regular expression:

```sh
npx asp --disclude "fixtures"
```

Configured `disclude` expressions in `as-pect.config.js` are applied too.

## Include files

Use `--include` for a comma-separated include glob list:

```sh
npx asp --include "assembly/__tests__/setup.include.ts,assembly/__tests__/helpers.include.ts"
```

If no include files are configured, `asp` defaults to:

```text
assembly/__tests__/**/*.include.ts
```

## Config paths

Use `--config` to select the `as-pect.config.js` file:

```sh
npx asp --config ./config/as-pect.config.js
```

Use `--as-config` to select the AssemblyScript compiler config:

```sh
npx asp --as-config ./config/as-pect.asconfig.json
```

## Reporter shortcuts

`asp` can combine multiple reporters in one run. If both `--summary` and `--verbose` are passed, summary output wins over verbose output.

```sh
npx asp --summary --json --junit
```

Useful shortcuts:

| Option | Output |
| --- | --- |
| `--summary` | Compact console reporter. Default when no reporter is selected. |
| `--verbose` | Verbose console reporter. |
| `--json` | Legacy as-pect JSON files. |
| `--csv` | CSV files. |
| `--junit` | JUnit XML files. |
| `--ctrf` | CTRF JSON files. |
| `--reporter <module>` | Custom reporter module or local path whose default export is an `IReporter` object. |

## Snapshots

Update snapshot files with:

```sh
npx asp --update-snapshots
```

Without this flag, `asp` compares actual snapshots to the expected snapshot file.

## Compiler artifacts

Write `.wasm` and `.wat` files next to each test entry:

```sh
npx asp --output-binary
```

Compile without running tests:

```sh
npx asp --no-run
```

`--no-run` also writes compiler artifacts.

## Memory options

Set the initial imported memory page count:

```sh
npx asp --memory-size 20
```

Set the maximum memory page count:

```sh
npx asp --memory-max 40
```

A WebAssembly memory page is 64 KiB. `--memory-max` must be greater than or equal to `--memory-size` when specified.

## Other useful options

```sh
npx asp --version
npx asp --show-stats
npx asp --no-logo
```

See [CLI reference](../reference/cli-reference.md) for the complete option table.

## Next steps

- Learn config files in [Configuration](configuration.md).
- Set up CI reporter output in [CI](ci.md).
- Review exact option defaults in [CLI reference](../reference/cli-reference.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
