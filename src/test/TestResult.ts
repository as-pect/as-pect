import { LogValue } from "../util/LogValue";
import { ActualValue } from "../util/ActualValue";
import { ILogTarget } from "../util/ILogTarget";
import { mean, median, var as variance, round } from "mathjs";
import { PerformanceLimits } from "./PerformanceLimits";

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
  /** This value indicates the maximum number of samples to collect. */
  public maxSamples: number = PerformanceLimits.MaxSamples;
  /** This value indicates the maximum test runtime. */
  public maxRuntime: number = PerformanceLimits.MaxTestRuntime;
  /** The number of decimal places used for rounding. */
  public decimalPlaces: number = PerformanceLimits.MinimumDecimalPlaces;
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
  /** This value indicated if a min value was calculated. */
  public hasMin: boolean = false;
  /** This calculated minimum value of the times collected.. */
  public min: number = 0;
  /** This value indicates if a standard deviation value was calculated. */
  public hasStdDev: boolean = false;
  /** The calculated standard deviation of the times collected. */
  public stdDev: number = 0;
  /** A boolean indicating if the variance was calcluated. */
  public hasVariance: boolean = false;
  /** The raw variance calculation before rounding was applied. */
  public rawVariance: number =  0;
  /** This value indicates the calculated variance used for standard deviation calculations. */
  public variance: number = 0;
  /** This is the timestamp for when the test started in milliseconds. */
  public start: number = 0;
  /** This is the timestamp for when the test ended in milliseconds. */
  public end: number = 0;
  /** This is the run time for the test in milliseconds. */
  public runTime: number = 0;

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
    this.median = round(median(this.times), this.decimalPlaces) as number;
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
    if (!this.hasVariance) {
      this.calculateVariance();
    }
    this.hasStdDev = true;
    this.stdDev = round(Math.sqrt(this.rawVariance), this.decimalPlaces) as number;
  }

  /**
   * Calculate the variance.
   */
  public calculateVariance(): void {
    if (this.hasVariance) return;
    this.hasVariance = true;
    this.rawVariance = variance(this.times, "biased");
    this.variance = round(this.rawVariance, this.decimalPlaces) as number;
  }
}
