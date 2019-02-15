import { Reporter } from "./Reporter";
import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestSuite } from "../test/TestSuite";
import { LogValue } from "../util/LogValue";
export declare class DefaultReporter extends Reporter {
    onStart(suite: TestSuite): void;
    onGroupStart(group: TestGroup): void;
    onGroupFinish(group: TestGroup): void;
    onTestStart(_group: TestGroup, _test: TestResult): void;
    onTestFinish(_group: TestGroup, test: TestResult): void;
    onFinish(suite: TestSuite): void;
    onTodo(_group: TestGroup, todo: string): void;
    onLog(logValue: LogValue): void;
}
//# sourceMappingURL=DefaultReporter.d.ts.map