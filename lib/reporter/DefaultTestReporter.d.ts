import { TestGroup } from "../test/TestGroup";
import { TestResult } from "../test/TestResult";
import { TestContext } from "../test/TestContext";
import { LogValue } from "../util/LogValue";
import { TestReporter } from "../test/TestReporter";
import { IWritable } from "./IWriteable";
/**
 * This is the default test reporter class for the `asp` command line application. It will pipe
 * all relevant details about each tests to the `stdout` WriteStream.
 */
export declare class DefaultTestReporter extends TestReporter {
    protected stdout: IWritable | null;
    onStart(suite: TestContext): void;
    onGroupStart(group: TestGroup): void;
    onGroupFinish(group: TestGroup): void;
    onTestStart(_group: TestGroup, _test: TestResult): void;
    onTestFinish(_group: TestGroup, test: TestResult): void;
    onFinish(suite: TestContext): void;
    onTodo(_group: TestGroup, todo: string): void;
    /**
     * A custom logger function for the default reporter that writes the log values using `console.log()`
     *
     * @param {LogValue} logValue - A value to be logged to the console
     */
    onLog(logValue: LogValue): void;
}
//# sourceMappingURL=DefaultTestReporter.d.ts.map