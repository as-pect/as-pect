import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
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