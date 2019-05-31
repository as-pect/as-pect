import { TestGroup } from "./TestGroup";
import { TestResult } from "./TestResult";
export class Collector {

  public groups: TestGroup[] = new Array<TestGroup>(0);
  public groupStack: TestGroup[] = new Array<TestGroup>(0);
  public currentGroup: TestGroup | null = null;
  public currentTest: TestResult | null = null;
  public performanceEnabledValue: bool = false;
  public maxSamplesValue: i32 = 0;
  public maxTestRunTimeValue: i32 = 2000;
  public roundDecimalPlacesValue: i32 = 3;
  public recordAverageValue: bool = true;
  public recordMedianValue: bool = true;
  public recordStdDevValue: bool = false;
  public recordMaxValue: bool = false;
  public recordMinValue: bool = false;
  public recordVariance: bool = false;
}

// @ts-ignore: Decorators *are* valid here
@global
export let collector = new Collector();

export function __set_performanceEnabled(value: bool): void {
  collector.performanceEnabledValue = value;
}

export function __set_maxSamples(value: i32): void {
  collector.maxSamplesValue = value;
}

export function __set_maxTestRunTime(value: i32): void {
  collector.maxTestRunTimeValue = value;
}

export function __set_roundDecimalPlaces(value: i32): void {
  collector.roundDecimalPlacesValue = value;
}

export function __set_recordAverage(value: bool): void {
  collector.recordAverageValue = value;
}

export function __set_recordMedian(value: bool): void {
  collector.recordMedianValue = value;
}

export function __set_recordStdDev(value: bool): void {
  collector.recordStdDevValue = value;
}

export function __set_recordMax(value: bool): void {
  collector.recordMaxValue = value;
}

export function __set_recordMin(value: bool): void {
  collector.recordMinValue = value;
}

export function __set_recordVar(value: bool): void {
  collector.recordVariance = value;
}

