import { describe } from "./internal/Describe";
import { expect, Expectation } from "./internal/Expectation";
import { test, it, afterAll, afterEach, beforeAll, beforeEach, todo } from "./internal/Test";
import { log } from "./internal/log";
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
} from "./internal/performance";
export { __call } from "./internal/call";

// @ts-ignore: Decorators *are* valid here
@start
export function __main(): void {}
