/// <reference path="../node_modules/assemblyscript/std/assembly/rt/index.d.ts" />

import { describe } from "./internal/Describe";
import { expect, Expectation } from "./internal/Expectation";
import {
  test,
  it,
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  todo,
  throws,
  itThrows,
  debug,
  xit,
  xtest,
} from "./internal/Test";
import { log } from "./internal/log";
import { RTrace } from "./internal/RTrace";
import { Expected } from "./internal/report/reportExpected";
export { __call } from "./internal/call";
export { __sendActual } from "./internal/report/reportActual";
export { __sendExpected } from "./internal/report/reportExpected";
export { __ignoreLogs } from "./internal/log";
export { __disableRTrace, __getUsizeArrayId } from "./internal/RTrace";
import { Performance } from "./internal/performance";
export function __ready(): void {
  Expected.ready = true;
}

export { __cleanup } from "./internal/Expectation";