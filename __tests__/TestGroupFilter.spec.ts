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
  test("group filtering", (): void => {
    context.groupRegex = /two/i;
    context.run(wasm);
    expect(context.testGroups).toMatchSnapshot();
  });

  test("test filtering", (): void => {
    context.testRegex = /two/i;
    context.run(wasm);
    expect(context.testGroups).toMatchSnapshot();
  });

  test("test filtering with no test matching", () => {
    context.testRegex = /four/i;
    context.run(wasm);
    expect(context.testGroups).toMatchSnapshot();
  });
});
