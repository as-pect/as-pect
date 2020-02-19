import { IWarning } from "../test/IWarning";
import { HostValue } from "./HostValue";

/**
 * This interface describes the shape of an object that can contain log values, warnings, and errors.
 */
export interface ILogTarget {
  logs: HostValue[];
  errors: IWarning[];
  warnings: IWarning[];
}
