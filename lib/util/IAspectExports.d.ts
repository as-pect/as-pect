/**
 * This is the shape of the exported functions provided by the `as-pect` test suite.
 */
export interface IAspectExports {
    /**
     * This method calls a function pointer that matches the `() => void` type.
     *
     * @param {number} pointer - The function pointer.
     */
    __call(pointer: number): void;
    /**
     * This method is the @start of the module, and is called to collect all of the testing
     * information.
     */
    __main(): void;
    /**
     * This method is called when the tests are ready to run.
     */
    __ready(): void;
    /**
     * This method notifies the wasm module to send the current `Actual` value.
     */
    __sendActual(): void;
    /**
     * This method notifies the wasm module to send the current `Expected` value.
     */
    __sendExpected(): void;
    /**
     * This method notifies the `wasm` module to conditionally ignore `log<T>(value: T)` values
     * because a performance test is running.
     *
     * @param {1 | 0} value - A value indicating if calls to `log()` should be ignored.
     */
    __ignoreLogs(value: 1 | 0): void;
}
//# sourceMappingURL=IAspectExports.d.ts.map