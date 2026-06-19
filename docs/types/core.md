# `@as-pect/core` types

Package-root exports from current `master`. These are the main types used by reporters, integrations, and maintainer-facing code.

## Reporter contract

```ts
export interface IWritable {
  write(str: string): void;
}

export interface IReporter extends ReportAdapter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onFinish(ctx: TestContext): void;
  onFlush?(): Promise<void> | void;
}
```

## Report events

```ts
export interface GroupReportEvent {
  group: SuiteGroupReport;
}

export interface TestReportEvent {
  group: SuiteGroupReport;
  test: SuiteTestReport;
}

export interface SuiteReportEvent {
  report: SuiteReport;
}

export interface ReportAdapter {
  onReportGroupStart?(event: GroupReportEvent): void;
  onReportGroupFinish?(event: GroupReportEvent): void;
  onReportTestStart?(event: TestReportEvent): void;
  onReportTestFinish?(event: TestReportEvent): void;
  onReportFinish?(event: SuiteReportEvent): void;
}
```

## Suite report facts

```ts
export type SnapshotReportLineType = "added" | "removed" | "unchanged";

export interface SnapshotReportLine {
  type: SnapshotReportLineType;
  value: string;
}

export interface SnapshotReportChange {
  name: string;
  lines: SnapshotReportLine[];
  result: import("@as-pect/snapshots").SnapshotDiffResult;
}

export interface SnapshotReportStats {
  total: number;
  added: number;
  removed: number;
  different: number;
}

export interface SuiteTestReport {
  type: "test";
  groupName: string;
  name: string;
  ran: boolean;
  negated: boolean;
  pass: boolean;
  runtime: number;
  message: string | null;
  stackTrace: string | null;
  rtraceDelta: number;
  logs: ReflectedValue[];
  actual: string | null;
  expected: string | null;
  actualValue: ReflectedValue | null;
  expectedValue: ReflectedValue | null;
}

export interface SuiteTodoReport {
  type: "todo";
  groupName: string;
  description: string;
}

export type SuiteResultReport = SuiteTestReport | SuiteTodoReport;

export interface SuiteGroupReport {
  type: "group";
  name: string;
  pass: boolean;
  runtime: number;
  hasChildren: boolean;
  logs: ReflectedValue[];
  todos: string[];
  tests: SuiteTestReport[];
}
```

## `SuiteReport`

```ts
export class SuiteReport {
  readonly fileName: string;
  readonly pass: boolean;
  readonly testCount: number;
  readonly testPassCount: number;
  readonly groupCount: number;
  readonly groupPassCount: number;
  readonly rootRuntime: number;
  readonly hasResults: boolean;
  readonly todoCount: number;
  readonly rootNode: TestNode;
  readonly warnings: IWarning[];
  readonly errors: IWarning[];
  readonly snapshotChanges: SnapshotReportChange[];
  readonly snapshotStats: SnapshotReportStats;
  readonly groups: SuiteGroupReport[];
  readonly results: SuiteResultReport[];

  static from(suite: TestContext): SuiteReport;
  static groupFromNode(group: TestNode): SuiteGroupReport;
  static testFromNode(group: TestNode, test: TestNode): SuiteTestReport;
}

export function createSuiteReport(suite: TestContext): SuiteReport;
export function createGroupReport(group: TestNode): SuiteGroupReport;
export function createTestReport(group: TestNode, test: TestNode): SuiteTestReport;
```

## Reporting lifecycle

`ReportingLifecycle` is exported for reporter infrastructure and maintainer-facing integrations that need to publish report events from a `TestContext` and reporter pair.

```ts
export class ReportingLifecycle {
  constructor(suite: TestContext, reporter: IReporter);
  enter(node: TestNode): void;
  exit(node: TestNode): void;
  finish(): void;
}
```

## Legacy reporter compatibility

```ts
export interface LegacyGroupReportFacts {
  context: TestContext;
  node: TestNode;
}

export interface LegacyTestReportFacts {
  context: TestContext;
  groupNode: TestNode;
  node: TestNode;
}

export interface LegacySuiteReportFacts {
  context: TestContext;
}

export interface ReportCompatibilityAdapter {
  onReportGroupStartWithLegacy?(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void;
  onReportGroupFinishWithLegacy?(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void;
  onReportTestStartWithLegacy?(event: TestReportEvent, legacy: LegacyTestReportFacts): void;
  onReportTestFinishWithLegacy?(event: TestReportEvent, legacy: LegacyTestReportFacts): void;
  onReportFinishWithLegacy?(event: SuiteReportEvent, legacy: LegacySuiteReportFacts): void;
}

export class LegacyReporterAdapter {
  constructor(reporter: IReporter);
  onReportGroupStart(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void;
  onReportGroupFinish(event: GroupReportEvent, legacy: LegacyGroupReportFacts): void;
  onReportTestStart(event: TestReportEvent, legacy: LegacyTestReportFacts): void;
  onReportTestFinish(event: TestReportEvent, legacy: LegacyTestReportFacts): void;
  onReportFinish(event: SuiteReportEvent, legacy: LegacySuiteReportFacts): void;
}
```

## Built-in core reporters

```ts
export class CombinationReporter implements IReporter {
  constructor(reporters: IReporter[]);
  stdout: IWritable | null;
  stderr: IWritable | null;
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onFinish(ctx: TestContext): void;
  onFlush(): Promise<void>;
}

export class EmptyReporter implements IReporter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  constructor(options?: any);
  onEnter(context: TestContext, node: TestNode): void;
  onExit(context: TestContext, node: TestNode): void;
  onFinish(context: TestContext): void;
}

export class SummaryReporter implements IReporter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  constructor();
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onReportFinish(event: SuiteReportEvent): void;
  onFinish(suite: TestContext): void;
}

export class VerboseReporter implements IReporter {
  stdout: IWritable | null;
  stderr: IWritable | null;
  constructor(options?: any);
  onEnter(ctx: TestContext, node: TestNode): void;
  onExit(ctx: TestContext, node: TestNode): void;
  onReportGroupStart(event: GroupReportEvent): void;
  onReportGroupFinish(event: GroupReportEvent): void;
  onReportTestStart(event: TestReportEvent): void;
  onReportTestFinish(event: TestReportEvent): void;
  onReportFinish(event: SuiteReportEvent): void;
  onGroupStart(group: TestNode): void;
  onGroupFinish(group: TestNode): void;
  onTestStart(group: TestNode, test: TestNode): void;
  onTestFinish(group: TestNode, test: TestNode): void;
  onFinish(suite: TestContext): void;
}
```

## Test suite model

```ts
export interface IWarning {
  type: string;
  message: string;
  stackTrace: string;
}

export const enum TestNodeType {
  Test = 0,
  Group = 1,
}

export interface ITestContextParameters {
  testRegex?: RegExp;
  groupRegex?: RegExp;
  fileName?: string;
  binary?: Uint8Array;
  reporter: IReporter;
  snapshots?: import("@as-pect/snapshots").Snapshot;
  wasi?: import("wasi").WASI | null;
}
```

## `TestNode`

```ts
export class TestNode {
  type: TestNodeType;
  name: string;
  callback: number;
  negated: boolean;
  namespace: string;
  beforeEach: number[];
  beforeAll: number[];
  afterEach: number[];
  afterAll: number[];
  parent: TestNode | null;
  children: TestNode[];
  pass: boolean;
  warnings: IWarning[];
  errors: IWarning[];
  logs: ReflectedValue[];
  stackTrace: string | null;
  actual: ReflectedValue | null;
  expected: ReflectedValue | null;
  message: string | null;
  todos: string[];
  start: number;
  end: number;
  rtraceStart: number;
  rtraceEnd: number;
  ran: boolean;
  allocations: number;
  frees: number;
  moves: number;

  addChild(node: TestNode): void;
  addBeforeAll(callbackPointer: number): void;
  addBeforeEach(callbackPointer: number): void;
  addAfterEach(callbackPointer: number): void;
  addAfterAll(callbackPointer: number): void;
  addTodo(todo: string): void;
  addLog(log: ReflectedValue): void;
  addError(error: IWarning): void;
  addWarning(warning: IWarning): void;
  recordAllocation(): void;
  recordFree(): void;
  get rtraceDelta(): number;
  get deltaT(): number;
  visit(callback: (node: TestNode) => boolean | void): void;
  get groupTodos(): string[];
  get groupTests(): TestNode[];
  get childGroups(): TestNode[];
}
```

## `TestContext`

```ts
export class TestContext {
  rootNode: TestNode;
  fileName: string;
  pass: boolean;
  testCount: number;
  testRunCount: number;
  testPassCount: number;
  groupCount: number;
  groupRunCount: number;
  groupPassCount: number;
  todoCount: number;
  errors: IWarning[];
  warnings: IWarning[];
  snapshots: import("@as-pect/snapshots").Snapshot;
  expectedSnapshots: import("@as-pect/snapshots").Snapshot;
  snapshotDiff: import("@as-pect/snapshots").SnapshotDiff | null;
  snapshotLifecycle: import("@as-pect/snapshots").SnapshotLifecycle | null;

  constructor(props: ITestContextParameters);
}
```

## Wasm host and reflected values

```ts
export interface IAspectExports {
  [key: string]: unknown;
  __call(pointer: number): void;
  __disableRTrace(): void;
  __getUsizeArrayId(): number;
  readonly memory: { readonly buffer: ArrayBuffer };
  _start(): void;
  __getString(ref: number): string;
  __allocArray(id: number, values: number[]): number;
  __getArray(ref: number): number[];
  __collect(): void;
  readonly table?: WebAssembly.Table;
}

export const enum ReflectedValueType {
  None = 0,
  Class = 1,
  String = 2,
  ArrayBuffer = 3,
  Map = 4,
  Set = 5,
  Function = 6,
  Integer = 7,
  Float = 8,
  Boolean = 9,
  Array = 10,
  TypedArray = 11,
  Finite = 12,
  Truthy = 13,
  Falsy = 14,
}

// Supporting configuration type used by ReflectedValue.stringify().
// It is not a package-root named export.
type StringifyReflectedValueProps = {
  keywordFormatter: (prop: string) => string;
  stringFormatter: (prop: string) => string;
  classNameFormatter: (prop: string) => string;
  numberFormatter: (prop: string) => string;
  indent: number;
  tab: number;
  maxPropertyCount: number;
  maxLineLength: number;
  maxExpandLevel: number;
};

export class ReflectedValue {
  isManaged: boolean;
  isNull: boolean;
  keys: ReflectedValue[] | null;
  negated: boolean;
  nullable: boolean;
  offset: number;
  pointer: number;
  signed: boolean;
  size: number;
  stack: string;
  type: ReflectedValueType;
  typeId: number;
  typeName: string | null;
  value: number | string;
  values: ReflectedValue[] | null;
  stringify(props?: Partial<StringifyReflectedValueProps>): string;
}
```

---

[![Support Joshua Tenner on Ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/jtenner)
