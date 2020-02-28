import { TestContext } from "../src/test/TestContext";
import { createPassFailModule } from "./setup/createPassFailModule";
import { StringifyReflectedValueProps } from "../src/util/stringifyReflectedValue";
import { TestNodeType } from "@as-pect/assembly/assembly/internal/TestNodeType";

let ctx: TestContext;

let start = new Promise<void>((resolve, reject) => {
  createPassFailModule({}, (err, result) => {
    if (err) {
      console.log(err);
      reject(err);
    } else {
      ctx = result!;
      resolve();
    }
  });
});

beforeAll(() => start);

const stringifyOptions: Partial<StringifyReflectedValueProps> = {
  indent: 2,
  tab: 4,
  maxLineLength: 80,
  maxPropertyCount: 10,
  maxExpandLevel: 3,
  classNameFormatter: name => "class: " + name,
  keywordFormatter: keyword => "keyword: " + keyword,
  numberFormatter: number => "number: " + number,
  stringFormatter: str => "string: " + str,
};

describe("pass-fail output", () => {
  test("Overall Statistics", () => {
    expect(ctx.pass).toMatchSnapshot("pass");
  });

  ctx.rootNode.visit(group => {
    if (group.type === TestNodeType.Group) {
      test(`Group: ${group.name}`, () => {
        expect(group.pass).toMatchSnapshot(`pass`);
        expect(group.afterAll.length).toMatchSnapshot(`afterAllPointers`);
        expect(group.afterEach.length).toMatchSnapshot(
          `afterEachPointers`,
        );
        expect(group.beforeEach.length).toMatchSnapshot(
          `beforeEachPointers`,
        );
        expect(group.beforeAll.length).toMatchSnapshot(
          `beforeAllPointers`,
        );
        /** @todo: add reasons back in */
        // expect(group.reason).toMatchSnapshot(`reason`);
      });

      describe(`Group: ${group.name}`, () => {
        for (const groupTest of group.groupTests) {
          test(`Test: ${groupTest.name}`, () => {
            expect(groupTest.pass).toMatchSnapshot(`pass`);
            expect(groupTest.actual).toMatchSnapshot("actual");
            if (groupTest.actual)
              expect(
                groupTest.actual.stringify(stringifyOptions),
              ).toMatchSnapshot("actual-stringify");
            expect(groupTest.expected).toMatchSnapshot("expected");
            if (groupTest.expected)
              expect(
                groupTest.expected.stringify(stringifyOptions),
              ).toMatchSnapshot("expected-stringify");
            expect(groupTest.message).toMatchSnapshot(`message`);
            expect(groupTest.negated).toMatchSnapshot(`negated`);
          });
        }
      });
    }
  });
});
