import { TestContext } from "../src/test/TestContext";
import { createPerformanceModule } from "./setup/createPerformanceModule";

let ctx: TestContext;

let start = new Promise<void>((resolve, reject) => {
  createPerformanceModule({}, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      resolve();
    }
  });
});

beforeAll(() => start);

describe("pass-fail", () => {
  test("pass-fail", () => {
    for (const group of ctx.testGroups) {
      for (const test of group.tests) {
        expect(test.performance).toMatchSnapshot(`${group.name}~${test.name} performance`);
        expect(test.hasAverage).toMatchSnapshot(`${group.name}~${test.name} hasAverage`);
        expect(test.hasMedian).toMatchSnapshot(`${group.name}~${test.name} hasMedian`);
        expect(test.hasMin).toMatchSnapshot(`${group.name}~${test.name} hasMin`);
        expect(test.hasMax).toMatchSnapshot(`${group.name}~${test.name} hasMax`);
        expect(test.hasStdDev).toMatchSnapshot(`${group.name}~${test.name} hasStdDev`);
        expect(test.hasVariance).toMatchSnapshot(`${group.name}~${test.name} hasVariance`);
      }
    }
  });
});
