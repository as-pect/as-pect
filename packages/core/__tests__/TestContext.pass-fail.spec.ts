import { instantiate } from "@assemblyscript/loader";
import { promises as fs } from "fs";
import { EmptyReporter, IAspectExports, ReflectedValue, TestContext, TestNode, TestNodeType } from "../src/index.js";

const binary = fs.readFile("./assembly/jest-pass-fail.wasm");

async function runPassFailContext(): Promise<TestContext> {
  const contents = await binary;
  const ctx = new TestContext({
    reporter: new EmptyReporter(),
    fileName: "./assembly/jest-pass-fail.ts",
    binary: contents,
  });

  ctx.run(await instantiate<IAspectExports>(contents, ctx.createImports()));

  return ctx;
}

function findChild(parent: TestNode, name: string): TestNode {
  const child = parent.children.find((node) => node.name === name);
  expect(child).toBeDefined();
  return child!;
}

function reflectedValueValue(node: TestNode, key: "actual" | "expected"): unknown {
  const value = node[key];
  expect(value).not.toBeNull();
  return value!.value;
}

function reflectedComponents(value: ReflectedValue | null): unknown[] {
  expect(value).not.toBeNull();
  expect(value!.values).not.toBeNull();
  return value!.values!.map((component) => component.value);
}

describe("pass-fail output", () => {
  test("records robust pass/fail facts for assertions and hooks", async () => {
    const ctx = await runPassFailContext();

    expect(ctx.pass).toBe(false);

    const topLevelTest = findChild(ctx.rootNode, "A test outside of a describe block");
    expect(topLevelTest.type).toBe(TestNodeType.Test);
    expect(topLevelTest.pass).toBe(true);
    expect(topLevelTest.ran).toBe(true);

    const passFail = findChild(ctx.rootNode, "pass-fail");
    expect(passFail.type).toBe(TestNodeType.Group);
    expect(passFail.pass).toBe(false);
    expect(passFail.ran).toBe(true);
    expect(passFail.groupTests).toHaveLength(29);

    const passingAssertion = findChild(passFail, "this test should pass");
    expect(passingAssertion.pass).toBe(true);
    expect(passingAssertion.ran).toBe(true);

    const failedAssert = findChild(passFail, "should fail");
    expect(failedAssert.pass).toBe(false);
    expect(failedAssert.message).toBe("expected fail");

    const stringMismatch = findChild(passFail, "should expect strings");
    expect(stringMismatch.pass).toBe(false);
    expect(reflectedValueValue(stringMismatch, "actual")).toBe("two");
    expect(reflectedValueValue(stringMismatch, "expected")).toBe("one");

    const referenceMismatch = findChild(passFail, "should report reference values");
    expect(referenceMismatch.pass).toBe(false);
    expect(reflectedComponents(referenceMismatch.actual)).toEqual([1, 2, 3]);
    expect(reflectedComponents(referenceMismatch.expected)).toEqual([4, 5, 6]);

    const numberMismatch = findChild(passFail, "should report number values");
    expect(numberMismatch.pass).toBe(false);
    expect(reflectedValueValue(numberMismatch, "actual")).toBe(0);
    expect(reflectedValueValue(numberMismatch, "expected")).toBe(42);

    const passingThrows = findChild(passFail, "should report a negated test");
    expect(passingThrows.pass).toBe(true);
    expect(passingThrows.ran).toBe(true);

    const failingThrows = findChild(passFail, "should fail when test does not throw");
    expect(failingThrows.pass).toBe(false);
    expect(failingThrows.ran).toBe(true);

    const failBeforeAll = findChild(ctx.rootNode, "fail on group beforeAll");
    expect(failBeforeAll.pass).toBe(false);
    expect(failBeforeAll.message).toBe("This should fail in beforeAll");
    expect(failBeforeAll.beforeAll).toHaveLength(1);
    expect(findChild(failBeforeAll, "shouldn't run").ran).toBe(false);

    const failBeforeEach = findChild(ctx.rootNode, "fail on group beforeEach");
    expect(failBeforeEach.pass).toBe(false);
    expect(failBeforeEach.message).toBe("This should fail in beforeEach");
    expect(failBeforeEach.beforeEach).toHaveLength(1);
    expect(findChild(failBeforeEach, "shouldn't run").ran).toBe(false);

    const failAfterEach = findChild(ctx.rootNode, "fail on group afterEach");
    expect(failAfterEach.pass).toBe(false);
    expect(failAfterEach.message).toBe("This should fail in afterEach");
    expect(failAfterEach.afterEach).toHaveLength(1);
    expect(findChild(failAfterEach, "should run").pass).toBe(true);

    const failAfterAll = findChild(ctx.rootNode, "fail on group afterAll");
    expect(failAfterAll.pass).toBe(false);
    expect(failAfterAll.message).toBe("This should fail in afterAll");
    expect(failAfterAll.afterAll).toHaveLength(1);
    expect(findChild(failAfterAll, "should run").pass).toBe(true);

    for (const name of [
      "pass on group beforeAll",
      "pass on group beforeEach",
      "pass on group afterEach",
      "pass on group afterAll",
    ]) {
      const group = findChild(ctx.rootNode, name);
      expect(group.pass).toBe(true);
      expect(findChild(group, "should run").ran).toBe(true);
    }

    const nestedFailure = findChild(ctx.rootNode, "nested fail in beforeAll");
    const nested = findChild(nestedFailure, "nested");
    expect(nestedFailure.pass).toBe(false);
    expect(nested.pass).toBe(false);
    expect(nested.beforeAll).toHaveLength(1);

    const lengthGroup = findChild(ctx.rootNode, "toHaveLength");
    const lengthTest = findChild(lengthGroup, "fails");
    expect(lengthGroup.pass).toBe(false);
    expect(lengthTest.pass).toBe(false);
    expect(lengthTest.message).toBe("the reason");
    expect(reflectedValueValue(lengthTest, "actual")).toBe(3);
    expect(reflectedValueValue(lengthTest, "expected")).toBe(5);
  });
});
