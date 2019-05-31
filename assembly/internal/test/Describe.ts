
import { noOp } from "../noOp";
import { Collector } from "./Collector";
import { TestGroup } from "./TestGroup";

type Callback = () => void;

// @ts-ignore: Decorators *are* valid here
@global
export function describe(name: string = "", tests: Callback = noOp): void {
  let currentGroup = Collector.currentGroup();
  let nextGroup = new TestGroup(name, currentGroup);
  Collector.push(nextGroup);
  tests();
  Collector.pop();
}
