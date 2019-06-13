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
          "stackTrace": "    at assembly/internal/Expectation/Expectation<i32>#toBe (wasm-function[60]:140)
          at start:assembly/jest-invalid-expectation~anonymous|0 (wasm-function[68]:40)
          at assembly/internal/Describe/describe (wasm-function[70]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[73]:6)
          at start (wasm-function[82]:12)",
          "type": "InvalidExpectCall",
        },
        Object {
          "message": "TestCollectionError: This is an error message.",
          "stackTrace": "RuntimeError: unreachable
          at start:assembly/jest-invalid-expectation~anonymous|1 (wasm-function[72]:18)
          at assembly/internal/Describe/describe (wasm-function[70]:16)
          at start:assembly/jest-invalid-expectation (wasm-function[73]:13)
          at start (wasm-function[82]:12)",
          "type": "TestCollectionError",
        },
      ]
    `);
  });

  it("should not run any tests", () => {
    for (const group of ctx.testGroups) {
      expect(group.tests.filter(e => e.ran)).toHaveLength(0);
    }
  });
});
