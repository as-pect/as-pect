import { LogValue } from "./LogValue";
import { ASUtil } from "assemblyscript/lib/loader";
import { IAspectExports } from "./IAspectExports";

/**
 * All the value types.
 */
export const enum ValueType {
  None = 0,
  Float = 1,
  Reference = 2,
  String = 3,
  Array = 4,
  Null = 5,
  Falsy = 6,
  Truthy = 7,
  Finite = 8,
}

/**
 * A class representing a reported expected or actual value. It shares a lot of properties with
 * LogValue, so those are copied over.
 */
export class ActualValue extends LogValue {
  constructor(
    wasm: ASUtil & IAspectExports,
    type: ValueType,
    value: number,
    reference: number,
    offset: number,
    stack: string,
    negated: 0 | 1,
  ) {
    super(wasm, type, value, reference, offset, stack);
    this.negated = (negated === 1);
  }
  /**
   * An indicator if the actual expected value is negated.
   */
  public negated: boolean = false;
}
