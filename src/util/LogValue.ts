import { TestResult } from "../test/TestResult";
import { TestGroup } from "../test/TestGroup";

export class LogValue {
  pointer: number = 0;
  offset: number = 0;
  bytes: number[] = [];
  message: string = "";
  stack: string = "";
  test: TestResult | null = null;
  group: TestGroup | null = null;
}
