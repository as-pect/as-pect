/**
 * This is a standard Vec3 Class that contains three float values.
 */
export class Vec3 {
  constructor(
    public x: f64,
    public y: f64,
    public z: f64) {}

  magnitude(): f64 {
    return sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
  }

  @operator("==")
  protected __equals(reference: Vec3 | null): bool {
    if (reference === this) return false;
    if (i32(reference === null) ^ i32(this === null)) return false;
    return this.x == reference.x
      && this.y == reference.y
      && this.z == reference.z;
  }
}

let testArray = new Uint8Array(3);
testArray[0] = 0;
testArray[1] = 1;
testArray[2] = 2;

let testArray2 = new Int8Array(3);
testArray2[0] = -1;
testArray2[1] = -2;
testArray2[2] = -3;

describe("logs", () => {
  log<string>("Hello world!");
  log<i32>(42);
  log<Vec3 | null>(null);
  log<Vec3>(new Vec3(1, 2, 3));
  log<i32[]>([1, 2, 3]);
  log<i64>(9999999999999);
  log<u32>(1234567);
  log<u64>(999999999999);
  log<i8>(-1);
  log<i16>(-1);
  log<bool>(true);
  log<bool>(false);
  log<Uint8Array>(testArray);
  log<Int8Array>(testArray2);

  test("logs", () => {
    log<string>("Hello world!");
    log<i32>(42);
    log<Vec3 | null>(null);
    log<Vec3>(new Vec3(1, 2, 3));
    log<i32[]>([1, 2, 3]);
    log<i64>(9999999999999);
    log<u32>(1234567);
    log<u64>(999999999999);
    log<i8>(-1);
    log<i16>(-1);
    log<bool>(true);
    log<bool>(false);
    log<Uint8Array>(testArray);
    log<Int8Array>(testArray2);
  });

  todo("one");
  todo("two");
  todo("three");
});
