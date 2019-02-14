import { TestResult } from "./TestResult";

export class TestGroup {
  suiteNamePointer: number = -1;
  beforeAll: number = -1;
  beforeEach: number = -1;
  testFunctionPointers: number[] = [];
  testNamePointers: number[] = [];
  success: number = 0;
  fail: number = 0;
  total: number = 0;

  afterEach: number = -1;
  afterAll: number = -1;
  todoPointers: number[] = [];
  name: string = "";
  pass: boolean = false;
  time: number = 0;
  results: TestResult[] = [];
  todos: string[] = [];
  reason: string = "";
}
