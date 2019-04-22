import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { ILogTarget } from "../util/ILogTarget";
import { std, mean, median } from "mathjs";

/**
 * This is the data class that contains all the data about each `test()` or `it()` function defined
 * in the `AssemblyScript` module.
 */
export class TestResult implements ILogTarget {
  /** The actual test's name or description. */
  public name: string = "";
  /** The indicator to see if the test passed. */
  public pass: boolean = false;
  /** The time in milliseconds indicating how long the test ran for each run. */
  public times: number[] = [];
  /** The reported actual value description. */
  public actual: ActualValue | null = null;
  /** The reported expected value description. */
  public expected: ActualValue | null = null;
  /** If the test failed, this is the message describing why the test failed. */
  public message: string = "";
  /** A set of strings logged by the test itself. */
  public logs: LogValue[] = [];
  /** The generated stack trace if the test errored. */
  public stack: string | null = null;
  /** This value is set to true if the test is expected to throw. */
  public negated: boolean = false;
  /** This value indicates if performance statistics were collected for this test. */
  public performance: boolean = false;
  /** This value indicates if an average was calculated. */
  public hasAverage: boolean = false;
  /** This is the average (mean) value. */
  public average: number = 0;
  /** This value indicates if a max was calculated. */
  public hasMax: boolean = false;
  /** This is the max time. */
  public max: number = 0;
  /** This value indicates if a median value was calculated. */
  public hasMedian: boolean = false;
  /** This is the calculated median time. */
  public median: number = 0;
  /** This value indicates if a min value was calculated. */
  public hasMin: boolean = false;
  /** This is the calculated min time. */
  public min: number = 0;
  /** This value indicates if a standard deviation value was calculated. */
  public hasStdDev: boolean = false;
  /** This is the calculated standard deviation of the times collected. */
  public stdDev: number = 0;

  /**
   * Caclculate the average value of the collected times.
   */
  public calculateAverage(): void {
    this.hasAverage = true;
    this.average = Math.round(1000 * mean(this.times)) / 1000;
  }

  /**
   * Calculate the max time of the collected times.
   */
  public calculateMax(): void {
    this.hasMax = true;
    this.max = Math.max(...this.times);
  }

  /**
   * Calculate the median value of the collected times.
   */
  public calculateMedian(): void {
    this.hasMedian = true;
    this.median = Math.round(1000 * median(this.times)) / 1000;
  }

  /**
   * Calculate the min value of the collected times.
   */
  public calculateMin(): void {
    this.hasMin = true;
    this.min = Math.min(...this.times);
  }

  /**
   * Calculate the standard deviation of the collected times.
   */
  public calculateStandardDeviation(): void {
    this.hasStdDev = true;
    this.stdDev = Math.round(1000 * std(this.times, "biased")) / 1000;
  }
}
