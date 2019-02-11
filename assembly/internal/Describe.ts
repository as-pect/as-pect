import { Test } from "./Test";
import { noOp } from "./noOp";

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "tryCall")
declare function tryCall(func: () => void): bool;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "reportSuccess")
declare function reportSuccess(testName: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "reportFailure")
declare function reportFailure(testName: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "reportDescribe")
declare function reportDescribe(suiteName: string): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "reportCallback")
declare function reportCallback(func: () => void): void;

// @ts-ignore: Decorators *are* valid here
@external("__aspect", "reportStatistics")
declare function reportStatistics(success: i32, failed: i32): void;

export class DescribeClosure {
  name: string = "";
  tests: Test[] = [];
}

export var closures: DescribeClosure[] = [];

// @ts-ignore: decorators *are* valid here
@global
export function describe(name: string = "", tests: () => void = noOp): void {
  var c: DescribeClosure = new DescribeClosure()
  c.name = name;
  closures.push(c);
  tests();
}

reportCallback((): void => {
  closures.forEach((closure: DescribeClosure, index: i32, array: DescribeClosure[]): void => {
    reportDescribe(closure.name);
    var success: i32 = 0;
    for (var i = 0; i < closure.tests.length; i++) {
      let test: Test = closure.tests[i];
      if (tryCall(test.runner)) {
        reportSuccess(test.description);
        success++;
      } else {
        reportFailure(test.description);
      }
    }
    reportStatistics(success, success - closure.tests.length);
  });
});
