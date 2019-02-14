# as-pect

Write your module in TypeScript and get blazing fast testing with web assembly speeds!

# Usage

To install `as-pect`, install the latest version from github. Once `AssemblyScript` is more stable,
`as-pect` will be published to npm.

```
$ npm install jtenner/as-pect
```

To initialize a test suite, run `npx asp --init`. It will create the following folders and files.

```
$ npx asp --init

C ./assembly/ (If your assembly folder does not exist, it will create one for you)
C ./assembly/__tests__/ (put your tests here in this folder)
C ./assembly/__tests__/as-pect.d.ts (This file will provide you with types tooling.)
C ./assembly/__tests__/example.spec.ts (This file is created if your tests folder does not exist)
C ./as-pect.config.js (This will provide a default configuration file for your AssemblyScript test suite)
```

To run `as-pect`, use the command line, or create an npm script.

```json
{
  "scripts": {
    "test": "asp"
  }
}
```

Run asp from the command line using npx without any parameters to use `./as-pect.config.js` as your
test configuration. Otherwise, you can specify a configuration like this:

```
$ npx asp --config as-pect.config.js
```

# Configuration

Currently `as-pect` will compile each file that matches each `Glob` in the `include` property of
your configuration. The default include is `"assembly/__tests__/**/*.spec.ts"`. It must compile each
file seperately, and run each binary seperately. This is a limitation of AssemblyScript, not of
`as-pect`, because seperate modules that share imports are buggy. Also, compiling the binaries in
tandem speeds up the testing process.

A single TypeScript file is added to the compilation to add all the global test functions like
`describe`, `it`, `test`, and `expect`. All of these functions are placed conveniently into a
`as-pect.d.ts` file in the `__test__` folder when the test suite is initialized.

## Configuration Files

A typical configuration looks like this:

```ts
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
```

If your module requires a set of imported functions, it's okay to mock them here in the `imports`
property of the configuration. If any module fails during compilation, the utility will exit with
code 1 so it can be used for travis builds.

## Reporters

Reporters are the way tests get reported. The test suite will never log out test results, only to
reporters. If you want to use a custom reporter, you can create your own by extending the abstract
reporter class.

```ts
export abstract class Reporter {
  public abstract onStart(suite: TestSuite): void;
  public abstract onGroupStart(group: TestGroup): void;
  public abstract onGroupFinish(group: TestGroup): void;
  public abstract onTestStart(group: TestGroup, result: TestResult): void;
  public abstract onTestFinish(group: TestGroup, result: TestResult): void;
  public abstract onFinish(suite: TestSuite): void;
  public abstract onTodo(group: TestGroup, todo: string): void;
}
```

Each test suite run will use the provided reporter and call `onStart(suite: TestSuite)` to notify a
consumer that a test has started. This happens once per test file. Since a file can have multiple
`describe` function calls, these are logically placed into `TestGroup`s. Each `TestGroup` has it's
own description and contains a list of `TestResult`s that were run.

Each function is self explainatory, and you don't need to call `super()` when extending the Reporter
class, since `Reporter` does not have one.

If no reporter is provided to the configuration, one will be provided that uses `console.log()` and
`chalk` to provide colored output.

# Notes

## Do Not Import An Allocator

`as-pect` will automatically include the `arena` allocator for you, so it's not necessary for you to
include this at the top of each test.

```ts
// Do not do this, since it's done for you automatically
import "allocator/arena";
```

This ultimately makes your test suite cleanner and require less imports.

## Closures

AssemblyScript currently does not support closure, however, you must place all relevant tests and
setup function calls for a test suite into the corresponding describe closure.

```ts
var vec: Vec3;
// be explicit about every callback type
describe("vectors", (): void => {
  // this runs before each test function, and must be placed within the describe function
  beforeEach((): void => {
    // create a new vector for each test
    vec = new Vec3(1, 2, 3);
  });

  // this runs after each test function, and must be placed within the describe function
  afterEach((): void => {
    memory.free(changetype<usize>(vec)); // free the vector
    vec = null;
  });

  // use `test()` or `it()` to run a test
  test("vec should not be null", (): void => {
    // write an expectation
    expect<Vec3>(vec).not.toBeNull();
  });
});
```

## Expectations

Special thanks to the `AssemblyScript` team for creating one of the best computer languages that
compile to web assembly.
