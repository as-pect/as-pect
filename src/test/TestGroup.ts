import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";

export class TestGroup implements ILogTarget {
  public describePointers: number[] = [];

  // callback properties
  public beforeEachPointers: number[] = [];
  public afterEachPointers: number[] = [];
  public beforeAllPointers: number[] = [];
  public afterAllPointers: number[] = [];

  // test properties
  public testFunctionPointers: number[] = [];
  public testNamePointers: number[] = [];
  public testMessagePointers: number[] = [];
  public testThrows: boolean[] = [];

  // tests and todos
  public tests: TestResult[] = [];
  public todos: number[] = [];

  // logs
  public logs: LogValue[] = [];

  public name: string = "";
  public pass: boolean = true;
  public reason: string = "";
  public time: number = 0;

  public fork(): TestGroup {
    const forked = new TestGroup();
    forked.describePointers = this.describePointers.slice();
    forked.beforeEachPointers = this.beforeEachPointers.slice();
    forked.afterEachPointers = this.afterEachPointers.slice();
    forked.beforeAllPointers = this.beforeAllPointers.slice();
    forked.afterAllPointers = this.afterAllPointers.slice();
    return forked;
  }
}