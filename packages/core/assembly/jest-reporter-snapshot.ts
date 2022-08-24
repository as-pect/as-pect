class Vec3 {
  constructor(public x: f64, public y: f64, public z: f64) {}

  magnitude(): f64 {
    return sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
  }

  @operator("==")
  protected __equals(reference: Vec3 | null): bool {
    if (changetype<usize>(reference) == 0) return false;
    if (changetype<usize>(reference) == changetype<usize>(this)) return true;
    return (
      this.x == reference!.x && this.y == reference!.y && this.z == reference!.z
    );
  }
}


describe("snapshots", () => {
  test("a few snapshots", () => {
    expect<Vec3>(new Vec3(1, 2, 3)).toMatchSnapshot("first vec3");
    expect("some string").toMatchSnapshot("a string");
    expect(504).toMatchSnapshot("some integer");
    expect(3.14).toMatchSnapshot("some float value");
  });
});
