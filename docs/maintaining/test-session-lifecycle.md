# Test session lifecycle

A Test session is a full `asp` run: discover entries, compile each entry, optionally execute wasm, publish reports, process snapshots, and aggregate stats.

## 1. Parse CLI options

`CliProgram` parses options such as:

- config paths,
- entry globs,
- test/group filters,
- reporters,
- snapshot update mode,
- memory options,
- run/compile-only behavior.

`asp` loads `as-pect.config.js` and creates a `TestSession`.

## 2. Create Test session config

`createTestSessionConfig` resolves runtime choices:

- entry filters from CLI and config,
- include globs from CLI/config/defaults,
- test and group regexes,
- memory descriptor,
- output binary behavior,
- project path,
- dependencies for testability.

Default include glob:

```text
assembly/__tests__/**/*.include.ts
```

## 3. Plan entries and includes

`planTestSessionEntries` expands CLI positional globs and configured entries. It sorts and deduplicates discovered paths, applies entry filters, and collects include files.

The output is the Test session entry plan:

```ts
{
  entries: string[];
  includeFiles: string[];
}
```

## 4. Create coverage plan

If `aspectConfig.coverage` is empty, the session uses the `noCoverage` compiler target.

If coverage files are configured, the session:

- loads the `as-covers` runtime,
- selects the `coverage` target,
- installs coverage imports,
- registers compiled modules,
- prints a coverage report at the end.

## 5. Compile each entry

For each entry, `runTestSessionEntry` creates a compiler IO adapter and invokes AssemblyScript with arguments like:

```text
<entry> <include files...> --config <as-pect.asconfig.json> --target <coverage|noCoverage>
```

The compiler IO adapter caches successful file reads and directory listings across the session and captures compiler output files in memory.

## 6. Extract compiler output

The CLI expects compiler output files ending in:

```text
output.wasm
output.wat
```

If `--output-binary` or `--no-run` is used, the CLI writes `.wasm` and `.wat` files next to the test entry.

## 7. Optionally run the test binary

When `--no-run` is not set, the CLI:

1. plans snapshot file paths,
2. resolves WASI options if configured,
3. collects reporters,
4. creates `TestContext`,
5. creates WebAssembly memory,
6. calls `aspectConfig.instantiate(...)`,
7. runs the suite,
8. flushes reporters.

## 8. Apply snapshot writes

The Snapshot lifecycle produces stats and an update plan. The CLI applies writes according to compare/update mode.

## 9. Accumulate session stats

Each completed suite contributes group/test/snapshot facts to the Test session stats accumulator. The final summary prints tests, groups, snapshots, and overall pass/fail.

## Next steps

- Learn output callbacks in [Reporting lifecycle](reporting-lifecycle.md).
- Learn snapshot details in [Snapshot lifecycle](snapshot-lifecycle.md).
- Review config responsibilities in [Configuration](../using/configuration.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
