import { Reporter } from "./Reporter";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestSuite } from "../test/TestSuite";
export declare class DefaultReporter extends Reporter {
    onStart(suite: TestSuite): void;
    onGroupStart(group: TestGroup): void;
    onGroupFinish(group: TestGroup): void;
    onTestStart(_group: TestGroup, _test: TestResult): void;
    onTestFinish(_group: TestGroup, test: TestResult): void;
    onFinish(suite: TestSuite): void;
    onTodo(_group: TestGroup, todo: string): void;
    onLog(_result: TestResult | null, logValue: string): void;
}
//# sourceMappingURL=DefaultReporter.d.ts.map