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

  @operator(">")
  protected __greaterThan(reference: Vec3): bool {
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude > refmagnitude;
  }

  @operator(">=")
  protected __greaterThanOrEqualTo(reference: Vec3): bool {
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude >= refmagnitude;
  }

  @operator("<")
  protected __lessThan(reference: Vec3): bool {
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude < refmagnitude;
  }

  @operator("<=")
  protected __lessThanOrEqualTo(reference: Vec3): bool {
    var magnitude = this.magnitude();
    var refmagnitude = reference.magnitude();
    return magnitude <= refmagnitude;
  }

  @operator("==")
  protected __equals(reference: Vec3): bool {
    return this.x == reference.x
      && this.y == reference.y
      && this.z == reference.z;
  }
}


describe("logs", () => {
  log<string>("Hello world!");
  log<i32>(42);
  log<Vec3>(null);
  log<Vec3>(new Vec3(1, 2, 3));
  log<i32[]>([1, 2, 3]);
  log<i64>(9999999999999);
  log<u32>(1234567);
  log<u64>(999999999999);
  log<i8>(-1);
  log<i16>(-1);
  log<bool>(true);
  log<bool>(false);

  test("logs", () => {
    log<string>("Hello world!");
    log<i32>(42);
    log<Vec3>(null);
    log<Vec3>(new Vec3(1, 2, 3));
    log<i32[]>([1, 2, 3]);
    log<i64>(9999999999999);
    log<u32>(1234567);
    log<u64>(999999999999);
    log<i8>(-1);
    log<i16>(-1);
    log<bool>(true);
    log<bool>(false);
  });

  todo("one");
  todo("two");
  todo("three");
});
