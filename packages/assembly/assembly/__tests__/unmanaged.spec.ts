@unmanaged
class ExampleClass {}

describe("unmanaged references", () => {
  test("unmanaged handling", () => {
    let t = new ExampleClass();
    let start = RTrace.increments();
    Actual.report<ExampleClass>(t);
    let end = RTrace.increments();
    expect<i32>(start).toBe(end);
  });

});
