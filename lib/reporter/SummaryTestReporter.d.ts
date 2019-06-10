import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
import { LogValue } from "../util/LogValue";
/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export declare class SummaryTestReporter extends TestReporter {
    private enableLogging;
    constructor(options: any);
    onStart(): void;
    onGroupStart(): void;
    onGroupFinish(): void;
    onTestStart(): void;
    onTestFinish(): void;
    onTodo(): void;
    private stdout;
    onFinish(suite: TestContext): void;
    /**
     * A custom logger function for the default reporter that writes the log values using `console.log()`
     *
     * @param {LogValue} logValue - A value to be logged to the console
     */
    onLog(logValue: LogValue): void;
}
//# sourceMappingURL=SummaryTestReporter.d.ts.map