import { Vec3 } from "./setup/Vec3";

describe("logs", (): void => {
  test("a log", (): void => {
    log<string>("Some string value");
    log<Vec3>(new Vec3(1, 2, 3));
    log<Vec3>(null);
    log<i32>(1);
    log<f64>(1.23);
  });

  todo("make a test!");
});