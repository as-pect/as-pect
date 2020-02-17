import { Vec3 } from "./setup/Vec3";

function IDFunc(i: i32): i32 { return i; }
const anonIDFunc = (i: i32): i32 => i;
/**
 * This section adds a log value that executes *once* per describle block. The output should show
 * that a string exits.
 */
beforeAll(() => {
  log("before all outside describe");
});

afterAll(() => {
  log("after all outside describe");
});

class A {
  a: f64 = 1.0;
  b: B = new B();
  c: i32 = 3;
}

class B {
  a: u8 = 1;
  b: i16 = 2;
  c: u32 = 3;
  d: i64 = 4;
}

/**
 * This test suite verifies that the log functions do not error when they are called.
 */
describe("logs", () => {

  beforeAll(() => {
    log("Before All");
  });

  afterAll(() => {
    log("After All");
  });

  beforeEach(() => {
    log("Before Each");
  });

  afterEach(() => {
    log("After Each");
  });

  /**
   * This test logs a string. It should be nice output when the test suite runs.
   */
  test("log a string", () => {
    log("Some string value");
  });

  /**
   * This test should log a number.
   */
  test("log a number", () => {
    log(42);
  });

  /**
   * This test populates an ArrayBuffer and logs it to the console. It should look like an output
   * reference.
   */
  test("log an ArrayBuffer", () => {
    var array = new Uint8Array(8);
    for (let i = 0; i < 8; i++) {
      unchecked(array[i] = <u8>i);
    }
    log(array.buffer);
  });

  /**
   * This test logs a simple class reference.
   */
  test("log a reference", () => {
    log(new Vec3(1, 2, 3));
  });

  /**
   * This test logs a null value.
   */
  test("log a null", () => {
    log<Vec3 | null>(null);
  });

  /**
   * This test logs a anonymous function pointer
   */
  test("log an anonymous function", () => {
    log(anonIDFunc);
  });

  /**
   * This test logs a named function pointer
   */
  test("log a named function", () => {
    log(IDFunc);
  });

  test("log a nested class", () => {
    let a = new A();
    log(a);
  });

  /**
   * This todo should show up in the test output.
   */
  todo("This should be a valid todo.");
});