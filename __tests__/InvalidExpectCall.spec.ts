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
          "stackTrace": "    at assembly/internal/Expectation/Expectation<assembly/jest-invalid-expectation/SomeRef>#reportActual (wasm-function[44]:13)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[61]:22)
          at assembly/internal/Describe/describe (wasm-function[63]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[64]:6)
          at start (wasm-function[66]:1)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/Expectation/Expectation<assembly/jest-invalid-expectation/SomeRef>#reportActual (wasm-function[44]:79)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[61]:94)
          at assembly/internal/Describe/describe (wasm-function[63]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[64]:6)
          at start (wasm-function[66]:1)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/Expectation/Expectation<i32>#reportActual (wasm-function[50]:6)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[61]:250)
          at assembly/internal/Describe/describe (wasm-function[63]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[64]:6)
          at start (wasm-function[66]:1)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/Expectation/Expectation<~lib/string/String>#reportActual (wasm-function[57]:35)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[61]:318)
          at assembly/internal/Describe/describe (wasm-function[63]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[64]:6)
          at start (wasm-function[66]:1)",
          "type": "InvalidExpectCall",
        },
      ]
    `);
  });

  it("should not run any tests", () => {
    expect(ctx.testGroups[0].tests).toHaveLength(0);
  });
});
