import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";
import { ActualValue } from "../util/ActualValue";
import { TestGroup } from "./TestGroup";
import { ILogTarget } from "../util/ILogTarget";
import { IWarning } from "./IWarning";
import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
export interface ITestCollectorParameters {
    performanceConfiguration?: IPerformanceConfiguration;
    testRegex?: RegExp;
    groupRegex?: RegExp;
    fileName?: string;
    nortrace?: boolean;
}
/**
 * This class is responsible for collecting all the tests in a test binary.
 */
export declare class TestCollector {
    protected wasm: (ASUtil & IAspectExports) | null;
    private groupStack;
    testGroups: TestGroup[];
    protected logTarget: ILogTarget;
    errors: IWarning[];
    warnings: IWarning[];
    fileName: string;
    protected stack: string;
    protected message: string;
    protected actual: ActualValue | null;
    protected expected: ActualValue | null;
    private performanceEnabledValue;
    private maxSamplesValue;
    private maxTestRunTimeValue;
    private roundDecimalPlacesValue;
    private recordAverageValue;
    private recordMedianValue;
    private recordStdDevValue;
    private recordMaxValue;
    private recordMinValue;
    private recordVariance;
    private performanceConfiguration;
    /**
     * This value is used to detect if an `expect()` function call was used outside of a test
     * function. If a reportExpected or reportActual function is called before the `context.run()`
     * method is called, it should prevent the `run()` method from running the tests and report a
     * failure.
     */
    protected ready: boolean;
    /**
     * These are the test and group filters for the binary. They must be provided before collection
     * begins.
     */
    protected testRegex: RegExp;
    protected groupRegex: RegExp;
    /**
     * RTrace is a funciton that helps with debugging reference counting and can be used to find
     * leaks. If it is enabled, it will be included automatically by the bootstrap in the
     * assemblyscript imports.
     */
    protected rtraceEnabled: boolean;
    private rtraceLabels;
    constructor(props?: ITestCollectorParameters);
    /**
     * Call this method to start the `__main()` method provided by the `as-pect` exports to start the
     * process of test collection.
     */
    protected collectTests(): void;
    /**
     * This method creates a WebAssembly imports object with all the TestContext functions
     * bound to the TestContext.
     *
     * @param {any[]} imports - Every import item specified.
     */
    createImports(...imports: any[]): any;
    /**
     * This is called to stop the debugger.  e.g. `node --inspect-brk asp`.
     */
    private debug;
    /**
     * This is a web assembly utility function that wraps a function call in a try catch block to
     * report success or failure.
     *
     * @param {number} pointer - The function pointer to call. It must accept no parameters and return
     * void.
     * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
     * returns 0.
     */
    protected tryCall(pointer: number): 1 | 0;
    /**
     * Log a null value to the reporter.
     */
    private logNull;
    /**
     * Log an array to the reporter.
     *
     * @param arrayPointer - The array pointer.
     */
    private logArray;
    /**
     * Log a reference to the reporter.
     *
     * @param {number} referencePointer - The pointer to the reference.
     * @param {number} offset - The offset of the reference.
     */
    private logReference;
    /**
     * This adds a logged string to the current test.
     *
     * @param {number} pointer - The pointer to the logged string reference.
     */
    private logString;
    /**
     * Log a numevalueric value to the reporter.
     *
     * @param {number} value - The value to be logged.
     * @param {1 | 0} signed - The value indicating if the number is signed.
     */
    private logValue;
    /**
     * Log a long value.
     *
     * @param suiteNamePointer - The boxed long value's pointer.
     */
    private logLong;
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
     * @param {1 | 0} signed - The value indicating if the value is signed.
     */
    private reportActualValue;
    /**
     * This function reports an expected numeric value.
     *
     * @param {number} numericValue - The expected value.
     * @param {1 | 0} signed - The value indicating if the value is signed.
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedValue;
    /**
     * This function reports an actual long value.
     *
     * @param {number} boxPointer - The expected box pointer.
     * @param {1 | 0} signed - An indicator if the long value is signed.
     */
    private reportActualLong;
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
     * This function reports an expected long value.
     *
     * @param {number} boxPointer - The expected box pointer.
     * @param {1 | 0} signed - An indicator if the long value is signed.
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedLong;
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
     * This web assembly linked function modifies the state machine to enable
     * performance for the following test.
     *
     * @param {1 | 0} value - A value indicating if performance should be enabled.
     */
    private performanceEnabled;
    /**
     * This web assembly linked function modifies the state machine to set the maximum number of
     * samples for the following test.
     *
     * @param {number} value - The maximum number of samples to collect for the following test.
     */
    private maxSamples;
    /**
     * This web assembly linked function modifies the state machine to set the maximum amount of
     * time to run the following test in milliseconds
     *
     * @param {number} value - The maximum number of milliseconds to run the following test.
     */
    private maxTestRunTime;
    /**
     * This web assembly linked function modifies the state machine to set the number of decimal places
     * to round all the statistics to.
     *
     * @param {number} value - The number of decimal places to round to.
     */
    private roundDecimalPlaces;
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
    /**
     * This web assembly linked function modifies the state machine to cause the next test to report
     * the variance of the run times for this test.
     *
     * @param {1 | 0} value - A boolean indicating if the min should be reported.
     */
    private reportVariance;
    /**
     * This method reports to the TestContext that an expect function call was used outside of the
     * intended test functions.
     */
    private reportInvalidExpectCall;
    /**
     * This method reports an actual array value.
     *
     * @param {number} arrayPointer - The Array pointer.
     */
    private reportActualArray;
    /**
     * This  method reports an expected array value.
     *
     * @param {number} arrayPointer - The Array pointer.
     * @param {1 | 0} negated - Is `1` if the expectation is negated.
     */
    private reportExpectedArray;
    /**
     * Gets an error stack trace.
     */
    private getErrorStackTrace;
    /**
     * Reset all the performance values to the configured values.
     */
    private resetPerformanceValues;
    /**
     * Gets a log stack trace.
     */
    private getLogStackTrace;
    /**
     * This method returns the current rtrace count.
     */
    private getRTraceCount;
    /**
     * This method starts a new rtrace count label.
     *
     * @param {number} label - The RTrace label.
     */
    private startRTrace;
    /**
     * This method ends an RTrace label and returns the difference between the current and the
     * starting reference counts.
     *
     * @param {number} label - The RTrace label.
     * @returns {number}
     */
    private endRTrace;
    /**
     * This is the current number of net allocations that occurred during `TestContext` execution.
     */
    allocationCount: number;
    /**
     * This is the current number of net allocations that occured during `TestGroup` execution.
     */
    protected groupAllocationCount: number;
    /**
     * This is the current number of net allocations that occured during `TestResult` execution.
     */
    protected testAllocationCount: number;
    /**
     * This is the current number of net dellocations that occurred during `TestContext` execution.
     */
    freeCount: number;
    /**
     * This is the current number of net allocations that occured during `TestGroup` execution.
     */
    protected groupFreeCount: number;
    /**
     * This is the current number of net allocations that occured during `TestGroup` execution.
     */
    protected testFreeCount: number;
    /**
     * This is the current number of net increments that occurred during `TestContext` execution.
     */
    protected incrementCount: number;
    /**
     * This is the current number of net increments that occurred during `TestGroup` execution.
     */
    protected groupIncrementCount: number;
    /**
     * This is the current number of net increments that occurred during `TestResult` execution.
     */
    protected testIncrementCount: number;
    /**
     * This is the current number of net decrements that occurred during `TestContext` execution.
     */
    protected decrementCount: number;
    /**
     * This is the current number of net decrements that occurred during `TestGroup` execution.
     */
    protected groupDecrementCount: number;
    /**
     * This is the current number of net decrements that occurred during `TestResult` execution.
     */
    protected testDecrementCount: number;
    /**
     * This map is responsible for keeping track of which blocks are currently allocated by their id.
     */
    protected blocks: Map<number, number>;
    /**
     * This set contains all the blocks currently allocated for the current test.
     */
    protected testBlocks: Set<number>;
    /**
     * This set contains all the blocks currently allocated for the current group.
     */
    protected groupBlocks: Set<number>;
    /**
     * This method is called when a memory block is allocated on the heap.
     *
     * @param {number} block - This is a unique identifier for the affected block.
     */
    private onalloc;
    /**
     * This method is called when a memory block is deallocated from the heap.
     *
     * @param {number} block - This is a unique identifier for the affected block.
     */
    private onfree;
    /**
     * This method is called when a memory block reference count is incremented.
     *
     * @param {number} block - This is a unique identifier for the affected block.
     */
    private onincrement;
    /**
     * This method is called when a memory block reference count is decremented.
     *
     * @param {number} block - This is a unique identifier for the affected block.
     */
    private ondecrement;
    /**
     * This method reports an error to the current logTarget and the `TestContext`.
     *
     * @param {IWarning} error - The error being reported.
     */
    protected pushError(error: IWarning): void;
    protected pushWarning(warning: IWarning): void;
    /**
     * This linked method gets all the RTrace increments for this entire test up until this point.
     */
    private getRTraceIncrements;
    /**
     * This linked method gets all the RTrace decrements for this entire test up until this point.
     */
    private getRTraceDecrements;
    /**
     * This linked method gets all the RTrace increments for the current group up until this point.
     */
    private getRTraceGroupIncrements;
    /**
     * This linked method gets all the RTrace decrements for the current group up until this point.
     */
    private getRTraceGroupDecrements;
    /**
     * This linked method gets all the RTrace increments for the current test up until this point.
     */
    private getRTraceTestIncrements;
    /**
     * This linked method gets all the RTrace decrements for the current test up until this point.
     */
    private getRTraceTestDecrements;
    /**
     * This linked method gets all the RTrace allocations for this entire test up until this point.
     */
    private getRTraceAllocations;
    /**
     * This linked method gets all the RTrace frees for this entire test up until this point.
     */
    private getRTraceFrees;
    /**
     * This linked method gets all the RTrace increments for this entire test up until this point.
     */
    private getRTraceGroupAllocations;
    /**
     * This linked method gets all the RTrace frees for the current group up until this point.
     */
    private getRTraceGroupFrees;
    /**
     * This linked method gets all the RTrace allocations for the current test up until this point.
     */
    private getRTraceTestAllocations;
    /**
     * This linked method gets all the RTrace allocations for the current test up until this point.
     */
    private getRTraceTestFrees;
    /**
     * This linked method gets all the current RTrace allocations and adds them to an array.
     */
    private getRTraceBlocks;
    /**
     * This linked method gets all the current RTrace allocations for the current group.
     */
    private getRTraceGroupBlocks;
    /**
     * This linked method gets all the current RTrace allocations for the current test.
     */
    private getRTraceTestBlocks;
}
//# sourceMappingURL=TestCollector.d.ts.map