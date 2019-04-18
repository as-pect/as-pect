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
  name: string = "";
  /** The indicator to see if the test passed. */
  pass: boolean = false;
  /** The time in milliseconds indicating how long the test ran for each run. */
  times: number[] = [];
  /** The reported actual value description. */
  actual: ActualValue | null = null;
  /** The reported expected value description. */
  expected: ActualValue | null = null;
  /** If the test failed, this is the message describing why the test failed. */
  message: string = "";
  /** A set of strings logged by the test itself. */
  logs: LogValue[] = [];
  /** The generated stack trace if the test errored. */
  stack: string | null = null;
  /** This value is set to true if the test is expected to throw. */
  negated: boolean = false;
  /** This value indicates if performance statistics were collected for this test. */
  performance: boolean = false;
  /** This value indicates if an average was calculated. */
  hasAverage: boolean = false;
  /** This is the average (mean) value. */
  average: number = 0;
  /** This value indicates if a max was calculated. */
  hasMax: boolean = false;
  /** This is the max time. */
  max: number = 0;
  /** This value indicates if a median value was calculated. */
  hasMedian: boolean = false;
  /** This is the calculated median time. */
  median: number = 0;
  /** This value indicates if a min value was calculated. */
  hasMin: boolean = false;
  /** This is the calculated min time. */
  min: number = 0;
  /** This value indicates if a standard deviation value was calculated. */
  hasStdDev: boolean = false;
  /** This is the calculated standard deviation of the times collected. */
  stdDev: number = 0;

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
    this.stdDev = Math.round(1000 * std(this.times, "biased"));
  }
}
