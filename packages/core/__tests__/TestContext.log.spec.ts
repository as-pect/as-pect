import {
  TestContext,
  TestNodeType,
  IAspectExports,
  EmptyReporter,
  ReflectedValue,
} from "../src/index.js";
import { StringifyReflectedValueProps } from "../src/util/stringifyReflectedValue.js";
import { promises as fs } from "fs";
import { instantiate } from "@assemblyscript/loader";

const binary = fs.readFile("./assembly/jest-log.wasm");

function normalizePointers(value: ReflectedValue, seen = new Set<ReflectedValue>()): void {
  if (seen.has(value)) return;
  seen.add(value);
  value.pointer = 0;

  for (const key of value.keys ?? []) {
    normalizePointers(key, seen);
  }

  for (const child of value.values ?? []) {
    normalizePointers(child, seen);
  }
}

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

describe("log output", () => {
  test("Overall Statistics", async () => {
    const contents = await binary;
    const ctx = new TestContext({
      reporter: new EmptyReporter(),
      fileName: "assembly/jest-log.ts",
      binary: contents,
    });
    const result = await instantiate<IAspectExports>(
      contents,
      ctx.createImports({}),
    );
    ctx.run(result);
    ctx.rootNode.visit((group) => {
      if (group.type === TestNodeType.Group) {
        for (const log of group.logs) {
          const stack = log.stack;
          log.stack = "";
          normalizePointers(log);
          expect(log).toMatchSnapshot(`${group.name} log`);
          log.stack = stack;
        }
        for (const todo of group.todos) {
          expect(todo).toMatchSnapshot(`${group.name} todo`);
        }
        expect(group.pass).toBeTruthy();
        for (const groupTest of group.groupTests) {
          for (const log of groupTest.logs) {
            const stack = log.stack;
            log.stack = "";
            normalizePointers(log);
            expect(log).toMatchSnapshot(`${group.name} ${groupTest.name} log`);
            expect(log.stringify(stringifyOptions)).toMatchSnapshot(
              `${group.name} ${groupTest.name} stringify`,
            );
            log.stack = stack;
          }
          expect(groupTest.pass).toBeTruthy();
        }
      }
    });
  });
});
