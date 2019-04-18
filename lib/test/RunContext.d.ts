import { ASUtil } from "assemblyscript/lib/loader";
import { TestReporter } from "./TestReporter";
/**
 * This class is a test runner helper class that contains a set of useful properties
 * to help reduce run function size.
 */
export declare class RunContext {
    wasm: ASUtil;
    reporter: TestReporter;
    start: number;
    end: number;
    groupstart: number;
    groupend: number;
    teststart: number;
    testend: number;
    passed: boolean;
    endGroup: boolean;
    constructor(wasm: ASUtil, reporter: TestReporter);
}
//# sourceMappingURL=RunContext.d.ts.map