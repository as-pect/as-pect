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
    performanceConfiguration: IPerformanceConfiguration | null;
    testRegex: RegExp;
    groupRegex: RegExp;
    fileName: string;
    testGroups: TestGroup[];
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
}
//# sourceMappingURL=TestContext.d.ts.map