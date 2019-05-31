
import { noOp } from "../noOp";
type Callback = () => void;

// @ts-ignore: Decorators *are* valid here
@global
export function describe(name: string = "", tests: () => void = noOp): void {

}
