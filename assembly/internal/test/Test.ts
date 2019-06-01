import { Collector } from "./Collector";
import { TestResult } from "./TestResult";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "debug") @global
export declare function debug(): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "testCanRun")
export declare function testCanRun(description: string): bool;

// @ts-ignore: Decorators *are* valid here!
@global @inline
export function todo(description: string): void {
  let group = Collector.currentGroup();
  group.todos.push(description);
}

// @ts-ignore: decorators *are* valid here
@global @inline
export function xit(description: string, callback: () => void): void {
  todo(description);
}

// @ts-ignore: decorators *are* valid here
@global @inline
export function xtest(description: string, callback: () => void): void {
  todo(description);
}

// @ts-ignore: decorators *are* valid here
@global
export function it(description: string, runner: () => void): void {
  let group = Collector.currentGroup();
  assert(group, "group is null");
  let canRun: bool = testCanRun(description);
  if (!canRun) return;
  let result = new TestResult();
  result.name = description;
  result.callback = runner;
  result.negated = 0;

  result.performanceEnabled = Collector.performanceEnabledValue;
  result.maxSamples = Collector.maxSamplesValue;
  result.maxTestRunTime = Collector.maxTestRunTimeValue;
  result.roundDecimalPlaces = Collector.roundDecimalPlacesValue;
  result.recordAverage = Collector.recordAverageValue;
  result.recordMedian = Collector.recordMedianValue;
  result.recordStdDev = Collector.recordStdDevValue;
  result.recordMax = Collector.recordMaxValue;
  result.recordMin = Collector.recordMinValue;
  result.recordVariance = Collector.recordVarianceValue;
  Collector.resetPerformanceValues();
  group.tests.push(result);
}

// @ts-ignore: decorators *are* valid here
@global @inline
export function test(description: string, runner: () => void): void {
  it(description, runner);
}

// @ts-ignore: decorators *are* valid here
@global @inline
export function beforeEach(callback: () => void): void {
  let currentGroup = Collector.currentGroup();
  currentGroup.beforeEach.push(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function beforeAll(callback: () => void): void {
  let currentGroup = Collector.currentGroup();
  currentGroup.beforeAll.push(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function afterEach(callback: () => void): void {
  let currentGroup = Collector.currentGroup();
  currentGroup.afterEach.push(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function afterAll(callback: () => void): void {
  let currentGroup = Collector.currentGroup();
  currentGroup.afterAll.push(callback);
}

// @ts-ignore: decorators *are* valid here
@global
export function throws(description: string, callback: () => void, message: string = ""): void {
  let group = Collector.currentGroup();
  let canRun: bool = testCanRun(description);
  if (!canRun) return;
  let result = new TestResult();
  result.name = description;
  result.callback = callback;
  result.negated = 1;
  result.message = message;

  result.performanceEnabled = Collector.performanceEnabledValue;
  result.maxSamples = Collector.maxSamplesValue;
  result.maxTestRunTime = Collector.maxTestRunTimeValue;
  result.roundDecimalPlaces = Collector.roundDecimalPlacesValue;
  result.recordAverage = Collector.recordAverageValue;
  result.recordMedian = Collector.recordMedianValue;
  result.recordStdDev = Collector.recordStdDevValue;
  result.recordMax = Collector.recordMaxValue;
  result.recordMin = Collector.recordMinValue;
  result.recordVariance = Collector.recordVarianceValue;
  Collector.resetPerformanceValues();

  group.tests.push(result);
}
