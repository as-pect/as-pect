import { Vec3 } from "./jest-log";

describe("snapshots", () => {
  test("a few snapshots", () => {
    expect(new Vec3(1, 2, 3)).toMatchSnapshot("first vec3");
    expect("some string").toMatchSnapshot("a string");
    expect(504).toMatchSnapshot("some integer");
    expect(3.14).toMatchSnapshot("some float value");
  });
});
