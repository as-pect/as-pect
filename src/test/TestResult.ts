export class TestResult {
  /**
   * The actual test's name or description.
   */
  testName: string = "";
  /**
   * The indicator to see if the test passed.
   */
  pass: boolean = false;
  /**
   * The time in milliseconds indicating how long the test ran.
   */
  time: number = 0;
  /**
   * The reported actual value description.
   */
  actual: string = "";
  /**
   * The reported expected value description.
   */
  expected: string = "";
  /**
   * If the test failed, this is the message describing why the test failed.
   */
  message: string = "";
}
