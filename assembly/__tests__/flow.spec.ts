var beforeEachRan: i32 = 0;
var beforeAllRan: i32 = 0;
var afterEachRan: i32 = 0;
var afterAllRan: i32 = 0;
var testCount: i32 = 0;

/**
 * This test suite is designed to test how the test flow functions work. There are two describe
 * blocks. The first describe block runs three fake tests, to call the control flow functions. Each
 * control flow function increments a value, and those values are tested below.
 *
 * This test group actually tests the control flow values. It is garunteed to run after the first
 * test suite in this file, and therefore it should have modified the globals.
 */
describe("flow", (): void => {
  /**
   * The beforeEach function runs before each test, therefore we should expect the beforeEachRan
   * value to be exactly 4.
   */
  it("should call beforeEach twice", (): void => {
    assert(beforeEachRan == 4, "beforeEach run count should be 4");
  });

  /**
   * The beforeAll function runs exactly once before the whole test suite, therefore we should
   * expect the beforeAllRan value to be exactly 1.
   */
  it("should call beforeAll once", (): void => {
    assert(beforeAllRan == 1, "beforeAll run count should be 1");
  });

  /**
   * The afterEach function runs before each test, therefore we should expect the afterEachRan
   * value to be exactly 4.
   */
  it("should call afterEach twice", (): void => {
    assert(afterEachRan == 4, "afterEach run count should be 4");
  });

  /**
   * The afterAll function runs once after the test suite has run, therefore we should expect the
   * afterAllRan value to be exactly 1.
   */
  it("should call afterAll once", (): void => {
    assert(afterAllRan == 1, "afterAll run count should be 1");
  });

  /**
   * Since there are 4 tests, we should expect the the test count to be 4.
   */
  it("should call all 4 tests", (): void => {
    assert(testCount == 4, "test run count should be 4");
  });
});

/**
 * Describe blocks that finish last run first, so that inner describe blocks run *after* their
 * parent runs.
 *
 * In this case, this second describe block will run first, and set the global values.
 */
describe("example test", (): void => {
  beforeAll((): void => {
    beforeAllRan += 1;
  });

  beforeEach((): void => {
    beforeEachRan += 1;
  });

  afterEach((): void => {
    afterEachRan += 1;
  });

  afterAll((): void => {
    afterAllRan += 1;
  });

  it("should run this example test", (): void => {
    testCount += 1;
  });

  it("should run this example test", (): void => {
    testCount += 1;
  });

  it("should run this example test", (): void => {
    testCount += 1;
  });

  throws("this test should run", (): void => {
    testCount += 1;
    unreachable();
  });
});