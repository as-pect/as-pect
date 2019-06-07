import { Vec3 } from "./__tests__/setup/Vec3";

let globalVec: Vec3 | null = null;
let globaVecArray: Vec3[] = new Array<Vec3>(0);

describe("RTrace tests", () => {
  it("should allocate an object", () => {
    globalVec = new Vec3(1, 2, 3);
  });

  it("should deallocate an object", () => {
    globalVec = null;
  });

  it("should allocate a bunch of objects", () => {
    for (let i = 0; i < 3; i++) {
      globaVecArray.push(new Vec3(1, 2, 3));
    }
  });

  it("should deallocate all the objects", () => {
    for (let i = 0; i < 3; i++) {
      globaVecArray.pop();
    }
  });
});