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
    if (reference === this) return true;
    if (reference === null) return false;
    //@ts-ignore
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

type idFunction = (i: i32) => i32;
function IdFunction(i: i32): i32  { return i; }
export const id_func: idFunction = IdFunction;

@unmanaged
class UnmanagedClass {
  a: f64 = 1;
  b: f64 = 2;
  c: f64 = 3;
}

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
  log<idFunction>(id_func);
  trace("The thing!", 5, 1, 2, 3, 4, 5);

  test("logs", () => {
    log("Hello world!");
    log(42);
    log<Vec3 | null>(null);
    log(new Vec3(1, 2, 3));
    log([1, 2, 3]);
    log(<i64>9999999999999);
    log(<u32>1234567);
    log(<u64>999999999999);
    log(<i8>-1);
    log(<i16>-1);
    log(true);
    log(false);
    log(testArray);
    log(testArray2);
    log(id_func);
    trace("The thing!", 5, 1, 2, 3, 4, 5);
    let e = new UnmanagedClass();
    log(e);
    __free(changetype<usize>(e));
  });

  todo("one");
  todo("two");
  todo("three");
});
