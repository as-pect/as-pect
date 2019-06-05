import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
/**
 * This test reporter should be used when logging output and test validation only needs happen on
 * the group level. It is useful for CI builds and also reduces IO output to speed up the testing
 * process.
 */
export declare class SummaryTestReporter extends TestReporter {
    onStart(): void;
    onGroupStart(): void;
    onGroupFinish(): void;
    onTestStart(): void;
    onTestFinish(): void;
    onTodo(): void;
    constructor();
    onFinish(suite: TestContext): void;
}
//# sourceMappingURL=SummaryTestReporter.d.ts.map