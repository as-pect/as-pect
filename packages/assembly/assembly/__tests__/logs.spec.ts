import { Vec3 } from "./setup/Vec3";

function IDFunc(i: i32): i32 { return i; }
const anonIDFunc = (i: i32): i32 => i;
/**
 * This section adds a log value that executes *once* per describle block. The output should show
 * that a string exits.
 */
beforeAll((): void => {
  log<string>("before all outside describe");
});

afterAll((): void => {
  log<string>("after all outside describe");
});

/**
 * This test suite verifies that the log functions do not error when they are called.
 */
describe("logs", (): void => {

  beforeAll((): void => {
    log<string>("Before All");
  });

  afterAll((): void => {
    log<string>("After All");
  });

  beforeEach((): void => {
    log<string>("Before Each");
  });

  afterEach((): void => {
    log<string>("After Each");
  });

  /**
   * This test logs a string. It should be nice output when the test suite runs.
   */
  test("log a string", (): void => {
    log<string>("Some string value");
  });

  /**
   * This test should log a number.
   */
  test("log a number", (): void => {
    log<i32>(42);
  });

  /**
   * This test populates an ArrayBuffer and logs it to the console. It should look like an output
   * reference.
   */
  test("log an ArrayBuffer", (): void => {
    var array = new Uint8Array(8);
    for (let i = 0; i < 8; i++) {
      unchecked(array[i] = <u8>i);
    }
    log<ArrayBuffer>(array.buffer);
  });

  /**
   * This test logs a simple class reference.
   */
  test("log a reference", (): void => {
    log<Vec3>(new Vec3(1, 2, 3));
  });

  /**
   * This test logs a null value.
   */
  test("log a null", (): void => {
    log<Vec3 | null>(null);
  });

  /**
   * This test logs a anonymous function pointer
   */
  test("log an anonymous function", () => {
    log<(i: i32) => i32>(anonIDFunc);
  });

  /**
   * This test logs a named function pointer
   */
  test("log a named function", () => {
    log<(i: i32) => i32>(IDFunc);
  });

  /**
   * This todo should show up in the test output.
   */
  todo("This should be a valid todo.");
});