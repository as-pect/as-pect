import { TestContext } from "../src/test/TestContext.js";
import { StringifyReflectedValueProps } from "../src/util/stringifyReflectedValue.js";
import { promises as fs } from "fs";
import { EmptyReporter } from "../src/reporter/EmptyReporter.js";
import { instantiate } from "@assemblyscript/loader";

const stringifyOptions: Partial<StringifyReflectedValueProps> = {
  indent: 2,
  tab: 4,
  maxLineLength: 80,
  maxPropertyCount: 10,
  maxExpandLevel: 3,
  classNameFormatter: (name) => "class: " + name,
  keywordFormatter: (keyword) => "keyword: " + keyword,
  numberFormatter: (number) => "number: " + number,
  stringFormatter: (str) => "string: " + str,
};

describe("pass-fail output", () => {
  test("Overall Statistics", async () => {
    const binary = await fs.readFile("./assembly/jest-pass-fail.wasm");
    const ctx = new TestContext({
      reporter: new EmptyReporter(),
      fileName: "./assembly/jest-pass-fail.ts",
      binary,
    });

    ctx.run(await instantiate(binary, ctx.createImports()));
    // process.exit(1);
    expect(ctx.pass).toMatchSnapshot("pass");

    ctx.rootNode.visit((group) => {
      expect(group.pass).toMatchSnapshot(`${group.namespace} pass`);
      expect(group.ran).toMatchSnapshot(`${group.namespace} ran`);
      expect(group.afterAll.length).toMatchSnapshot(
        `${group.namespace} afterAllPointers`,
      );
      expect(group.afterEach.length).toMatchSnapshot(
        `${group.namespace} afterEachPointers`,
      );
      expect(group.beforeEach.length).toMatchSnapshot(
        `${group.namespace} beforeEachPointers`,
      );
      expect(group.beforeAll.length).toMatchSnapshot(
        `${group.namespace} beforeAllPointers`,
      );
      expect(group.allocations).toMatchSnapshot(
        `${group.namespace} allocations`,
      );
      expect(group.frees).toMatchSnapshot(`${group.namespace} frees`);

      if (group.actual) {
        group.actual.stack = group.actual.stack
          ? "Has Stack Trace"
          : "No Stack Trace";

        expect(group.actual).toMatchSnapshot(`${group.namespace} actual`);
        expect(group.actual.stringify(stringifyOptions)).toMatchSnapshot(
          `${group.namespace} actual-stringify`,
        );
      }

      if (group.expected) {
        group.expected.stack = group.expected.stack
          ? "Has Stack Trace"
          : "No Stack Trace";

        expect(group.expected).toMatchSnapshot(`${group.namespace} expected`);
        expect(group.expected.stringify(stringifyOptions)).toMatchSnapshot(
          `${group.namespace} expected-stringify`,
        );
      }

      expect(group.message).toMatchSnapshot(`${group.namespace} message`);
      expect(group.type).toMatchSnapshot(`${group.namespace} type`);
    });
  });
});
