import { noOp } from "./noOp";

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportDescribe")
declare function reportDescribe(suiteName: string): void;

// @ts-ignore: Decorators *are* valid here!
@external("__aspect", "reportEndDescribe")
declare function reportEndDescribe(): void;

// @ts-ignore: Decorators *are* valid here!
@global
export function describe(name: string = "", tests: () => void = noOp): void {
  reportDescribe(name);
  tests();
  reportEndDescribe();
}
