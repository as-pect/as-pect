import { instantiate } from "@assemblyscript/loader";
import { promises as fs } from "fs";
import { EmptyReporter, IAspectExports, TestContext, TestNode, TestNodeType } from "../src/index.js";

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
      "a few snapshots!~first vec3[0]",
      "a few snapshots!~a string[0]",
      "a few snapshots!~some integer[0]",
      "a few snapshots!~some float value[0]",
    ]);
    expect(ctx.snapshots.values.get("a few snapshots!~first vec3[0]")).toContain("Vec3 {");
    expect(ctx.snapshots.values.get("a few snapshots!~a string[0]")).toBe('"some string"');
    expect(ctx.snapshots.values.get("a few snapshots!~some integer[0]")).toBe("504");
    expect(ctx.snapshots.values.get("a few snapshots!~some float value[0]")).toBe("3.14");
  });
});
