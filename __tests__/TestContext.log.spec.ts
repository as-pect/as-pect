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

describe("logged values", () => {
  test("log values", () => {
    for (const group of ctx.testGroups) {
      for (const log of group.logs) {
        expect(log.bytes).toMatchSnapshot(`${group.name} bytes`);
        expect(log.message).toMatchSnapshot(`${group.name} message`);
        expect(log.offset).toMatchSnapshot(`${group.name} offset`);
        expect(log.pointer).toMatchSnapshot(`${group.name} pointer`);
        expect(log.stack).toMatchSnapshot(`${group.name} stack`);
        expect(log.target).toBe(group);
        expect(log.value).toMatchSnapshot(`${group.name} snapshot`);
      }

      for (const test of group.tests) {
        for (const log of test.logs) {
          expect(log.bytes).toMatchSnapshot(`${group.name}~${test.name} bytes`);
          expect(log.message).toMatchSnapshot(`${group.name}~${test.name} message`);
          expect(log.offset).toMatchSnapshot(`${group.name}~${test.name} offset`);
          expect(log.pointer).toMatchSnapshot(`${group.name}~${test.name} pointer`);
          expect(log.stack).toMatchSnapshot(`${group.name}~${test.name} stack`);
          expect(log.target).toBe(test);
          expect(log.value).toMatchSnapshot(`${group.name}~${test.name} snapshot`);
        }
      }

      for (const todo of group.todos) {
        expect(todo).toMatchSnapshot(`${group.name} todo`);
      }
    }
  });
});
