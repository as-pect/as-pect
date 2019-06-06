import { TestContext } from "./TestContext";
import { TestGroup } from "./TestGroup";
import { TestResult } from "./TestResult";

/**
 * This is the abstract shape of a `TestReporter`. It can be extended to create a `TestReporter`.
 */
export abstract class TestReporter {
  /**
   * A function that is called when a test suite starts.
   *
   * @param {TestSuite} suite - The started test suite.
   */
  public abstract onStart(suite: TestContext): void;

  /**
   * A function that is called when a test group starts.
   *
   * @param {TestGroup} group - The started test group.
   */
  public abstract onGroupStart(group: TestGroup): void;

  /**
   * A function that is called when a test group ends.
   *
   * @param {TestGroup} group - The ended test group.
   */
  public abstract onGroupFinish(group: TestGroup): void;


  /**
   * A function that is called when a test starts.
   *
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The generated test result reference that will be used for the test.
   */
  public abstract onTestStart(group: TestGroup, result: TestResult): void;

  /**
   * A function that is called when a test ends.
   *
   * @param {TestGroup} group - The current test group.
   * @param {TestResult} result - The generated test result reference.
   */
  public abstract onTestFinish(group: TestGroup, result: TestResult): void;

  /**
   * A function that is called when a test suite ends.
   *
   * @param {TestSuite} suite - The ended test suite.
   */
  public abstract onFinish(suite: TestContext): void;

  /**
   * A function that is called when a test group reports a "todo" item.
   *
   * @param {TestGroup} group - The current test group.
   * @param {string} todo - The todo description.
   */
  public abstract onTodo(group: TestGroup, todo: string): void;
}
