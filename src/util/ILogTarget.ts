import { LogValue } from "./LogValue";

/**
 * This interface describes the shape of an object that can contain log values.
 */
export interface ILogTarget {
  logs: LogValue[];
}
