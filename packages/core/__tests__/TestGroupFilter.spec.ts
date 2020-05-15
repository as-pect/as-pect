import { TestContext, TestNodeType } from "../src";
import { createTestGroupFilterModule } from "./setup/createTestGroupFilterModule";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../src/util/IAspectExports";

let context: TestContext;
let result: {
  instance: WebAssembly.Instance;
  exports: ASUtil & IAspectExports;
};

beforeEach(() => {
  return new Promise((resolve, reject) => {
    createTestGroupFilterModule({}, (err, callbackResult) => {
      if (err || !callbackResult) reject(err);
      else {
        context = callbackResult.context;
        result = callbackResult.result;
        resolve();
      }
    });
  });
});

describe("TestGroup filtering", () => {
  test("group filtering", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /two/i;
    context.run(result);
    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Group && node.ran) count += 1;
    });
    expect(count).toBe(1);
  });

  test("test filtering", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(result);

    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Test && node.ran) count += 1;
    });
    expect(count).toBe(3);
  });

  test("test filtering with no test matching", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /five/i;
    context.run(result);
    expect(context.testRunCount).toBe(0);
  });
});
