import { TestContext } from "../src/test/TestContext";
import { createPassFailModule } from "./setup/createPassFailModule";

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

describe("pass-fail", () => {
  test("pass-fail", () => {
    for (const group of ctx.testGroups) {
      expect(group.pass).toMatchSnapshot(`${group.name} pass`);
      expect(group.afterAllPointers).toMatchSnapshot(`${group.name} afterAllPointers`);
      expect(group.afterEachPointers).toMatchSnapshot(`${group.name} afterEachPointers`);
      expect(group.beforeEachPointers).toMatchSnapshot(`${group.name} beforeEachPointers`);
      expect(group.beforeAllPointers).toMatchSnapshot(`${group.name} beforeAllPointers`);
      expect(group.reason).toMatchSnapshot(`${group.name} reason`);

      for (const test of group.tests) {
        expect(test.pass).toMatchSnapshot(`${group.name}~${test.name} pass`);
        if (test.actual) {
          expect(test.actual.bytes).toMatchSnapshot(`${group.name}~${test.name}~actual bytes`);
          expect(test.actual.message).toMatchSnapshot(`${group.name}~${test.name}~actual message`);
          expect(test.actual.offset).toMatchSnapshot(`${group.name}~${test.name}~actual offset`);
          expect(test.actual.pointer).toMatchSnapshot(`${group.name}~${test.name}~actual pointer`);
          expect(test.actual.stack).toMatchSnapshot(`${group.name}~${test.name}~actual stack`);
          expect(test.actual.target).toBe(test);
          expect(test.actual.value).toMatchSnapshot(`${group.name}~${test.name}~actual value`);
        }
        if (test.expected) {
          expect(test.expected.bytes).toMatchSnapshot(`${group.name}~${test.name}~expected bytes`);
          expect(test.expected.message).toMatchSnapshot(`${group.name}~${test.name}~expected message`);
          expect(test.expected.offset).toMatchSnapshot(`${group.name}~${test.name}~expected offset`);
          expect(test.expected.pointer).toMatchSnapshot(`${group.name}~${test.name}~expected pointer`);
          expect(test.expected.stack).toMatchSnapshot(`${group.name}~${test.name}~expected stack`);
          expect(test.expected.target).toBe(test);
          expect(test.expected.value).toMatchSnapshot(`${group.name}~${test.name}~expected value`);
          expect(test.expected.negated).toMatchSnapshot(`${group.name}~${test.name}~expected negated`);
        }
        expect(test.functionPointer).toMatchSnapshot(`${group.name}~${test.name} functionPointer`);
        expect(test.message).toMatchSnapshot(`${group.name}~${test.name} message`);
        expect(test.negated).toMatchSnapshot(`${group.name}~${test.name} negated`);
      }
    }
  });
});
