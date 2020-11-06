import { TestContext, TestNodeType, EmptyReporter } from "../src";
import { promises as fs } from "fs";
import { instantiate } from "assemblyscript/lib/loader/umd";

describe("RTrace output", () => {
  test("Overall Statistics", async () => {
    const binary = await fs.readFile("./assembly/jest-rtrace.wasm");
    const ctx = new TestContext({
      binary,
      reporter: new EmptyReporter(),
      fileName: "./assembly/jest-rtrace.ts",
    });
    ctx.run(await instantiate(binary, ctx.createImports({})));
    expect(ctx.freeCount).toMatchSnapshot("freeCount");
    expect(ctx.allocationCount).toMatchSnapshot("allocationCount");
    expect(ctx.errors).toMatchSnapshot("errors"); // matches empty array
    ctx.rootNode.visit((group) => {
      if (group.type === TestNodeType.Group) {
        expect(group.rtraceStart).toMatchSnapshot(`${group.name} rtraceStart`);
        expect(group.rtraceEnd).toMatchSnapshot(`${group.name} rtraceEnd`);
        expect(group.rtraceDelta).toMatchSnapshot(`${group.name} rtraceDelta`);
        expect(group.errors).toMatchSnapshot(`${group.name}errors`); // matches empty array
        for (const groupTest of group.groupTests) {
          expect(groupTest.rtraceStart).toMatchSnapshot(
            `${groupTest.namespace} rtraceStart`,
          );
          expect(groupTest.rtraceEnd).toMatchSnapshot(
            `${groupTest.namespace} rtraceEnd`,
          );
          expect(groupTest.rtraceDelta).toMatchSnapshot(
            `${groupTest.namespace} rtraceDelta`,
          );
          expect(groupTest.errors).toMatchSnapshot(
            `${groupTest.namespace} errors`,
          ); // matches empty array
        }
      }
    });
  });
});
