/* eslint-disable @typescript-eslint/no-empty-function */
/**
 * This is a standard Vec3 Class that contains three float values.
 */
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

let testArray = new Uint8Array(3);
testArray[0] = 0;
testArray[1] = 1;
testArray[2] = 2;

let testArray2 = new Int8Array(3);
testArray2[0] = -1;
testArray2[1] = -2;
testArray2[2] = -3;

type idFunction = (i: i32) => i32;
function IdFunction(i: i32): i32 {
  return i;
}
export const id_func: idFunction = IdFunction;

@unmanaged
// @ts-ignore: unmanaged decorator is allowed
class UnmanagedClass {
  a: f64 = 1;
  b: f64 = 2;
  c: f64 = 3;
}

class LotsOfFields {
  a: f64 = 1.0;
  b: f64 = 1.0;
  c: f64 = 1.0;
  d: f64 = 1.0;
  e: f64 = 1.0;
  f: f64 = 1.0;
  g: f64 = 1.0;
  h: f64 = 1.0;
  i: f64 = 1.0;
  j: f64 = 1.0;
  k: f64 = 1.0;
  l: f64 = 1.0;
  m: f64 = 1.0;
  n: f64 = 1.0;
  o: f64 = 1.0;
  p: f64 = 1.0;
  q: f64 = 1.0;
  r: f64 = 1.0;
  s: f64 = 1.0;
  t: f64 = 1.0;
  u: f64 = 1.0;
  v: f64 = 1.0;
  w: f64 = 1.0;
  x: f64 = 1.0;
  y: f64 = 1.0;
  z: f64 = 1.0;
}

class Circular {
  a: f32 = 1.0;
  b: Circular | null = null;
  c: f32 = 3.0;
  d: Array<Circular> | null = null;
}

class NestedA {
  a: NestedB = new NestedB();
}

class NestedB {
  b: NestedC = new NestedC();
}

class NestedC {
  c: NestedD = new NestedD();
}

class NestedD {
  d: NestedE = new NestedE();
}

class NestedE {
  e: NestedF = new NestedF();
}

class NestedF {
  f: f64 = 42.0;
}

class NestedForInlineFunctionA {
  a: NestedForInlineFunctionB = new NestedForInlineFunctionB();
}

class NestedForInlineFunctionB {
  b: NestedForInlineFunctionC = new NestedForInlineFunctionC();
}

class NestedForInlineFunctionC {
  c: () => void = () => {};
}

class NestedForInlineStringA {
  a: NestedForInlineStringB = new NestedForInlineStringB();
}

class NestedForInlineStringB {
  b: NestedForInlineStringC = new NestedForInlineStringC();
}

class NestedForInlineStringC {
  c: string = "The Inlined String";
}

class NestedForInlineU8A {
  a: NestedForInlineU8B = new NestedForInlineU8B();
}

class NestedForInlineU8B {
  b: NestedForInlineU8C = new NestedForInlineU8C();
}

class NestedForInlineU8C {
  c: u8 = 42;
}

class NestedForInlineBoolA {
  a: NestedForInlineBoolB = new NestedForInlineBoolB();
}

class NestedForInlineBoolB {
  b: NestedForInlineBoolC = new NestedForInlineBoolC();
}

class NestedForInlineBoolC {
  c: bool = true;
}

class NestedTypeImpliedArrayA {
  a: NestedTypeImpliedArrayB = new NestedTypeImpliedArrayB();
}

class NestedTypeImpliedArrayB {
  b: NestedTypeImpliedArrayC = new NestedTypeImpliedArrayC();
}

class NestedTypeImpliedArrayC {
  c: u8[][] = [[<u8>0]];
}

class MeaningOfLife {
  its: i32 = 42;
}

class Overridden {
  __aspectReflectAs(): MeaningOfLife {
    return new MeaningOfLife();
  }
}

class Parent {
  a: i32 = 0;

  get b(): i32 {
    return 1;
  }

  c: i32 = 2;
}

class Child extends Parent {
  get b(): i32 {
    return 4;
  }

  d: i32 = 6;
}

describe("logs", () => {
  log("Hello world!");
  log<i32>(42);
  log<Vec3 | null>(null);
  log<Vec3>(new Vec3(1, 2, 3));
  log<i32[]>([1, 2, 3]);
  log<i64>(9999999999999);
  log<u32>(1234567);
  log<u64>(999999999999);
  log<i8>(-1);
  log<i16>(-1);
  log<bool>(true);
  log<bool>(false);
  log<Uint8Array>(testArray);
  log<Int8Array>(testArray2);
  log<idFunction>(id_func);
  trace("The thing!", 5, 1, 2, 3, 4, 5);

  test("logs", () => {
    log("Hello world!");
    log("Calculated " + (42).toString());
    log(42);
    log<Vec3 | null>(null);
    log(new Vec3(1, 2, 3));
    log([1, 2, 3]);
    log(<i64>9999999999999);
    log(<u32>1234567);
    log(<u64>999999999999);
    log(<i8>-1);
    log(<i16>-1);
    log(true);
    log(false);
    log(testArray);
    log(testArray2);
    log(id_func);
    trace("The thing!", 5, 1, 2, 3, 4, 5);
    let e = new UnmanagedClass();
    log(e);
    __free(changetype<usize>(e));
    let lotsOfValues = new Array<i32>();
    __pin(changetype<usize>(lotsOfValues));
    for (let i = 0; i < 20; i++) lotsOfValues[i] = i; // for expanded values
    log(lotsOfValues);
    log(new LotsOfFields());
    let g = new Float64Array(20);
    for (let i = 0; i < 20; i++) g[i] = <f64>i;
    log(g);
    log([1, 2, 3]); // short array
    let circular = new Circular();
    circular.b = circular;
    log(circular);

    // circular array references
    let circularArray = new Array<Circular>();
    let circular2 = new Circular();
    circular2.d = circularArray;
    circularArray.push(circular2);
    log(circularArray);
    log(new NestedA());

    let m = new Map<Vec3, i32>();
    let key1 = new Vec3(1, 2, 3);
    m.set(key1, 42);
    let key2 = new Vec3(1, 2, 3);
    m.set(key2, 43);
    let key3 = new Vec3(1, 2, 3);
    m.set(key3, 44);
    log(m);

    log(function thisIsTheFunctionName(): string {
      return "";
    }); // log a function

    log(new NestedForInlineFunctionA());

    log(new NestedForInlineStringA());

    log(new NestedForInlineU8A());

    log(new NestedForInlineBoolA()); // truee for inline position

    let falseTester = new NestedForInlineBoolA(); // false for inlined position
    falseTester.a.b.c = false;
    log(falseTester);

    log(new NestedTypeImpliedArrayA()); // type info is implied in inline position
    log(new NestedTypeImpliedArrayC()); // type info is implied in expanded position

    let lotsOfFieldsArray = new Array<Vec3>(4); // implied type information for class display
    for (let i = 0; i < 4; i++) lotsOfFieldsArray[i] = new Vec3(1, 2, 3);
    log(lotsOfFieldsArray);

    let anotherFieldsArray = new Array<Vec3 | null>(1); // implied type information on null output
    anotherFieldsArray[0] = null;
    log(anotherFieldsArray);
    log(new Overridden());

    log(new Child());
  });

  todo("one");
  todo("two");
  todo("three");
});
