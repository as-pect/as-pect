import { Vec3 } from "./setup/Vec3";

describe("logs", (): void => {

  beforeAll((): void => {
    log<string>("Before All");
  });

  afterAll((): void => {
    log<string>("After All");
  });

  beforeEach((): void => {
    log<string>("Before Each");
  });

  afterEach((): void => {
    log<string>("After Each");
  });

  test("log a string", (): void => {
    log<string>("Some string value");
  });

  test("log a number", (): void => {
    log<i32>(42);
  });

  test("log a reference", (): void => {
    log<Vec3>(new Vec3(1, 2, 3));
  });

  test("log a null", (): void => {
    log<Vec3>(null);
  });

  todo("make a test!");
});