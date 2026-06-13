import { TestContext, TestNodeType, EmptyReporter, SuiteReport } from "../src/index.js";
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

  test("group filtering with no group matching skips the suite without failing", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /five/i;
    context.run(result);

    let ranUserGroups = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Group && node.ran) ranUserGroups += 1;
    });

    expect(ranUserGroups).toBe(0);
    expect(context.testRunCount).toBe(0);
    expect(context.testCount).toBe(0);
    expect(context.pass).toBe(true);
    expect(SuiteReport.from(context).hasResults).toBe(false);
  });

  test("test filtering with no test matching skips tests without failing", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /five/i;
    context.run(result);

    expect(context.testRunCount).toBe(0);
    expect(context.testCount).toBe(0);
    expect(context.pass).toBe(true);
    expect(SuiteReport.from(context).hasResults).toBe(false);
  });

  test.each([/group/g, /group/y])("group filtering is stable for stateful regex %s", (regex) => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = regex;
    context.run(result);

    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Group && node.ran) count += 1;
    });
    expect(count).toBe(3);
    expect(regex.lastIndex).toBe(0);
  });

  test.each([/test/g, /test/y])("test filtering is stable for stateful regex %s", (regex) => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = regex;
    context.run(result);

    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Test && node.ran) count += 1;
    });
    expect(count).toBe(12);
    expect(regex.lastIndex).toBe(0);
  });
});
