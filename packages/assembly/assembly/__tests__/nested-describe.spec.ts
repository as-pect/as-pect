let outer = true;

/**
 * This test suite tests the nested describe logic expectations.
 */
describe("nested describes", () => {
  describe("inner describe", () => {
    it("should run the inner test", () => {
      expect(outer).toBeTruthy();
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
describe("nested control flow", () => {
  beforeEach(() => {
    beforeEachFlag++;
  });
  beforeAll(() => {
    beforeAllFlag++;
  });
  afterEach(() => {
    afterEachFlag++;
  });
  afterAll(() => {
    afterAllFlag++;
  });

  describe("runs first", () => {
    test("firstTest", () => {
      expect(beforeEachFlag).toBe(1, "beforeEach should be 1");
      expect(beforeAllFlag).toBe(1, "beforeAll should be 1");
      expect(afterEachFlag).toBe(
        0,
        "the afterEach callback should not have run yet",
      );
      expect(afterAllFlag).toBe(
        0,
        "the afterAll callback should not have run yet",
      );
    });
  });

  describe("runs second", () => {
    test("secondTest", () => {
      expect(beforeEachFlag).toBe(2, "beforeEach should be 2");
      expect(beforeAllFlag).toBe(1, "beforeAll should be 1");
      expect(afterEachFlag).toBe(1, "afterEach should be 1");
      expect(afterAllFlag).toBe(
        0,
        "the afterAll callback should not have run yet",
      );
    });
  });
});
