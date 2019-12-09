import { Vec3 } from "./setup/Vec3";
import { EventDispatcher, listener, anotherListener, Listener, Event } from "./setup/Event";

var eventDispatcher = new EventDispatcher();
eventDispatcher.events.push(listener);
eventDispatcher.events.push(anotherListener);
const newListener: Listener = (event: Event) => { let x = "hello" }

let numberTester: i32[] = new Array<i32>();
numberTester.push(1);
numberTester.push(2);
numberTester.push(3);

/**
 * This test block validates that the `toInclude<U>()` assertiong validates actual and expected
 * values.
 */
describe("toInclude value arrays", () => {
  /**
   * This test verifies an array includes a value.
   */
  it("should include numbers", () => {
    expect<i32[]>(numberTester).toInclude(2, "numberTester should include 2");
  });

  /**
   * This test throws because the numberTester reference does not include 4.
   */
  throws("when numberTester doesn't include a number", () => {
    expect<i32[]>(numberTester).toInclude(4);
  }, "numberTester should not include 4");

  /**
   * This test verifies that the array reference does *not* include 4.
   */
  it("should not include numbers", () => {
    expect<i32[]>(numberTester).not.toInclude(4, "numberTester should not include 4");
  });

  /**
   * This test throws because the array reference does *not* include 4.
   */
  throws("when numberTester includes a number but the expectation is negated", () => {
    expect<i32[]>(numberTester).not.toInclude(2);
  });
});

/**
 * These setup values are used for strict reference equality assertions inside the referenceTester
 * array.
 */
let referenceTester: Vec3[] = new Array<Vec3>();

/**
 * These values are included in the array.
 */
let one = new Vec3(1,2,3);
let two = new Vec3(1,2,3);
let three = new Vec3(1,2,3);
referenceTester.push(one);
referenceTester.push(two);
referenceTester.push(three);
/**
 * This value is not included.
 */
let four = new Vec3(1,2,3);

describe("toInclude reference arrays", () => {
  /**
   * This test verifies the second reference is included in the array.
   */
  it("should include a reference", () => {
    expect<Vec3[]>(referenceTester).toInclude(two, "referenceTester should include reference two");
  });

  /**
   * This test throws because the fourth reference is not included in the referenceTester.
   */
  throws("when referenceTester doesn't include a reference", () => {
    expect<Vec3[]>(referenceTester).toInclude(four);
  }, "numberTester should not include four");

  /**
   * This test verifies that the fourth reference is not included in the referenceTester array.
   */
  it("should not include a reference", () => {
    expect<Vec3[]>(referenceTester).not.toInclude(four, "referenceTester should not include reference four");
  });

  /**
   * This test throws because the second reference is included in the referenceTester array.
   */
  throws("when referenceTester includes a reference but the expectation is negated", () => {
    expect<Vec3[]>(referenceTester).not.toInclude(two);
  });

  /**
   * Should find included function pointer.
   */
  it("should include a function pointer", () => {
    expect<Array<Listener>>(eventDispatcher.events).toInclude(listener);
    expect<Array<Listener>>(eventDispatcher.events).not.toInclude(newListener);
  })

  /**
   * Throws if function pointer is not included.
   */
  throws("should include a function pointer", () => {
    expect<Array<Listener>>(eventDispatcher.events).toInclude(newListener);
  })
});
