// @ts-ignore
@external("jest", "mockAfterAll")
declare function mockAfterAll(): void;
// @ts-ignore
@external("jest", "mockAfterEach")
declare function mockAfterEach(): void;
// @ts-ignore
@external("jest", "mockBeforeAll")
declare function mockBeforeAll(): void;
// @ts-ignore
@external("jest", "mockBeforeEach")
declare function mockBeforeEach(): void;
// @ts-ignore
@external("jest", "mockFailBeforeAll")
declare function mockFailBeforeAll(): void;
// @ts-ignore
@external("jest", "mockFailBeforeEach")
declare function mockFailBeforeEach(): void;
// @ts-ignore
@external("jest", "mockFailAfterEach")
declare function mockFailAfterEach(): void;
// @ts-ignore
@external("jest", "mockFailAfterAll")
declare function mockFailAfterAll(): void;
// @ts-ignore
@external("jest", "mockFailBeforeEachPerformance")
declare function mockFailBeforeEachPerformance(): void;
// @ts-ignore
@external("jest", "mockFailAfterEachPerformance")
declare function mockFailAfterEachPerformance(): void;


class Vec3 {
  x: f64 = 0;
  y: f64 = 0;
  z: f64 = 0;
}

let actual = new Vec3();
actual.x = 10;
actual.y = 20;
actual.z = 30;

let expected = new Vec3();

describe("A test Suite", (): void => {
  it("this test should pass", (): void => {
    expect<i32>(13 + 29).toBe(42);
  });

  it("should fail", (): void => {
    assert(false, "expected fail");
  });

  it("this should log a string", (): void => {
    log<string>("Hello world!");
    log<i32>(42);
    log<Vec3>(null);
    log<Vec3>(new Vec3());
  });

  it("should expect strings", (): void => {
    expect<string>("two").toBe("one");
  });

  it("should report expected finite values", (): void => {
    expect<f64>(NaN).toBeFinite();
  });

  it("should report falsy expected values", (): void => {
    expect<i32>(1).toBeFalsy();
  });

  it("should report truthy expected values", (): void => {
    expect<i32>(0).toBeTruthy();
  });

  it("should report reference values", (): void => {
    expect<Vec3>(actual).toStrictEqual(expected);
  });

  it("should report number values", (): void => {
    expect<i32>(0).toBe(42);
  });

  it("should report nulls", (): void => {
    expect<Vec3>(null).not.toBeNull();
  });

  throws("should report a negated test", (): void => {
    expect<i32>(0).not.toBe(0);
  });

  throws("should fail when test does not throw", (): void => {
    expect<i32>(0).toBe(0);
  });

  it("should report array values", () => {
    expect<i32[]>([1, 2, 3]).toStrictEqual([4, 5, 6]);
  });

  todo("this should be a todo");
});

let globalValue: i32 = 0;

describe("A second test Suite", (): void => {
  performanceEnabled(true);
  test("this should have performance enabled", (): void => {
    assert(true, "");
  });

  performanceEnabled(true);
  reportVariance(true);
  test("this should have variance enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportMin(true);
  test("this should have min enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportMax(true);
  test("this should have max enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportStdDev(true);
  test("this should have stdDev enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportMedian(true);
  test("this should have stdDev enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  reportAverage(true);
  test("this should have average enabled", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  roundDecimalPlaces(42);
  test("this should have set the decimal places", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  maxTestRunTime(10);
  test("this should only run for less than a second", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });

  performanceEnabled(true);
  maxSamples(400);
  test("this should only run for less than a second", (): void => {
    for(let i = 0; i < 1000; i++) {
      assert(true, "");
    }
  });
});

describe("control flow", (): void => {
  afterAll((): void => { mockAfterAll(); });
  afterEach((): void => { mockAfterEach(); });
  beforeAll((): void => { mockBeforeAll(); });
  beforeEach((): void => { mockBeforeEach(); });
  test("single test", (): void => {
    assert(true, "");
  });
});

describe("failBeforeAll", (): void => {
  beforeAll((): void => {
    mockFailBeforeAll();
    assert(false, "");
  });

  test("passes", (): void => {
    assert(true);
  });
});

describe("failBeforeEach", (): void => {
  beforeEach((): void => {
    mockFailBeforeEach();
    assert(false, "");
  });

  test("passes", (): void => {
    assert(true);
  });
});

describe("failAfterEach", (): void => {
  afterEach((): void => {
    mockFailAfterEach();
    assert(false, "");
  });

  test("passes", (): void => {
    assert(true);
  });
});

describe("failAfterAll", (): void => {
  afterAll((): void => {
    mockFailAfterAll();
    assert(false, "");
  });

  test("passes", (): void => {
    assert(true);
  });
});

describe("failBeforeEachPerformance", (): void => {
  beforeEach((): void => {
    mockFailBeforeEachPerformance();
    assert(false, "");
  });

  performanceEnabled(true);
  test("passes", (): void => {
    assert(true);
  });
});

describe("failAfterEachPerformance", (): void => {
  afterEach((): void => {
    mockFailAfterEachPerformance();
    assert(false, "");
  });

  performanceEnabled(true);
  test("passes", (): void => {
    assert(true);
  });
});
