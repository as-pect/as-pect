import { TestNodeType } from "../util/TestNodeType.js";
import { IWarning } from "./IWarning.js";
import { ReflectedValue } from "../util/ReflectedValue.js";
import { timeDifference } from "../util/timeDifference.js";

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

  /** The node allocations. */
  allocations: number = 0;

  /** The node deallocations */
  frees: number = 0;

  /** The node reallocations. */
  moves: number = 0;

  /** The delta number of heap allocations. */
  get rtraceDelta(): number {
    return this.allocations - this.frees;
  }

  /** The difference between the start and end TestNode runtime. */
  get deltaT(): number {
    return timeDifference(this.end, this.start);
  }

  /**
   * Recursively visit this node's children conditionally. Return false to the callback
   * if you don't want to visit that particular node's children.
   */
  visit(callback: (node: TestNode) => boolean | void): void {
    const children = this.children;
    for (let i = 0; i < children.length; i++) {
      const child = children[i];
      if (callback(child) !== false) child.visit(callback);
    }
  }

  /** Get this group's todos, recursively. */
  get groupTodos(): string[] {
    return (<string[]>[]).concat.apply(
      this.todos,
      this.groupTests.map((e) => e.todos),
    );
  }

  /** Get this group's tests, recursively. */
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

  /** Get all the groups beneath this node. */
  get childGroups(): TestNode[] {
    const result: TestNode[] = [];
    this.visit((node) => {
      if (node.type === TestNodeType.Group) result.push(node);
    });
    return result;
  }
}
