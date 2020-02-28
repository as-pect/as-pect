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
   * This method notifies the `wasm` module to conditionally ignore `log<T>(value: T)` values
   * because a performance test is running.
   *
   * @param {1 | 0} value - A value indicating if calls to `log()` should be ignored.
   */
  __ignoreLogs(value: 1 | 0): void;

  /**
   * This method disables rtrace calls for the current test context.
   */
  __disableRTrace(): void;

  /**
   * This method returns the `usize[]` of the current module.
   */
  __getUsizeArrayId(): number;

  /** The exported web assembly memory. For compatibility with docs, this is explicit. */
  readonly memory: {
    readonly buffer: ArrayBuffer;
  };
  /** Explicit start function. */
  _start(): void;

  /** Reads (copies) the value of a string from the module's memory. */
  __getString(ref: number): string;
  /** Allocates a new array in the module's memory and returns a reference (pointer) to it. */
  __allocArray(id: number, values: number[]): number;
  /** Reads (copies) the values of an array from the module's memory. */
  __getArray(ref: number): number[];
  /** Forces a cycle collection. Only relevant if objects potentially forming reference cycles are used. */
  __collect(): void;
  /** The WebAssembly function Table. */
  readonly table?: WebAssembly.Table;
}
