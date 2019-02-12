import { TestSuite } from "./TestSuite";
import { ASUtil } from "assemblyscript/lib/loader";
export declare class TestRunner {
    constructor(buffer: Uint8Array, imports: any);
    reason: string;
    suites: TestSuite[];
    wasm: ASUtil;
    actual: string;
    expected: string;
    passed: boolean;
    createImports(imports?: any): any;
    run(): void;
    tryCall(pointer: number): 1 | 0;
    reportDescribe(suiteName: number): void;
    reportTest(testName: number, callback: number): void;
    reportBeforeEach(cb: number): void;
    reportBeforeAll(cb: number): void;
    reportAfterEach(cb: number): void;
    reportAfterAll(cb: number): void;
    reportExpectedReference(expected: number, actual: number, offset: number): void;
    reportExpectedValue(expected: number, actual: number): void;
    reportTodo(description: number): void;
    abort(reasonPointer: number, _fileNamePointer: number, _c: number, _d: number): void;
}
//# sourceMappingURL=TestRunner.d.ts.map