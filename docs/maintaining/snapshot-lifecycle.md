# Snapshot lifecycle

The Snapshot lifecycle owns snapshot meaning: parsing, normalization, diffing, pass/fail decisions, stats, and update planning.

The CLI owns snapshot file paths and writes.

## Snapshot data model

`Snapshot` stores normalized key/value pairs:

```ts
values: Map<string, string>
```

Snapshot file entries look like:

```ts
exports[`key`] = `value`;
```

Values are normalized to `\n` newlines.

## Parsing

`Snapshot.parse(input)` parses a snapshot file into a `Snapshot` instance. Syntax failures throw `SnapshotParseError` with lexer and parser error messages.

## Diffing

`actual.diff(expected)` creates a `SnapshotDiff`. Each key maps to a `SnapshotDiffResult`:

| Result type | Meaning |
| --- | --- |
| `NoChange` | Actual and expected values match. |
| `Added` | Actual contains a key missing from expected. |
| `Removed` | Expected contains a key missing from actual. |
| `Different` | Both contain the key but values differ. |

Diff results include line changes from the `diff` package so reporters can render added, removed, and unchanged lines.

## Lifecycle pass/fail

`SnapshotLifecycle` accepts added snapshots and unchanged snapshots as passing:

- `NoChange` passes.
- `Added` passes and can be written by the update plan.
- `Removed` fails.
- `Different` fails.

This lets first-time snapshots be recorded while still failing on removed or changed expectations.

## Stats

`SnapshotLifecycleStats` includes:

- `totalSnapshots`,
- `addedSnapshots`,
- `removedSnapshots`,
- `changedSnapshots`,
- `passedSnapshots`.

The CLI folds these into Test session stats.

## Update plan

`SnapshotUpdatePlan` stores updates for added snapshots. It can be applied to the expected snapshot object before writing:

```ts
updatePlan.applyTo(expectedSnapshots);
```

The CLI decides whether to write based on mode:

- compare mode applies added-snapshot updates whenever the update plan should write, without checking root pass state and without creating missing snapshot directories;
- update mode writes only when the root test node passed and the update plan should write, creating the snapshot directory when needed.

## CLI integration

For each test entry, the CLI uses:

```text
<entry directory>/__snapshots__/<entry basename>.snap
```

Example:

```text
assembly/__tests__/math.spec.ts
assembly/__tests__/__snapshots__/math.spec.snap
```

## Maintainer guidance

When changing snapshot behavior:

- update [Snapshots](../using/snapshots.md),
- update [`@as-pect/snapshots` types](../types/snapshots.md),
- update reporter output docs if snapshot diff rendering changes,
- add migration notes if snapshot key shape or file syntax changes.

## Next steps

- Learn user-facing behavior in [Snapshots](../using/snapshots.md).
- Learn session integration in [Test session lifecycle](test-session-lifecycle.md).
- Review exported snapshot types in [`@as-pect/snapshots`](../types/snapshots.md).

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
