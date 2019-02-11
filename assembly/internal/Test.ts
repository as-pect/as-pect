import { closure } from "./Describe";
import { noOp } from "./noOp";

export class Test {
  description: string = "";
  runner: () => void = noOp;

  constructor(description: string = "", runner: () => void = noOp) {
    this.description = description;
    this.runner = runner;
  }
}

export function it(description: string, runner: () => void): void {
  test(description, runner);
}

export function test(description: string, runner: () => void): void {
  if (closure.tests == null) throw new Error("Cannot add test when there is no description to add to.");
  closure.tests.push(new Test(description, runner));
}
