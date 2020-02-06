@unmanaged
class ExampleClass {}

describe("unmanaged references", () => {
  test("unmanaged handling", () => {
    let t = new ExampleClass();
    let start = RTrace.increments();
    Actual.report(t);
    let end = RTrace.increments();
    expect(start).toBe(end);
  });
});
