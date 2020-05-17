import { IWritable } from "@as-pect/core/lib/util/IWritable";

export interface IProcessConfiguration {
  stderr: IWritable;
  stdout: IWritable;
  exit(code: number): void;
}
