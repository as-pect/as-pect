import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";
import { IWarning } from "./IWarning";
import { ReflectedValue } from "../util/ReflectedValue";

export class TestNode {
  /** The TestNode type. */
  type: TestNodeType = TestNodeType.Test;

  /** The name of the TestNode */
  name: string = "";

  /** The callback pointer. */
  callback: number = -1;

  /** If the test is expected to fail. */
  negated: boolean = false;

  /** The namespace of this TestNode */
  namespace: string = "";

  /** The callback pointers that need to be called before each test. */
  beforeEach: number[] = [];

  /** The callback pointers that need to be called once before traversing through this node's children. */
  beforeAll: number[] = [];

  /** The callback pointers that need to be called after each test. */
  afterEach: number[] = [];

  /** The callback pointers that need to be called once after traversing through this node's children. */
  afterAll: number[] = [];

  /** Parent TestNode */
  parent: TestNode | null = null;

  /** Children TestNodes */
  children: TestNode[] = [];

  /** An indicator if the test suite passed. */
  pass: boolean = false;

  /** A set of warnings. */
  warnings: IWarning[] = [];

  /** A set of errors. */
  errors: IWarning[] = [];

  /** A set of logged values. */
  logs: ReflectedValue[] = [];

  /** A stack trace for the error. */
  stackTrace: string | null = null;

  /** The actual reported value. */
  actual: ReflectedValue | null = null;

  /** The expected reported value. */
  expected: ReflectedValue | null = null;

  /** Message provided by the abort() function. */
  message: string | null = null;

  /** A set of todo messages provided by the testnode. */
  todos: string[] = [];

  /** Start time. */
  start: number = 0;

  /** End time. */
  end: number = 0;

  /** The number of active heap allocations when the node started. */
  rtraceStart: number = 0;

  /** The number of active heap allocations when the node ended. */
  rtraceEnd: number = 0;

  /** If the TestNode ran. */
  ran: boolean = false;

  /** The delta number of heap allocations. */
  get rtraceDelta(): number {
    return this.rtraceEnd - this.rtraceStart;
  };

  /** Collect all the children of this node that are nested tests. */
  getTestChildren(ref: TestNode[] = []): TestNode[] {
    const children = this.children;
    for (let i = 0; i < children.length; i++) {
      const child = children[i];
      child.getTestChildren(ref);
      if (child.type === TestNodeType.Test) ref.push(child);
    }
    return ref;
  }

  visit(callback: (node: TestNode) => boolean | void): void {
    const children = this.children;
    for (let i = 0; i < children.length; i++) {
      const child = children[i];
      if (callback(child) !== false) child.visit(callback);
    }
  }

  get groupTodos(): string[] {
    return (<string[]>[]).concat.apply(this.todos, this.groupTests.map(e => e.todos));
  }

  get groupTests(): TestNode[] {
    const result: TestNode[] = [];
    this.visit((node): boolean | void => {
      if (node.type === TestNodeType.Test) {
        result.push(node);
      } else {
        return false;
      }
    });
    return result;
  }
}