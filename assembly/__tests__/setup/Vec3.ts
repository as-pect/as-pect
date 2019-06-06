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
}
