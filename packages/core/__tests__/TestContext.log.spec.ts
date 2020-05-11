import { TestContext, TestNodeType } from "../src";
import { createLogModule } from "./setup/createLogModule";
import { StringifyReflectedValueProps } from "../src/util/stringifyReflectedValue";

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

const stringifyOptions: Partial<StringifyReflectedValueProps> = {
  indent: 2,
  tab: 4,
  maxLineLength: 80,
  maxPropertyCount: 10,
  maxExpandLevel: 3,
  classNameFormatter: (name) => "class: " + name,
  keywordFormatter: (keyword) => "keyword: " + keyword,
  numberFormatter: (number) => "number: " + number,
  stringFormatter: (str) => "string: " + str,
};

describe("log output", () => {
  test("Overall Statistics", () => {});

  ctx.rootNode.visit((group) => {
    if (group.type === TestNodeType.Group) {
      test(`Group: ${group.name}`, () => {
        for (const log of group.logs) {
          const stack = log.stack;
          log.stack = "";
          expect(log).toMatchSnapshot("log");
          log.stack = stack;
        }
        for (const todo of group.todos) {
          expect(todo).toMatchSnapshot(`todo`);
        }
        expect(group.pass).toBeTruthy();
      });

      describe(`Group: ${group.name}`, () => {
        for (const groupTest of group.groupTests) {
          test(`Test: ${groupTest.name}`, () => {
            for (const log of groupTest.logs) {
              const stack = log.stack;
              log.stack = "";
              expect(log).toMatchSnapshot("log");
              expect(log.stringify(stringifyOptions)).toMatchSnapshot(
                "stringify",
              );
              log.stack = stack;
            }
            expect(groupTest.pass).toBeTruthy();
          });
        }
      });
    }
  });
});
