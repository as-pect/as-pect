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
    expect(context.testGroups).toHaveLength(1);
  });

  test("test filtering", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /two/i;
    context.run(wasm);
    expect(context.testGroups).toHaveLength(3);

    context.testGroups.forEach(group => {
      expect(group.tests).toHaveLength(1);
    });
  });

  test("test filtering with no test matching", () => {
    // @ts-ignore setting the protected testRegex property is just for testing
    context.testRegex = /five/i;
    context.run(wasm);
    expect(context.testGroups).toHaveLength(0);
  });
});
