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
  test("RTrace group and test values", () => {
    expect(ctx.deallocationCount).toMatchSnapshot("deallocationCount");
    expect(ctx.allocationCount).toMatchSnapshot("allocationCount");
    expect(ctx.errors).toMatchSnapshot("errors");

    for (let i = 0; i < ctx.testGroups.length; i++) {
      const group = ctx.testGroups[i];
      expect(group.deallocationCount).toMatchSnapshot(`group ${i} deallocationCount`);
      expect(group.allocationCount).toMatchSnapshot(`group ${i} allocationCount`);
      expect(group.incrementCount).toMatchSnapshot(`group ${i} incrementCount`);
      expect(group.incrementCount).toMatchSnapshot(`group ${i} decrementCount`);
      expect(group.rtraceStart).toMatchSnapshot(`group ${i} rtraceStart`);
      expect(group.rtraceEnd).toMatchSnapshot(`group ${i} rtraceEnd`);
      expect(group.rtraceDelta).toMatchSnapshot(`group ${i} rtraceDelta`);
      expect(group.errors).toMatchSnapshot(`group ${i} errors`);

      for (let j = 0; j < group.tests.length; j++) {
        const test = group.tests[j];
        expect(test.deallocationCount).toMatchSnapshot(`test ${i}-${j} deallocationCount`);
        expect(test.allocationCount).toMatchSnapshot(`test ${i}-${j} allocationCount`);
        expect(test.incrementCount).toMatchSnapshot(`test ${i}-${j} incrementCount`);
        expect(test.incrementCount).toMatchSnapshot(`test ${i}-${j} decrementCount`);
        expect(test.rtraceStart).toMatchSnapshot(`test ${i}-${j} rtraceStart`);
        expect(test.rtraceEnd).toMatchSnapshot(`test ${i}-${j} rtraceEnd`);
        expect(test.rtraceDelta).toMatchSnapshot(`test ${i}-${j} rtraceDelta`);
        expect(test.errors).toMatch(`test ${i}-${j} errors`);
      }
    }
  });
});