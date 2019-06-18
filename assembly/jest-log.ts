import { Vec3 } from "./__tests__/setup/Vec3";

describe("logs", () => {
  log<string>("Hello world!");
  log<i32>(42);
  log<Vec3>(null);
  log<Vec3>(new Vec3(1, 2, 3));
  log<i32[]>([1, 2, 3]);
  log<i64>(9999999999999);
  log<u32>(1234567);
  log<u64>(999999999999);

  test("logs", () => {
    log<string>("Hello world!");
    log<i32>(42);
    log<Vec3>(null);
    log<Vec3>(new Vec3(1, 2, 3));
    log<i32[]>([1, 2, 3]);
    log<i64>(9999999999999);
    log<u32>(1234567);
    log<u64>(999999999999);
  });

  todo("one");
  todo("two");
  todo("three");
});
