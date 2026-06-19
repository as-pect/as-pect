# Coverage

`as-pect` uses the `as-covers` runtime contract to collect coverage points from instrumented AssemblyScript sources and render a coverage report.

## Enable coverage

Add coverage globs to `as-pect.config.js`:

```js
export default {
  // ...the rest of your config
  coverage: ["assembly/**/*.ts"],
};
```

When `coverage` is non-empty, `asp`:

1. selects the `coverage` target in `as-pect.asconfig.json`,
2. installs coverage imports through `as-covers`,
3. registers each compiled test module with the coverage runtime, and
4. prints a coverage report after the test run.

## Required compiler target

The init template creates a coverage target like this:

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
  }
}
```

Keep both transforms in this order for coverage runs:

1. `./node_modules/@as-pect/cli/init/as-covers-transform.js`
2. `@as-pect/transform`

The first transform is an `as-pect` coverage wrapper. It instruments project sources with `as-covers`-compatible coverage points while keeping dependency and library sources out of the instrumentation pass.

## Choosing coverage globs

Start with your project source files:

```js
coverage: ["assembly/**/*.ts"]
```

Then exclude tests or generated code by narrowing the glob if needed. Coverage globs are the files passed to the coverage runtime; they should represent source files you want counted in the report.

## Running coverage

Coverage runs as part of a normal test command once configured:

```sh
npx asp --summary
```

At the end of the run, `asp` prints:

```text
Coverage Report:
```

followed by the coverage runtime's text output.

## Disabling coverage

Remove or comment out the `coverage` field:

```js
// coverage: ["assembly/**/*.ts"]
```

When no coverage files are configured, `asp` selects the `noCoverage` compiler target.

## Common problems

### The compiler cannot find `@as-covers/assembly`

Make sure dependencies are installed and the coverage target uses:

```json
"lib": ["./node_modules/@as-covers/assembly/index.ts"]
```

### Coverage transform is missing

Make sure the coverage target includes:

```json
"transform": ["./node_modules/@as-pect/cli/init/as-covers-transform.js", "@as-pect/transform"]
```

### Coverage report is empty

Check that your `coverage` globs match source files and not only test files.

## Next steps

- Configure compiler targets in [Configuration](configuration.md).
- Use CI reporters in [CI](ci.md).
- See the exact config fields in [Config reference](../reference/config-reference.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
