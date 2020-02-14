import { Vec3 } from "./setup/Vec3";
import { listener, Listener, Event, initializeDispatcher } from "./setup/Event";

var eventDispatcher = initializeDispatcher();
const newListener = (event: Event): void => { let x = "hello"; }

let numberTester = [1, 2, 3];

/**
 * This test block validates that the `toInclude<U>()` assertiong validates actual and expected
 * values.
 */
describe("toInclude value arrays", () => {
  /**
   * This test verifies an array includes a value.
   */
  it("should include numbers", () => {
    expect(numberTester).toInclude(2, "numberTester should include 2");
  });

  /**
   * This test throws because the numberTester reference does not include 4.
   */
  throws("when numberTester doesn't include a number", () => {
    expect(numberTester).toInclude(4);
  }, "numberTester should not include 4");

  /**
   * This test verifies that the array reference does *not* include 4.
   */
  it("should not include numbers", () => {
    expect(numberTester).not.toInclude(4, "numberTester should not include 4");
  });

  /**
   * This test throws because the array reference does *not* include 4.
   */
  throws("when numberTester includes a number but the expectation is negated", () => {
    expect(numberTester).not.toInclude(2);
  });
});

/**
 * These setup values are used for strict reference equality assertions inside the referenceTester
 * array.
 */
let referenceTester = new Array<Vec3>();

/**
 * These values are included in the array.
 */
let one = new Vec3(1,2,3);
let two = new Vec3(1,2,3);
let three = new Vec3(1,2,3);
referenceTester.push(one);
referenceTester.push(two);
referenceTester.push(three);

let referenceSet = new Set<Vec3>();
referenceSet.add(one);
referenceSet.add(two);
referenceSet.add(three);

/**
 * This value is not included.
 */
let four = new Vec3(1,2,3);

describe("toInclude reference arrays", () => {
  /**
   * This test verifies the second reference is included in the array.
   */
  it("should include a reference", () => {
    expect(referenceTester).toInclude(two, "referenceTester should include reference two");
  });

  /**
   * This test throws because the fourth reference is not included in the referenceTester.
   */
  throws("when referenceTester doesn't include a reference", () => {
    expect(referenceTester).toInclude(four);
  }, "numberTester should not include four");

  /**
   * This test verifies that the fourth reference is not included in the referenceTester array.
   */
  it("should not include a reference", () => {
    expect(referenceTester).not.toInclude(four, "referenceTester should not include reference four");
  });

  /**
   * This test throws because the second reference is included in the referenceTester array.
   */
  throws("when referenceTester includes a reference but the expectation is negated", () => {
    expect(referenceTester).not.toInclude(two);
  });

  /**
   * Should find included function pointer.
   */
  it("should include a function pointer", () => {
    expect(eventDispatcher.events).toInclude(listener);
  });

  it("Should handle the negated included function pointer", () => {
    expect(eventDispatcher.events).not.toInclude(newListener);
  });

  /**
   * Throws if function pointer is not included.
   */
  throws("should include a function pointer", () => {
    expect(eventDispatcher.events).toInclude(newListener);
  });

   /**
   * Throws if function pointer is included when it shouldn't be.
   */
  throws("should include a function pointer", () => {
    expect(eventDispatcher.events).not.toInclude(listener);
  });

  /**
   * Sets should be value actual targets for toInclude function calls.
   */
  it("should include items in the set", () => {
    expect(referenceSet).toInclude(one, "The item should be included in the set.");
  });

  /**
   * If the item is not included in the set, it should throw.
   */
  throws("when item is not included in the set", () => {
    expect(referenceSet).toInclude(new Vec3(10, 11, 12));
  }, "The item should not be included in the set.");

  /**
   * If the item is not included in the set, it should throw.
   */
  test("should not include an item that is not in the set", () => {
    expect(referenceSet).not.toInclude(new Vec3(10, 11, 12), "The item should not be included in the set.");
  });

  /**
   * If the item is included in the set, it should throw.
   */
  throws("when item is not included in the set", () => {
    expect(referenceSet).not.toInclude(one);
  }, "The item should be included in the set.");
});
