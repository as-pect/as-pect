var beforeEachRan: i32 = 0;
var beforeAllRan: i32 = 0;
var afterEachRan: i32 = 0;
var afterAllRan: i32 = 0;
var testCount: i32 = 0;

/**
 * This test suite is designed to test how the test flow functions work. There are two describe
 * blocks. The first describe block runs three fake tests, to call the control flow functions. Each
 * control flow function increments a value, and those values are tested below.
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
    expect<bool>(true).toBeTruthy();
    testCount += 1;
  });

  it("should run this example test", (): void => {
    expect<bool>(false).toBeFalsy();
    testCount += 1;
  });

  it("should run this example test", (): void => {
    expect<i32>(1).toBe(1);
    testCount += 1;
  });
});



/**
 * This test group actually tests the control flow values. It is garunteed to run after the first
 * test suite in this file, and therefore it should have modified the globals.
 */
describe("flow", (): void => {
  /**
   * The beforeEach function runs before each test, therefore we should expect the beforeEachRan
   * value to be exactly 3.
   */
  it("should call beforeEach twice", (): void => {
    expect<i32>(beforeEachRan).toBe(3);
  });

  /**
   * The beforeAll function runs exactly once before the whole test suite, therefore we should
   * expect the beforeAllRan value to be exactly 1.
   */
  it("should call beforeAll once", (): void => {
    expect<i32>(beforeAllRan).toBe(1);
  });

  /**
   * The afterEach function runs before each test, therefore we should expect the afterEachRan
   * value to be exactly 3.
   */
  it("should call afterEach twice", (): void => {
    expect<i32>(afterEachRan).toBe(3);
  });

  /**
   * The afterAll function runs once after the test suite has run, therefore we should expect the
   * afterAllRan value to be exactly 1.
   */
  it("should call afterAll once", (): void => {
    expect<i32>(afterAllRan).toBe(1);
  });

  /**
   * Since there are 3 tests, we should expect the the test count to be 3.
   */
  it("should call all 3 tests", (): void => {
    expect<i32>(testCount).toBe(3);
  });
});
