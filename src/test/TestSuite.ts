import { TestGroup } from "./TestGroup";

export class TestSuite {
  /**
   * All the test groups in this test suite.
   */
  testGroups: TestGroup[] = [];
  /**
   * The total number tests run in this test suite.
   */
  totalTests: number = 0;
  /**
   * The total number test successes in this test suite.
   */
  successCount: number = 0;
  /**
   * The total number of test fails in this test suite.
   */
  failCount: number = 0;
  /**
   * The total number to todos left to complete in this test suite.
   */
  todoCount: number = 0;
  /**
   * The test suite filename.
   */
  filename: string = "";
  /**
   * The total time it took for this test suite to run in milliseconds rounded to the nearest
   * thousandth.
   */
  time: number = 0;
  /**
   * An indicator if the test suite passed.
   */
  pass: boolean = false;
}
