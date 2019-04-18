import { ASUtil } from "assemblyscript/lib/loader";
import { TestGroup } from "./TestGroup";
import { TestReporter } from "./TestReporter";
import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
export declare class TestContext {
    reporter: TestReporter;
    file: string;
    performanceConfiguration: IPerformanceConfiguration;
    private groupStack;
    testGroups: TestGroup[];
    private logTarget;
    private wasm;
    private stack;
    private message;
    private actual;
    private expected;
    time: number;
    pass: boolean;
    private performanceEnabledValue;
    private minSamplesValue;
    private maxSamplesValue;
    private minTestRunTimeValue;
    private maxTestRunTimeValue;
    private recordAverageValue;
    private recordMedianValue;
    private recordStdDevValue;
    private recordMaxValue;
    private recordMinValue;
    constructor(reporter?: TestReporter, file?: string, performanceConfiguration?: IPerformanceConfiguration);
    /**
     * Run the tests on the wasm module.
     */
    run(wasm: ASUtil): void;
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
    /**
     * This method creates a WebAssembly imports object with all the TestContext functions
     * bound to the TestContext.
     *
     * @param {any[]} imports - Every import item specified.
     */
    createImports(...imports: any[]): any;
    /**
     * This web assembly linked function creates a test group. It's called when the test suite calls
     * the describe("test", callback) function from within AssemblyScript. It receives a pointer to
     * the description of the tests, forks the top level test group, pushes the suiteName to a list,
     * then pushes the forked group to the top of the test context stack.
     *
     * @param {number} suiteNamePointer
     */
    private reportDescribe;
    /**
     * This web assembly linked function finishes a test group. It's called when the test suite calls
     * the describe("test", callback) function from within AssemblyScript. It pops the current
     * test group from the test context stack and pushes it to the final test group list.
     */
    private reportEndDescribe;
    /**
     * This web assembly linked function sets the group's "beforeEach" callback pointer to
     * the current groupStackItem.
     *
     * @param {number} callbackPointer - The callback that should run before each test.
     */
    private reportBeforeEach;
    /**
     * This web assembly linked function adds the group's "beforeAll" callback pointer to
     * the current groupStackItem.
     *
     * @param {number} callbackPointer - The callback that should run before each test in the
     * current context.
     */
    private reportBeforeAll;
    /**
     * This web assembly linked function sets the group's "afterEach" callback pointer.
     *
     * @param {number} callbackPointer - The callback that should run before each test group.
     */
    private reportAfterEach;
    /**
     * This web assembly linked function adds the group's "afterAll" callback pointer to
     * the current groupStackItem.
     *
     * @param {number} callbackPointer - The callback that should run before each test in the
     * current context.
     */
    private reportAfterAll;
    /**
     * This is a web assembly utility function that wraps a function call in a try catch block to
     * report success or failure.
     *
     * @param {number} pointer - The function pointer to call. It must accept no parameters and return
     * void.
     * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
     * returns 0.
     */
    private tryCall;
    /**
     * This adds a logged string to the current test.
     *
     * @param {number} pointer - The pointer to the logged string reference.
     */
    private logString;
    /**
     * Log a reference to the reporter.
     *
     * @param {number} referencePointer - The pointer to the reference.
     * @param {number} offset - The offset of the reference.
     */
    private logReference;
    /**
     * Log a numevalueric value to the reporter.
     *
     * @param {number} value - The value to be logged.
     */
    private logValue;
    /**
     * Log a null value to the reporter.
     */
    private logNull;
    /**
     * Gets a log stack trace.
     */
    private getLogStackTrace;
    /**
     * Gets an error stack trace.
     */
    private getErrorStackTrace;
    /**
     * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
     */
    private debug;
    /**
     * This web assembly linked function creates a test from the callback and the testNamePointer in
     * the current group. It assumes that the group has already been created with the describe
     * function. It is called when `it("description", callback)` or `test("description", callback)`
     * is called.
     *
     * @param {number} testNamePointer - The test's name pointer.
     * @param {number} callback - The test's function.
     */
    private reportTest;
    /**
     * This web assembly linked function is responsible for reporting tests that are expected
     * to fail. This is useful for verifying that specific application states will throw.
     *
     * @param {number} testNamePointer - The test's name pointer.
     * @param {number} callback - The test's function.
     * @param {number} message - The message associated with this test if it does not throw.
     */
    private reportNegatedTest;
    /**
     * This function reports a single "todo" item in a test suite.
     *
     * @param {number} todoPointer - The todo description string pointer.
     */
    private reportTodo;
    /**
      * This function is called after each expectation if the expectation passes. This prevents other
      * unreachable() conditions that throw errors to report actual and expected values too.
      */
    private clearExpected;
    /**
     * This function reports an actual null value.
     */
    private reportActualNull;
    /**
     * This function reports an expected null value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedNull;
    /**
     * This function reports an actual numeric value.
     *
     * @param {number} numericValue - The value to be expected.
     */
    private reportActualValue;
    /**
     * This function reports an expected numeric value.
     *
     * @param {number} numericValue - The value to be expected
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedValue;
    /**
     * This function reports an actual reference value.
     *
     * @param {number} referencePointer - The actual reference pointer.
     * @param {number} offset - The size of the reference in bytes.
     */
    private reportActualReference;
    /**
     * This function reports an expected reference value.
     *
     * @param {number} referencePointer - The expected reference pointer.
     * @param {number} offset - The size of the reference in bytes.
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedReference;
    /**
     * This function reports an expected truthy value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedTruthy;
    /**
     * This function reports an expected falsy value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedFalsy;
    /**
     * This function reports an expected finite value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedFinite;
    /**
     * This function reports an actual string value.
     *
     * @param {number} stringPointer - A pointer that points to the actual string.
     */
    private reportActualString;
    /**
     * This function reports an expected string value.
     *
     * @param {number} stringPointer - A pointer that points to the expected string.
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedString;
    /**
     * This function overrides the provided AssemblyScript `env.abort()` function to catch abort
     * reasons.
     *
     * @param {number} reasonPointer - This points to the message value that causes the expectation to
     * fail.
     * @param {number} _fileNamePointer - The file name that reported the error. (Ignored)
     * @param {number} _line - The line that reported the error. (Ignored)
     * @param {number} _col - The column that reported the error. (Ignored)
     */
    private abort;
    /**
     * Reset all the performance values to the configured values.
     */
    private resetPerformanceValues;
    /**
     * This web assembly linked function modifies the state machine to enable
     * performance for the following test.
     *
     * @param {1 | 0} value - A value indicating if performance should be enabled.
     */
    private performanceEnabled;
    /**
     * This web assembly linked function modifies the state machine to set the minimum number of
     * samples for the following test.
     *
     * @param {number} value - The minimum number of samples to collect for the following test.
     */
    private minSamples;
    /**
     * This web assembly linked function modifies the state machine to set the maximum number of
     * samples for the following test.
     *
     * @param {number} value - The maximum number of samples to collect for the following test.
     */
    private maxSamples;
    /**
     * This web assembly linked function modifies the state machine to set the minimum amount of
     * time to run the following test in milliseconds
     *
     * @param {number} value - The minimum number of milliseconds to run the following test.
     */
    private minTestRunTime;
    /**
     * This web assembly linked function modifies the state machine to set the maximum amount of
     * time to run the following test in milliseconds
     *
     * @param {number} value - The maximum number of milliseconds to run the following test.
     */
    private maxTestRunTime;
    /**
     * This web assembly linked function modifies the state machine to cause the next test to report
     * an average run time.
     *
     * @param {1 | 0} value - A boolean indicating if the average should be reported.
     */
    private reportAverage;
    /**
     * This web assembly linked function modifies the state machine to cause the next test to report
     * an median run time.
     *
     * @param {1 | 0} value - A boolean indicating if the median should be reported.
     */
    private reportMedian;
    /**
     * This web assembly linked function modifies the state machine to cause the next test to report
     * a standard deviation calculation on the run times.
     *
     * @param {1 | 0} value - A boolean indicating if the standard deviation should be reported.
     */
    private reportStdDev;
    /**
     * This web assembly linked function modifies the state machine to cause the next test to report
     * the maximum run time for this test.
     *
     * @param {1 | 0} value - A boolean indicating if the max should be reported.
     */
    private reportMax;
    /**
     * This web assembly linked function modifies the state machine to cause the next test to report
     * the minimum run time for this test.
     *
     * @param {1 | 0} value - A boolean indicating if the min should be reported.
     */
    private reportMin;
}
//# sourceMappingURL=TestContext.d.ts.map