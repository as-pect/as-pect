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

function countRanNodes(type: TestNodeType): number {
  let count = 0;
  context.rootNode.visit((node) => {
    if (node.type === type && node.ran) count += 1;
  });
  return count;
}

beforeEach(async () => {
  const ctx = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "assembly/jest-filter.ts",
  });
  result = await instantiate<IAspectExports>(binary, ctx.createImports({}));
  context = ctx;
});

describe("TestGroup filtering", () => {
  test("group filtering only runs matching groups and preserves matching failures", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /two/i;
    context.run(result);

    expect(countRanNodes(TestNodeType.Group)).toBe(1);
    expect(context.testCount).toBe(4);
    expect(context.testPassCount).toBe(2);
    expect(context.pass).toBe(false);
    expect(SuiteReport.from(context).hasResults).toBe(true);
  });

  test("test filtering only runs matching tests and preserves matching failures", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(result);

    expect(countRanNodes(TestNodeType.Test)).toBe(3);
    expect(context.testCount).toBe(3);
    expect(context.testPassCount).toBe(0);
    expect(context.pass).toBe(false);
    expect(SuiteReport.from(context).hasResults).toBe(true);
  });

  test("combined group and test filters only run matching tests in matching groups", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /two/i;
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /one/i;
    context.run(result);

    expect(countRanNodes(TestNodeType.Group)).toBe(1);
    expect(countRanNodes(TestNodeType.Test)).toBe(1);
    expect(context.testCount).toBe(1);
    expect(context.testPassCount).toBe(1);
    expect(context.pass).toBe(true);
    expect(SuiteReport.from(context).hasResults).toBe(true);
  });

  test("combined filters preserve failures from matching tests", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /two/i;
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(result);

    expect(countRanNodes(TestNodeType.Group)).toBe(1);
    expect(countRanNodes(TestNodeType.Test)).toBe(1);
    expect(context.testCount).toBe(1);
    expect(context.testPassCount).toBe(0);
    expect(context.pass).toBe(false);
    expect(SuiteReport.from(context).hasResults).toBe(true);
  });

  test("group filtering with no group matching skips the suite without failing", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /five/i;
    context.run(result);

    expect(countRanNodes(TestNodeType.Group)).toBe(0);
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

    expect(countRanNodes(TestNodeType.Group)).toBe(3);
    expect(regex.lastIndex).toBe(0);
  });

  test.each([/test/g, /test/y])("test filtering is stable for stateful regex %s", (regex) => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = regex;
    context.run(result);

    expect(countRanNodes(TestNodeType.Test)).toBe(12);
    expect(regex.lastIndex).toBe(0);
  });

  test("test filtering does not run hooks around filtered-out tests", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports();
    const hookEvents: string[] = [];
    const strings = new Map([
      [1, "group"],
      [2, "filtered test"],
      [3, "matching test"],
    ]);
    const callbacks = new Map<number, () => void>([
      [
        101,
        () => {
          imports.__aspect.beforeEach(201);
          imports.__aspect.afterEach(202);
          imports.__aspect.reportTestTypeNode(2, 301);
          imports.__aspect.reportTestTypeNode(3, 302);
        },
      ],
      [201, () => hookEvents.push("beforeEach")],
      [202, () => hookEvents.push("afterEach")],
      [301, () => hookEvents.push("filtered body")],
      [302, () => hookEvents.push("matching body")],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.reportGroupTypeNode(1, 101);
      },
      __call(pointer: number): void {
        callbacks.get(pointer)?.();
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    // @ts-ignore setting the protected testRegex property is just for testing
    ctx.testRegex = /matching/;
    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    expect(hookEvents).toEqual(["beforeEach", "matching body", "afterEach"]);
    expect(ctx.testRunCount).toBe(1);
  });
});
