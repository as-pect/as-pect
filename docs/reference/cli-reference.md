# CLI reference

The `asp` command runs `as-pect` Test sessions. The CLI package also installs `aspect` as an alias for the same command.

## Usage

```sh
asp [options] [entry globs...]
```

Positional arguments are test entry globs. They are combined with `entries` from `as-pect.config.js`.

## Value options

| Option | Default | Description |
| --- | --- | --- |
| `-c, --config <config_location>` | `./as-pect.config.js` | Location of the `as-pect.config.js` file. |
| `-a, --as-config <asconfig_location>` | `./as-pect.asconfig.json` | Location of the AssemblyScript compiler config used by tests. |
| `--memory-size <pages>` | `10` | Initial imported WebAssembly memory size in 64 KiB pages. |
| `--memory-max <pages>` | `-1` | Maximum imported WebAssembly memory size in pages. `-1` means no maximum is specified. |
| `-t, --test <regex>` | `(:?)` | Run tests whose names match the regex. |
| `-g, --group <regex>` | `(:?)` | Run groups whose names match the regex. |
| `-d, --disclude <regex>` | none | Exclude discovered test entries whose paths match the regex. |
| `-i, --include <globs>` | effective default: `assembly/__tests__/**/*.include.ts` when no include is configured | Comma-separated include globs compiled with each test entry. |
| `--reporter <reporter>` | none | Custom reporter local path, file URL, or package module whose default export is an `IReporter` object. |

## Boolean options

| Option | Default | Description |
| --- | --- | --- |
| `-v, --version` | `false` | Print the as-pect version and exit. |
| `-h, --help` | `false` | Print help and exit. |
| `--init` | `false` | Initialize standard test project files. |
| `-o, --output-binary` | `false` | Write `.wasm` and `.wat` files for each test entry. |
| `-u, --update-snapshots` | `false` | Update snapshot files. |
| `--summary` | `false` | Use the summary reporter. Default if no reporter is selected. |
| `--verbose` | `false` | Use the verbose reporter. |
| `--csv` | `false` | Write CSV reporter files. |
| `--json` | `false` | Write legacy JSON reporter files. |
| `--junit` | `false` | Write JUnit XML reporter files. |
| `--ctrf` | `false` | Write CTRF JSON reporter files. |
| `-s, --show-stats` | `false` | Print compiler stats between compilations. |
| `-n, --no-logo` | logo enabled | Disable the logo. |
| `--no-run` | run enabled | Compile and write artifacts without running tests. |

## Option parsing details

Long value options accept `--option value` and `--option=value` forms. Short value options accept both separated and compact forms, such as `-t adds` and `-tadds`.

Unknown options fail immediately. Value options fail when the next token is missing or looks like another option.

## Exit behavior

`asp` exits with a failing status when:

- config loading throws,
- compilation fails,
- compiler output is missing or invalid,
- any executed suite fails.

`--help`, `--init`, and `--version` exit successfully after completing their action.

## Reporter combination

Multiple reporter flags can be used together:

```sh
asp --summary --junit --ctrf
```

Selected reporters are combined into one reporter pipeline. If both `--summary` and `--verbose` are passed, summary output is selected before verbose output.

## Memory validation

`--memory-size` and `--memory-max` must be integer page counts. `--memory-size` must be non-negative. `--memory-max` may be `-1` for unspecified; otherwise it must be greater than or equal to `--memory-size`.

## Related pages

- [CLI guide](../using/cli.md)
- [Configuration](../using/configuration.md)
- [Built-in reporters](../extending/built-in-reporters.md)

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
