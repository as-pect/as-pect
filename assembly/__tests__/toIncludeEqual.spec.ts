import { Vec3 } from "./setup/Vec3";

let numberTester: i32[] = new Array<i32>();
numberTester.push(1);
numberTester.push(2);
numberTester.push(3);

describe("toIncludeEqual value arrays", () => {
  it("should include numbers", () => {
    expect<i32[]>(numberTester).toIncludeEqual<i32>(2, "numberTester should include 2");
  });

  throws("when numberTester doesn't include a number", () => {
    expect<i32[]>(numberTester).toIncludeEqual<i32>(4);
  }, "numberTester should not include 4");

  it("should not include numbers", () => {
    expect<i32[]>(numberTester).not.toIncludeEqual<i32>(4, "numberTester should not include 4");
  });

  throws("when numberTester includes a number but the expectation is negated", () => {
    expect<i32[]>(numberTester).not.toIncludeEqual<i32>(2);
  });
});

let referenceTester: Vec3[] = new Array<Vec3>();
let one = new Vec3(1,2,3);
let two = new Vec3(1,2,3);
let three = new Vec3(1,2,3);
referenceTester.push(one);
referenceTester.push(two);
referenceTester.push(three);
let four = new Vec3(1,2,3);

describe("toIncludeEqual reference arrays", () => {
  it("should include a reference", () => {
    expect<Vec3[]>(referenceTester).toIncludeEqual<Vec3>(two, "referenceTester should include reference two");
  });

  throws("when referenceTester includes a reference but the expectation is negated", () => {
    expect<Vec3[]>(referenceTester).not.toIncludeEqual<Vec3>(two);
  });

  it("should include a reference", () => {
    expect<Vec3[]>(referenceTester).toIncludeEqual<Vec3>(new Vec3(1, 2, 3), "referenceTester should include reference two");
  });

  throws("when referenceTester doesn't include a reference", () => {
    expect<Vec3[]>(referenceTester).toIncludeEqual<Vec3>(new Vec3(4, 5, 6));
  }, "numberTester should not include four");

  it("should not include a reference", () => {
    expect<Vec3[]>(referenceTester).not.toIncludeEqual<Vec3>(new Vec3(4, 5, 6), "referenceTester should not include reference four");
  });

  throws("when referenceTester includes a reference but the expectation is negated", () => {
    expect<Vec3[]>(referenceTester).not.toIncludeEqual<Vec3>(new Vec3(1, 2, 3));
  });
});
