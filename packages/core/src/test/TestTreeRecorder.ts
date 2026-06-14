import { Snapshot } from "@as-pect/snapshots";
import { ReflectedValue } from "../util/ReflectedValue.js";
import { ReflectedValueType } from "../util/ReflectedValueType.js";
import { TestNodeType } from "../util/TestNodeType.js";
import { TestNode } from "./TestNode.js";

export type TestTreeStringReader = (pointer: number, defaultValue: string) => string;

export class TestTreeRecorder {
  /** A collection of all generated namespaces for snapshot purposes. */
  private namespaces: Set<string> = new Set<string>();

  /** The most recent actual value reported by an assertion. */
  private actual: ReflectedValue | null = null;

  /** The most recent expected value reported by an assertion. */
  private expected: ReflectedValue | null = null;

  /** The current Test node that receives facts from Wasm host callbacks. */
  private targetNode: TestNode;

  constructor(
    private readonly readString: TestTreeStringReader,
    rootNode: TestNode,
  ) {
    this.targetNode = rootNode;
  }

  /** The current Test node that receives facts from Wasm host callbacks. */
  get currentTargetNode(): TestNode {
    return this.targetNode;
  }

  /** Set the current Test node for compatibility with existing TestContext extension seams. */
  setCurrentTargetNode(node: TestNode): void {
    this.targetNode = node;
  }

  /** Temporarily route collected facts to a specific Test node. */
  withTargetNode<T>(node: TestNode, callback: () => T): T {
    const previousTargetNode = this.targetNode;
    this.targetNode = node;
    try {
      return callback();
    } finally {
      this.targetNode = previousTargetNode;
    }
  }

  /** Record a group or test declaration under the active parent node. */
  recordDeclaration(
    parent: TestNode,
    type: TestNodeType,
    descriptionPointer: number,
    callbackPointer: number,
    negated: 1 | 0,
    messagePointer: number,
  ): TestNode {
    const node = new TestNode();
    node.type = type;
    node.name = this.readString(descriptionPointer, node.name);
    node.callback = callbackPointer;
    node.negated = negated === 1;
    node.message = node.negated ? this.readString(messagePointer, "No Message Provided.") : node.message;
    node.namespace = this.createNamespace(parent, node.name);
    parent.addChild(node);

    return node;
  }

  /** Record a beforeAll hook callback on the active group. */
  recordBeforeAll(target: TestNode, callbackPointer: number): void {
    target.addBeforeAll(callbackPointer);
  }

  /** Record a beforeEach hook callback on the active group. */
  recordBeforeEach(target: TestNode, callbackPointer: number): void {
    target.addBeforeEach(callbackPointer);
  }

  /** Record an afterEach hook callback on the active group. */
  recordAfterEach(target: TestNode, callbackPointer: number): void {
    target.addAfterEach(callbackPointer);
  }

  /** Record an afterAll hook callback on the active group. */
  recordAfterAll(target: TestNode, callbackPointer: number): void {
    target.addAfterAll(callbackPointer);
  }

  /** Record a todo declaration on the active group. */
  recordTodo(target: TestNode, todoPointer: number): void {
    target.addTodo(this.readString(todoPointer, "No todo() value provided."));
  }

  /** Record a log value on the active target node. */
  recordLog(target: TestNode, value: ReflectedValue): void {
    target.addLog(value);
  }

  /** Record the actual value most recently reported by an assertion. */
  recordActual(value: ReflectedValue): void {
    this.actual = value;
  }

  /** Record the expected value most recently reported by an assertion. */
  recordExpected(value: ReflectedValue, negated: number): void {
    value.negated = negated === 1;
    this.expected = value;
  }

  /** Record an expected matcher value that does not come from the reflected-value cache. */
  recordExpectedType(type: ReflectedValueType, negated: number): void {
    const expected = new ReflectedValue();
    expected.negated = negated === 1;
    expected.type = type;
    this.expected = expected;
  }

  /** Clear the most recently reported actual value. */
  clearActual(): void {
    this.actual = null;
  }

  /** Clear the most recently reported expected value. */
  clearExpected(): void {
    this.expected = null;
  }

  /** Attach the latest failure facts to a failed group or test node. */
  recordFailureFacts(target: TestNode, stackTrace: string, message: string): void {
    target.stackTrace = stackTrace;
    target.actual = this.actual;
    target.expected = this.expected;
    target.message = message;
  }

  /** Record a snapshot value under the active test node's snapshot key. */
  recordSnapshot(target: TestNode, snapshots: Snapshot, namePointer: number, value: string): void {
    snapshots.add(this.createSnapshotKey(target, this.readString(namePointer, "")), value);
  }

  /** Build the external snapshot key prefix for a test node and explicit snapshot name. */
  createSnapshotKey(target: TestNode, snapshotName: string): string {
    const namespace = this.toSnapshotNamespace(target);
    return `${namespace}!~${snapshotName}`;
  }

  private toSnapshotNamespace(target: TestNode): string {
    return target.namespace.startsWith("!~") ? target.namespace.slice(2) : target.namespace;
  }

  private createNamespace(parent: TestNode, name: string): string {
    const namespacePrefix = `${parent.namespace}!~${name}`;
    let i = 0;

    while (true) {
      const namespace = `${namespacePrefix}[${i}]`;
      if (this.namespaces.has(namespace)) {
        i++;
        continue;
      }
      this.namespaces.add(namespace);
      return namespace;
    }
  }
}
