import { instantiate } from "@assemblyscript/loader";
import { promises as fs } from "fs";
import { EmptyReporter, IAspectExports, TestContext } from "../src/index.js";

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
