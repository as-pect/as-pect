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
    constructor(_options?: any);
    /**
     * This method reports a starting TestContext. This method can be called many times, but may
     * be instantiated once
     *
     * @param {TestContext} suite - The test context being started.
     */
    onStart(suite: TestContext): void;
    /**
     * This method reports a TestGroup is starting.
     *
     * @param {TestGroup} group - The started test group.
     */
    onGroupStart(group: TestGroup): void;
    /**
     * This method reports a completed TestGroup.
     *
     * @param {TestGroup} group - The finished TestGroup.
     */
    onGroupFinish(group: TestGroup): void;
    /** This method is a stub for onTestStart(). */
    onTestStart(_group: TestGroup, _test: TestResult): void;
    /**
     * This method reports a completed test.
     *
     * @param {TestGroup} _group - The TestGroup that the TestResult belongs to.
     * @param {TestResult} test - The finished TestResult
     */
    onTestFinish(_group: TestGroup, test: TestResult): void;
    /**
     * This method reports that a TestContext has finished.
     *
     * @param {TestContext} suite - The finished test context.
     */
    onFinish(suite: TestContext): void;
    /**
     * This method reports a todo to stdout.
     *
     * @param {TestGroup} _group - The test group the todo belongs to.
     * @param {string} todo - The todo.
     */
    onTodo(_group: TestGroup, todo: string): void;
    /**
     * A custom logger function for the default reporter that writes the log values using `console.log()`
     *
     * @param {LogValue} logValue - A value to be logged to the console
     */
    onLog(logValue: LogValue): void;
}
//# sourceMappingURL=DefaultTestReporter.d.ts.map