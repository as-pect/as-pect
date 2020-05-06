import { TestContext } from "../src/test/TestContext";
import { createTestGroupFilterModule } from "./setup/createTestGroupFilterModule";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "../src/util/IAspectExports";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";

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
    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Group && node.ran) count += 1;
    });
    expect(count).toBe(1);
  });

  test("test filtering", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(wasm);

    let count = 0;
    context.rootNode.visit((node) => {
      if (node.type === TestNodeType.Test && node.ran) count += 1;
    });
    expect(count).toBe(3);
  });

  test("test filtering with no test matching", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /five/i;
    context.run(wasm);
    expect(context.testRunCount).toBe(0);
  });
});
