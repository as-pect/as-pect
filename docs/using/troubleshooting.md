# Troubleshooting

Use this page to narrow common `as-pect` setup, compile, runtime, snapshot, coverage, and reporter failures.

## `asp --init` did not create `example.spec.ts`

`asp --init` creates the example spec only when `assembly/__tests__/` itself is new. If that directory already exists, the init plan skips the example file to avoid overwriting project tests.

Create your own spec manually:

```ts
describe("example", () => {
  it("passes", () => {
    expect<i32>(1 + 1).toBe(2);
  });
});
```

## Tests are not discovered

Check:

- Your test file matches `entries` in `as-pect.config.js`.
- CLI positional globs point at existing files.
- `disclude` or `--disclude` is not filtering the entry.
- You are running `asp` from the expected project directory.

Default entries:

```js
entries: ["assembly/__tests__/**/*.spec.ts"]
```

## Type declarations are missing

If AssemblyScript cannot find `describe`, `it`, or `expect`, make sure your test folder has a declarations file like:

```ts
/// <reference types="@as-pect/assembly/types/as-pect" />
```

The init template writes this to:

```text
assembly/__tests__/as-pect.d.ts
```

## Compiler did not emit `output.wasm` or `output.wat`

`as-pect` expects the compiler config to emit both files:

```json
"outFile": "output.wasm",
"textFile": "output.wat"
```

If those names change, the CLI cannot extract compiler output.

## Class/object equality is not working

Make sure `@as-pect/transform` runs in the selected compiler target. The transform generates class reflection helpers consumed by runtime `Reflect` helpers.

For normal runs:

```json
"noCoverage": {
  "transform": ["@as-pect/transform"]
}
```

For coverage runs:

```json
"coverage": {
  "transform": ["./node_modules/@as-pect/cli/init/as-covers-transform.js", "@as-pect/transform"]
}
```

## Snapshot failures

If output intentionally changed, update snapshots:

```sh
npx asp --update-snapshots
```

If output did not intentionally change, inspect:

- group/test names,
- explicit snapshot names,
- test filters,
- moved entry files,
- changed serialization output.

## Coverage fails

Check that:

- `coverage` in `as-pect.config.js` is a non-empty list of source globs,
- the `coverage` target exists in `as-pect.asconfig.json`,
- the target includes `@as-covers/assembly`,
- the target includes the coverage transform wrapper before `@as-pect/transform`.

## Custom reporter cannot be imported

For local reporter files, use an explicit relative path:

```sh
npx asp --reporter ./my-reporter.js
```

For package reporters, install the package and pass the package name. The package default export must be an `IReporter` object, not an uninstantiated class:

```sh
npm install --save-dev @scope/as-pect-reporter
npx asp --reporter @scope/as-pect-reporter
```

For built-in file reporters, prefer the shortcut flags such as `--junit`, `--ctrf`, `--json`, and `--csv`.

## WASI tests fail

If your tests require WASI imports, configure `wasi` in `as-pect.config.js`. `as-pect` defaults the WASI version to `preview1` when not specified.

## Need more output

Try:

```sh
npx asp --verbose
npx asp --show-stats
npx asp --output-binary
```

Use `--no-run` to compile and write artifacts without running tests.

## Next steps

- Revisit [Getting started](getting-started.md) for the expected file layout.
- Check [Configuration](configuration.md) for config responsibilities.
- Check [CLI reference](../reference/cli-reference.md) for exact defaults.

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
