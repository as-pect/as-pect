// @ts-ignore: Decorators *are* valid here
@external("__aspect", "testFail")
declare function testFail(): void

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "testStart")
declare function testStart(description: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "testPass")
declare function testPass(): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "now")
declare function now(): f64;


import { noOp } from "../noOp";
import { TestGroup } from "./TestGroup";
type Callback = () => void;

export class TestResult {
  public callback: Callback = noOp;
  public pass: bool = false;
  public negated: bool = false;
  public name: string = "";
  public message: string = "";

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

  public run(group: TestGroup): bool {
    let pass: bool = false;
    let times: f64[] = new Array<f64>(0);
    testStart(this.name);
    let start: f64 = now();

    if (this.performanceEnabled) {
      times = new Array<f64>(0);
      let count: i32 = 0;

      while (true) {

      }
    } else {
      // run beforeEach
      if (!group.runBeforeEach()) {
        testFail();
        return false;
      }

      pass = bool(i32(this.negated) ^ i32(tryCall(this.callback)));

      if (!group.runAfterEach()) {
        testFail();
        return false;
      }

      times.push(now() - start);
    }

    if (pass)  {
      testPass(
        times,
        this.performanceEnabled,
        this.maxSamples,
        this.maxTestRunTime,
        this.roundDecimalPlaces,
        this.recordAverage,
        this.recordMedian,
        this.recordStdDev,
        this.recordMax,
        this.recordMin,
        this.recordVariance,
      );
    } else {
      testFail();
    }

    // the groups did not error, always return true here
    return true;
  }
}