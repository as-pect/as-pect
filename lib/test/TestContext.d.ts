import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { IWritable } from "../reporter/IWriteable";
import { TestReporter } from "./TestReporter";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";
export interface ITestContextParameters {
    reporter?: TestReporter;
    stdout?: IWritable;
    stderr?: IWritable;
    performanceConfiguration?: IPerformanceConfiguration;
    testRegex?: RegExp;
    groupRegex?: RegExp;
    fileName?: string;
}
export declare class TestContext {
    private reporter;
    stdout: IWritable | null;
    stderr: IWritable | null;
    private performanceConfiguration;
    testRegex: RegExp;
    groupRegex: RegExp;
    fileName: string;
    wasm: (ASUtil & IAspectExports) | null;
    private actual;
    private expected;
    private logTarget;
    constructor(props?: ITestContextParameters);
    /**
     * This method creates a WebAssembly imports object with all the TestContext functions
     * bound to the TestContext.
     *
     * @param {any[]} imports - Every import item specified.
     */
    createImports(...imports: any[]): any;
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
     * This function is called after each expectation if the expectation passes. This prevents other
     * unreachable() conditions that throw errors to report actual and expected values too.
     */
    private clearExpected;
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
     */
    private logValue;
}
//# sourceMappingURL=TestContext.d.ts.map