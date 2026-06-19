# Snapshots

Snapshots let tests compare large or structured output without writing the full expected value inline.

## Create a snapshot

Use `toMatchSnapshot(name?)` on an expectation:

```ts
describe("renderer", () => {
  it("renders text", () => {
    expect<string>("hello\nworld").toMatchSnapshot("rendered text");
  });
});
```

The snapshot name is optional, but explicit names make snapshot files easier to read.

## Snapshot file location

For a test entry:

```text
assembly/__tests__/renderer.spec.ts
```

`as-pect` stores snapshots at:

```text
assembly/__tests__/__snapshots__/renderer.spec.snap
```

The file contains exports keyed by snapshot namespace:

```ts
exports[`renderer[0]!~renders text[0]: rendered text[0]`] = `hello
world`;
```

The exact key includes the Test node namespace. That namespace includes duplicate-safe indexes so duplicate group names, duplicate test names, and multiple snapshots with the same explicit name remain stable.

## First run behavior

When no expected snapshot exists, actual snapshots are treated as added snapshots. The snapshot lifecycle can pass with added snapshots, and the update plan knows which entries need to be written.

For first-time snapshot creation, run update mode so `as-pect` can create the `__snapshots__` directory when needed:

```sh
npx asp --update-snapshots
```

## Compare mode

By default, `asp` runs in compare mode:

```sh
npx asp
```

In compare mode, existing snapshot files are loaded and compared against actual snapshots from the test run.

- Matching snapshots pass.
- Changed snapshots fail.
- Removed snapshots fail.
- Added snapshots are tracked by the update plan.

In current `master`, compare mode applies added-snapshot updates after the run when the snapshot path can already be written. It does not create a missing `__snapshots__` directory, so use `--update-snapshots` for first-time snapshot creation.

## Update mode

Use update mode when you intentionally changed output:

```sh
npx asp --update-snapshots
```

In update mode, `as-pect` writes planned snapshot updates after the test run when the root test node passed. New snapshot files are created under `__snapshots__` when needed.

## Good snapshot habits

- Give snapshots explicit names when a test has more than one snapshot.
- Keep snapshots focused. Snapshot the value that matters, not unrelated state.
- Review snapshot diffs like code changes.
- Avoid snapshots for simple values that are clearer inline with `toBe` or `toStrictEqual`.
- Update snapshots only after confirming the new output is correct.

## Troubleshooting snapshots

### Snapshot was added unexpectedly

Check whether the test name, group name, or explicit snapshot name changed. Those names are part of the key.

### Snapshot was removed unexpectedly

Check whether the test stopped running, was filtered by `--test` or `--group`, or moved to another entry file.

### Snapshot key changed after duplicate tests were added

Snapshot keys include duplicate-safe indexes. If you intentionally add duplicate group/test names, review the resulting snapshot file carefully.

## Next steps

- Learn update CLI behavior in [CLI](cli.md).
- Learn the Snapshot lifecycle in [Snapshot lifecycle](../maintaining/snapshot-lifecycle.md).
- Review snapshot-related types in [`@as-pect/snapshots`](../types/snapshots.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
