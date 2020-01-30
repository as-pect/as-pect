import { Vec3 } from "./setup/Vec3";

let globalVec: Vec3;

@unmanaged class TestUnmanaged {}

/**
 * The only valid test we can perform in AssemblyScript to verify `RTrace` works is to assert that
 * the `count()` function returns a positive number.
 */
describe("RTrace", () => {
  it("should start and end with the correct delta in reference counts", () => {
    RTrace.start(1);
    globalVec = new Vec3(1, 2, 3);

    expect<i32>(RTrace.count()).toBeGreaterThan(0, "RTrace counts should be greater than 0");
    
    let delta: i32 = RTrace.end(1);
    expect<i32>(delta).toBeGreaterThan(0, "delta from RTrace.end() should be greater than 0");
  });

  it("should return a positive number", () => {
    globalVec = new Vec3(1, 2, 3);
    expect<i32>(RTrace.count()).toBeGreaterThan(0, "RTrace counts should be greater than 0");
  });

  it('should return a correct reference count of a pointer', () => {
    let ptr: i32 = __alloc(offsetof<Vec3>(), idof<Vec3>());

    for (let i = 0; i < 5; i++) __retain(ptr);
    expect<i32>(RTrace.refCountOf(ptr)).toBe(5);

    for (let i = 0; i < 3; i++) __release(ptr);
    expect<i32>(RTrace.refCountOf(ptr)).toBe(2);

    for (let i = 0; i < 2; i++) __release(ptr);
  });

  it('should return a correct reference count of a reference', () => {
    let reference: Vec3 = new Vec3(1, 2, 3);

    expect<i32>(RTrace.refCountOfReference<Vec3>(reference as Vec3)).toBe(2);
    for (let i = 0; i < 5; i++) __retain(changetype<usize>(reference));
    expect<i32>(RTrace.refCountOfReference<Vec3>(reference as Vec3)).toBe(7);

    for (let i = 0; i < 3; i++) __release(changetype<usize>(reference));
    expect<i32>(RTrace.refCountOfReference<Vec3>(reference as Vec3)).toBe(4);

    for (let i = 0; i < 2; i++) __release(changetype<usize>(reference));
  });

  it("should return 0 for the reference count of an unmanaged class", () => {
    let reference: TestUnmanaged = new TestUnmanaged();
    expect<i32>(RTrace.refCountOfReference(reference)).toBe(0);
  });

  it("should return a correct size of a pointer", () => {
    let ptr: i32 = __alloc(offsetof<Vec3>(), idof<Vec3>());
    expect<i32>(RTrace.sizeOf(ptr)).toBe(offsetof<Vec3>());
  });

  it("should return a correct size of a reference", () => {
    let reference: Vec3 = new Vec3(1, 2, 3);
    expect<i32>(RTrace.sizeOfReference<Vec3>(reference)).toBe(offsetof<Vec3>());
  });

  it("should return a correct size of an unmanaged class", () => {
    let reference: TestUnmanaged = new TestUnmanaged();
    expect<i32>(RTrace.sizeOfReference<TestUnmanaged>(reference)).toBe(offsetof<TestUnmanaged>());
  });

  it("should return a correct type id of a pointer", () => {
    let ptr: i32 = __alloc(offsetof<Vec3>(), idof<Vec3>());

    expect<i32>(RTrace.typeIdOf(ptr)).toBe(idof<Vec3>());
  });

  it("should return a correct type id of a reference", () => {
    let reference: Vec3 = new Vec3(1, 2, 3);

    expect<i32>(RTrace.typeIdOfReference<Vec3>(reference)).toBe(idof<Vec3>());
  });

  it("should return a correct type id for an unmanaged class", () => {
    let reference: TestUnmanaged = new TestUnmanaged();

    // expect<i32>(RTrace.typeIdOfReference<TestUnmanaged>(reference)).toBe(idof<TestUnmanaged>());
  });
});
