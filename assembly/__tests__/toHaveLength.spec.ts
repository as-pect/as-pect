runTypedArrayTest<Uint8Array, u8>();
runTypedArrayTest<Uint8ClampedArray, u8>();
runTypedArrayTest<Int8Array, i8>();
runTypedArrayTest<Uint16Array, u16>();
runTypedArrayTest<Int16Array, i16>();
runTypedArrayTest<Uint32Array, u32>();
runTypedArrayTest<Int32Array, i32>();
runTypedArrayTest<Uint64Array, u64>();
runTypedArrayTest<Int64Array, i64>();
runTypedArrayTest<Float32Array, f32>();
runTypedArrayTest<Float64Array, f64>();

@inline
function free<T extends TypedArray<U>, U extends number>(array: T): void {
  if (isManaged<T>()) {
    memory.free(changetype<usize>(array.buffer));
    memory.free(changetype<usize>(array));
  }
}

@inline
function create<T extends TypedArray<U>, U extends number>(): T {
  var value: T = instantiate<T>();
  value[0] = <U>0;
  value[1] = <U>1;
  value[2] = <U>2;
  return value;
}

@inline
function runTypedArrayTest<T extends TypedArray<U>, U extends number>(): void {
  describe("TypedArray type", (): void => {
    it("should assert typed array should have expected length", (): void => {
      var created: T = create<T, U>();
      expect<T>(created).toHaveLength(3);
    });
  });
}