export default {
  /**
   * A set of globs passed to the glob package that quality files to be added to each test.
   */
  include: ["assembly/__tests__/**/*.include.ts"],
  /**
   * A set of regexp that will disclude source files from testing.
   */
  disclude: [/node_modules/i],
  /**
   * Add these test files to your test suite.
   */
  entries: ["assembly/**/*.spec.ts"],
  /**
   * Add your required AssemblyScript imports here. The createImports callback
   * returns the WebAssembly imports object passed to AssemblyScript's loader.
   */
  async instantiate(memory, createImports, instantiate, binary) {
    let instance; // Imports can reference this
    const myImports = {
      // put your WebAssembly imports here
    };
    instance = instantiate(binary, createImports(myImports));
    return instance;
  },
  /** Add code coverage. */
  // coverage: ["assembly/internal/**/*.ts"],
  /** Use the summary reporter. */
  // reporter: new SummaryTestReporter(),
};
