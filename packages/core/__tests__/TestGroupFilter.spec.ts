import { TestContext, TestNodeType, EmptyReporter } from "../src/index.js";
import { ASUtil, instantiate } from "@assemblyscript/loader";
import { IAspectExports } from "../src/util/IAspectExports.js";
import { promises as fs } from "fs";

let context: TestContext;
let result: {
  instance: WebAssembly.Instance;
  exports: ASUtil & IAspectExports;
};

const binary = fs.readFile("./assembly/jest-filter.wasm");

beforeEach(async () => {
  const ctx = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "assembly/jest-filter.ts",
  });
  result = await instantiate<IAspectExports>(binary, ctx.createImports({}));
  context = ctx;
});

describe("TestGroup filtering", () => {
  test("group filtering", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /two/i;
    context.run(result);
    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Group && node.ran) count += 1;
    });
    expect(count).toBe(1);
  });

  test("test filtering", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(result);

    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Test && node.ran) count += 1;
    });
    expect(count).toBe(3);
  });

  test("test filtering with no test matching", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /five/i;
    context.run(result);
    expect(context.testRunCount).toBe(0);
  });
});
