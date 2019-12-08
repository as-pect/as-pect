import { Vec3 } from "./setup/Vec3";

/**
 * This section adds a log value that executes *once* per describle block. The output should show
 * that a string exits.
 */
beforeAll(() => {
  log<string>("before all outside describe");
});

afterAll(() => {
  log<string>("after all outside describe");
});

/**
 * This test suite verifies that the log functions do not error when they are called.
 */
describe("logs", () => {

  beforeAll(() => {
    log<string>("Before All");
  });

  afterAll(() => {
    log<string>("After All");
  });

  beforeEach(() => {
    log<string>("Before Each");
  });

  afterEach(() => {
    log<string>("After Each");
  });

  /**
   * This test logs a string. It should be nice output when the test suite runs.
   */
  test("log a string", () => {
    log<string>("Some string value");
  });

  /**
   * This test should log a number.
   */
  test("log a number", () => {
    log<i32>(42);
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
    log<ArrayBuffer>(array.buffer);
  });

  /**
   * This test logs a simple class reference.
   */
  test("log a reference", () => {
    log<Vec3>(new Vec3(1, 2, 3));
  });

  /**
   * This test logs a null value.
   */
  test("log a null", () => {
    log<Vec3 | null>(null);
  });

  /**
   * This todo should show up in the test output.
   */
  todo("This should be a valid todo.");
});