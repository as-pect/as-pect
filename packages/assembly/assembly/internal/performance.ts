// @ts-ignore decorators are valid here
@external("__aspect", "performanceEnabled")
export declare function performanceEnabled(value: bool): void;

// @ts-ignore decorators are valid here
@external("__aspect", "maxSamples")
export declare function maxSamples(value: f64): void;

// @ts-ignore decorators are valid here
@external("__aspect", "maxTestRunTime")
export declare function maxTestRunTime(value: f64): void;

// @ts-ignore decorators are valid here
@external("__aspect", "roundDecimalPlaces")
export declare function roundDecimalPlaces(value: i32): void;

// @ts-ignore decorators are valid here
@external("__aspect", "reportAverage")
export declare function reportAverage(value: bool): void;

// @ts-ignore decorators are valid here
@external("__aspect", "reportMedian")
export declare function reportMedian(value: bool): void;

// @ts-ignore decorators are valid here
@external("__aspect", "reportStdDev")
export declare function reportStdDev(value: bool): void;

// @ts-ignore decorators are valid here
@external("__aspect", "reportMax")
export declare function reportMax(value: bool): void;

// @ts-ignore decorators are valid here
@external("__aspect", "reportMin")
export declare function reportMin(value: bool): void;

// @ts-ignore decorators are valid here
@external("__aspect", "reportVariance")
export declare function reportVariance(value: bool): void;

@global
export class Performance {
  public static enabled(value: bool): void {
    performanceEnabled(value);
  }

  public static maxSamples(value: f64): void {
    maxSamples(value);
  }

  public static maxTestRunTime(value: f64): void {
    maxTestRunTime(value);
  }

  public static roundDecimalPlaces(value: i32): void {
    roundDecimalPlaces(value);
  }

  public static reportAverage(value: bool): void {
    reportAverage(value);
  }

  public static reportMedian(value: bool): void {
    reportMedian(value);
  }

  public static reportStdDev(value: bool): void {
    reportStdDev(value);
  }

  public static reportMax(value: bool): void {
    reportMax(value);
  }

  public static reportMin(value: bool): void {
    reportMin(value);
  }

  public static reportVariance(value: bool): void {
    reportVariance(value);
  }
}
