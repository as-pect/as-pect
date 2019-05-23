runTypedArrayTest<Uint8Array, u8>("Uint8Array");
runTypedArrayTest<Uint8ClampedArray, u8>("Uint8ClampedArray");
runTypedArrayTest<Int8Array, i8>("Int8Array");
runTypedArrayTest<Uint16Array, u16>("Uint16Array");
runTypedArrayTest<Int16Array, i16>("Int16Array");
runTypedArrayTest<Uint32Array, u32>("Uint32Array");
runTypedArrayTest<Int32Array, i32>("Int32Array");
runTypedArrayTest<Uint64Array, u64>("Uint64Array");
runTypedArrayTest<Int64Array, i64>("Int64Array");
runTypedArrayTest<Float32Array, f32>("Float32Array");
runTypedArrayTest<Float64Array, f64>("Float64Array");

// @ts-ignore: decorators are valid here
@inline
function create<T extends TypedArray<U>, U extends number>(): T {
  var value: T = instantiate<T>(3);
  value[0] = <U>0;
  value[1] = <U>1;
  value[2] = <U>2;
  return value;
}

function runTypedArrayTest<T extends TypedArray<U>, U extends number>(typedArrayType: string): void {
  describe("toHaveLength TypedArray type: " + typedArrayType, (): void => {
    it("should assert expected length", (): void => {
      var created: T = create<T, U>();
      expect<T>(created).toHaveLength(3);
    });

    throws("should throw when expected length should not equal the same value", (): void => {
      var created: T = create<T, U>();
      expect<T>(created).not.toHaveLength(3);
    }, "When length is equal, negated assertions should throw.");
  });
}

var valueArray: i32[] = [1, 2, 3];

describe("toHaveLength Arrays", (): void => {
  it("should assert expected length", (): void => {
    expect<i32[]>(valueArray).toHaveLength(3);
  });

  throws("should throw when expected length should not equal the same value", (): void => {
    expect<i32[]>(valueArray).not.toHaveLength(3);
  }, "When length is equal, negated assertions should throw.");
});

class Example {
  length: i32 = 3;
}

var customExample: Example = new Example();

describe("toHaveLength custom classes", (): void => {
  it("should assert expected length", (): void => {
    expect<Example>(customExample).toHaveLength(3);
  });

  throws("when expected length should not equal the same value", (): void => {
    expect<Example>(customExample).not.toHaveLength(3);
  }, "When length is equal, negated assertions should throw.");

  throws("when reference type is null", (): void => {
    expect<Example>(null).toHaveLength(3);
  }, "When the reference type is null, it should throw an error.");

  throws("when reference type is null and assertion is negated", (): void => {
    expect<Example>(null).not.toHaveLength(3);
  }, "When the reference type is null, it should throw an error.");
});

describe("toHaveLength value type assertions", (): void => {
  throws("value types should throw when toHaveLength assertions are used", (): void => {
    expect<i32>(3).toHaveLength(3);
  }, "toHaveLength assertions should throw on value types.");
});
