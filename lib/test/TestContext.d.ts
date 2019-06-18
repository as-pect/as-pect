import { TestReporter } from "./TestReporter";
import { IAspectExports } from "../util/IAspectExports";
import { TestCollector, ITestCollectorParameters } from "./TestCollector";
import { IWritable } from "../reporter/IWriteable";
export interface ITestContextParameters extends ITestCollectorParameters {
    reporter?: TestReporter;
    stdout?: IWritable;
    stderr?: IWritable;
}
export declare class TestContext extends TestCollector {
    time: number;
    pass: boolean;
    startupTime: number;
    reporter: TestReporter;
    stdout: IWritable | null;
    stderr: IWritable | null;
    private endGroup;
    constructor(props?: ITestContextParameters);
    /**
     * Run the tests on the wasm module.
     */
    run(wasm: IAspectExports): void;
    private runGroup;
    /**
     * Run a given test.
     *
     * @param {RunContext} runContext - The current run context.
     * @param {TestGroup} group - The current run group.
     * @param {number} testIndex - The current test index.
     */
    private runTest;
    /**
     * Run the current test once and collect statistics.
     *
     * @param {RunContext} runContext - The current run context.
     * @param {TestGroup} group - The current test group.
     * @param {TestResult} result - The current test result.
     * @param {number} testIndex - The current test index.
     */
    private runTestCall;
    /**
     * Run the afterEach callbacks before running the test.
     *
     * @param {RunContext} runContext - The current run context.
     * @param {TestGroup} group - The current test group.
     * @param {TestResult} result - The current test result.
     */
    private runAfterEach;
    /**
     * Run the beforeEach callbacks before running the test.
     *
     * @param {RunContext} runContext - The current run context.
     * @param {TestGroup} group - The current test group.
     * @param {TestResult} result - The current test result.
     */
    private runBeforeEach;
    /**
     * Run the afterAll callbacks with the given runContext and group.
     *
     * @param {RunContext} runContext - The current run context.
     * @param {TestGroup} group - The current test group.
     */
    private runAfterAll;
    /**
     * Run the beforeAll callbacks with the given runContext and group.
     *
     * @param {RunContext} runContext - The current run context.
     * @param {TestGroup} group - The current test group.
     */
    private runBeforeAll;
}
//# sourceMappingURL=TestContext.d.ts.map