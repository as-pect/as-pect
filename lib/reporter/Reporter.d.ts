import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestSuite } from "../test/TestSuite";
export declare abstract class Reporter {
    abstract onStart(suite: TestSuite): void;
    abstract onGroupStart(group: TestGroup): void;
    abstract onGroupFinish(group: TestGroup): void;
    abstract onTestStart(group: TestGroup, test: TestResult): void;
    abstract onTestFinish(group: TestGroup, test: TestResult): void;
    abstract onFinish(suite: TestSuite): void;
}
//# sourceMappingURL=Reporter.d.ts.map