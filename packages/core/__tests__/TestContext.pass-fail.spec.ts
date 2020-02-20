import { TestContext } from "../src/test/TestContext";
import { createPassFailModule } from "./setup/createPassFailModule";
import { StringifyReflectedValueProps } from "../src/util/stringifyReflectedValue";

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
  for (const group of ctx.testGroups) {
    test(`Group: ${group.name}`, () => {
      expect(group.pass).toMatchSnapshot(`pass`);
      expect(group.afterAllPointers.length).toMatchSnapshot(`afterAllPointers`);
      expect(group.afterEachPointers.length).toMatchSnapshot(
        `afterEachPointers`,
      );
      expect(group.beforeEachPointers.length).toMatchSnapshot(
        `beforeEachPointers`,
      );
      expect(group.beforeAllPointers.length).toMatchSnapshot(
        `beforeAllPointers`,
      );
      expect(group.reason).toMatchSnapshot(`reason`);
    });

    describe(`Group: ${group.name}`, () => {
      for (const groupTest of group.tests) {
        test(`Test: ${groupTest.name}`, () => {
          expect(groupTest.pass).toMatchSnapshot(`pass`);
          expect(groupTest.actual).toMatchSnapshot("actual");
          if (groupTest.actual) expect(groupTest.actual.stringify(stringifyOptions)).toMatchSnapshot("actual-stringify");
          expect(groupTest.expected).toMatchSnapshot("expected");
          if (groupTest.expected) expect(groupTest.expected.stringify(stringifyOptions)).toMatchSnapshot("expected-stringify");
          expect(groupTest.message).toMatchSnapshot(`message`);
          expect(groupTest.negated).toMatchSnapshot(`negated`);
        });
      }
    });
  }
});
