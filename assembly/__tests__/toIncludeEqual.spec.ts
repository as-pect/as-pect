import { Vec3 } from "./setup/Vec3";

let numberTester: i32[] = new Array<i32>();
numberTester.push(1);
numberTester.push(2);
numberTester.push(3);

describe("toIncludeEqual value arrays", () => {
  it("should include numbers", () => {
    expect<i32[]>(numberTester).toIncludeEqual(2, "numberTester should include 2");
  });

  throws("when numberTester doesn't include a number", () => {
    expect<i32[]>(numberTester).toIncludeEqual(4);
  }, "numberTester should not include 4");

  it("should not include numbers", () => {
    expect<i32[]>(numberTester).not.toIncludeEqual(4, "numberTester should not include 4");
  });

  throws("when numberTester includes a number but the expectation is negated", () => {
    expect<i32[]>(numberTester).not.toIncludeEqual(2);
  });
});

let referenceTester: Vec3[] = new Array<Vec3>();
let one = new Vec3(1,2,3);
let two = new Vec3(1,2,3);
let three = new Vec3(1,2,3);
referenceTester.push(one);
referenceTester.push(two);
referenceTester.push(three);

/**
 * This test block describes the toIncludeEqual method which performs a block comparison on every
 * item in the array. `T` should be a reference, or it delegates to `toInclude()`, it's not
 * necessary to test `T` where `T` is a value type.
 */
describe("toIncludeEqual reference arrays", () => {
  /**
   * This test verifies that pointer equality "strictEqual"s a value.
   */
  it("should include a reference", () => {
    expect<Vec3[]>(referenceTester).toIncludeEqual(two, "referenceTester should include reference two");
  });

  /**
   * This test throws because two is included as a reference to referenceTester.
   */
  throws("when referenceTester includes a reference but the expectation is negated", () => {
    expect<Vec3[]>(referenceTester).not.toIncludeEqual(two);
  });

  /**
   * This test verifies a memory block equivalent to the first item exists in the referenceTester
   * array.
   */
  it("should include a reference", () => {
    expect<Vec3[]>(referenceTester).toIncludeEqual(new Vec3(1, 2, 3), "referenceTester should include reference two");
  });

  /**
   * This test throws because referenceTester doesn't contain a reference that matches the expected
   * value.
   */
  throws("when referenceTester doesn't include a reference", () => {
    expect<Vec3[]>(referenceTester).toIncludeEqual(new Vec3(4, 5, 6));
  }, "numberTester should not include four");

  /**
   * This test validates there is no reference that matches any of the elements in referenceTester.
   */
  it("should not include a reference", () => {
    expect<Vec3[]>(referenceTester).not
      .toIncludeEqual(new Vec3(4, 5, 6), "referenceTester should not include reference four");
  });

  /**
   * This test throws because an item that "strictEqual"s an element exists in the referenceTester
   * array.
   */
  throws("when referenceTester includes a reference but the expectation is negated", () => {
    expect<Vec3[]>(referenceTester).not.toIncludeEqual(new Vec3(1, 2, 3));
  });
});

let typedarray = new Uint8Array(10);
for (let i = 0; i < 10; i++) typedarray[i] = <u8>i;

describe("TypedArrays", () => {
  it("should include values", () => {
    expect<Uint8Array>(typedarray).toIncludeEqual(5);
  });

  itThrows("when the value is included", () => {
    expect<Uint8Array>(typedarray).not.toIncludeEqual(5);
  }, "The underlying array contains the value,");

  it("should not include values", () => {
    expect<Uint8Array>(typedarray).not.toIncludeEqual(11);
  });

  itThrows("when the value is included", () => {
    expect<Uint8Array>(typedarray).toIncludeEqual(11);
  }, "The value is not included.");
});

let stringRefs = new Array<string>(0);
stringRefs.push("one");
stringRefs.push("two");
stringRefs.push("three");

describe("arrays with strings", () => {
  it("should include values", () => {
    expect<string[]>(stringRefs).toIncludeEqual("three");
  });

  itThrows("when the value is included", () => {
    expect<string[]>(stringRefs).not.toIncludeEqual("three");
  }, "The underlying array contains the value,");

  it("should not include values", () => {
    expect<string[]>(stringRefs).not.toIncludeEqual("four");
  });

  itThrows("when the value is included", () => {
    expect<string[]>(stringRefs).toIncludeEqual("four");
  }, "The value is not included.");
});
