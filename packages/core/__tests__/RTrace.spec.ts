import { TestContext } from "../src/test/TestContext";
import { createRTraceModule } from "./setup/createRTraceModule";

let ctx: TestContext;

let start = new Promise<void>((resolve, reject) => {
  createRTraceModule({}, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      resolve();
    }
  });
});

beforeEach(() => start);

describe("RTrace output", () => {
  test("Overall Statistics", () => {
    expect(ctx.freeCount).toMatchSnapshot("freeCount");
    expect(ctx.allocationCount).toMatchSnapshot("allocationCount");
    expect(ctx.errors).toMatchSnapshot("errors"); // matches empty array
  });

  for (const group of ctx.testGroups) {
    test(`Group: ${group.name}`, () => {
      expect(group.freeCount).toMatchSnapshot(`freeCount`);
      expect(group.allocationCount).toMatchSnapshot(`allocationCount`);
      expect(group.incrementCount).toMatchSnapshot(`incrementCount`);
      expect(group.decrementCount).toMatchSnapshot(`decrementCount`);
      expect(group.rtraceStart).toMatchSnapshot(`rtraceStart`);
      expect(group.rtraceEnd).toMatchSnapshot(`rtraceEnd`);
      expect(group.rtraceDelta).toMatchSnapshot(`rtraceDelta`);
      expect(group.errors).toMatchSnapshot(`errors`); // matches empty array
    });

    describe(`Group: ${group.name}`, () => {
      for (const groupTest of group.tests) {
        test(`Test: ${groupTest.name}`, () => {
          expect(groupTest.freeCount).toMatchSnapshot(`freeCount`);
          expect(groupTest.allocationCount).toMatchSnapshot(`allocationCount`);
          expect(groupTest.incrementCount).toMatchSnapshot(`incrementCount`);
          expect(groupTest.decrementCount).toMatchSnapshot(`decrementCount`);
          expect(groupTest.rtraceStart).toMatchSnapshot(`rtraceStart`);
          expect(groupTest.rtraceEnd).toMatchSnapshot(`rtraceEnd`);
          expect(groupTest.rtraceDelta).toMatchSnapshot(`rtraceDelta`);
          expect(groupTest.errors).toMatchSnapshot(`errors`); // matches empty array
        });
      }
    });
  }
});
