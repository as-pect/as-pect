import { TestContext } from "../src/test/TestContext";
import { createTestGroupFilterModule } from "./setup/createTestGroupFilterModule";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../src/util/IAspectExports";

let context: TestContext;
let wasm: ASUtil & IAspectExports;

beforeEach(() => {
  return new Promise((resolve, reject) => {
    createTestGroupFilterModule({}, (err, result) => {
      if (err || !result) reject(err);
      else {
        context = result.context;
        wasm = result.wasm;
        resolve();
      }
    });
  });
});

describe("TestGroup filtering", () => {
  test("group filtering", () => {
    // @ts-ignore setting the protected groupRegex property is just for testing
    context.groupRegex = /two/i;
    context.run(wasm);
    expect(context.rootNode.groupTests).toHaveLength(1);
  });

  test("test filtering", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(wasm);
    expect(context.rootNode.childGroups).toHaveLength(3);

    context.rootNode.childGroups.forEach(group => {
      expect(group.children).toHaveLength(1);
    });
  });

  test("test filtering with no test matching", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /five/i;
    context.run(wasm);
    expect(context.rootNode.groupTests).toHaveLength(0);
  });
});
