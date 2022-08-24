import { TestContext } from "../src/index.js";

describe("TestContext", () => {
  it("should throw errors when using a bad reporter", () => {
    const ctx = new TestContext({
      // @ts-ignore: This is absolutely on purpose, to make the context error
      reporter: {}
    });

    expect(ctx.errors).toMatchSnapshot("Reporter errors");
  });
});