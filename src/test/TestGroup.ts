import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";
import { IWarning } from "./IWarning";

/**
 * This test group class is designed with a data oriented layout in mind. Each test property is
 * represented by an array.
 */
export class TestGroup implements ILogTarget {
  /**
   * This is the set of function pointers that will be called before each test.
   */
  public beforeEachPointers: number[] = [];

  /**
   * This is the set of function pointers that will be called after each test.
   */
  public afterEachPointers: number[] = [];

  /**
   * This is the set of function pointers that will be called before each describe block.
   */
  public beforeAllPointers: number[] = [];

  /**
   * This is the set of function pointers that will be called after each describe block.
   */
  public afterAllPointers: number[] = [];

  /**
   * This is the list of tests that the `TestContext` ran for this group.
   */
  public tests: TestResult[] = [];

  /**
   * This is a list of "todos" that were collected for this group.
   */
  public todos: string[] = [];

  /**
   * This is the set of log values that were collected before and after the tests ran.
   */
  public logs: LogValue[] = [];

  /**
   * This is the name of the test.
   */
  public name: string = "";

  /**
   * This is a value indicating if the group's tests passed successfully.
   */
  public pass: boolean = true;

  /**
   * This is the reason that the group's tests did not pass.
   */
  public reason: string = "";

  /**
   * This is how long the group ran in ms.
   */
  public time: number = 0;

  /**
   * A value indicating if this test group should run.
   */
  public willRun: boolean = true;

  /**
   * The group start time.
   */
  public start: number = 0;
  /**
   * The group end time.
   */
  public end: number = 0;

  /**
   * If the test group did not error, this is the number of allocations that occurred durring the
   * the group's exection.
   */
  public allocationCount: number = 0;

  /**
   * If the test group did not error, this is the number of deallocations that occurred durring the
   * the group's exection.
   */
  public freeCount: number = 0;

  /**
   * If the test group did not error, this is the number of block decrements that occurred during
   * the group's exection.
   */
  public decrementCount: number = 0;

  /**
   * If the test group did not error, this is the number of block increments that occurred during
   * the group's exection.
   */
  public incrementCount: number = 0;

  /**
   * This is the number of allocations currently on the heap when the `TestGroup` execution starts.
   */
  public rtraceStart: number = 0;

  /**
   * If the test group completed, this is the number of allocations currently on the heap when the
   * `TestGroup` execution ends.
   */
  public rtraceEnd: number = 0;

  /**
   * If the test group completed, this is the delta number of allocations that occured during the
   * `TestGroup` execution.
   */
  public rtraceDelta: number = 0;

  /**
   * The parent describe context that contains callbacks that also apply to this context.
   */
  public parent: TestGroup | null = null;

  public children: TestGroup[] = [];

  /**
   * This method creates a new TestGroup that contains a reference to all of the current flow
   * functions of this `TestGroup`.
   */
  public fork(): TestGroup {
    const forked = new TestGroup();
    forked.parent = this;
    this.children.push(forked);
    return forked;
  }

  public errors: IWarning[] = [];

  /**
   * A set of warnings that were reported for this test.
   */
  public warnings: IWarning[] = [];
}
