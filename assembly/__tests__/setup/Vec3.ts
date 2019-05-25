export class Vec3 {
  x: f64;
  y: f64;
  z: f64;

  constructor(x: f64, y: f64, z: f64) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

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
}
