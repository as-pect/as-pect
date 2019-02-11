import { closures } from "./Describe";
import { noOp } from "./noOp";

export class Test {
  description: string = "";
  runner: () => void = noOp;

  constructor(description: string = "", runner: () => void = noOp) {
    this.description = description;
    this.runner = runner;
  }
}

// @ts-ignore: decorators *are* valid here
@global
export function it(description: string, runner: () => void): void {
  test(description, runner);
}

// @ts-ignore: decorators *are* valid here
@global
export function test(description: string, runner: () => void): void {
  if (closures.length == 0) throw new Error("please use the describe function");
  closures[closures.length - 1].tests.push(new Test(description, runner));
}
