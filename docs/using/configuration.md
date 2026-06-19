# Configuration

`as-pect` uses two project-level configuration files by default:

```text
as-pect.config.js
as-pect.asconfig.json
```

Use `as-pect.config.js` for the Test session and JavaScript/WebAssembly runtime setup. Use `as-pect.asconfig.json` for AssemblyScript compiler options.

## `as-pect.config.js`

The init template creates an ES module with a default export:

```js
export default {
  entries: ["assembly/__tests__/**/*.spec.ts"],
  include: ["assembly/__tests__/**/*.include.ts"],
  disclude: [/node_modules/],

  async instantiate(memory, createImports, instantiate, binary) {
    const myImports = {
      env: { memory },
    };

    return instantiate(binary, createImports(myImports));
  },

  outputBinary: false,
};
```

### `entries`

Test entry globs. Each discovered file becomes one Test session entry.

```js
entries: ["assembly/__tests__/**/*.spec.ts"]
```

CLI positional arguments are added to configured entries. Matches are sorted per glob and duplicate entries are removed.

### `include`

Include globs compiled into every test entry.

```js
include: ["assembly/__tests__/**/*.include.ts"]
```

Use include files for shared declarations or setup code that each test binary needs.

### `disclude`

Regular expressions used to remove discovered entries.

```js
disclude: [/node_modules/]
```

The CLI `--disclude <regex>` adds another filter.

### `instantiate`

Creates one WebAssembly instance for each compiled test binary.

```js
async instantiate(memory, createImports, instantiate, binary) {
  const myImports = {
    env: { memory },
    // custom imports go here
  };

  return instantiate(binary, createImports(myImports));
}
```

Always pass imports through `createImports(...)`; this installs the `as-pect` host imports required by the test runtime.

### `coverage`

A list of AssemblyScript source globs to instrument with `as-covers`-compatible coverage points.

```js
coverage: ["assembly/**/*.ts"]
```

When this list is non-empty, `asp` selects the `coverage` compiler target from `as-pect.asconfig.json`, installs `as-covers` imports, registers compiled modules with the coverage runtime, and prints a coverage report after the test run.

### `outputBinary`

Writes `.wasm` and `.wat` files next to each test entry.

```js
outputBinary: true
```

This is useful for debugging compiler output. The CLI also writes compiler artifacts when `--output-binary` is passed, or when `--no-run` is used.

### `reporter`

A custom reporter module path or package name. The module default export must be an `IReporter` object; `asp` does not instantiate a default-exported class.

```js
reporter: "./my-reporter.js"
```

The CLI can add another reporter with `--reporter <reporter>`. Built-in shortcuts such as `--json`, `--csv`, `--junit`, and `--ctrf` add file reporters.

### `wasi`

Node WASI options for tests that use WASI imports.

```js
wasi: {
  args: [],
  env: {},
  preopens: {
    "/sandbox": "./sandbox"
  }
}
```

If `version` is omitted, `as-pect` uses Node's `preview1` default.

## `as-pect.asconfig.json`

This file is passed to the AssemblyScript compiler with `--config`. The init template expects two targets:

```json
{
  "targets": {
    "coverage": {
      "lib": ["./node_modules/@as-covers/assembly/index.ts"],
      "transform": ["./node_modules/@as-pect/cli/init/as-covers-transform.js", "@as-pect/transform"]
    },
    "noCoverage": {
      "transform": ["@as-pect/transform"]
    }
  },
  "options": {
    "exportMemory": true,
    "outFile": "output.wasm",
    "textFile": "output.wat",
    "bindings": "raw",
    "exportStart": "_start",
    "exportRuntime": true,
    "use": ["RTRACE=1"],
    "debug": true,
    "exportTable": true
  },
  "extends": "./asconfig.json",
  "entries": ["./node_modules/@as-pect/assembly/assembly/index.ts"]
}
```

Important compiler requirements:

- `outFile` must emit `output.wasm`.
- `textFile` must emit `output.wat`.
- `@as-pect/transform` must run so class reflection helpers are generated.
- The coverage target must include the coverage support library and transform wrapper.

## Path resolution

In normal CLI use, the Test session project path is the current working directory where you run `asp`.

`asp` resolves test entry globs, include globs, `--as-config`, reporter local paths, snapshot files, and emitted `.wasm` / `.wat` artifacts from that project path. The `--config` file is also resolved from the current working directory before the Test session is created.

AssemblyScript still interprets compiler-config internals such as `extends`, `entries`, `lib`, and `transform` according to its own `--config` handling after `asp` passes the resolved `as-pect.asconfig.json` path.

## Next steps

- Review all config fields in [Config reference](../reference/config-reference.md).
- Learn CLI overrides in [CLI](cli.md).
- Enable coverage in [Coverage](coverage.md).
- Configure output reporters in [Built-in reporters](../extending/built-in-reporters.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
