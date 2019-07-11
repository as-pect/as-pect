import { Vec3 } from "./setup/Vec3";

let globalVec: Vec3;

/**
 * The only valid test we can perform in AssemblyScript to verify `RTrace` works is to assert that
 * the `count()` function returns a positive number.
 */
describe("RTrace", () => {
  beforeEach(() => {
    RTrace.start(1);
  });

  it("should return a positive number", () => {
    globalVec = new Vec3(1, 2, 3);
    expect<i32>(RTrace.count()).toBeGreaterThan(0, "RTrace counts should be greater than 0");
  });

  afterEach(() => {
    let delta = RTrace.end(1);
    expect<i32>(delta).toBe(1, "There should only now be one global reference to the Vec3 object");
  });
});
