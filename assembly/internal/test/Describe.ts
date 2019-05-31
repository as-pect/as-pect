
import { noOp } from "../noOp";
type Callback = () => void;

@global
export function describe(name: string = "", tests: () => void = noOp): void {

}
