import { TestNodeType } from "../util/TestNodeType.js";
import { TestNode } from "./TestNode.js";

export type TestTreeStringReader = (pointer: number, defaultValue: string) => string;

export class TestTreeRecorder {
  /** A collection of all generated namespaces for snapshot purposes. */
  private namespaces: Set<string> = new Set<string>();

  constructor(private readonly readString: TestTreeStringReader) {}

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
    node.parent = parent;
    parent.children.push(node);

    return node;
  }

  /** Record a beforeAll hook callback on the active group. */
  recordBeforeAll(target: TestNode, callbackPointer: number): void {
    target.beforeAll.push(callbackPointer);
  }

  /** Record a beforeEach hook callback on the active group. */
  recordBeforeEach(target: TestNode, callbackPointer: number): void {
    target.beforeEach.push(callbackPointer);
  }

  /** Record an afterEach hook callback on the active group. */
  recordAfterEach(target: TestNode, callbackPointer: number): void {
    target.afterEach.push(callbackPointer);
  }

  /** Record an afterAll hook callback on the active group. */
  recordAfterAll(target: TestNode, callbackPointer: number): void {
    target.afterAll.push(callbackPointer);
  }

  /** Record a todo declaration on the active group. */
  recordTodo(target: TestNode, todoPointer: number): void {
    target.todos.push(this.readString(todoPointer, "No todo() value provided."));
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
