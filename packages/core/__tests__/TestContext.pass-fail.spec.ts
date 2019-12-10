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
          if (groupTest.actual) {
            expect(groupTest.actual.bytes).toMatchSnapshot(`actual bytes`);
            expect(groupTest.actual.message).toMatchSnapshot(`actual message`);
            expect(groupTest.actual.offset).toMatchSnapshot(`actual offset`);
            expect(groupTest.actual.target).toBe(groupTest);
            expect(groupTest.actual.value).toMatchSnapshot(`actual value`);
            expect(groupTest.actual.values).toMatchSnapshot(`actual values`);
          }
          if (groupTest.expected) {
            expect(groupTest.expected.bytes).toMatchSnapshot(`expected bytes`);
            expect(groupTest.expected.message).toMatchSnapshot(
              `expected message`,
            );
            expect(groupTest.expected.offset).toMatchSnapshot(
              `expected offset`,
            );
            expect(groupTest.expected.target).toBe(groupTest);
            expect(groupTest.expected.value).toMatchSnapshot(`expected value`);
            expect(groupTest.expected.negated).toMatchSnapshot(
              `expected negated`,
            );
            expect(groupTest.expected.values).toMatchSnapshot(`expected values`);
          }
          // expect(test.functionPointer).toMatchSnapshot(`${group.name}~${test.name} functionPointer`);
          expect(groupTest.message).toMatchSnapshot(`message`);
          expect(groupTest.negated).toMatchSnapshot(`negated`);
        });
      }
    });
  }
});
