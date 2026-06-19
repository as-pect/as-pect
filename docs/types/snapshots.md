# `@as-pect/snapshots` types

Package-root exports from current `master`.

## Snapshot parsing and storage

```ts
export interface SnapshotStringElement {
  image: string;
}

export class SnapshotParseError extends Error {
  readonly lexerErrors: string[];
  readonly parserErrors: string[];
}

export class SnapshotParser {
  readonly lexerErrors: { message: string }[];
  readonly parserErrors: { message: string }[];
  constructor(input: string);
  parse(): Map<string, string>;
}

export class Snapshot {
  static parse(input: string): Snapshot;
  static from(input: Map<string, string>): Snapshot;

  values: Map<string, string>;

  add(key: string, value: string): this;
  set(key: string, value: string): this;
  diff(other: Snapshot): SnapshotDiff;
  stringify(): string;
}

export function parseImageCSTElement(element: unknown): string;
```

## Snapshot diffing

```ts
export const enum SnapshotDiffResultType {
  NoChange,
  Added,
  Removed,
  Different,
}

export class SnapshotDiffResult {
  type: SnapshotDiffResultType;
  left: string | null;
  right: string | null;
  changes: import("diff").Change[];
}

export class SnapshotDiff {
  results: Map<string, SnapshotDiffResult>;
  constructor(left: Snapshot, right: Snapshot);
  left: Snapshot;
  right: Snapshot;
  calculateDiff(): void;
}
```

## Snapshot lifecycle

```ts
export interface SnapshotLifecycleStats {
  totalSnapshots: number;
  addedSnapshots: number;
  removedSnapshots: number;
  changedSnapshots: number;
  passedSnapshots: number;
}

export interface SnapshotUpdate {
  name: string;
  value: string;
}

export class SnapshotUpdatePlan {
  constructor(updates: SnapshotUpdate[]);
  readonly updates: SnapshotUpdate[];
  get shouldWrite(): boolean;
  get addedSnapshots(): number;
  applyTo(snapshot: Snapshot): Snapshot;
}

export class SnapshotLifecycle {
  readonly actual: Snapshot;
  readonly expected: Snapshot;
  readonly diff: SnapshotDiff;
  readonly pass: boolean;
  readonly stats: SnapshotLifecycleStats;
  readonly updatePlan: SnapshotUpdatePlan;

  constructor(actual: Snapshot, expected: Snapshot);
}
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
