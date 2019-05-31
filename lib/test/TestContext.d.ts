import { IWritable } from "../reporter/IWriteable";
import { TestReporter } from "./TestReporter";
import { IPerformanceConfiguration } from "../util/IPerformanceConfiguration";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../util/IAspectExports";
import { TestGroup } from "./TestGroup";
import { IWarning } from "./IWarning";
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
    private wasm;
    reporter: TestReporter;
    time: number;
    pass: boolean;
    errors: IWarning[];
    stdoutChunks: string[];
    stdout: IWritable;
    stderrChunks: string[];
    stderr: IWritable;
    performanceConfiguration: IPerformanceConfiguration;
    testRegex: RegExp;
    groupRegex: RegExp;
    fileName: string;
    testGroups: TestGroup[];
    private currentGroup;
    private currentTest;
    private logTarget;
    startupTime: number;
    constructor(props: ITestContextParameters);
    /**
     * This method creates a WebAssembly imports object with all the TestContext functions
     * bound to the TestContext.
     *
     * @param {any[]} imports - Every import item specified.
     */
    createImports(...imports: any[]): any;
    run(wasm: ASUtil & IAspectExports): void;
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
     * This method checks to see if the provided string matches the test regular expression.
     *
     * @param {number} descriptionPointer - The pointer to the test's name.
     * @returns {1 | 0} - The return value is a bool in AssemblyScript.
     */
    private testCanRun;
    /**
     * This method checks to see if the provided string matches the group regular expression.
     *
     * @param {number} descriptionPointer - The pointer to the test's name.
     * @returns {1 | 0} - The return value is a bool in AssemblyScript.
     */
    private groupCanRun;
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
     * Gets an error stack trace.
     */
    private getErrorStackTrace;
    /**
     * Starts the next group and starts the timer.
     *
     * @param {number} descriptionPointer - The pointer to the name of the group.
     */
    private groupStart;
    /**
     * Reports a todo.
     *
     * @param {number} descriptionPointer - A pointer to the todo description.
     */
    private reportTodo;
    /**
     * This method is linked to web assembly, and will be called when a group has ended. It also
     * stops the timer and calculated the runtime for the group.
     */
    private groupEnd;
    /**
     * This linked function returns the current time.
     */
    private now;
}
//# sourceMappingURL=TestContext.d.ts.map