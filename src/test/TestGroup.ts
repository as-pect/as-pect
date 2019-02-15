import { TestResult } from "./TestResult";
import { LogValue } from "../util/LogValue";

export class TestGroup {
  /**
   * A pointer that points to the test suite name.
   */
  suiteNamePointer: number = -1;
  /**
   * A pointer that points to the beforeAll callback for this test group.
   */
  beforeAllPointer: number = -1;
  /**
   * A pointer that points to the beforeEach callback for this test group.
   */
  beforeEachPointer: number = -1;
  /**
   * A pointer that points to the afterEach callback for this test group.
   */
  afterEachPointer: number = -1;
  /**
   * A pointer that points to the afterAll callback for this test group.
   */
  afterAllPointer: number = -1;
  /**
   * A pointer[] that points to each test function.
   */
  testFunctionPointers: number[] = [];
  /**
   * A pointer[] that points to all the test names.
   */
  testNamePointers: number[] = [];
  /**
   * A count of how many successful tests ran in this test group.
   */
  successCount: number = 0;
  /**
   * A count of how many failed tests ran in this test group.
   */
  failCount: number = 0;
  /**
   * A count of how many tests ran in this test group. This may be different that the actual test
   * count because the test suite ends if any setup functions throw an error.
   */
  totalCount: number = 0;
  /**
   * A pointer array that points to the todo string references.
   */
  todoPointers: number[] = [];
  /**
   * The name of this test group. (e.g. `describe("test-group-name")`)
   */
  name: string = "";
  /**
   * A boolean which indicates if the test group passed.
   */
  pass: boolean = false;
  /**
   * How long the test group ran in milliseconds rounded to the nearest thousanth.
   */
  time: number = 0;
  /**
   * An array of test results.
   */
  results: TestResult[] = [];
  /**
   * A resolved list of todos.
   */
  todos: string[] = [];
  /**
   * The number of todo items.
   */
  todoCount: number = 0;
  /**
   * The reason this test group failed.
   */
  reason: string = "";
  /**
   * The logged items in the current testGroup.
   */
  log: LogValue[] = [];
}
