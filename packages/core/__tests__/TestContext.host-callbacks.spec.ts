import { instantiate } from "@assemblyscript/loader";
import { jest } from "@jest/globals";
import { promises as fs } from "fs";
import { createGroupReport, EmptyReporter, IAspectExports, TestContext, TestNode, TestNodeType } from "../src/index.js";
import { ReflectedValueType } from "../src/util/ReflectedValueType.js";

const snapshotBinary = fs.readFile("./assembly/jest-reporter-snapshot.wasm");

const aspectHostCallbacks = [
  "afterAll",
  "afterEach",
  "attachStackTraceToReflectedValue",
  "beforeAll",
  "beforeEach",
  "clearActual",
  "clearExpected",
  "createReflectedLong",
  "createReflectedNumber",
  "createReflectedValue",
  "debug",
  "errorMessageIncludes",
  "logReflectedValue",
  "pushReflectedObjectKey",
  "pushReflectedObjectValue",
  "reportActualReflectedValue",
  "reportExpectedFalsy",
  "reportExpectedFinite",
  "reportExpectedReflectedValue",
  "reportExpectedSnapshot",
  "reportExpectedTruthy",
  "reportGroupTypeNode",
  "reportNegatedTestNode",
  "reportTestTypeNode",
  "reportTodo",
  "tryCall",
];

function findChild(parent: TestNode, name: string, index = 0): TestNode {
  const matches = parent.children.filter((node) => node.name === name);
  expect(matches[index]).toBeDefined();
  return matches[index];
}

describe("TestContext host callbacks", () => {
  test("createImports exposes the expected __aspect callback inventory", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports(
      {
        __aspect: {
          ignoredHostCallback: () => {},
        },
        env: {
          customEnvImport: 1,
        },
      },
      {
        env: {
          anotherEnvImport: 2,
        },
      },
    );

    expect(Object.keys(imports.__aspect).sort()).toEqual(aspectHostCallbacks.sort());
    expect(imports.__aspect.ignoredHostCallback).toBeUndefined();
    expect(imports.env.customEnvImport).toBe(1);
    expect(imports.env.anotherEnvImport).toBe(2);
    expect(typeof imports.env.abort).toBe("function");
    expect(typeof imports.env.trace).toBe("function");
    expect(imports.rtrace).toBeDefined();
  });

  test("abort callback preserves the AssemblyScript message when a previous abort import throws", () => {
    const previousAbort = jest.fn(() => {
      throw new Error("previous abort failure");
    });
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports({
      env: {
        abort: previousAbort,
      },
    });
    const strings = new Map([
      [1, "aborting test"],
      [2, "AssemblyScript abort reason"],
      [3, "assembly/file.ts"],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.reportTestTypeNode(1, 101);
      },
      __call(pointer: number): void {
        if (pointer === 101) imports.env.abort(2, 3, 7, 11);
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    const abortingTest = findChild(ctx.rootNode, "aborting test");
    expect(previousAbort).toHaveBeenCalledWith(2, 3, 7, 11);
    expect(abortingTest.pass).toBe(false);
    expect(abortingTest.message).toBe("AssemblyScript abort reason");
    expect(abortingTest.stackTrace).toContain("previous abort failure");
  });

  test("abort callback still delegates to a non-throwing previous abort import", () => {
    const previousAbort = jest.fn();
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports({
      env: {
        abort: previousAbort,
      },
    });
    const strings = new Map([
      [1, "aborting test"],
      [2, "AssemblyScript abort reason"],
      [3, "assembly/file.ts"],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.reportTestTypeNode(1, 101);
      },
      __call(pointer: number): void {
        if (pointer === 101) imports.env.abort(2, 3, 7, 11);
        throw new Error("abort should fail this test");
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    const abortingTest = findChild(ctx.rootNode, "aborting test");
    expect(previousAbort).toHaveBeenCalledWith(2, 3, 7, 11);
    expect(abortingTest.message).toBe("AssemblyScript abort reason");
  });

  test("declaration callbacks preserve parent links and stable duplicate namespaces", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports();
    const strings = new Map([
      [1, "outer"],
      [2, "duplicate"],
      [3, "inner"],
    ]);
    const callbacks = new Map<number, () => void>([
      [
        101,
        () => {
          imports.__aspect.reportTestTypeNode(2, 201);
          imports.__aspect.reportTestTypeNode(2, 202);
          imports.__aspect.reportGroupTypeNode(3, 301);
        },
      ],
      [
        301,
        () => {
          imports.__aspect.reportTestTypeNode(2, 302);
        },
      ],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.reportGroupTypeNode(1, 101);
        imports.__aspect.reportTestTypeNode(2, 102);
      },
      __call(pointer: number): void {
        callbacks.get(pointer)?.();
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    const outer = findChild(ctx.rootNode, "outer");
    const rootDuplicate = findChild(ctx.rootNode, "duplicate");
    const firstOuterDuplicate = findChild(outer, "duplicate", 0);
    const secondOuterDuplicate = findChild(outer, "duplicate", 1);
    const inner = findChild(outer, "inner");
    const innerDuplicate = findChild(inner, "duplicate");

    expect(outer.type).toBe(TestNodeType.Group);
    expect(outer.parent).toBe(ctx.rootNode);
    expect(rootDuplicate.parent).toBe(ctx.rootNode);
    expect(firstOuterDuplicate.parent).toBe(outer);
    expect(secondOuterDuplicate.parent).toBe(outer);
    expect(inner.parent).toBe(outer);
    expect(innerDuplicate.parent).toBe(inner);
    expect([
      outer.namespace,
      rootDuplicate.namespace,
      firstOuterDuplicate.namespace,
      secondOuterDuplicate.namespace,
      inner.namespace,
      innerDuplicate.namespace,
    ]).toEqual([
      "!~outer[0]",
      "!~duplicate[0]",
      "!~outer[0]!~duplicate[0]",
      "!~outer[0]!~duplicate[1]",
      "!~outer[0]!~inner[0]",
      "!~outer[0]!~inner[0]!~duplicate[0]",
    ]);
  });

  test("hook and todo callbacks record on the active group", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports();
    const strings = new Map([
      [1, "outer"],
      [2, "inner"],
      [3, "root todo"],
      [4, "outer todo"],
      [5, "inner todo"],
      [6, "child"],
    ]);
    const callbacks = new Map<number, () => void>([
      [
        101,
        () => {
          imports.__aspect.beforeAll(501);
          imports.__aspect.beforeEach(502);
          imports.__aspect.afterEach(503);
          imports.__aspect.afterAll(504);
          imports.__aspect.reportTodo(4, 0);
          imports.__aspect.reportGroupTypeNode(2, 201);
          imports.__aspect.reportTestTypeNode(6, 301);
        },
      ],
      [
        201,
        () => {
          imports.__aspect.beforeAll(601);
          imports.__aspect.beforeEach(602);
          imports.__aspect.afterEach(603);
          imports.__aspect.afterAll(604);
          imports.__aspect.reportTodo(5, 0);
          imports.__aspect.reportTestTypeNode(6, 302);
        },
      ],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.beforeAll(401);
        imports.__aspect.beforeEach(402);
        imports.__aspect.afterEach(403);
        imports.__aspect.afterAll(404);
        imports.__aspect.reportTodo(3, 0);
        imports.__aspect.reportGroupTypeNode(1, 101);
      },
      __call(pointer: number): void {
        callbacks.get(pointer)?.();
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    const outer = findChild(ctx.rootNode, "outer");
    const inner = findChild(outer, "inner");

    expect(ctx.rootNode.beforeAll).toEqual([401]);
    expect(ctx.rootNode.beforeEach).toEqual([402]);
    expect(ctx.rootNode.afterEach).toEqual([403]);
    expect(ctx.rootNode.afterAll).toEqual([404]);
    expect(ctx.rootNode.todos).toEqual(["root todo"]);
    expect(outer.beforeAll).toEqual([501]);
    expect(outer.beforeEach).toEqual([502]);
    expect(outer.afterEach).toEqual([503]);
    expect(outer.afterAll).toEqual([504]);
    expect(createGroupReport(outer).todos).toEqual(["outer todo"]);
    expect(inner.beforeAll).toEqual([601]);
    expect(inner.beforeEach).toEqual([602]);
    expect(inner.afterEach).toEqual([603]);
    expect(inner.afterAll).toEqual([604]);
    expect(createGroupReport(inner).todos).toEqual(["inner todo"]);
  });

  test("target node scope restores around passing and throwing callbacks", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports();
    const strings = new Map([
      [1, "outer"],
      [2, "passing test"],
      [3, "throwing test"],
      [4, "sibling test"],
      [5, "i32"],
    ]);
    const logNumber = (value: number): void => {
      const reflectedValue = imports.__aspect.createReflectedNumber(1, 4, ReflectedValueType.Integer, 5, value);
      imports.__aspect.logReflectedValue(reflectedValue);
    };
    const callbacks = new Map<number, () => void>([
      [
        101,
        () => {
          imports.__aspect.afterEach(401);
          imports.__aspect.reportTestTypeNode(2, 201);
          imports.__aspect.reportTestTypeNode(3, 202);
          imports.__aspect.reportTestTypeNode(4, 203);
        },
      ],
      [201, () => logNumber(1)],
      [
        202,
        () => {
          logNumber(2);
          throw new Error("expected host callback failure");
        },
      ],
      [203, () => logNumber(3)],
      [401, () => logNumber(100)],
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

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    const outer = findChild(ctx.rootNode, "outer");
    const passingTest = findChild(outer, "passing test");
    const throwingTest = findChild(outer, "throwing test");
    const siblingTest = findChild(outer, "sibling test");

    expect(outer.logs.map((log) => log.value)).toEqual([100, 100, 100]);
    expect(passingTest.logs.map((log) => log.value)).toEqual([1]);
    expect(throwingTest.logs.map((log) => log.value)).toEqual([2]);
    expect(throwingTest.pass).toBe(false);
    expect(siblingTest.logs.map((log) => log.value)).toEqual([3]);
    expect(siblingTest.ran).toBe(true);
  });

  test("duplicate snapshot callbacks under one test receive stable suffixes", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports();
    const strings = new Map([
      [1, "snapshots"],
      [2, "same snapshot"],
      [3, "i32"],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.reportTestTypeNode(1, 101);
      },
      __call(pointer: number): void {
        if (pointer !== 101) return;

        const first = imports.__aspect.createReflectedNumber(1, 4, ReflectedValueType.Integer, 3, 1);
        const second = imports.__aspect.createReflectedNumber(1, 4, ReflectedValueType.Integer, 3, 2);
        imports.__aspect.reportExpectedSnapshot(first, 2);
        imports.__aspect.reportExpectedSnapshot(second, 2);
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    expect(Array.from(ctx.snapshots.values.entries())).toEqual([
      ["snapshots[0]!~same snapshot[0]", "1"],
      ["snapshots[0]!~same snapshot[1]", "2"],
    ]);
  });

  test("duplicate test names isolate snapshot suffixes per test namespace", () => {
    const ctx = new TestContext({ reporter: new EmptyReporter() });
    const imports = ctx.createImports();
    const strings = new Map([
      [1, "outer"],
      [2, "duplicate"],
      [3, "same snapshot"],
      [4, "i32"],
    ]);
    const wasm = {
      _start(): void {
        imports.__aspect.reportGroupTypeNode(1, 101);
      },
      __call(pointer: number): void {
        if (pointer === 101) {
          imports.__aspect.reportTestTypeNode(2, 201);
          imports.__aspect.reportTestTypeNode(2, 202);
          return;
        }

        const reflectedValue = imports.__aspect.createReflectedNumber(1, 4, ReflectedValueType.Integer, 4, pointer);
        imports.__aspect.reportExpectedSnapshot(reflectedValue, 3);

        if (pointer === 201) {
          const secondValue = imports.__aspect.createReflectedNumber(1, 4, ReflectedValueType.Integer, 4, 1201);
          imports.__aspect.reportExpectedSnapshot(secondValue, 3);
        }
      },
      __getString(pointer: number): string {
        return strings.get(pointer) ?? "";
      },
    } as unknown as IAspectExports;

    ctx.run({ exports: wasm, instance: {} as WebAssembly.Instance });

    expect(Array.from(ctx.snapshots.values.entries())).toEqual([
      ["outer[0]!~duplicate[0]!~same snapshot[0]", "201"],
      ["outer[0]!~duplicate[0]!~same snapshot[1]", "1201"],
      ["outer[0]!~duplicate[1]!~same snapshot[0]", "202"],
    ]);
  });

  test("snapshot callbacks record under the active test namespace", async () => {
    const contents = await snapshotBinary;
    const ctx = new TestContext({
      reporter: new EmptyReporter(),
      fileName: "assembly/jest-reporter-snapshot.ts",
      binary: contents,
    });

    ctx.run(await instantiate<IAspectExports>(contents, ctx.createImports()));

    expect(ctx.pass).toBe(true);
    expect(Array.from(ctx.snapshots.values.keys())).toEqual([
      "snapshots[0]!~a few snapshots[0]!~first vec3[0]",
      "snapshots[0]!~a few snapshots[0]!~a string[0]",
      "snapshots[0]!~a few snapshots[0]!~some integer[0]",
      "snapshots[0]!~a few snapshots[0]!~some float value[0]",
    ]);
    expect(ctx.snapshots.values.get("snapshots[0]!~a few snapshots[0]!~first vec3[0]")).toContain("Vec3 {");
    expect(ctx.snapshots.values.get("snapshots[0]!~a few snapshots[0]!~a string[0]")).toBe('"some string"');
    expect(ctx.snapshots.values.get("snapshots[0]!~a few snapshots[0]!~some integer[0]")).toBe("504");
    expect(ctx.snapshots.values.get("snapshots[0]!~a few snapshots[0]!~some float value[0]")).toBe("3.14");
  });
});
