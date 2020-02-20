import { IWarning } from "../test/IWarning";
import { ReflectedValue } from "./ReflectedValue";

/**
 * This interface describes the shape of an object that can contain log values, warnings, and errors.
 */
export interface ILogTarget {
  logs: ReflectedValue[];
  errors: IWarning[];
  warnings: IWarning[];
}
