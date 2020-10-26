/**
 * This is a standard Vec3 Class that contains three float values.
 */
export class Vec3 {
  constructor(public x: f64, public y: f64, public z: f64) {}

  magnitude(): f64 {
    return sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
  }

  @operator(">")
  protected __greaterThan(reference: Vec3 | null): bool {
    if (reference === null) return false;
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude > refmagnitude;
  }

  @operator(">=")
  protected __greaterThanOrEqualTo(reference: Vec3 | null): bool {
    if (reference === null) return false;
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude >= refmagnitude;
  }

  @operator("<")
  protected __lessThan(reference: Vec3 | null): bool {
    if (reference === null) return false;
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude < refmagnitude;
  }

  @operator("<=")
  protected __lessThanOrEqualTo(reference: Vec3 | null): bool {
    if (reference === null) return false;
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude <= refmagnitude;
  }

  @operator("==")
  protected __equals(reference: Vec3 | null): bool {
    if (this === reference) return true;
    if (reference === null) return false;
    return (
      this.x == reference.x && this.y == reference.y && this.z == reference.z
    );
  }
}

let globalVecArray: Vec3[] = new Array<Vec3>(0);
let globalVec: Vec3 | null;

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

  test("trigger a reallocation", () => {
    // create a reference that will be reallocated
    let a = __retain(__new(100, idof<ArrayBuffer>()));

    // add some things to the heap so tlsf must allocate a new block for "a"
    let b = new Vec3(1, 2, 3);
    let c = new Vec3(1, 2, 3);
    let d = new Vec3(1, 2, 3);
    let e = new Vec3(1, 2, 3);
    
    // manually trigger a reallocation
    a = __renew(changetype<usize>(a), 10000);
    __release(a);
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
  test("RTrace.nodeIncrements()", () => {
    RTrace.nodeIncrements();
  });
  test("RTrace.nodeDecrements()", () => {
    RTrace.nodeDecrements();
  });
  test("RTrace.allocations()", () => {
    RTrace.allocations();
  });
  test("RTrace.frees()", () => {
    RTrace.frees();
  });
  test("RTrace.nodeAllocations()", () => {
    RTrace.nodeAllocations();
  });
  test("RTrace.nodeFrees()", () => {
    RTrace.nodeFrees();
  });

  test("RTrace.activeNodeBlocks()", () => {
    RTrace.activeNodeBlocks();
  });

  test("RTrace.activeBlocks()", () => {
    RTrace.activeBlocks();
  });

  test("RTrace.sizeOf(pointer: usize)", () => {
    let ref = new Vec3(1, 2, 3);
    RTrace.sizeOf(changetype<usize>(ref));
    log<Vec3>(ref);
  });

  test("RTrace.sizeOfReference<T>(reference: T)", () => {
    let ref = new Vec3(1, 2, 3);
    RTrace.sizeOfReference(ref);
    log<Vec3>(ref);
  });

  test("RTrace.typeIdOf(pointer: usize)", () => {
    let ref = new Vec3(1, 2, 3);
    RTrace.typeIdOf(changetype<usize>(ref));
    log(ref);
  });

  test("RTrace.typeIdOfReference<T>(reference: T)", () => {
    let ref = new Vec3(1, 2, 3);
    RTrace.typeIdOfReference(ref);
    log(ref);
  });

  test("RTrace.refCountOf(pointer: usize)", () => {
    let ref = new Vec3(1, 2, 3);
    RTrace.refCountOf(changetype<usize>(ref));
    log(ref);
  });

  test("RTrace.refCountOfReference<T>(reference: T)", () => {
    let ref = new Vec3(1, 2, 3);
    RTrace.refCountOfReference(ref);
    log(ref);
  });

  test("RTrace.reallocations()", () => {
    log(RTrace.reallocations());
  });

  test("RTrace.nodeReallocations()", () => {
    log(RTrace.nodeReallocations());
  });
});
