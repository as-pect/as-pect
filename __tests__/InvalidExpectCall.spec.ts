import { createModule } from "./setup/createInvalidExpectationModule";
import { TestContext } from "../src/test/TestContext";

let ctx: TestContext;
let start = new Promise<void>((resolve, reject) => {
  createModule({}, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      resolve();
    }
  });
});

beforeEach(() => start);

describe("an invalid expect call test suite", () => {
  it("should match the error snapshots", () => {
    expect(ctx.errors).toMatchInlineSnapshot(`
      Array [
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest-invalid-expectation.ts.",
          "stackTrace": "    at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[64]:398)
          at assembly/internal/Describe/describe (wasm-function[66]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[67]:6)
          at start (wasm-function[73]:1)
          at assembly/index/__main (wasm-function[68]:6)",
          "type": "InvalidExpectCall",
        },
      ]
    `);
  });

  it("should not run any tests", () => {
    expect(ctx.testGroups[0].tests.filter(e => e.ran)).toHaveLength(0);
  });
});
