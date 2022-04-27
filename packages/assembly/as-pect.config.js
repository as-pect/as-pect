export default {
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
  flags: {
    /** To output a wat file, uncomment the following line. */
    "--textFile": ["output.wat"]
  },
  /**
   * A set of regexp that will disclude source files from testing.
   */
  disclude: [/node_modules/i],
  /**
   * Add your required AssemblyScript imports here.
   */
  imports(memory, createImports, instantiateSync, binary) {
    let instance; // Imports can reference this
    const myImports = {
      // put your web assembly imports here, and return the module
    };
    instance = instantiateSync(binary, createImports(myImports));
    return instance;
  },
  /** Add code coverage. */
  coverage: ["assembly/internal/**/*.ts"],
  /** Use the summary reporter. */
  // reporter: new SummaryTestReporter(),
};
