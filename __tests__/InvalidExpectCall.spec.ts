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
    for (let i = 0; i < ctx.errors.length; i++) {
      let error = ctx.errors[i];
      expect(error.message).toMatchSnapshot(`Error message ${i}`);
      expect(error.type).toMatchSnapshot(`Error type ${i}`);
    }

    expect(ctx.errors).toHaveLength(3);
  });

  it("should not run any tests", () => {
    for (const group of ctx.testGroups) {
      expect(group.tests.filter(e => e.ran)).toHaveLength(0);
    }
  });
});
