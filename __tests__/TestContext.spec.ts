import { createModule } from "./setup/createModule";
import { TestContext } from "../src/test/TestContext";
import { TestGroup } from "../src/test/TestGroup";
import { round, sqrt, median, mean, sum } from "mathjs";
import { EmptyReporter } from "../src/reporter/EmptyReporter";

let ctx: TestContext;
let testGroup: TestGroup;
let controlFlowGroup: TestGroup;
let performanceGroup: TestGroup;
let failBeforeAllGroup: TestGroup;
let failBeforeEachGroup: TestGroup;
let failAfterEachGroup: TestGroup;
let failAfterAllGroup: TestGroup;
let failBeforeEachPerformanceGroup: TestGroup;
let failAfterEachPerformanceGroup: TestGroup;
const mock = {
  jest: {
    mockAfterAll: jest.fn(),
    mockAfterEach: jest.fn(),
    mockBeforeAll: jest.fn(),
    mockBeforeEach: jest.fn(),
    mockFailBeforeAll: jest.fn(),
    mockFailBeforeEach: jest.fn(),
    mockFailAfterEach: jest.fn(),
    mockFailAfterAll: jest.fn(),
    mockFailBeforeEachPerformance: jest.fn(),
    mockFailAfterEachPerformance: jest.fn()
  }
};

let start = new Promise<void>((resolve, reject) => {
  createModule(mock, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      failAfterEachPerformanceGroup = ctx.testGroups[0];
      failBeforeEachPerformanceGroup = ctx.testGroups[1];
      failAfterAllGroup = ctx.testGroups[2];
      failAfterEachGroup = ctx.testGroups[3];
      failBeforeEachGroup = ctx.testGroups[4];
      failBeforeAllGroup = ctx.testGroups[5];
      controlFlowGroup = ctx.testGroups[6];
      performanceGroup = ctx.testGroups[7];
      testGroup = ctx.testGroups[8];
      resolve();
    }
  });
});

beforeEach(() => start);

describe("TestContext test results", (): void => {
  it("should pass the first test", (): void => {
    const test = testGroup.tests[0];
    expect(test.pass).toBeTruthy();
  });

  it("should fail the second test", (): void => {
    const test = testGroup.tests[1];
    expect(test.pass).toBeFalsy();
  });

  it("should pass the third test", (): void => {
    const test = testGroup.tests[2];
    expect(test.pass).toBeTruthy();
  });

  it("should expect each logged value target to be test", (): void => {
    const test = testGroup.tests[2];
    test.logs.forEach(element => {
      expect(element.target).toBe(test);
    });
  });

  it("should have logged a string", (): void => {
    const test = testGroup.tests[2];
    const value = test.logs[0];
    expect(value.message).toBe("Hello world!");
  });

  it("should have logged a number", (): void => {
    const test = testGroup.tests[2];
    const value = test.logs[1];
    expect(value.value).toBe(42);
  });

  it("should have logged a null", (): void => {
    const test = testGroup.tests[2];
    const value = test.logs[2];
    expect(value.message).toBe("null");
    expect(value.value).toBe(null);
  });

  it("should have logged a reference", (): void => {
    const test = testGroup.tests[2];
    const value = test.logs[3];
    expect(value.message).toBe("Reference Type");
    expect(value.bytes).toHaveLength(24);
  });

  it("should expect strings", (): void => {
    const test = testGroup.tests[3];
    expect(test.expected!.message).toBe("one");
    expect(test.actual!.message).toBe("two");
  });

  it("should expect finite values", (): void => {
    const test = testGroup.tests[4];
    expect(test.actual!.message).toBe("NaN");
    expect(test.actual!.value).toBeNaN();
    expect(test.expected!.message).toBe("Finite Value");
  });

  it("should expect falsy values", (): void => {
    const test = testGroup.tests[5];
    expect(test.actual!.value).toBe(1);
    expect(test.expected!.message).toBe("Falsy Value");
  });

  it("should expect truthy values", (): void => {
    const test = testGroup.tests[6];
    expect(test.actual!.value).toBe(0);
    expect(test.expected!.message).toBe("Truthy Value");
  });

  it("should expect reference values", (): void => {
    const test = testGroup.tests[7];
    expect(test.actual!.message).toBe("Reference Value");
    expect(test.expected!.message).toBe("Reference Value");
    expect(test.actual!.bytes).not.toStrictEqual(test.expected!.bytes);
  });

  it("should expect number values", (): void => {
    const test = testGroup.tests[8];
    expect(test.actual!.value).toBe(0);
    expect(test.expected!.value).toBe(42);
  });

  it("should report nulls", (): void => {
    const test = testGroup.tests[9];
    expect(test.actual!.value).toBe(null);
    expect(test.expected!.value).toBe(null);
  });

  it("should report a negated test", (): void => {
    const test = testGroup.tests[10];
    expect(test.negated).toBeTruthy();
  });

  it("should fail when a negated test does not throw", (): void => {
    const test = testGroup.tests[11];
    expect(test.negated).toBeTruthy();
    expect(test.pass).toBeFalsy();
  });

  it("should report an array of numbers", (): void => {
    const test = testGroup.tests[12];
    expect(test.pass).toBeFalsy();
    expect(test.actual!.message).toBe("[1,2,3]");
    expect(test.expected!.message).toBe("[4,5,6]");
  });

  it("should report an actual long", (): void => {
    const test = testGroup.tests[13];
    expect(test.pass).toBeFalsy();
    expect(test.actual!.message).toMatchInlineSnapshot(
      `"Long Value: -9999999999"`
    );
    expect(test.expected!.message).toMatchInlineSnapshot(
      `"Long Value: 9999999999"`
    );
  });

  it("should log a long value", () => {
    const test = testGroup.tests[14];
    expect(test.logs[0].message).toMatchInlineSnapshot(
      `"Value 999999999999999"`
    );
  });
});

describe("TestContext performance metrics", (): void => {
  it("should have tested performance on the performanceGroup", (): void => {
    const test = performanceGroup.tests[0];
    expect(test.performance).toBeTruthy();
  });

  it("should have variance enabled", (): void => {
    const test = performanceGroup.tests[1];
    expect(test.hasVariance).toBeTruthy();
    expect(test.rawVariance).not.toBe(0);
    expect(test.variance).toBe(round(test.rawVariance, test.decimalPlaces));
  });

  it("should have min enabled", (): void => {
    const test = performanceGroup.tests[2];
    expect(test.hasMin).toBeTruthy();
    expect(test.min).toBe(Math.min(...test.times));
  });

  it("should have min enabled", (): void => {
    const test = performanceGroup.tests[3];
    expect(test.hasMax).toBeTruthy();
    expect(test.max).toBe(Math.max(...test.times));
  });

  it("should have stdDev enabled", (): void => {
    const test = performanceGroup.tests[4];
    expect(test.hasStdDev).toBeTruthy();
    expect(test.hasVariance).toBeTruthy();
    expect(test.stdDev).toBe(round(sqrt(test.rawVariance), test.decimalPlaces));
  });

  it("should have median enabled", (): void => {
    const test = performanceGroup.tests[5];
    expect(test.hasMedian).toBeTruthy();
    expect(test.median).toBe(round(median(test.times), test.decimalPlaces));
  });

  it("should have average enabled", (): void => {
    const test = performanceGroup.tests[6];
    expect(test.hasAverage).toBeTruthy();
    expect(test.average).toBe(round(mean(test.times), test.decimalPlaces));
  });

  it("should have set the rounding decimal places value", (): void => {
    const test = performanceGroup.tests[7];
    expect(test.decimalPlaces).toBe(42);
  });

  it("should run approximately less than a second", (): void => {
    const test = performanceGroup.tests[8];
    const testTimes = sum(test.times);
    expect(testTimes).toBeLessThan(30);
    expect(test.runTime).toBeLessThan(30);
  });

  it("should collect 400 samples", (): void => {
    const test = performanceGroup.tests[9];
    expect(test.times).toHaveLength(400);
  });
});

describe("TestContext control flow", (): void => {
  it("should have a single test", (): void => {
    expect(controlFlowGroup.tests).toHaveLength(1);
  });
  it("should call the beforeEach callback", (): void => {
    expect(mock.jest.mockBeforeEach).toBeCalled();
  });
  it("should call the beforeAll callback", (): void => {
    expect(mock.jest.mockBeforeAll).toBeCalled();
  });
  it("should call the afterEach callback", (): void => {
    expect(mock.jest.mockAfterEach).toBeCalled();
  });
  it("should call the afterAll callback", (): void => {
    expect(mock.jest.mockAfterAll).toBeCalled();
  });
});

describe("fail beforeAll", (): void => {
  it("should call beforeAll", (): void => {
    expect(mock.jest.mockFailBeforeAll).toBeCalled();
  });

  it("should fail the test group", (): void => {
    expect(failBeforeAllGroup.pass).toBeFalsy();
    expect(failBeforeAllGroup.reason).toBe(
      `Test suite failBeforeAll failed in beforeAll callback.`
    );
  });
});

describe("fail beforeEach", (): void => {
  it("should call beforeEach", (): void => {
    expect(mock.jest.mockFailBeforeEach).toBeCalled();
  });

  it("should fail the test group", (): void => {
    expect(failBeforeEachGroup.pass).toBeFalsy();
    expect(failBeforeEachGroup.reason).toBe(
      `Test suite failBeforeEach failed in beforeEach callback.`
    );
  });
});

describe("fail afterEach", (): void => {
  it("should call afterEach", (): void => {
    expect(mock.jest.mockFailAfterEach).toBeCalled();
  });

  it("should fail the test group", (): void => {
    expect(failAfterEachGroup.pass).toBeFalsy();
    expect(failAfterEachGroup.reason).toBe(
      `Test suite failAfterEach failed in afterEach callback.`
    );
  });
});

describe("fail afterAll", (): void => {
  it("should call afterAll", (): void => {
    expect(mock.jest.mockFailAfterAll).toBeCalled();
  });

  it("should fail the test group", (): void => {
    expect(failAfterAllGroup.pass).toBeFalsy();
    expect(failAfterAllGroup.reason).toBe(
      `Test suite failAfterAll failed in afterAll callback.`
    );
  });
});

describe("fail beforeEach in performance", (): void => {
  it("should call mockFailBeforeEachPerformance", (): void => {
    expect(mock.jest.mockFailBeforeEachPerformance).toBeCalled();
  });

  it("should fail the test group", (): void => {
    expect(failBeforeEachPerformanceGroup.pass).toBeFalsy();
    expect(failBeforeEachPerformanceGroup.reason).toBe(
      `Test suite failBeforeEachPerformance failed in beforeEach callback.`
    );
  });
});

describe("fail afterEach in performance", (): void => {
  it("should call mockFailAfterEachPerformance", (): void => {
    expect(mock.jest.mockFailAfterEachPerformance).toBeCalled();
  });

  it("should fail the test group", (): void => {
    expect(failAfterEachPerformanceGroup.pass).toBeFalsy();
    expect(failAfterEachPerformanceGroup.reason).toBe(
      `Test suite failAfterEachPerformance failed in afterEach callback.`
    );
  });
});

describe("other specs", (): void => {
  const t = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "empty.ts",
    performanceConfiguration: { enabled: false }
  });
  it("should return 1 when tryCall is passed -1", (): void => {
    // @ts-ignore
    expect(t.tryCall(-1)).toBe(1);
  });

  // this test is just for statement coverage
  it("should have default parameters", (): void => {
    const t = new TestContext();
    expect(t).toBeTruthy();
  });
});
