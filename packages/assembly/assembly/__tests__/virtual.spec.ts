class A {}
class B extends A {
  constructor(public a: A | null = null) {
    super();
  }
}

describe("B", () => {
  test("reflect.equals", () => {
    let b = new B();
    b.__aspectStrictEquals(b, [], [], []);
  });
});
