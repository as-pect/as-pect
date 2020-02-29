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

  ctx.rootNode.visit(group => {
    test(`Node: ${group.namespace}`, () => {
      expect(group.pass).toMatchSnapshot(`pass`);
      expect(group.ran).toMatchSnapshot("ran");
      expect(group.afterAll.length).toMatchSnapshot(`afterAllPointers`);
      expect(group.afterEach.length).toMatchSnapshot(`afterEachPointers`);
      expect(group.beforeEach.length).toMatchSnapshot(`beforeEachPointers`);
      expect(group.beforeAll.length).toMatchSnapshot(`beforeAllPointers`);
      expect(group.allocations).toMatchSnapshot("allocations");
      expect(group.reallocs).toMatchSnapshot("reallocs");
      expect(group.frees).toMatchSnapshot("frees");
      expect(group.increments).toMatchSnapshot("increments");
      expect(group.decrements).toMatchSnapshot("decrements");

      if (group.actual) {
        group.actual.stack = group.actual.stack
          ? "Has Stack Trace"
          : "No Stack Trace";

        expect(group.actual).toMatchSnapshot("actual");
        expect(group.actual.stringify(stringifyOptions)).toMatchSnapshot(
          "actual-stringify",
        );
      }

      if (group.expected) {
        group.expected.stack = group.expected.stack
          ? "Has Stack Trace"
          : "No Stack Trace";

        expect(group.expected).toMatchSnapshot("expected");
        expect(group.expected.stringify(stringifyOptions)).toMatchSnapshot(
          "expected-stringify",
        );
      }

      expect(group.message).toMatchSnapshot("message");
      expect(group.type).toMatchSnapshot("type");
    });
  });
});
