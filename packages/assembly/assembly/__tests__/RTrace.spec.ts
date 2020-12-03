import { Vec3 } from "./setup/Vec3";

/* eslint-disable-line no-unused-vars */
let ATo: Vec3;

@unmanaged
class TestUnmanaged {}

/**
 * The only valid test we can perform in AssemblyScript to verify `RTrace` works is to assert that
 * the `count()` function returns a positive number.
 */
describe("RTrace", () => {
  it("should start and end with the correct delta in reference counts", () => {
    RTrace.start(1);
    ATo = new Vec3(1, 2, 3);

    expect(RTrace.count()).toBeGreaterThan(
      0,
      "RTrace counts should be greater than 0",
    );

    let delta = RTrace.end(1);
    expect(delta).toBeGreaterThan(
      0,
      "delta from RTrace.end() should be greater than 0",
    );
  });

  it("should return a positive number", () => {
    ATo = new Vec3(1, 2, 3);
    expect(RTrace.count()).toBeGreaterThan(
      0,
      "RTrace counts should be greater than 0",
    );
  });

  it("should return a correct reference count of a pointer", () => {
    let ptr = __new(offsetof<Vec3>(), idof<Vec3>());

    for (let i = 0; i < 5; i++) __retain(ptr);
    expect(RTrace.refCountOf(ptr)).toBe(5);

    for (let i = 0; i < 3; i++) __release(ptr);
    expect(RTrace.refCountOf(ptr)).toBe(2);

    for (let i = 0; i < 2; i++) __release(ptr);
  });

  it("should return a correct reference count of a reference", () => {
    let reference: Vec3 = new Vec3(1, 2, 3);

    expect(RTrace.refCountOfReference(reference)).toBe(1);
    for (let i = 0; i < 5; i++) __retain(changetype<usize>(reference));
    expect(RTrace.refCountOfReference(reference)).toBe(6);

    for (let i = 0; i < 3; i++) __release(changetype<usize>(reference));
    expect(RTrace.refCountOfReference(reference)).toBe(3);

    for (let i = 0; i < 2; i++) __release(changetype<usize>(reference));
  });

  it("should return 0 for the reference count of an unmanaged class", () => {
    let reference: TestUnmanaged = new TestUnmanaged();
    expect(RTrace.refCountOfReference(reference)).toBe(0);
  });

  it("should return a correct size of a pointer", () => {
    let ptr = __new(offsetof<Vec3>(), idof<Vec3>());
    expect(RTrace.sizeOf(ptr)).toBe(offsetof<Vec3>());
  });

  it("should return a correct size of a reference", () => {
    let reference: Vec3 = new Vec3(1, 2, 3);
    expect(RTrace.sizeOfReference(reference)).toBe(offsetof<Vec3>());
  });

  it("should return a correct size of an unmanaged class", () => {
    let reference: TestUnmanaged = new TestUnmanaged();
    expect(RTrace.sizeOfReference<TestUnmanaged>(reference)).toBe(
      offsetof<TestUnmanaged>(),
    );
  });

  it("should return a correct type id of a pointer", () => {
    let ptr = __new(offsetof<Vec3>(), idof<Vec3>());
    expect(RTrace.typeIdOf(ptr)).toBe(idof<Vec3>());
  });

  it("should return a correct type id of a reference", () => {
    let reference: Vec3 = new Vec3(1, 2, 3);
    expect(RTrace.typeIdOfReference(reference)).toBe(idof<Vec3>());
  });

  throws(
    "when null is passed to typeIdOfReference",
    () => {
      RTrace.typeIdOfReference<Vec3 | null>(null);
    },
    "Null is not a valid parameter value for typeIdOfReference",
  );

  throws(
    "when null is passed to refCountOfReference",
    () => {
      RTrace.refCountOfReference<Vec3 | null>(null);
    },
    "Null is not a valid parameter value for refCountOfReference",
  );

  throws(
    "when null is passed to sizeOfReference",
    () => {
      RTrace.sizeOfReference<Vec3 | null>(null);
    },
    "Null is not a valid parameter value for sizeOfReference",
  );
});
