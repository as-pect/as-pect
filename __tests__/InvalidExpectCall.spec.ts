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
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[55]:59)
          at assembly/internal/Describe/describe (wasm-function[57]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[58]:6)
          at start (wasm-function[61]:1)
          at assembly/index/__main (wasm-function[59]:6)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/comparison/truthyComparison/truthyComparison<assembly/jest-invalid-expectation/SomeRef> (wasm-function[45]:79)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[55]:197)
          at assembly/internal/Describe/describe (wasm-function[57]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[58]:6)
          at start (wasm-function[61]:1)
          at assembly/index/__main (wasm-function[59]:6)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[55]:259)
          at assembly/internal/Describe/describe (wasm-function[57]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[58]:6)
          at start (wasm-function[61]:1)
          at assembly/index/__main (wasm-function[59]:6)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/comparison/truthyComparison/truthyComparison<~lib/string/String> (wasm-function[52]:44)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[55]:345)
          at assembly/internal/Describe/describe (wasm-function[57]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[58]:6)
          at start (wasm-function[61]:1)
          at assembly/index/__main (wasm-function[59]:6)",
          "type": "InvalidExpectCall",
        },
      ]
    `);
  });

  it("should not run any tests", () => {
    expect(ctx.testGroups[0].tests).toHaveLength(0);
  });
});
