import { TestContext, TestNodeType, IAspectExports, EmptyReporter, ReflectedValue, TestNode } from "../src/index.js";
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

async function runLogContext(): Promise<TestContext> {
  const contents = await binary;
  const ctx = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "assembly/jest-log.ts",
    binary: contents,
  });
  const result = await instantiate<IAspectExports>(contents, ctx.createImports({}));

  ctx.run(result);

  ctx.rootNode.visit((node) => {
    for (const log of node.logs) {
      log.stack = "";
      normalizePointers(log);
    }
  });

  return ctx;
}

function findChild(parent: TestNode, name: string): TestNode {
  const child = parent.children.find((node) => node.name === name);
  expect(child).toBeDefined();
  return child!;
}

function findLog(logs: ReflectedValue[], predicate: (value: ReflectedValue) => boolean): ReflectedValue {
  const log = logs.find(predicate);
  expect(log).toBeDefined();
  return log!;
}

function vec3Components(value: ReflectedValue): unknown[] {
  expect(value.typeName).toBe("Vec3");
  expect(value.values).not.toBeNull();
  return value.values!.map((component) => component.value);
}

describe("log output", () => {
  test("captures group logs, test logs, todos, and formatted reflected values", async () => {
    const ctx = await runLogContext();
    const group = findChild(ctx.rootNode, "logs");
    const groupTest = findChild(group, "logs");

    expect(group.type).toBe(TestNodeType.Group);
    expect(group.pass).toBe(true);
    expect(groupTest.type).toBe(TestNodeType.Test);
    expect(groupTest.pass).toBe(true);
    expect(group.todos).toEqual(["one", "two", "three"]);

    expect(group.logs.map((log) => log.value)).toEqual(expect.arrayContaining(["Hello world!", 42, "null"]));
    expect(group.logs.filter((log) => log.typeName === "bool").map((log) => log.value)).toEqual([1, 0]);
    expect(groupTest.logs.map((log) => log.value)).toEqual(
      expect.arrayContaining(["Hello world!", "Calculated 42", 42, "null"]),
    );
    expect(groupTest.logs.filter((log) => log.typeName === "bool").map((log) => log.value)).toEqual([1, 0]);

    const groupVec3 = findLog(group.logs, (log) => log.typeName === "Vec3" && !log.isNull);
    const testVec3 = findLog(groupTest.logs, (log) => log.typeName === "Vec3" && !log.isNull);
    expect(vec3Components(groupVec3)).toEqual([1, 2, 3]);
    expect(vec3Components(testVec3)).toEqual([1, 2, 3]);

    expect(testVec3.stringify(stringifyOptions)).toContain("class: Vec3 {");
    expect(testVec3.stringify(stringifyOptions)).toContain("x: number: 1");
    expect(testVec3.stringify(stringifyOptions)).toContain("y: number: 2");
    expect(testVec3.stringify(stringifyOptions)).toContain("z: number: 3");

    const childValue = findLog(groupTest.logs, (log) => log.typeName === "Child");
    expect(childValue.stringify(stringifyOptions)).toContain("class: Child {");
    expect(childValue.stringify(stringifyOptions)).toContain("a: number: 0");
    expect(childValue.stringify(stringifyOptions)).toContain("b: number: 4");
    expect(childValue.stringify(stringifyOptions)).toContain("d: number: 6");
  });
});
