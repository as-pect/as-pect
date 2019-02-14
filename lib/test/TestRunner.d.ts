import { TestSuite } from "./TestSuite";
import { ASUtil } from "assemblyscript/lib/loader";
import { Reporter } from "../reporter/Reporter";
/**
 * The test class that hooks up the web assembly imports, and runs each test group in a file.
 */
export declare class TestRunner {
    constructor();
    /**
     * This is the value set by the web assembly module whenever an expectation fails.
     */
    message: string;
    /**
     * This is the currently running TestSuite.
     */
    suite: TestSuite | null;
    /**
     * This is the string that represents the current actual value reported by the module.
     */
    actual: string;
    /**
     * This is the string that represents the current expected value reported by the module.
     */
    expected: string;
    /**
     * This boolean is set to true for every run, and is true if the test suite passed.
     */
    passed: boolean;
    /**
     * This is the web assembly module.
     */
    wasm: ASUtil | null;
    /**
     * This function generates web assembly imports object.
     *
     * @param {any} imports - The web assembly imports to be mixed in.
     */
    createImports(imports?: any): any;
    /**
     * Runs a test suite from a compiled AssemblyScript module buffer.
     *
     * @param {string} filename - The name of the file.
     * @param {Uint8Array} buffer - The buffer containing the AssemblyScript module.
     * @param {any} imports - Custom web assembly imports object.
     * @param {Reporter} reporter - The reporter that reports each test and fail.
     */
    runBuffer(filename: string, buffer: Uint8Array, imports?: any, reporter?: Reporter): void;
    /**
     * Runs a test suite from a fetched reponse object that resolves to an AssemblyScript module.
     *
     * @param {string} filename - The name of the file.
     * @param {Promise<Response>} response - The buffer containing the AssemblyScript module.
     * @param {any} imports - Custom web assembly imports object.
     * @param {Reporter} reporter - The reporter that reports each test and fail.
     */
    runStreaming(filename: string, response: Promise<Response>, imports?: any, reporter?: Reporter): Promise<void>;
    /**
     * This function should be called after the test suite is initialized and the web assembly module
     * has been instantiated.
     *
     * @param {string} filename - The name of the test file.
     * @param {Reporter} reporter - The reporter that reports each test and fail.
     */
    run(filename: string, reporter?: Reporter): void;
    /**
     * This is a web assembly utility function that wraps a function call in a try catch block to
     * report success or failure.
     *
     * @param {number} pointer - The function pointer to call. It must accept no parameters and return
     * void.
     */
    tryCall(pointer: number): 1 | 0;
    /**
     * This web assembly linked function creates a test group. It's called when the test suite calls
     * the describe("test", callback) function from within AssemblyScript. It returns a pointer to the
     * suiteName string.
     *
     * @param {number} suiteNamePointer
     */
    reportDescribe(suiteNamePointer: number): void;
    /**
     * This web assembly linked function creates a test from the callback and the testNamePointer in
     * the current group. It assumes that the group has already been created with the describe
     * function. It is called when `it("description", callback)` or `test("description", callback)`
     * is called.
     *
     * @param {number} testNamePointer - The test's name pointer.
     * @param {number} callback - The test's function.
     */
    reportTest(testNamePointer: number, callback: number): void;
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
    reportExpectedTruthy(negated: 1 | 0): void;
    reportExpectedFalsy(negated: 1 | 0): void;
    clearExpected(): void;
    abort(reasonPointer: number, _fileNamePointer: number, _c: number, _d: number): void;
}
//# sourceMappingURL=TestRunner.d.ts.map