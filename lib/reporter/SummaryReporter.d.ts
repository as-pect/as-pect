import { TestReporter } from "../test/TestReporter";
import { TestContext } from "../test/TestContext";
export declare class SummaryReporter extends TestReporter {
    onStart(): void;
    onGroupStart(): void;
    onGroupFinish(): void;
    onTestStart(): void;
    onTestFinish(): void;
    onTodo(): void;
    constructor();
    onFinish(suite: TestContext): void;
}
//# sourceMappingURL=SummaryReporter.d.ts.map