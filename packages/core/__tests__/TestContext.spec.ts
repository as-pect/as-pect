import { TestContext } from "../src";

describe("TestContext", () => {
  test("constructor", () => {
    const t = new TestContext({
      reporter: {} as any,
    });

    expect(t.errors).toMatchSnapshot("errors");
  });
});
