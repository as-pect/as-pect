class Vec3 {
  public constructor(public x: f64 = 0, public y: f64 = 0, public z: f64 = 0) {}
}

describe("a set of snapshots", () => {
  test("some snapshots", () => {
    expect(1).toMatchSnapshot("an integer");
    expect(3.14).toMatchSnapshot("a float");

    expect([1, 2, 3, 4, 5]).toMatchSnapshot("an integer array");

    let a = new Float64Array(4);
    a[0] = 1;
    a[1] = 2;
    a[2] = 3;
    a[3] = 4;
    expect(a).toMatchSnapshot("a typed array");
    expect("a string").toMatchSnapshot("a string");
    expect(new Vec3(1, 2, 3)).toMatchSnapshot("a reference");
  });
});
