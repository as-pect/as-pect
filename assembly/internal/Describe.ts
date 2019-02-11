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
export class DescribeClosure {
  name: string = "";
  tests: Test[] = [];
}

export var closure: DescribeClosure;

export function describe(name: string = "", tests: () => void = noOp): void {
  closure = new DescribeClosure()
  closure.name = name;
  tests();
}

reportCallback((): void => {
  reportDescribe(closure.name);
  for (var i = 0; i < closure.tests.length; i++) {
    let test: Test = closure.tests[i];
    if (tryCall(test.runner)) {
      reportSuccess(test.description);
    } else {
      reportFailure(test.description);
    }
  }
});
