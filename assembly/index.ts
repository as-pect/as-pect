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
  collector,
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
  __set_recordVar
};

export { __call } from "./internal/call";

// @ts-ignore: Decorators *are* valid here

export function __run(): void {
  //todo: run all the tests
}
