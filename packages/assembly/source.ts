export class A {
  public __aspectStrictEquals<T>(
    ref: T,
    stack: Array<usize>,
    cache: Array<usize>,
    ignore: StaticArray<i64>,
  ): bool {
    if (isDefined(super.__aspectStrictEquals)) {
      if (
        !super.__aspectStrictEquals(
          ref,
          stack,
          cache,
          StaticArray.concat(ignore, [] as StaticArray<i64>),
        )
      )
        return false;
    }
    return true;
  }
  public __aspectAddReflectedValueKeyValuePairs(
    reflectedValue: i32,
    seen: Map<usize, i32>,
    ignore: StaticArray<i64>,
  ): void {
    if (isDefined(super.__aspectAddReflectedValueKeyValuePairs)) {
      super.__aspectAddReflectedValueKeyValuePairs(
        reflectedValue,
        seen,
        StaticArray.concat(ignore, [] as StaticArray<i64>),
      );
    }
  }
}
class B extends A {
  constructor(public a: A | null = null) {
    super();
  }
  public __aspectStrictEquals<T>(
    ref: T,
    stack: Array<usize>,
    cache: Array<usize>,
    ignore: StaticArray<i64>,
  ): bool {
    if (
      !ignore.includes(4685344707553787904) &&
      Reflect.equals(this.a, ref.a, stack, cache) == Reflect.FAILED_MATCH
    )
      return false;
    if (isDefined(super.__aspectStrictEquals)) {
      if (
        !super.__aspectStrictEquals(
          ref,
          stack,
          cache,
          StaticArray.concat(ignore, [4685344707553787904] as StaticArray<i64>),
        )
      )
        return false;
    }
    return true;
  }
  public __aspectAddReflectedValueKeyValuePairs(
    reflectedValue: i32,
    seen: Map<usize, i32>,
    ignore: StaticArray<i64>,
  ): void {
    if (isDefined(super.__aspectAddReflectedValueKeyValuePairs)) {
      super.__aspectAddReflectedValueKeyValuePairs(
        reflectedValue,
        seen,
        StaticArray.concat(ignore, [4685344707553787904] as StaticArray<i64>),
      );
    }
    if (!ignore.includes(4685344707553787904)) {
      __aspectPushReflectedObjectKey(
        reflectedValue,
        Reflect.toReflectedValue("a", seen),
      );
      __aspectPushReflectedObjectValue(
        reflectedValue,
        Reflect.toReflectedValue(this.a, seen),
      );
    }
  }
}
let b = new B();
b.__aspectStrictEquals(new B(), [], [], []);
