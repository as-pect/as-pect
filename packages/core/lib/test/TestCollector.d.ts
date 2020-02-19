import { IAspectExports } from "../util/IAspectExports";
import { TestGroup } from "./TestGroup";
import { ILogTarget } from "../util/ILogTarget";
import { IWarning } from "./IWarning";
import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { NameSection } from "../util/wasmTools";
import { HostValue } from "../util/HostValue";
/**
 * @ignore
 * This is a collection of all the parameters required for intantiating a TestCollector.
 */
export interface ITestCollectorParameters {
    /** A provided performance configuration. */
    performanceConfiguration?: Partial<IPerformanceConfiguration>;
    /** A regular expression that filters what tests can be run. Must be set before calling `testContext.run(wasm);` */
    testRegex?: RegExp;
    /** A regular expression that filters what test groups can be run. Must be set before calling `testContext.run(wasm);` */
    groupRegex?: RegExp;
    /**
     * Put the AssemblyScript test filename here.
     *
     * @example
     * ```ts
     * const ctx = new TestContext({
     *   fileName: "example.spec.ts",
     * });
     * ```
     */
    fileName?: string;
    /** Disable RTrace when set to `true`. */
    nortrace?: boolean;
    binary?: Uint8Array;
}
/**
 * @ignore
 * This is an internal class that is responsible for collecting all the tests in a test binary.
 */
export declare class TestCollector {
    protected wasm: IAspectExports | null;
    protected nameSection: NameSection | null;
    private groupStack;
    /** A collection of `TestGroup` objects that ran tests after `testContext.run(wasm)` was called. */
    testGroups: TestGroup[];
    /** The root `TestGroup` object. */
    topLevelGroup: TestGroup | null;
    protected logTarget: ILogTarget;
    /** A set of errors that were collected during the testing process. */
    errors: IWarning[];
    /** A set of warnings that were collected during the testing process. */
    warnings: IWarning[];
    /** The name of the AssemblyScript test file. */
    fileName: string;
    protected stack: string;
    protected message: string;
    protected actual: HostValue | null;
    protected expected: HostValue | null;
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
    /**
     * A collection of host values used to help cache and aid in the creation
     * of nested host values.
     */
    private hostValueCache;
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
     * Gets an error stack trace.
     */
    protected getErrorStackTrace(ex: Error): string;
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
     * This is the current number of net reallocations during the `TestContext` execution.
     */
    protected reallocationCount: number;
    /**
     * This is the current number of net reallocations during the `TestGroup` execution.
     */
    protected groupReallocationCount: number;
    /**
     * This is the current number of net reallocations during the `TestResult` execution.
     */
    protected testReallocationCount: number;
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
    private onrealloc;
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
     * This linked method gets all the RTrace reallocations for the current TestContext.
     */
    private getRTraceReallocs;
    /**
     * This linked method gets all the RTrace reallocations for the current TestGroup.
     */
    private getRTraceGroupReallocs;
    /**
     * This linked method gets all the RTrace reallocations for the current TestResult.
     */
    private getRTraceTestReallocs;
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
    /**
     * Gets a string from the wasm module, unless the module string is null. Otherwise it returns
     * a default value.
     */
    private getString;
    /**
     * An override implementation of the AssemblyScript trace function.
     *
     * @param {number} strPointer - The trace string.
     * @param {number} count - The number of arguments to be traced.
     * @param {number[]} args - The traced arguments.
     */
    private trace;
    /**
     * Retrieve the function name of a given web assembly function.
     *
     * @param {number} index - The function index
     */
    private funcName;
    private createHostValue;
    /**
     * Get a boxed integer of a given kind at a pointer location.
     *
     * @param {number} pointer - The pointer location of the number
     * @param {number} size - The size of the integer in bytes
     * @param {boolean} signed - If the number is signed
     */
    private getInteger;
    /**
     * Get a boxed float of a given kind at a pointer location.
     *
     * @param {number} pointer - The pointer location of the number
     * @param {number} size - The size of the float in bytes.
     */
    private getFloat;
    /**
     * Log a host value.
     *
     * @param {number} id - The HostValue id
     */
    private logHostValue;
    /**
     * Report an actual host value.
     *
     * @param {number} id - The HostValue id
     */
    private reportActualHostValue;
    /**
     * Report an expected host value.
     *
     * @param {number} id - The HostValue id
     */
    private reportExpectedHostValue;
    /**
     * Push a host value to a given host value.
     *
     * @param {number} hostValueID - The target host value parent.
     * @param {number} valueID - The target host value to be pushed.
     */
    private pushHostObjectValue;
    /**
     * Push a host value key to a given host value.
     *
     * @param {number} hostValueID - The target host value parent.
     * @param {number} keyId - The target host value key to be pushed.
     */
    private pushHostObjectKey;
    /**
     * Clear the expected value.
     */
    private clearExpected;
    /**
     * Clear the actual value.
     */
    private clearActual;
    /**
     * Report an expected truthy value, and if it's negated.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedTruthy;
    /**
     * Report an expected truthy value, and if it's negated.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedFalsy;
    /**
     * Report an expected finite value, and if it's negated.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    private reportExpectedFinite;
    /**
     * Attaches a stack trace to the given hostValue by it's id.
     *
     * @param {number} hostValueID - The given host value.
     */
    private attachStackTraceToHostValue;
}
