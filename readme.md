# as-pect

A simple test runner for *AssemblyScript*.

# Usage

To install `as-pect`, install the latest version from github. Once `assemblyscript` is more stable,
`as-pect` will be published to npm.

```
$ npm install jtenner/as-pect
```

To initialize a test suite, run `npx asp --init`.

```
$ npx asp init
```

To run the test suite, you must provide `asp` with a configuration. The initialization creates a
default configuration in your project.

```
$ npx asp --config as-pect.config.js
```

`as-pect` will compile each file that fits the glob `assembly/__tests__/**/*.spec.ts` seperately by
default, and run each binary seperately. The typical test functions will be added to the globals
and provided to you in the form of an `as-pect.d.ts` file in the `__test__` folder.

# notes

## allocator

`as-pect` will automatically include the arena allocator for you, so it's not necessary for you to
include this at the top of each test.

```ts
import "allocator/arena";
```

## closures

You must place all relevant closures for a test suite into the describe closure.

```ts
var vec: Vec3;
// be explicit about every callback type
describe("my module", (): void => {
  // this runs before each test function
  beforeEach((): void => {
    vec = new Vec3(1, 2, 3);
  });

  // this runs after each test function
  afterEach((): void => {
    memory.free(changetype<usize>(vec));
    vec = null;
  });

  // use `test()` or `it()` to run a test
  test("vec should not be null", (): void => {
    expect<Vec3>(vec).not.toBeNull();
  });
});
```

Special thanks to the `AssemblyScript` team for creating one of the best computer languages that
compile to web assembly.
