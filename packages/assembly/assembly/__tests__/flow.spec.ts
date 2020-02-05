var beforeEachRan = 0;
var beforeAllRan = 0;
var afterEachRan = 0;
var afterAllRan = 0;
var testCount = 0;


/**
 * Describe blocks that finish last run first, so that inner describe blocks run *after* their
 * parent runs.
 *
 * In this case, this second describe block will run first, and set the global values.
 */
describe("example test", () => {

  /**
   * The following flow tests modify the global values.
   */
  beforeAll(() => {
    beforeAllRan += 1;
  });

  beforeEach(() => {
    beforeEachRan += 1;
  });

  afterEach(() => {
    afterEachRan += 1;
  });

  afterAll(() => {
    afterAllRan += 1;
  });

  /**
   * The following three tests increase the testCount.
   */
  it("should run this example test", () => {
    testCount += 1;
  });

  it("should run this example test", () => {
    testCount += 1;
  });

  it("should run this example test", () => {
    testCount += 1;
  });

  /**
   * This test increases the test count, and is garunteed to throw by using an `unreachable()`
   * instruction.
   */
  throws("this test should run", () => {
    testCount += 1;
    unreachable();
  });
});

/**
 * This test suite is designed to test how the test how flow functions work. There are two describe
 * blocks. The first describe block runs three fake tests, to call the control flow functions. Each
 * control flow function increments a value, and those values are tested below.
 *
 * This test group actually tests the control flow values. It is garunteed to run after the first
 * test suite in this file, and therefore it should have modified the globals.
 */
describe("flow", () => {
  /**
   * The beforeEach function runs before each test, therefore we should expect the beforeEachRan
   * value to be exactly 4.
   */
  it("should call beforeEach twice", () => {
    assert(beforeEachRan == 4, "beforeEach run count should be 4");
  });

  /**
   * The beforeAll function runs exactly once before the whole test suite, therefore we should
   * expect the beforeAllRan value to be exactly 1.
   */
  it("should call beforeAll once", () => {
    assert(beforeAllRan == 1, "beforeAll run count should be 1");
  });

  /**
   * The afterEach function runs before each test, therefore we should expect the afterEachRan
   * value to be exactly 4.
   */
  it("should call afterEach twice", () => {
    assert(afterEachRan == 4, "afterEach run count should be 4");
  });

  /**
   * The afterAll function runs once after the test suite has run, therefore we should expect the
   * afterAllRan value to be exactly 1.
   */
  it("should call afterAll once", () => {
    assert(afterAllRan == 1, "afterAll run count should be 1");
  });

  /**
   * Since there are 4 tests, we should expect the the test count to be 4.
   */
  it("should call all 4 tests", () => {
    assert(testCount == 4, "test run count should be 4");
  });
});
