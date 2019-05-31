import { describe } from "./internal/test/Describe";
import { expect, Expectation } from "./internal/test/Expectation";
import { test, it, afterAll, afterEach, beforeAll, beforeEach, todo } from "./internal/test/Test";
import { log } from "./internal/log/log";
import {
  performanceEnabled,
  maxSamples,
  maxTestRunTime,
  roundDecimalPlaces,
  reportAverage,
  reportMedian,
  reportStdDev,
  reportMax,
  reportMin,
  reportVariance,
} from "./internal/test/Performance";
import {
  Collector,
  __set_performanceEnabled,
  __set_maxSamples,
  __set_maxTestRunTime,
  __set_roundDecimalPlaces,
  __set_recordAverage,
  __set_recordMedian,
  __set_recordStdDev,
  __set_recordMax,
  __set_recordMin,
  __set_recordVar,
} from "./internal/test/Collector";
import { TestGroup } from "./internal/test/TestGroup";
export {
  __set_performanceEnabled,
  __set_maxSamples,
  __set_maxTestRunTime,
  __set_roundDecimalPlaces,
  __set_recordAverage,
  __set_recordMedian,
  __set_recordStdDev,
  __set_recordMax,
  __set_recordMin,
  __set_recordVar,
};

export { __call } from "./internal/call";

// @ts-ignore: Decorators *are* valid here
@start
export function __init(): void {}

export function __run(): void {
  let groups = Collector.groups;
  if (!groups) return;
  let length = groups.length;
  let group: TestGroup;
  for (let i = 0; i < length; i++) {
    group = unchecked(groups[i]);
    group.run();
  }
}
