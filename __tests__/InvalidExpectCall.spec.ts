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
          "stackTrace": "    at assembly/internal/Expectation/Expectation<assembly/jest-invalid-expectation/SomeRef>#reportActual (wasm-function[17]:11)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[34]:18)
          at assembly/internal/Describe/describe (wasm-function[36]:11)
          at start:assembly/jest-invalid-expectation (wasm-function[37]:7)
          at start (wasm-function[38]:1)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/Expectation/Expectation<assembly/jest-invalid-expectation/SomeRef>#reportActual (wasm-function[17]:21)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[34]:80)
          at assembly/internal/Describe/describe (wasm-function[36]:11)
          at start:assembly/jest-invalid-expectation (wasm-function[37]:7)
          at start (wasm-function[38]:1)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/Expectation/Expectation<i32>#reportActual (wasm-function[23]:6)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[34]:170)
          at assembly/internal/Describe/describe (wasm-function[36]:11)
          at start:assembly/jest-invalid-expectation (wasm-function[37]:7)
          at start (wasm-function[38]:1)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "An expect() function call was used outside of a test function in assembly/jest.ts.",
          "stackTrace": "    at assembly/internal/Expectation/Expectation<~lib/string/String>#reportActual (wasm-function[30]:20)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[34]:230)
          at assembly/internal/Describe/describe (wasm-function[36]:11)
          at start:assembly/jest-invalid-expectation (wasm-function[37]:7)
          at start (wasm-function[38]:1)",
          "type": "InvalidExpectCall",
        },
      ]
    `);
  });

  it("should not run any tests", () => {
    expect(ctx.testGroups[0].tests).toHaveLength(0);
  });
});
