import { LogValue } from "../util/LogValue";
import { ILogTarget } from "../util/ILogTarget";
import { TestResult } from "./TestResult";

/**
 * This test group class is designed with a data oriented layout in mind. Each test property is
 * represented by an array.
 */
export class TestGroup implements ILogTarget {
  public describePointers: number[] = [];

  // callback properties
  public beforeEachPointers: number[] = [];
  public afterEachPointers: number[] = [];
  public beforeAllPointers: number[] = [];
  public afterAllPointers: number[] = [];

  // test properties
  public testFunctionPointers: number[] = [];
  public testNames: string[] = [];
  public testMessages: string[] = [];
  public testThrows: boolean[] = [];

  // tests and todos
  public tests: TestResult[] = [];
  public todoPointers: number[] = [];
  public todos: string[] = [];

  // logs
  public logs: LogValue[] = [];

  public name: string = "";
  public pass: boolean = true;
  public reason: string = "";
  public time: number = 0;

  // individual test performance configurations
  public performanceEnabled: Array<boolean | undefined> = [];
  public maxSamples: Array<number | undefined> = [];
  public roundDecimalPlaces: Array<number | undefined> = [];
  public maxTestRuntime: Array<number | undefined> = [];
  public reportAverage: Array<boolean | undefined> = [];
  public reportMedian: Array<boolean | undefined> = [];
  public reportStandardDeviation: Array<boolean | undefined> = [];
  public reportMax: Array<boolean | undefined> = [];
  public reportMin: Array<boolean | undefined> = [];
  public reportVariance: Array<boolean | undefined> = [];

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
