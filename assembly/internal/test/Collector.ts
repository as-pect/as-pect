// @ts-ignore: Decorators *are* valid here
@external("__aspect", "groupCanRun")
declare function groupCanRun(description: string): bool;

import { TestGroup } from "./TestGroup";
import { TestResult } from "./TestResult";

export class Collector {
  public static groups: TestGroup[];
  private static groupStack: TestGroup[];
  public static currentTest: TestResult | null = null;

  public static performanceEnabledConfigurationValue: bool;
  public static maxSamplesConfigurationValue: i32;
  public static maxTestRunTimeConfigurationValue: i32;
  public static roundDecimalPlacesConfigurationValue: i32;
  public static recordAverageConfigurationValue: bool;
  public static recordMedianConfigurationValue: bool;
  public static recordStdDevConfigurationValue: bool;
  public static recordMaxConfigurationValue: bool;
  public static recordMinConfigurationValue: bool;
  public static recordVarianceConfigurationValue: bool;

  public static performanceEnabledValue: bool;
  public static maxSamplesValue: i32;
  public static maxTestRunTimeValue: i32;
  public static roundDecimalPlacesValue: i32;
  public static recordAverageValue: bool;
  public static recordMedianValue: bool;
  public static recordStdDevValue: bool;
  public static recordMaxValue: bool;
  public static recordMinValue: bool;
  public static recordVarianceValue: bool;

  /**
   * Get the currentGroup on the top of the stack.
   */
  @inline
  public static currentGroup(): TestGroup {
    if (!Collector.groupStack) Collector.groupStack = new Array<TestGroup>(0);
    if (Collector.groupStack.length == 0) Collector.groupStack.push(new TestGroup("", null));
    let stack = Collector.groupStack;
    let length = stack.length;
    assert(length != 0, "Internal as-pect Error: Group stack is empty.");
    return unchecked(stack[length - 1]);
  }

  /**
   * Push the test group to the stack.
   *
   * @param {TestGroup} group - The test group to be pushed to the stack.
   */
  @inline
  public static push(group: TestGroup): void {
    assert(Collector.groupStack, "groupStack is null");
    Collector.groupStack.push(group);
  }

  /**
   * Pop the test group off of the stack and into the group queue.
   */
  @inline
  public static pop(): void {
    if (!Collector.groups) {
      Collector.groups = new Array<TestGroup>(0);
    }
    let group = Collector.groupStack.pop();
    let canRun = groupCanRun(group.name);
    if (canRun && group.tests.length > 0) Collector.groups.push(group);
  }

  /**
   * Reset all the performance values.
   */
  @inline
  public static resetPerformanceValues(): void {
    Collector.performanceEnabledValue = Collector.performanceEnabledConfigurationValue;
    Collector.maxSamplesValue = Collector.maxSamplesConfigurationValue;
    Collector.maxTestRunTimeValue = Collector.maxTestRunTimeConfigurationValue;
    Collector.roundDecimalPlacesValue = Collector.roundDecimalPlacesConfigurationValue;
    Collector.recordAverageValue = Collector.recordAverageConfigurationValue;
    Collector.recordMedianValue = Collector.recordMedianConfigurationValue;
    Collector.recordStdDevValue = Collector.recordStdDevConfigurationValue;
    Collector.recordMaxValue = Collector.recordMaxConfigurationValue;
    Collector.recordMinValue = Collector.recordMinConfigurationValue;
    Collector.recordVarianceValue = Collector.recordVarianceConfigurationValue;
  }
}

export function __set_performanceEnabled(value: bool): void {
  Collector.performanceEnabledConfigurationValue = value;
}

export function __set_maxSamples(value: i32): void {
  Collector.maxSamplesConfigurationValue = value;
}

export function __set_maxTestRunTime(value: i32): void {
  Collector.maxTestRunTimeConfigurationValue = value;
}

export function __set_roundDecimalPlaces(value: i32): void {
  Collector.roundDecimalPlacesConfigurationValue = value;
}

export function __set_recordAverage(value: bool): void {
  Collector.recordAverageConfigurationValue = value;
}

export function __set_recordMedian(value: bool): void {
  Collector.recordMedianConfigurationValue = value;
}

export function __set_recordStdDev(value: bool): void {
  Collector.recordStdDevConfigurationValue = value;
}

export function __set_recordMax(value: bool): void {
  Collector.recordMaxConfigurationValue = value;
}

export function __set_recordMin(value: bool): void {
  Collector.recordMinConfigurationValue = value;
}

export function __set_recordVar(value: bool): void {
  Collector.recordVarianceConfigurationValue = value;
}
