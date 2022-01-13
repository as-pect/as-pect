runTypedArrayTest<Uint8Array>("Uint8Array");
runTypedArrayTest<Uint8ClampedArray>("Uint8ClampedArray");
runTypedArrayTest<Int8Array>("Int8Array");
runTypedArrayTest<Uint16Array>("Uint16Array");
runTypedArrayTest<Int16Array>("Int16Array");
runTypedArrayTest<Uint32Array>("Uint32Array");
runTypedArrayTest<Int32Array>("Int32Array");
runTypedArrayTest<Uint64Array>("Uint64Array");
runTypedArrayTest<Int64Array>("Int64Array");
runTypedArrayTest<Float32Array>("Float32Array");
runTypedArrayTest<Float64Array>("Float64Array");

/**
 * This method creates a default TypedArray<U> reference like Uint8Array.
 *
 * @example
 * let value = create<Int16Array, i16>();
 */
function create<T extends ArrayBufferView>(): T {
  var value: T = instantiate<T>(3);
  // @ts-ignore: this is safe
  unchecked((value[0] = <valueof<T>>0));
  // @ts-ignore: this is safe
  unchecked((value[1] = <valueof<T>>1));
  // @ts-ignore: this is safe
  unchecked((value[2] = <valueof<T>>2));
  return value;
}

/**
 * This method creates a describe block that tests the given TypedArray.
 *
 * @param {T extends ArrayBufferView} - The TypedArray type.
 * @param {U} - The number type.
 * @param {string} typedArrayType - The name of the TypedArray
 */
function runTypedArrayTest<T extends ArrayBufferView>(
  typedArrayType: string,
): void {
  describe("toHaveLength TypedArray type: " + typedArrayType, () => {
    /**
     * This test verifies the length is 3 using toHaveLength(3).
     */
    it("should assert expected length", () => {
      var created = create<T>();
      expect<T>(created).toHaveLength(3);
    });

    /**
     * This test throws because the length *is* 3. This is the contrapositive of the previous test.
     */
    throws(
      "when expected length should not equal the same value",
      () => {
        var created = create<T>();
        expect<T>(created).not.toHaveLength(3);
      },
      "When length is equal, negated assertions should throw.",
    );

    /**
     * This test verifies that when the expectation is negated, it validates the expected reference.
     */
    it("should verify the length is not another value", () => {
      var created = create<T>();
      expect<T>(created).not.toHaveLength(
        10,
        "The length of created is 3, not 10.",
      );
    });

    /**
     * This test throws when the expectation is not negated. It's the contrapositive of the previous
     * test.
     */
    throws(
      "when the length is another expected value",
      () => {
        var created = create<T>();
        expect<T>(created).toHaveLength(10);
      },
      "The length of created is 3, and not 10",
    );
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
describe("toHaveLength Arrays", () => {
  /**
   * This test verifies the valueArray global has length 3.
   */
  it("should assert expected length", () => {
    expect<i32[]>(valueArray).toHaveLength(3);
  });

  /**
   * This test throws because the length *is* 3. This is the contrapositive of the previous test.
   */
  throws(
    "should throw when expected length should not equal the same value",
    () => {
      expect<i32[]>(valueArray).not.toHaveLength(3);
    },
    "When length is equal, negated assertions should throw.",
  );

  /**
   * This test verifies that when the expectation is negated, it validates the expected reference.
   */
  it("should verify the length is not another value", () => {
    expect<i32[]>(valueArray).not.toHaveLength(
      10,
      "The length of valueArray is 3, not 10.",
    );
  });

  /**
   * This test throws when the expectation is not negated. It's the contrapositive of the previous
   * test.
   */
  throws(
    "when the length is another expected value",
    () => {
      expect<i32[]>(valueArray).toHaveLength(10);
    },
    "The length of valueArray is 3, and not 10",
  );
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

describe("toHaveLength custom classes", () => {
  /**
   * This test verifies the customExample global has length 3.
   */
  it("should assert expected length", () => {
    expect<Example>(customExample).toHaveLength(3);
  });

  /**
   * This test throws because the length *is* 3. This is the contrapositive of the previous test.
   */
  throws(
    "should throw when expected length should not equal the same value",
    () => {
      expect<Example>(customExample).not.toHaveLength(3);
    },
    "When length is equal, negated assertions should throw.",
  );

  /**
   * This test verifies that when the expectation is negated, it validates the expected reference.
   */
  it("should verify the length is not another value", () => {
    expect<Example>(customExample).not.toHaveLength(
      10,
      "The length of customExample is 3, not 10.",
    );
  });

  /**
   * This test throws when the expectation is not negated. It's the contrapositive of the previous
   * test.
   */
  throws(
    "when the length is another expected value",
    () => {
      expect<Example>(customExample).toHaveLength(10);
    },
    "The length of customExample is 3, and not 10",
  );
});

describe("ArrayBuffer", () => {
  it("should compare ArrayBuffer lengths", () => {
    expect<ArrayBuffer>(new ArrayBuffer(100)).toHaveLength(
      100,
      "An array buffer with length 100 should have length 100.",
    );
  });
});

describe("nullable types", () => {
  it("should accept nullable types", () => {
    let t: i32[] | null = [1, 2, 3, 4];
    expect(t).toHaveLength(4);
  });

  itThrows("when actual is null", () => {
    expect<i32[] | null>(null).toHaveLength(5);
  });
});
