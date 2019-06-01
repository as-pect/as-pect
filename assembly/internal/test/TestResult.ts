
import { noOp } from "../noOp";
import { TestGroup } from "./TestGroup";
import { ValueType, Expected, Actual } from "../value";

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "testStart")
declare function testStart(description: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "testFail")
declare function testFail(
  actualType: ValueType,
  actualValue: f64,
  actualReference: usize,
  actualOffset: i32,
  actualStack: i32,
  expectedType: ValueType,
  expectedValue: f64,
  expectedReference: usize,
  expectedOffset: i32,
  expectedStack: i32,
  negated: i32,
): void

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "testPass")
declare function testPass(
  times: f64[],
  performanceEnabled: bool,
  roundDecimalPlaces: i32,
  recordAverage: bool,
  recordMedian: bool,
  recordMax: bool,
  recordMin: bool,
  recordStdDev: bool,
  recordVariance: bool,
  negated: i32,
): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "now")
declare function now(): f64;

type Callback = () => void;

export class TestResult {
  public callback: Callback = noOp;
  public pass: bool = false;
  public negated: i32 = 0;
  public name: string = "";
  public message: string = "";
  public times: f64[] = new Array<f64>(0);

  // performance values
  public performanceEnabled: bool;
  public maxSamples: i32;
  public maxTestRunTime: i32;
  public roundDecimalPlaces: i32;
  public recordAverage: bool;
  public recordMedian: bool;
  public recordStdDev: bool;
  public recordMax: bool;
  public recordMin: bool;
  public recordVariance: bool;

  private start: f64;

  public run(group: TestGroup): bool {
    testStart(this.name);
    this.start = now();

    if (this.performanceEnabled) {
      let count: i32 = 0;

      while (count < this.maxSamples) {
        if (!this.runInstance(group)) return false;
        if (!this.pass) break;
        if (this.maxTestRunTime <= (now() - this.start)) break;
      }
    } else {
      if (!this.runInstance(group)) return false;
    }

    if (this.pass)  {
      this.passTest();
    } else {
      this.failTest();
    }

    // the groups did not error, always return true here
    return true;
  }

  @inline
  private runInstance(group: TestGroup): bool {
    // run beforeEach
    if (!group.runBeforeEach()) {
      this.pass = false;
      this.failTest();
      return false;
    }

    let runStart: f64 = now();
    this.pass = bool(this.negated ^ i32(tryCall(this.callback)));
    this.times.push(now() - runStart);

    if (!group.runAfterEach()) {
      this.pass = false;
      this.failTest();
      return false;
    }

    return true;
  }

  @inline
  private passTest(): void {
    testPass(
      this.times,
      this.performanceEnabled,
      this.roundDecimalPlaces,
      this.recordAverage,
      this.recordMedian,
      this.recordMax,
      this.recordMin,
      this.recordStdDev,
      this.recordVariance,
      this.negated,
    );
  }

  @inline
  private failTest(): void {
    testFail(
      Actual.type,
      Actual.value,
      Actual.reference,
      Actual.offset,
      Actual.stack,
      Expected.type,
      Expected.value,
      Expected.reference,
      Expected.offset,
      Expected.stack,
      this.negated,
    );
  }
}