import { Vec3 } from "./__tests__/setup/Vec3";

let globalVec: Vec3 | null = null;
let globalVecArray: Vec3[] = new Array<Vec3>(0);

describe("RTrace tests", () => {
  it("should allocate an object", () => {
    globalVec = new Vec3(1, 2, 3);
  });

  it("should deallocate an object", () => {
    globalVec = null;
  });

  it("should allocate a bunch of objects", () => {
    for (let i = 0; i < 3; i++) {
      globalVecArray.push(new Vec3(1, 2, 3));
    }
  });


  it("should count references", () => {
    log<i32>(RTrace.count());
  });

  it("should start a label", () => {
    RTrace.start(1);
    globalVecArray.push(new Vec3(1, 2, 3));
    log<i32>(RTrace.end(1));
  });

  it("should deallocate all the objects", () => {
    let last: Vec3;
    for (let i = 0; i < 4; i++) {
      last = globalVecArray.pop();
    }
  });
});

let dummyReference: Vec3 = new Vec3(1, 2, 3);
describe("a group reference counting error", () => {
  beforeAll(() => {
    // This should report an error to the TestGroup and cause the entire group to fail
    __free(changetype<usize>(dummyReference));
    __free(changetype<usize>(dummyReference));
  });
  test("empty", () => {});
});

describe("RTrace api", () => {
  test("RTrace.count()", () => {
    RTrace.count();
  });
  test("RTrace.increments()", () => {
    RTrace.increments();
  });
  test("RTrace.decrements()", () => {
    RTrace.decrements();
  });
  test("RTrace.groupIncrements()", () => {
    RTrace.groupIncrements();
  });
  test("RTrace.groupDecrements()", () => {
    RTrace.groupDecrements();
  });
  test("RTrace.testIncrements()", () => {
    RTrace.testIncrements();
  });
  test("RTrace.testDecrements()", () => {
    RTrace.testDecrements();
  });
  test("RTrace.allocations()", () => {
    RTrace.allocations();
  });
  test("RTrace.frees()", () => {
    RTrace.frees();
  });
  test("RTrace.groupAllocations()", () => {
    RTrace.groupAllocations();
  });
  test("RTrace.groupFrees()", () => {
    RTrace.groupFrees();
  });
  test("RTrace.testAllocations()", () => {
    RTrace.testAllocations();
  });
  test("RTrace.testFrees()", () => {
    RTrace.testFrees();
  });
});
