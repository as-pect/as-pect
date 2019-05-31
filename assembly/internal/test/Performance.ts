import { Collector } from "./Collector";

export const enum PerformanceLimits {
  MaxSamples = 10000,
  MaxTestRuntime = 5000,
  MinimumDecimalPlaces = 0,
};

// @ts-ignore decorators are valid here
@global
export function performanceEnabled(value: bool = true): void {
  Collector.performanceEnabledValue = value;
}

// @ts-ignore decorators are valid here
@global
export function maxSamples(value: i32): void {
  Collector.maxSamplesValue = min<i32>(value, PerformanceLimits.MaxSamples);
}

// @ts-ignore decorators are valid here
@global
export function maxTestRunTime(value: i32): void {
  Collector.maxTestRunTimeValue = min<i32>(value, PerformanceLimits.MaxTestRuntime);
}

// @ts-ignore decorators are valid here
@global
export function roundDecimalPlaces(value: i32): void {
  Collector.roundDecimalPlacesValue = min<i32>(value, PerformanceLimits.MinimumDecimalPlaces);
}

// @ts-ignore decorators are valid here
@global
export function reportAverage(value: bool = true): void {
  Collector.recordAverageValue = value;
}

// @ts-ignore decorators are valid here
@global
export function reportMedian(value: bool = true): void {
  Collector.recordMedianValue = value;
}

// @ts-ignore decorators are valid here
@global
export function reportStdDev(value: bool = true): void {
  Collector.recordStdDevValue = value;
}

// @ts-ignore decorators are valid here
@global
export function reportMax(value: bool = true): void {
  Collector.recordMaxValue = value;
}

// @ts-ignore decorators are valid here
@global
export function reportMin(value: bool = true): void {
  Collector.recordMinValue = value;
}

// @ts-ignore decorators are valid here
@global
export function reportVariance(value: bool = true): void {
  Collector.recordVarianceValue = value;
}
