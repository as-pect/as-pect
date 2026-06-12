import { Reflect as AspectReflect } from "../internal/Reflect";

class ReflectedSetHolder {
  values: Set<i32> = new Set<i32>();

  constructor() {
    this.values.add(1);
    this.values.add(2);
  }
}

/**
 * This test describes the types that are output from the expect function.
 */
describe("unit types", () => {
  /**
   * This test has a problem with using the `instanceof` keyword with an ambient type that has
   * a generic <T> value. It is, however, valid AssemblyScript. It verifies that the output
   *  of the `expect<T>()` function matches the expected output.
   *
   * This is a primary unit test of the `as-pect` testing suite.
   */
  it("should create instanceof Expectation<T>", () => {
    var result = expect(1);
    // @ts-ignore: instanceof checks must include type generics if they are in the definition
    assert(
      result instanceof Expectation,
      "The result is not instanceof Expectation.",
    );
  });

  /**
   * This test validates that the actual value is set when using the `expect()` function.
   */
  it("should create an expectation with a value", () => {
    var result = expect(1);
    assert(
      result.actual == 1,
      "The expect function does not report values correctly.",
    );
  });

  /**
   * This test actually tests the implementation, but it validates that an expectation is negated.
   * In order to access a private value on the reference, we must use `offsetof<T>("_not")`
   */
  it("should negate the _not property", () => {
    var result = expect(1).not;
    var notValue = load<bool>(
      changetype<usize>(result),
      offsetof<Expectation<i32>>("_not"),
    );
    assert(notValue, "The expect function was not negated.");
  });

  it("should return a reflected value id for a top-level Set", () => {
    var previousReflectedValueID = AspectReflect.toReflectedValue(42);
    var values = new Set<i32>();
    values.add(1);
    values.add(2);

    var reflectedSetID = AspectReflect.toReflectedValue(values);

    assert(
      reflectedSetID != previousReflectedValueID,
      "Reflect.toReflectedValue() should return the Set's reflected value id, not alias a previous value.",
    );
    assert(
      reflectedSetID > previousReflectedValueID,
      "Reflect.toReflectedValue() should return the newly-created Set reflected value id.",
    );
  });

  it("should reserve a distinct reflected value id for nested Sets", () => {
    var seen = new Map<usize, i32>();
    var previousReflectedValueID = AspectReflect.toReflectedValue("before set", seen);
    var holder = new ReflectedSetHolder();

    AspectReflect.toReflectedValue(holder, seen);
    var reflectedNestedSetID = AspectReflect.toReflectedValue(holder.values, seen);

    assert(
      reflectedNestedSetID != previousReflectedValueID,
      "Nested Set reflection should keep its own reflected value id after an earlier value exists.",
    );
    assert(
      reflectedNestedSetID > previousReflectedValueID,
      "Nested Set reflection should cache a newly-created Set reflected value id.",
    );
  });
});
