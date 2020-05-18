module.exports = {
  /**
   * A set of globs passed to the glob package that qualify typescript files for testing.
   */
  include: ["assembly/__tests__/**/*.spec.ts"],
  /**
   * A set of globs passed to the glob package that quality files to be added to each test.
   */
  add: ["assembly/__tests__/**/*.include.ts"],
  /**
   * All the compiler flags needed for this test suite. Make sure that a binary file is output.
   */
  flags: [
    /** To output a wat file, uncomment the following line. */
    // "--textFile", "output.wat",
    /** A runtime must be provided here. */
    "--runtime", "full", // Acceptable values are: full, half, stub (arena), and none
    "--binary", "output.wasm", // required by the aspect cli
    // define all use variables here
    "--use", "ASC_RTRACE=1" // ASC_RTRACE enables memory leak detection
  ],
  /**
   * A set of globs that will disclude source files from testing.
   */
  disclude: ["**/node_modules"],
  /**
   * Add your required AssemblyScript imports here.
   *
   * Notes:
   * - `memory` is the WebAssembly.Memory
   * - `createImports` must be called on your imports
   * - `instantiate` is the loader instantiation method that returns a promise
   * - `binary` is the wasm binary compiled by AssemblyScript
   */
  imports(memory, createImports, instantiate, binary) {
    let instance; // Imports can reference this
    const myImports = {
      // put your web assembly imports here, and return the module
    };
    return instantiate(binary, createImports(myImports))
      .then((result) => {
        instance = result.exports;
        return result;
      });
  },
  /**
   * Add a custom reporter here if you want one. The following example is in typescript.
   *
   * @example
   * import { IReporter, TestNode, TestContext } from "as-pect";
   *
   * export interface IReporter {
   *   onEnter(ctx: TestContext, node: TestNode): void;
   *   onExit(ctx: TestContext, node: TestNode): void;
   *   onFinish(ctx: TestContext): void;
   * }
   */
  // reporter: {},
  /**
   * Specify if the binary wasm file should be written to the file system.
   */
  outputBinary: false,
};
