import { TestSuite } from "./TestSuite";
import { ASUtil } from "assemblyscript/lib/loader";
import { Reporter } from "../reporter/Reporter";
export declare class TestRunner {
    constructor();
    reason: string;
    suite: TestSuite | null;
    actual: string;
    expected: string;
    passed: boolean;
    wasm: ASUtil | null;
    createImports(imports?: any): any;
    run(filename: string, buffer: Uint8Array, imports?: any, reporter?: Reporter): void;
    tryCall(pointer: number): 1 | 0;
    reportDescribe(suiteName: number): void;
    reportTest(testName: number, callback: number): void;
    reportBeforeEach(cb: number): void;
    reportBeforeAll(cb: number): void;
    reportAfterEach(cb: number): void;
    reportAfterAll(cb: number): void;
    reportTodo(value: number): void;
    reportActualString(value: number): void;
    reportExpectedString(value: number, negated: 1 | 0): void;
    reportActualNull(): void;
    reportExpectedNull(negated: 1 | 0): void;
    reportActualValue(value: number): void;
    reportExpectedValue(value: number, negated: 0 | 1): void;
    reportActualReference(value: number, offset: number): void;
    reportExpectedReference(value: number, offset: number, negated: 1 | 0): void;
    clearExpected(): void;
    abort(reasonPointer: number, _fileNamePointer: number, _c: number, _d: number): void;
}
//# sourceMappingURL=TestRunner.d.ts.map