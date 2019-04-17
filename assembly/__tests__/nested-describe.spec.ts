let outer = true;

/**
 * This test suite tests the nested describe logic expectations.
 */
describe("nested describes", (): void => {
  describe("inner describe", (): void => {
    it("should run the inner test", (): void => {
      expect<bool>(outer).toBeTruthy();
    });
  });
});

let beforeEachFlag = 0;
let beforeAllFlag = 0;
let afterEachFlag = 0;
let afterAllFlag = 0;

/**
 * This test suite describes the behavior of the test control flow functions.
 */
describe("nested control flow", (): void => {
  beforeEach((): void => {
    beforeEachFlag++;
  });
  beforeAll((): void => {
    beforeAllFlag++;
  });
  afterEach((): void => {
    afterEachFlag++;
  });
  afterAll((): void => {
    afterAllFlag++;
  });

  describe("runs second", (): void => {
    test("secondTest", (): void => {
      expect<i32>(afterEachFlag).toBeTruthy("afterEach should be truthy");
      expect<i32>(afterAllFlag).toBeTruthy("afterAll should be truthy");
    });
  });

  describe("inner", (): void => {
    test("firstTest", (): void => {
      expect<i32>(beforeEachFlag).toBeTruthy("beforeEach should be truthy");
      expect<i32>(beforeAllFlag).toBeTruthy("beforeAll should be truthy");
    });
  });
});
