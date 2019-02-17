import { afterEach } from "../internal/Test";

var beforeEachRan: i32 = 0;
var beforeAllRan: i32 = 0;
var afterEachRan: i32 = 0;
var afterAllRan: i32 = 0;
var testCount: i32 = 0;

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

describe("beforeAndAfter", (): void => {
  it("should call beforeEach twice", (): void => {
    expect<i32>(beforeEachRan).toBe(3);
  });

  it("should call beforeAll once", (): void => {
    expect<i32>(beforeAllRan).toBe(1);
  });

  it("should call afterEach twice", (): void => {
    expect<i32>(afterEachRan).toBe(3);
  });

  it("should call afterAll once", (): void => {
    expect<i32>(afterAllRan).toBe(1);
  });

  it("should call all 3 tests", (): void => {
    expect<i32>(testCount).toBe(3);
  });
});
