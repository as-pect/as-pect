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

  /** This method disables rtrace calls for the current test context. */
  __disableRTrace(): void;

  /**
   * This method returns the `usize[]` of the current module.
   */
  __getUsizeArrayId(): number;

  /** The exported web assembly memory. For compatibility with docs, this is explicit. */
  readonly memory: {
    readonly buffer: ArrayBuffer;
  };
}
