import { TestContext } from "../src";

describe("TestContext", () => {
  test("constructor", () => {
    const t = new TestContext({
      reporter: {} as any,
      nortrace: true,
    });

    expect(t.errors).toMatchSnapshot("errors");
    const imports = t.createImports();
    expect(imports.rtrace).not.toBeDefined();
  });
});
