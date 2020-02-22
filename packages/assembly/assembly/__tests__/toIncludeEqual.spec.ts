import { Vec3 } from "./setup/Vec3";
import { listener, Listener, Event, initializeDispatcher } from "./setup/Event";

var eventDispatcher = initializeDispatcher();
const newListener: Listener = (event: Event): void => {
  let x = "hello";
};

let numberTester = [1, 2, 3];

describe("toIncludeEqual value arrays", () => {
  it("should include numbers", () => {
    expect(numberTester).toIncludeEqual(2, "numberTester should include 2");
  });

  throws(
    "when numberTester doesn't include a number",
    () => {
      expect(numberTester).toIncludeEqual(4);
    },
    "numberTester should not include 4",
  );

  it("should not include numbers", () => {
    expect(numberTester).not.toIncludeEqual(
      4,
      "numberTester should not include 4",
    );
  });

  throws(
    "when numberTester includes a number but the expectation is negated",
    () => {
      expect(numberTester).not.toIncludeEqual(2);
    },
  );
});

let referenceTester = new Array<Vec3>(0);
let one = new Vec3(1, 2, 3);
let two = new Vec3(4, 5, 6);
let three = new Vec3(7, 8, 9);
referenceTester.push(one);
referenceTester.push(two);
referenceTester.push(three);

let referenceSet = new Set<Vec3>();
referenceSet.add(one);
referenceSet.add(two);
referenceSet.add(three);

/**
 * This test block describes the toIncludeEqual method which performs a block comparison on every
 * item in the array. `T` should be a reference, or it delegates to `toInclude()`, it's not
 * necessary to test `T` where `T` is a value type.
 */
describe("toIncludeEqual reference arrays", () => {
  /**
   * This test verifies that pointer equality "strictEqual"s a value.
   */
  it("should include a reference", () => {
    expect(referenceTester).toIncludeEqual(
      two,
      "referenceTester should include reference two",
    );
  });

  /**
   * This test throws because two is included as a reference to referenceTester.
   */
  throws(
    "when referenceTester includes a reference but the expectation is negated",
    () => {
      expect(referenceTester).not.toIncludeEqual(two);
    },
  );

  /**
   * This test verifies a memory block equivalent to the first item exists in the referenceTester
   * array.
   */
  it("should include a reference", () => {
    expect(referenceTester).toIncludeEqual(
      new Vec3(1, 2, 3),
      "referenceTester should include reference two",
    );
  });

  /**
   * This test throws because referenceTester doesn't contain a reference that matches the expected
   * value.
   */
  throws(
    "when referenceTester doesn't include a reference",
    () => {
      expect(referenceTester).toIncludeEqual(new Vec3(10, 11, 12));
    },
    "numberTester should not include four",
  );

  /**
   * This test validates there is no reference that matches any of the elements in referenceTester.
   */
  it("should not include a reference", () => {
    expect(referenceTester).not.toIncludeEqual(
      new Vec3(10, 11, 12),
      "referenceTester should not include reference four",
    );
  });

  /**
   * This test throws because an item that "strictEqual"s an element exists in the referenceTester
   * array.
   */
  throws(
    "when referenceTester includes a reference but the expectation is negated",
    () => {
      expect(referenceTester).not.toIncludeEqual(new Vec3(1, 2, 3));
    },
  );

  /**
   * Should delegate function pointers to "toInclude".
   */
  it("should include a function pointer", () => {
    expect(eventDispatcher.events).toIncludeEqual(listener);
  });

  it("should handle case when negated and not included", () => {
    expect(eventDispatcher.events).not.toIncludeEqual(newListener);
  });

  /**
   * Throws if function pointer is not included by delegating to "toInclude".
   */
  throws("should include a function pointer", () => {
    expect(eventDispatcher.events).toIncludeEqual(newListener);
  });

  /**
   * Throws if function pointer is not included by delegating to "toInclude".
   */
  throws("should include a function pointer", () => {
    expect(eventDispatcher.events).not.toIncludeEqual(listener);
  });
});

let typedarray = new Uint8Array(10);
for (let i = 0; i < 10; i++) typedarray[i] = <u8>i;

describe("TypedArrays", () => {
  it("should include values", () => {
    expect(typedarray).toIncludeEqual(5);
  });

  itThrows(
    "when the value is included",
    () => {
      expect(typedarray).not.toIncludeEqual(5);
    },
    "The underlying array contains the value,",
  );

  it("should not include values", () => {
    expect(typedarray).not.toIncludeEqual(11);
  });

  itThrows(
    "when the value is included",
    () => {
      expect(typedarray).toIncludeEqual(11);
    },
    "The value is not included.",
  );
});

let stringRefs = ["one", "two", "three"];

describe("arrays with strings", () => {
  it("should include values", () => {
    expect(stringRefs).toIncludeEqual("three");
  });

  itThrows(
    "when the value is included",
    () => {
      expect(stringRefs).not.toIncludeEqual("three");
    },
    "The underlying array contains the value,",
  );

  it("should not include values", () => {
    expect(stringRefs).not.toIncludeEqual("four");
  });

  itThrows(
    "when the value is included",
    () => {
      expect(stringRefs).toIncludeEqual("four");
    },
    "The value is not included.",
  );
});

describe("sets", () => {
  /**
   * Sets should be comparable for toIncludeEqual comparisons.
   */
  it("should include items in the set", () => {
    expect(referenceSet).toIncludeEqual(
      new Vec3(1, 2, 3),
      "The item should be included in the set.",
    );
  });

  /**
   * If the item is not included in the set, it should throw.
   */
  throws(
    "when item is not included in the set",
    () => {
      expect(referenceSet).toIncludeEqual(new Vec3(10, 11, 12));
    },
    "The item should not be included in the set.",
  );

  /**
   * If the item is not included in the set, it should throw.
   */
  test("should not include an item that is not in the set", () => {
    expect(referenceSet).not.toIncludeEqual(
      new Vec3(10, 11, 12),
      "The item should not be included in the set.",
    );
  });

  /**
   * If the item is included in the set, it should throw.
   */
  throws(
    "when item is not included in the set",
    () => {
      expect(referenceSet).not.toIncludeEqual(new Vec3(1, 2, 3));
    },
    "The item should be included in the set.",
  );
});
