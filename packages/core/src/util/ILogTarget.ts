import { LogValue } from "./LogValue";
import { IWarning } from "../test/IWarning";

/**
 * This interface describes the shape of an object that can contain log values.
 */
export interface ILogTarget {
  logs: LogValue[];
  errors: IWarning[];
  warnings: IWarning[];
}
