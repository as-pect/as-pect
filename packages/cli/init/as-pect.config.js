export default {
  /**
   * A set of globs passed to the glob package that qualify typescript files for testing.
   */
  entries: ["assembly/__tests__/**/*.spec.ts"],
  /**
   * A set of globs passed to the glob package that quality files to be added to each test.
   */
  include: ["assembly/__tests__/**/*.include.ts"],
  /**
   * A set of regexp that will disclude source files from testing.
   */
  disclude: [/node_modules/],
  /**
   * Add your required AssemblyScript imports here. The createImports callback
   * returns the WebAssembly imports object passed to AssemblyScript's loader.
   */
  async instantiate(memory, createImports, instantiate, binary) {
    let instance; // Imports can reference this
    const myImports = {
      env: { memory }
      // put your WebAssembly imports here
    };
    instance = instantiate(binary, createImports(myImports));
    return instance;
  },
  /**
   * Enable line and branch coverage with as-covers for the matching AssemblyScript files.
   * When this array is non-empty, asp compiles with the `coverage` target in
   * as-pect.asconfig.json and prints a coverage report after the test run.
   */
  // coverage: ["assembly/**/*.ts"],
  /**
   * Specify if the binary wasm file should be written to the file system.
   */
  outputBinary: false,
};
