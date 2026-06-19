# Getting started

This page gets a standard AssemblyScript project running its first `as-pect` test. The golden path is `asp --init`; use the manual setup section only when you need to understand or recreate the generated files yourself.

## Prerequisites

You need:

- Node.js and npm.
- An AssemblyScript project.
- A project-level `asconfig.json` if you want to use the default `as-pect.asconfig.json`, because the init template extends `./asconfig.json`.

If you are starting from an empty directory, create the package first:

```sh
npm init -y
npm install --save-dev assemblyscript
npx asinit .
```

If you already have an AssemblyScript project, start from the next section.

## Install as-pect

Install the CLI and AssemblyScript compiler in your project:

```sh
npm install --save-dev @as-pect/cli assemblyscript
```

The CLI package brings in the core `as-pect` packages it needs, including the AssemblyScript test runtime and transform packages.

## Initialize the test project

Run:

```sh
npx asp --init
```

In a new project, the init command creates the standard test layout:

```text
assembly/
  __tests__/
    as-pect.d.ts
    example.spec.ts
as-pect.config.js
as-pect.asconfig.json
```

`asp --init` does not overwrite existing files. It creates `example.spec.ts` only when `assembly/__tests__/` itself is new; if that directory already exists, create your first spec manually.

The current init template is maintained in the repository under these source files:

- [`packages/cli/init/as-pect.config.js`](https://github.com/jtenner/as-pect/blob/master/packages/cli/init/as-pect.config.js)
- [`packages/cli/init/as-pect.asconfig.json`](https://github.com/jtenner/as-pect/blob/master/packages/cli/init/as-pect.asconfig.json)
- [`packages/cli/init/example.spec.ts`](https://github.com/jtenner/as-pect/blob/master/packages/cli/init/example.spec.ts)
- [`packages/cli/init/init-types.d.ts`](https://github.com/jtenner/as-pect/blob/master/packages/cli/init/init-types.d.ts)

## Add npm scripts

Add scripts like these to your `package.json`:

```json
{
  "scripts": {
    "test": "asp --summary",
    "test:verbose": "asp --verbose",
    "test:update-snapshots": "asp --update-snapshots"
  }
}
```

Use `--summary` for compact output and `--verbose` when you want to see each group and test result.

## Run the generated test

Run:

```sh
npm test
```

The generated `assembly/__tests__/example.spec.ts` includes a small group of tests showing numeric expectations, reference equality, strict equality, string comparison, value comparison, and logging.

## Add your first project test

Create a new file that matches the default entry glob:

```text
assembly/__tests__/**/*.spec.ts
```

For example:

```ts
// assembly/__tests__/math.spec.ts

describe("math", () => {
  it("adds numbers", () => {
    expect<i32>(19 + 23).toBe(42);
  });
});
```

Then run:

```sh
npm test
```

## What the generated files do

### `assembly/__tests__/as-pect.d.ts`

This file adds the `as-pect` global test declarations for AssemblyScript test files. It lets tests use functions like `describe`, `it`, `expect`, `beforeEach`, `todo`, and `log`.

### `assembly/__tests__/example.spec.ts`

This is a starter test file. Keep it while you are learning, then replace it with project-specific tests.

### `as-pect.config.js`

This file configures the Test session:

- which test entries are discovered
- which include files are added to every test compilation
- which entries are excluded
- how WebAssembly imports are created
- whether coverage is enabled
- whether compiled wasm binaries are written to disk

Default entry discovery:

```js
entries: ["assembly/__tests__/**/*.spec.ts"]
```

Default include discovery:

```js
include: ["assembly/__tests__/**/*.include.ts"]
```

### `as-pect.asconfig.json`

This file configures the AssemblyScript compiler invocation used for tests. Compiler options belong here, not in `as-pect.config.js`.

The init template defines two targets:

- `noCoverage`: normal test compilation with `@as-pect/transform`
- `coverage`: coverage-enabled compilation with `@as-covers/assembly`, the `as-pect` coverage transform wrapper, and `@as-pect/transform`

## Manual setup from scratch

Use this when you cannot run `asp --init` or want to build the setup by hand. This is intentionally minimal-first; compare it with the full init template links above when you need the canonical generated files.

### 1. Install dependencies

```sh
npm install --save-dev @as-pect/cli assemblyscript
```

### 2. Add npm scripts

```json
{
  "scripts": {
    "test": "asp --summary",
    "test:verbose": "asp --verbose",
    "test:update-snapshots": "asp --update-snapshots"
  }
}
```

### 3. Create the test directory

```text
assembly/
  __tests__/
```

### 4. Create test type declarations

Create:

```text
assembly/__tests__/as-pect.d.ts
```

with:

```ts
/// <reference types="@as-pect/assembly/types/as-pect" />
```

### 5. Create `as-pect.config.js`

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

Add coverage later by adding a `coverage` glob list:

```js
coverage: ["assembly/**/*.ts"]
```

### 6. Create `as-pect.asconfig.json`

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

If your project does not have `asconfig.json`, either create one with AssemblyScript's `asinit` flow or remove/replace the `extends` field with the compiler configuration your project needs.

### 7. Create the first spec

```ts
// assembly/__tests__/example.spec.ts

describe("example", () => {
  it("adds numbers", () => {
    expect<i32>(19 + 23).toBe(42, "19 + 23 is 42");
  });
});
```

### 8. Run tests

```sh
npm test
```

## Next steps

- Learn the test API in [Writing tests](writing-tests.md).
- Configure discovery, compiler options, reporters, WASI, and coverage in [Configuration](configuration.md).
- Learn the command-line options in [CLI](cli.md).
- Add snapshot assertions in [Snapshots](snapshots.md).
- Enable coverage in [Coverage](coverage.md).
- Set up CI in [CI](ci.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
