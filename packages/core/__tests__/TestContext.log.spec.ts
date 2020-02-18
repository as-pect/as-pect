import { TestContext } from "../src/test/TestContext";
import { createLogModule } from "./setup/createLogModule";

let ctx: TestContext;

let start = new Promise<void>((resolve, reject) => {
  createLogModule({}, (err, result) => {
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

describe("log output", () => {
  test("Overall Statistics", () => {});
  for (const group of ctx.testGroups) {
    test(`Group: ${group.name}`, () => {
      for (const log of group.logs) {
        expect(log).toMatchSnapshot("log");
      }
      for (const todo of group.todos) {
        expect(todo).toMatchSnapshot(`todo`);
      }
      expect(group.pass).toBeTruthy();
    });

    describe(`Group: ${group.name}`, () => {
      for (const groupTest of group.tests) {
        test(`Test: ${groupTest.name}`, () => {
          for (const log of groupTest.logs) {
            expect(log).toMatchSnapshot("log");
          }
          expect(groupTest.pass).toBeTruthy();
        });
      }
    });
  }
});
