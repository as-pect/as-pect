import { promises as fs } from "fs";
import { instantiate } from "@assemblyscript/loader";
import { EmptyReporter, IAspectExports, TestContext, TestNode } from "../src/index.js";

const binary = fs.readFile("./assembly/jest-lifecycle.wasm");

const EVENT_NAMES = [
  "outer beforeAll",
  "outer beforeEach",
  "outer test body",
  "outer afterEach",
  "inner beforeAll",
  "inner beforeEach",
  "inner test body",
  "inner afterEach",
  "inner afterAll",
  "outer afterAll",
  "failing beforeAll hook",
  "should not run after beforeAll fails",
  "failing beforeEach hook",
  "should not run after beforeEach fails",
  "failing afterEach test body",
  "failing afterEach hook",
  "failing afterAll test body",
  "failing afterAll hook",
  "nested afterEach test body",
  "inner failing afterEach hook",
  "outer afterEach after nested failure",
];

async function runLifecycleContext(): Promise<{
  ctx: TestContext;
  events: string[];
}> {
  const contents = await binary;
  const events: string[] = [];
  const ctx = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "assembly/jest-lifecycle.ts",
    binary: contents,
  });
  const result = await instantiate<IAspectExports>(
    contents,
    ctx.createImports({
      __lifecycle: {
        recordEvent(code: number): void {
          events.push(EVENT_NAMES[code] ?? `unknown event ${code}`);
        },
      },
    }),
  );

  ctx.run(result);

  return { ctx, events };
}

function findChild(parent: TestNode, name: string): TestNode {
  const child = parent.children.find((node) => node.name === name);
  expect(child).toBeDefined();
  return child!;
}

function logValues(node: TestNode): unknown[] {
  return node.logs.map((log) => log.value);
}

function reflectedValueValue(node: TestNode, key: "actual" | "expected"): unknown {
  const value = node[key];
  expect(value).not.toBeNull();
  return value!.value;
}

describe("TestContext lifecycle characterization", () => {
  it("runs nested hooks in their intended order", async () => {
    const { events } = await runLifecycleContext();

    expect(events).toEqual([
      "outer beforeAll",
      "outer beforeEach",
      "outer test body",
      "outer afterEach",
      "inner beforeAll",
      "outer beforeEach",
      "inner beforeEach",
      "inner test body",
      "inner afterEach",
      "outer afterEach",
      "inner afterAll",
      "outer afterAll",
      "failing beforeAll hook",
      "failing beforeEach hook",
      "failing afterEach test body",
      "failing afterEach hook",
      "failing afterAll test body",
      "failing afterAll hook",
      "nested afterEach test body",
      "inner failing afterEach hook",
    ]);
  });

  it("documents current log ownership for nested hooks and test bodies", async () => {
    const { ctx } = await runLifecycleContext();
    const lifecycleOrder = findChild(ctx.rootNode, "lifecycle order");
    const outerTest = findChild(lifecycleOrder, "outer test");
    const inner = findChild(lifecycleOrder, "inner");
    const innerTest = findChild(inner, "inner test");

    expect(logValues(lifecycleOrder)).toEqual(["outer beforeAll", "outer beforeEach"]);
    expect(logValues(outerTest)).toEqual(["outer test body", "outer afterEach"]);
    expect(logValues(inner)).toEqual(["inner beforeAll", "outer beforeEach", "inner beforeEach"]);
    expect(logValues(innerTest)).toEqual([
      "inner test body",
      "inner afterEach",
      "outer afterEach",
      "inner afterAll",
      "outer afterAll",
    ]);
  });

  it("documents current failing-hook fact ownership", async () => {
    const { ctx, events } = await runLifecycleContext();
    const failingBeforeAll = findChild(ctx.rootNode, "failing beforeAll hook");
    const afterBeforeAllFailure = findChild(failingBeforeAll, "should not run after beforeAll fails");
    const failingBeforeEach = findChild(ctx.rootNode, "failing beforeEach hook");
    const afterBeforeEachFailure = findChild(failingBeforeEach, "should not run after beforeEach fails");
    const failingAfterEach = findChild(ctx.rootNode, "failing afterEach hook");
    const afterEachBody = findChild(failingAfterEach, "body runs before afterEach fails");
    const failingAfterAll = findChild(ctx.rootNode, "failing afterAll hook");
    const afterAllBody = findChild(failingAfterAll, "body runs before afterAll fails");
    const nestedFailingAfterEach = findChild(ctx.rootNode, "nested failing afterEach hook");
    const innerAfterEachFails = findChild(nestedFailingAfterEach, "inner afterEach fails");
    const nestedAfterEachBody = findChild(innerAfterEachFails, "body runs before inner afterEach fails");

    expect(events).not.toContain("should not run after beforeAll fails");
    expect(events).not.toContain("should not run after beforeEach fails");
    // afterEach remains fail-fast: once the inner hook fails, outer afterEach
    // hooks are intentionally skipped instead of running with overwritten facts.
    expect(events).not.toContain("outer afterEach after nested failure");

    expect(failingBeforeAll.pass).toBe(false);
    expect(failingBeforeAll.message).toBe("beforeAll failure marker");
    expect(reflectedValueValue(failingBeforeAll, "actual")).toBe(10);
    expect(reflectedValueValue(failingBeforeAll, "expected")).toBe(11);
    expect(logValues(failingBeforeAll)).toEqual(["failing beforeAll hook"]);
    expect(afterBeforeAllFailure.ran).toBe(false);
    expect(logValues(afterBeforeAllFailure)).toEqual([]);

    expect(failingBeforeEach.pass).toBe(false);
    expect(failingBeforeEach.message).toBe("beforeEach failure marker");
    expect(reflectedValueValue(failingBeforeEach, "actual")).toBe(20);
    expect(reflectedValueValue(failingBeforeEach, "expected")).toBe(21);
    expect(logValues(failingBeforeEach)).toEqual(["failing beforeEach hook"]);
    expect(afterBeforeEachFailure.ran).toBe(false);
    expect(logValues(afterBeforeEachFailure)).toEqual([]);

    expect(failingAfterEach.pass).toBe(false);
    expect(failingAfterEach.message).toBe("afterEach failure marker");
    expect(reflectedValueValue(failingAfterEach, "actual")).toBe(30);
    expect(reflectedValueValue(failingAfterEach, "expected")).toBe(31);
    expect(logValues(failingAfterEach)).toEqual([]);
    expect(afterEachBody.pass).toBe(true);
    expect(logValues(afterEachBody)).toEqual(["failing afterEach test body", "failing afterEach hook"]);

    expect(failingAfterAll.pass).toBe(false);
    expect(failingAfterAll.message).toBe("afterAll failure marker");
    expect(reflectedValueValue(failingAfterAll, "actual")).toBe(40);
    expect(reflectedValueValue(failingAfterAll, "expected")).toBe(41);
    expect(logValues(failingAfterAll)).toEqual([]);
    expect(afterAllBody.pass).toBe(true);
    expect(logValues(afterAllBody)).toEqual(["failing afterAll test body", "failing afterAll hook"]);

    expect(nestedFailingAfterEach.pass).toBe(false);
    expect(logValues(nestedFailingAfterEach)).toEqual([]);
    expect(innerAfterEachFails.pass).toBe(false);
    expect(innerAfterEachFails.message).toBe("inner afterEach failure marker");
    expect(reflectedValueValue(innerAfterEachFails, "actual")).toBe(50);
    expect(reflectedValueValue(innerAfterEachFails, "expected")).toBe(51);
    expect(logValues(innerAfterEachFails)).toEqual([]);
    expect(nestedAfterEachBody.pass).toBe(true);
    expect(logValues(nestedAfterEachBody)).toEqual(["nested afterEach test body", "inner failing afterEach hook"]);
  });
});
