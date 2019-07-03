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

/**
 * This method creates a default TypedArray<U> reference like Uint8Array.
 *
 * @example
 * let value = create<Int16Array, i16>();
 */
// @ts-ignore: decorators are valid here
@inline
function create<T extends TypedArray<U>, U extends number>(): T {
  var value: T = instantiate<T>(3);
  value[0] = <U>0;
  value[1] = <U>1;
  value[2] = <U>2;
  return value;
}

/**
 * This method creates a describe block that tests the given TypedArray.
 *
 * @param {T extends TypedArray<U>} - The TypedArray type.
 * @param {U} - The number type.
 * @param {string} typedArrayType - The name of the TypedArray
 */
function runTypedArrayTest<T extends TypedArray<U>, U extends number>(typedArrayType: string): void {
  describe("toHaveLength TypedArray type: " + typedArrayType, (): void => {

    /**
     * This test verifies the length is 3 using toHaveLength(3).
     */
    it("should assert expected length", (): void => {
      var created: T = create<T, U>();
      expect<T>(created).toHaveLength(3);
    });

    /**
     * This test throws because the length *is* 3. This is the contrapositive of the previous test.
     */
    throws("when expected length should not equal the same value", (): void => {
      var created: T = create<T, U>();
      expect<T>(created).not.toHaveLength(3);
    }, "When length is equal, negated assertions should throw.");

    /**
     * This test verifies that when the expectation is negated, it validates the expected reference.
     */
    it("should verify the length is not another value", () => {
      var created: T = create<T, U>();
      expect<T>(created).not.toHaveLength(10, "The length of created is 3, not 10.");
    });

    /**
     * This test throws when the expectation is not negated. It's the contrapositive of the previous
     * test.
     */
    throws("when the length is another expected value", () => {
      var created: T = create<T, U>();
      expect<T>(created).toHaveLength(10);
    }, "The length of created is 3, and not 10");
  });
}

/**
 * This valueArray value is used to verify regular array length.
 */
var valueArray: i32[] = [1, 2, 3];

/**
 * Since the TypedArray values are different than regular arrays, we need to verify that Arrays
 * are valid input to the expectation functions.
 */
describe("toHaveLength Arrays", (): void => {
  /**
   * This test verifies the valueArray global has length 3.
   */
  it("should assert expected length", (): void => {
    expect<i32[]>(valueArray).toHaveLength(3);
  });

  /**
   * This test throws because the length *is* 3. This is the contrapositive of the previous test.
   */
  throws("should throw when expected length should not equal the same value", (): void => {
    expect<i32[]>(valueArray).not.toHaveLength(3);
  }, "When length is equal, negated assertions should throw.");

    /**
     * This test verifies that when the expectation is negated, it validates the expected reference.
     */
    it("should verify the length is not another value", () => {
      expect<i32[]>(valueArray).not.toHaveLength(10, "The length of valueArray is 3, not 10.");
    });

    /**
     * This test throws when the expectation is not negated. It's the contrapositive of the previous
     * test.
     */
    throws("when the length is another expected value", () => {
      expect<i32[]>(valueArray).toHaveLength(10);
    }, "The length of valueArray is 3, and not 10");
});

/**
 * Keeping in line with JavaScript testing, we should verify that classes that have a length
 * property are also valid input for the `toHaveLength()` expectation function. The following class
 * is used as an example.
 */
class Example {
  length: i32 = 3;
}

var customExample: Example = new Example();

describe("toHaveLength custom classes", (): void => {
 /**
   * This test verifies the customExample global has length 3.
   */
  it("should assert expected length", (): void => {
    expect<Example>(customExample).toHaveLength(3);
  });

  /**
   * This test throws because the length *is* 3. This is the contrapositive of the previous test.
   */
  throws("should throw when expected length should not equal the same value", (): void => {
    expect<Example>(customExample).not.toHaveLength(3);
  }, "When length is equal, negated assertions should throw.");

  /**
   * This test verifies that when the expectation is negated, it validates the expected reference.
   */
  it("should verify the length is not another value", () => {
    expect<Example>(customExample).not.toHaveLength(10, "The length of customExample is 3, not 10.");
  });

  /**
   * This test throws when the expectation is not negated. It's the contrapositive of the previous
   * test.
   */
  throws("when the length is another expected value", () => {
    expect<Example>(customExample).toHaveLength(10);
  }, "The length of customExample is 3, and not 10");
});

/**
 * Because the toHaveLength assertions can be used on value types, and this cannot be caught at
 * compile time, we must assert that the `T` parameter is a reference.
 */
describe("toHaveLength value type assertions", (): void => {
  /**
   * This test causes the expectation to fail because `T` is an `i32` and not a reference.
   */
  throws("value types should throw when toHaveLength assertions are used", (): void => {
    expect<i32>(3).toHaveLength(3);
  }, "toHaveLength assertions should throw on value types.");
});


describe("ArrayBuffer", () => {
  it("should compare ArrayBuffer lengths", () => {
    expect<ArrayBuffer>(new ArrayBuffer(100)).toHaveLength(100, "An array buffer with length 100 should have length 100.");
  });
});
