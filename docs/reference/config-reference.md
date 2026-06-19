# Config reference

This page lists the public configuration fields used by `as-pect`.

## Files

| File | Purpose |
| --- | --- |
| `as-pect.config.js` | Test session configuration, runtime imports, reporters, WASI, coverage, output behavior. |
| `as-pect.asconfig.json` | AssemblyScript compiler configuration for test builds. |

## `as-pect.config.js`

```ts
export interface IAspectConfig {
  coverage?: string[];
  disclude?: RegExp[];
  include?: string[];
  entries?: string[];
  outputBinary?: boolean;
  reporter?: string;
  wasi?: import("wasi").WASIOptions;
  instantiate(
    memory: WebAssembly.Memory,
    createImports: AspectCreateImports,
    instantiate: AspectInstantiate,
    binary: Uint8Array,
  ): Promise<AspectInstantiateResult>;
}
```

### `entries?: string[]`

Glob patterns for test entry files. Each matched file becomes a Test session entry.

Default init template:

```js
entries: ["assembly/__tests__/**/*.spec.ts"]
```

### `include?: string[]`

Glob patterns for files compiled with every test entry.

Default when no include is configured:

```text
assembly/__tests__/**/*.include.ts
```

### `disclude?: RegExp[]`

Regular expressions used to exclude discovered entry paths.

```js
disclude: [/node_modules/]
```

### `coverage?: string[]`

Source file globs passed to the coverage runtime and instrumented with `as-covers`-compatible coverage points. Empty or missing coverage selects the `noCoverage` compiler target. Non-empty coverage selects the `coverage` target and prints a report after the run.

### `outputBinary?: boolean`

When true, writes `.wasm` and `.wat` files next to each test entry.

### `reporter?: string`

Custom reporter local path, file URL, or package name. The module default export must be an `IReporter` object.

### `wasi?: WASIOptions`

Node WASI options. If `version` is omitted, `as-pect` uses `preview1`.

### `instantiate(...)`

Required function that instantiates the compiled test binary. Always pass custom imports through `createImports(...)`.

```js
async instantiate(memory, createImports, instantiate, binary) {
  return instantiate(binary, createImports({ env: { memory } }));
}
```

## `as-pect.asconfig.json`

The CLI invokes AssemblyScript with:

```text
--config <as-pect.asconfig.json> --target <coverage|noCoverage>
```

Required target names:

| Target | When used |
| --- | --- |
| `noCoverage` | When `coverage` is missing or empty. |
| `coverage` | When `coverage` contains one or more globs. |

Required output names:

```json
"outFile": "output.wasm",
"textFile": "output.wat"
```

Required transform:

```json
"transform": ["@as-pect/transform"]
```

Coverage target transform:

```json
"transform": ["./node_modules/@as-pect/cli/init/as-covers-transform.js", "@as-pect/transform"]
```

Keep this order: the `as-pect` coverage wrapper instruments project sources with `as-covers`-compatible coverage points, then `@as-pect/transform` adds the reflection helpers used by assertions and reflected output.

## Path resolution summary

In normal CLI use, the Test session project path is the current working directory. `asp` resolves test entry globs, include globs, `--as-config`, local reporter paths, snapshot files, and emitted compiler artifacts from that project path. It resolves `--config` from the current working directory before creating the Test session.

AssemblyScript owns resolution of compiler-config internals such as `extends`, `entries`, `lib`, and `transform` after `asp` passes the resolved config path to `asc`.

## Related pages

- [Configuration guide](../using/configuration.md)
- [Coverage](../using/coverage.md)
- [`@as-pect/cli` types](../types/cli.md)

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
