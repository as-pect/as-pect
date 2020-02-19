import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { HostValue } from "../util/HostValue";
/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export default class SummaryReporter extends TestReporter {
    private enableLogging;
    constructor(options?: any);
    onStart(): void;
    onGroupStart(): void;
    onGroupFinish(): void;
    onTestStart(): void;
    onTestFinish(): void;
    onTodo(): void;
    private stdout;
    /**
     * This method reports a test context is finished running.
     *
     * @param {TestContext} suite - The finished test suite.
     */
    onFinish(suite: TestContext): void;
    /**
     * A custom logger function for the default reporter that writes the log values using `console.log()`
     *
     * @param {HostValue} logValue - A value to be logged to the console
     */
    onLog(logValue: HostValue): void;
}
