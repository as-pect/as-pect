// @ts-ignore: Decorators *are* valid here
@external("__aspect", "groupStart")
declare function groupStart(description: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "reportTodo")
declare function reportTodo(description: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "groupEnd")
declare function groupEnd(pass: bool): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

import { TestResult } from "./TestResult";

type Callback = () => void;

export class TestGroup {
  public name: string;
  public beforeAll: Callback[];
  public afterAll: Callback[];
  public beforeEach: Callback[];
  public afterEach: Callback[];
  public tests: TestResult[];
  public todos: string[];

  public parent: TestGroup | null;

  public constructor(name: string = "", parent: TestGroup | null = null) {
    this.beforeAll = new Array<Callback>(0);
    this.afterAll = new Array<Callback>(0);
    this.beforeEach = new Array<Callback>(0);
    this.afterEach = new Array<Callback>(0);
    this.tests = new Array<TestResult>(0);
    this.todos = new Array<string>(0);

    if (parent) {
      this.name = parent.name + " " + name;
      this.parent = parent;
    } else {
      this.name = name;
    }
  }

  public run(): void {
    groupStart(this.name);
    let todos = this.todos;
    let length = todos.length;

    for (let i = 0; i < length; i++) {
      reportTodo(todos[i]);
    }

    if (!this.runBeforeAll()) {
      groupEnd(false);
      return;
    }

    let test: TestResult;
    let tests = this.tests;
    length = tests.length;
    assert(tests, "tests are null");
    for (let i = 0; i < length; i++) {
      test = tests[i];
      assert(test, "test is null");

      if (!test.run(this)) {
        groupEnd(false);
        return;
      }
    }

    groupEnd(!this.runAfterAll());
  }

  /**
   * Call every beforeAll function in the groups context (parents first), then return false if an
   * error occurred.
   */
  public runBeforeAll(): bool {
    if (this.parent) {
      if (!this.parent.runBeforeAll()) return false;
    }

    let callback: Callback;
    let beforeAll = this.beforeAll;
    let length = beforeAll.length;

    for (let i = 0; i < length; i++) {
      callback = unchecked(beforeAll[i]);
      if (!tryCall(callback)) return false;
    }
    return true;
  }

  /**
   * Call every afterAll function in the groups context (parents first), then return false if an
   * error occurred.
   */
  public runBeforeEach(): bool {
    if (this.parent) {
      if (!this.parent.runBeforeEach()) return false;
    }

    let callback: Callback;
    let beforeEach = this.beforeEach;
    let length = beforeEach.length;

    for (let i = 0; i < length; i++) {
      callback = unchecked(beforeEach[i]);
      if (!tryCall(callback)) return false;
    }

    return true;
  }

  /**
   * Call every afterAll function in the groups context (parents first), then return false if an
   * error occurred.
   */
  public runAfterAll(): bool {
    if (this.parent) {
      if (!this.parent.runAfterAll()) return false;
    }

    let callback: Callback;
    let afterAll = this.afterAll;
    let length = afterAll.length;

    for (let i = 0; i < length; i++) {
      callback = unchecked(afterAll[i]);
      if (!tryCall(callback)) return false;
    }
    return true;
  }

  /**
   * Call every afterEach function in the groups context (parents first), then return false if an
   * error occurred.
   */
  public runAfterEach(): bool {
    if (this.parent) {
      if (!this.parent.runAfterEach()) return false;
    }

    let callback: Callback;
    let afterEach = this.afterEach;
    let length = afterEach.length;

    for (let i = 0; i < length; i++) {
      callback = unchecked(afterEach[i]);
      if (!tryCall(callback)) return false;
    }
    return true;
  }
}
