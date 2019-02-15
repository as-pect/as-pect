import { TestSuite } from "./TestSuite";
import { ASUtil } from "assemblyscript/lib/loader";
import { TestResult } from "./TestResult";
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
     * The currently running test.
     */
    currentTest: TestResult | null;
    /**
     * The stack trace generated when the currently running test threw.
     */
    stack: string | null;
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
     * @returns {1 | 0} - If the callback was run successfully without error, it returns 1, else it
     * returns 0.
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
    /**
     * This web assembly linked function sets the group's "beforeEach" callback pointer.
     *
     * @param {number} callbackPointer - The callback that should run before each test.
     */
    reportBeforeEach(callbackPointer: number): void;
    /**
     * This web assembly linked function sets the group's "beforeAll" callback pointer.
     *
     * @param {number} callbackPointer - The callback that should run before each test group.
     */
    reportBeforeAll(callbackPointer: number): void;
    /**
     * This web assembly linked function sets the group's "afterEach" callback pointer.
     *
     * @param {number} callbackPointer - The callback that should run before each test group.
     */
    reportAfterEach(callbackPointer: number): void;
    /**
     * This web assembly linked function sets the group's "afterAll" callback pointer.
     *
     * @param {number} callbackPointer - The callback that should run before each test group.
     */
    reportAfterAll(callbackPointer: number): void;
    /**
     * This function reports a single "todo" item in a test suite.
     *
     * @param {number} todoPointer - The todo description string pointer.
     */
    reportTodo(todoPointer: number): void;
    /**
     * This function reports an actual string value.
     *
     * @param {number} stringPointer - A pointer that points to the actual string.
     */
    reportActualString(stringPointer: number): void;
    /**
     * This function reports an expected string value.
     *
     * @param {number} stringPointer - A pointer that points to the expected string.
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    reportExpectedString(value: number, negated: 1 | 0): void;
    /**
     * This function reports an actual null value.
     */
    reportActualNull(): void;
    /**
     * This function reports an expected null value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    reportExpectedNull(negated: 1 | 0): void;
    /**
     * This function reports an actual numeric value.
     *
     * @param {number} value - The value to be expected.
     */
    reportActualValue(value: number): void;
    /**
     * This function reports an expected numeric value.
     *
     * @param {number} value - The value to be expected
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    reportExpectedValue(value: number, negated: 0 | 1): void;
    /**
     * This function reports an actual reference value. It converts the reference to a string of hex
     * characters with a space between each `u8` value.
     *
     * @param {number} referencePointer - The actual reference pointer.
     * @param {number} offset - The size of the reference in bytes.
     */
    reportActualReference(referencePointer: number, offset: number): void;
    /**
     * This function reports an expected reference value. It converts the reference to a string of hex
     * characters with a space between each `u8` value.
     *
     * @param {number} referencePointer - The expected reference pointer.
     * @param {number} offset - The size of the reference in bytes.
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    reportExpectedReference(referencePointer: number, offset: number, negated: 1 | 0): void;
    /**
     * This function reports an expected truthy value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    reportExpectedTruthy(negated: 1 | 0): void;
    /**
     * This function reports an expected falsy value.
     *
     * @param {1 | 0} negated - An indicator if the expectation is negated.
     */
    reportExpectedFalsy(negated: 1 | 0): void;
    /**
     * This function is called after each expectation if the expectation passes. This prevents other
     * unreachable() conditions that throw errors to report actual and expected values too.
     */
    clearExpected(): void;
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
    abort(reasonPointer: number, _fileNamePointer: number, _line: number, _col: number): void;
    /**
     * This adds a logged string to the current test.
     *
     * @param {number} pointer - The pointer to the logged string reference.
     */
    logString(pointer: number): void;
    /**
     * Log a reference to the reporter.
     *
     * @param {number} referencePointer - The pointer to the reference.
     * @param {number} offset - The offset of the reference.
     */
    logReference(referencePointer: number, offset: number): void;
    /**
     * Log a numeric value to the reporter.
     *
     * @param {number} value - The value to be logged.
     */
    logValue(value: number): void;
    /**
     * Log a null value to the reporter.
     */
    logNull(): void;
    /**
     * Gets a stack trace.
     */
    getStackTrace(): string;
}
//# sourceMappingURL=TestRunner.d.ts.map