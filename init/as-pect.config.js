module.exports = {
  /**
   * A set of globs passed to the glob package that qualify typescript files for testing.
   */
  include: ["assembly/__tests__/**/*.spec.ts"],
  /**
   * A set of regexp that will disclude source files from testing.
   */
  disclude: [],
  /**
   * Add your required AssemblyScript imports here.
   */
  imports: {},
  /**
   * Add a custom reporter here if you want one
   */
  // reporter: new CustomReporter(),
};
